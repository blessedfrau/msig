import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msig/bloc/main_cubit.dart';
import 'package:msig/database/db.dart';
import 'package:msig/models/meals_model.dart';
import 'package:msig/pages/detail_page.dart';
import 'package:msig/shared/widget/loading_indicator.dart';
import 'package:drift/drift.dart' as drift;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<MealsModel> data = [];
  List<FavoriteListData> dataDB = [];
  late AppDatabase _db;

  @override
  void initState() {
    getListMenu();
    _db = AppDatabase();
    super.initState();
  }

  @override
  void dispose() {
    _db.close();
    super.dispose();
  }

  getListMenu() async {
    await BlocProvider.of<MainCubit>(context).getFoodList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Seafood 86',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: BlocConsumer<MainCubit, MainState>(
          listener: (context, state) {
            if (state is MainStateFoodListSuccess) {
              data = state.foodList;
              _db.getListAll().then((value) {
                if (value.isNotEmpty) {
                  dataDB = value;
                }
              });
            }
          },
          builder: (context, state) {
            if (state is MainStateLoading) {
              return const LoadingIndicator();
            }

            return SingleChildScrollView(
              child: GridView.builder(
                  physics: const ScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .9,
                  ),
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: ((context, index) {
                    var menu = data[index];
                    for (var e in dataDB) {
                      if (e.idMeal == int.parse(menu.idMeal)) {
                        menu.isFav = true;
                      } else {
                        menu.isFav = false;
                      }
                    }
                    return InkWell(
                      onTap: (() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(
                              meal: menu,
                            ),
                          ),
                        );
                      }),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.17,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.network(
                                  menu.strMealThumb,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      menu.strMeal,
                                      softWrap: true,
                                      maxLines: 3,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {
                                        menu.isFav != true
                                            ? addToFav(menu)
                                            : removeFromFav(menu);
                                      },
                                      icon: menu.isFav == true
                                          ? const Icon(Icons.favorite,
                                              color: Colors.red)
                                          : const Icon(
                                              Icons.favorite_border_outlined),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  })),
            );
          },
        ),
      ),
    );
  }

  void addToFav(MealsModel menu) async {
    final insertIntoFav = FavoriteListCompanion(
      idMeal: drift.Value(int.parse(menu.idMeal)),
      name: drift.Value(menu.strMeal),
      linkImg: drift.Value(menu.strMealThumb),
    );
    await _db.insertFav(insertIntoFav).then((value) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Saved to Favorite !')));
    });
    setState(() {
      menu.isFav = true;
    });
  }

  void removeFromFav(MealsModel menu) async {
    await _db.deleteFav(int.parse(menu.idMeal)).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('I understand if Im no longer your favorite :(')));
    });
    setState(() {
      menu.isFav = false;
    });
  }
}
