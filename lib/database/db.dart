import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'db.g.dart';

class FavoriteList extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get idMeal => integer().nullable()();
  TextColumn get linkImg => text()();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db2.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [FavoriteList])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
  //ReadAllDataFav
  Future<List<FavoriteListData>> getListAll() async {
    return await select(favoriteList).get();
  }

  //ReadDetailFavBasedOnID
  Future<FavoriteListData> getDetailFav(int id) async {
    return (select(favoriteList)..where((u) => u.idMeal.equals(id)))
        .getSingle();
  }

  //INSERT
  Future insertFav(FavoriteListCompanion listFav) =>
      into(favoriteList).insert(listFav);

  //Delete
  Future<int> deleteFav(int idMeals) async {
    return await (delete(favoriteList)..where((u) => u.idMeal.equals(idMeals)))
        .go();
  }
}
