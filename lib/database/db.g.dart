// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class FavoriteListData extends DataClass
    implements Insertable<FavoriteListData> {
  final int id;
  final String name;
  final int? idMeal;
  final String linkImg;
  FavoriteListData(
      {required this.id,
      required this.name,
      this.idMeal,
      required this.linkImg});
  factory FavoriteListData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return FavoriteListData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      idMeal: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_meal']),
      linkImg: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}link_img'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || idMeal != null) {
      map['id_meal'] = Variable<int?>(idMeal);
    }
    map['link_img'] = Variable<String>(linkImg);
    return map;
  }

  FavoriteListCompanion toCompanion(bool nullToAbsent) {
    return FavoriteListCompanion(
      id: Value(id),
      name: Value(name),
      idMeal:
          idMeal == null && nullToAbsent ? const Value.absent() : Value(idMeal),
      linkImg: Value(linkImg),
    );
  }

  factory FavoriteListData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoriteListData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      idMeal: serializer.fromJson<int?>(json['idMeal']),
      linkImg: serializer.fromJson<String>(json['linkImg']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'idMeal': serializer.toJson<int?>(idMeal),
      'linkImg': serializer.toJson<String>(linkImg),
    };
  }

  FavoriteListData copyWith(
          {int? id, String? name, int? idMeal, String? linkImg}) =>
      FavoriteListData(
        id: id ?? this.id,
        name: name ?? this.name,
        idMeal: idMeal ?? this.idMeal,
        linkImg: linkImg ?? this.linkImg,
      );
  @override
  String toString() {
    return (StringBuffer('FavoriteListData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('idMeal: $idMeal, ')
          ..write('linkImg: $linkImg')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, idMeal, linkImg);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoriteListData &&
          other.id == this.id &&
          other.name == this.name &&
          other.idMeal == this.idMeal &&
          other.linkImg == this.linkImg);
}

class FavoriteListCompanion extends UpdateCompanion<FavoriteListData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int?> idMeal;
  final Value<String> linkImg;
  const FavoriteListCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.idMeal = const Value.absent(),
    this.linkImg = const Value.absent(),
  });
  FavoriteListCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.idMeal = const Value.absent(),
    required String linkImg,
  })  : name = Value(name),
        linkImg = Value(linkImg);
  static Insertable<FavoriteListData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int?>? idMeal,
    Expression<String>? linkImg,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (idMeal != null) 'id_meal': idMeal,
      if (linkImg != null) 'link_img': linkImg,
    });
  }

  FavoriteListCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int?>? idMeal,
      Value<String>? linkImg}) {
    return FavoriteListCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      idMeal: idMeal ?? this.idMeal,
      linkImg: linkImg ?? this.linkImg,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (idMeal.present) {
      map['id_meal'] = Variable<int?>(idMeal.value);
    }
    if (linkImg.present) {
      map['link_img'] = Variable<String>(linkImg.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteListCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('idMeal: $idMeal, ')
          ..write('linkImg: $linkImg')
          ..write(')'))
        .toString();
  }
}

class $FavoriteListTable extends FavoriteList
    with TableInfo<$FavoriteListTable, FavoriteListData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoriteListTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _idMealMeta = const VerificationMeta('idMeal');
  @override
  late final GeneratedColumn<int?> idMeal = GeneratedColumn<int?>(
      'id_meal', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _linkImgMeta = const VerificationMeta('linkImg');
  @override
  late final GeneratedColumn<String?> linkImg = GeneratedColumn<String?>(
      'link_img', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, idMeal, linkImg];
  @override
  String get aliasedName => _alias ?? 'favorite_list';
  @override
  String get actualTableName => 'favorite_list';
  @override
  VerificationContext validateIntegrity(Insertable<FavoriteListData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('id_meal')) {
      context.handle(_idMealMeta,
          idMeal.isAcceptableOrUnknown(data['id_meal']!, _idMealMeta));
    }
    if (data.containsKey('link_img')) {
      context.handle(_linkImgMeta,
          linkImg.isAcceptableOrUnknown(data['link_img']!, _linkImgMeta));
    } else if (isInserting) {
      context.missing(_linkImgMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FavoriteListData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return FavoriteListData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $FavoriteListTable createAlias(String alias) {
    return $FavoriteListTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $FavoriteListTable favoriteList = $FavoriteListTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [favoriteList];
}
