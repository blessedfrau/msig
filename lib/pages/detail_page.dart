import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msig/bloc/main_cubit.dart';
import 'package:msig/models/mealdetail_model.dart';
import 'package:msig/models/meals_model.dart';
import 'package:msig/shared/widget/loading_indicator.dart';

class DetailPage extends StatefulWidget {
  final MealsModel meal;
  const DetailPage({Key? key, required this.meal}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  MealsDetailModel dataDetail = const MealsDetailModel();
  @override
  void initState() {
    getDetailMenu();
    super.initState();
  }

  getDetailMenu() async {
    await BlocProvider.of<MainCubit>(context)
        .getFoodDetail(int.parse(widget.meal.idMeal));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Detail',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: body(),
        backgroundColor: Colors.white,
      ),
    );
  }

  Widget body() {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {
        if (state is MainStateFoodListDetailSuccess) {
          dataDetail = state.foodListDetail.first;
        }
      },
      builder: (context, state) {
        if (state is MainStateLoading) {
          return const LoadingIndicator();
        }
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.network(
                        dataDetail.strMealThumb,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dataDetail.strMeal,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '#Tags : ${dataDetail.strTags}',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontStyle: FontStyle.italic,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Category : ${dataDetail.strCategory}',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            'Area : ${dataDetail.strArea}',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      const Text(
                        'Ingredients :',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      textCustom(dataDetail.strIngredient1),
                      textCustom(dataDetail.strIngredient2),
                      textCustom(dataDetail.strIngredient3),
                      textCustom(dataDetail.strIngredient4),
                      textCustom(dataDetail.strIngredient5),
                      textCustom(dataDetail.strIngredient6),
                      textCustom(dataDetail.strIngredient7),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      const Text(
                        'How to Cook :',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(dataDetail.strInstructions)
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget textCustom(data) => Row(
        children: [
          const Icon(
            Icons.circle,
            size: 12,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.02,
          ),
          Text(
            data,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      );
}
