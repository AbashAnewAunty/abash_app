// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $NoticeItemsTable extends NoticeItems
    with TableInfo<$NoticeItemsTable, NoticeItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NoticeItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 6, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionsMeta =
      const VerificationMeta('descriptions');
  @override
  late final GeneratedColumn<String> descriptions = GeneratedColumn<String>(
      'descriptions', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, title, descriptions, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notice_items';
  @override
  VerificationContext validateIntegrity(Insertable<NoticeItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('descriptions')) {
      context.handle(
          _descriptionsMeta,
          descriptions.isAcceptableOrUnknown(
              data['descriptions']!, _descriptionsMeta));
    } else if (isInserting) {
      context.missing(_descriptionsMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NoticeItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NoticeItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      descriptions: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}descriptions'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at']),
    );
  }

  @override
  $NoticeItemsTable createAlias(String alias) {
    return $NoticeItemsTable(attachedDatabase, alias);
  }
}

class NoticeItem extends DataClass implements Insertable<NoticeItem> {
  final int id;
  final String title;
  final String descriptions;
  final DateTime? createdAt;
  const NoticeItem(
      {required this.id,
      required this.title,
      required this.descriptions,
      this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['descriptions'] = Variable<String>(descriptions);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    return map;
  }

  NoticeItemsCompanion toCompanion(bool nullToAbsent) {
    return NoticeItemsCompanion(
      id: Value(id),
      title: Value(title),
      descriptions: Value(descriptions),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  factory NoticeItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NoticeItem(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      descriptions: serializer.fromJson<String>(json['descriptions']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'descriptions': serializer.toJson<String>(descriptions),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
    };
  }

  NoticeItem copyWith(
          {int? id,
          String? title,
          String? descriptions,
          Value<DateTime?> createdAt = const Value.absent()}) =>
      NoticeItem(
        id: id ?? this.id,
        title: title ?? this.title,
        descriptions: descriptions ?? this.descriptions,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
      );
  NoticeItem copyWithCompanion(NoticeItemsCompanion data) {
    return NoticeItem(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      descriptions: data.descriptions.present
          ? data.descriptions.value
          : this.descriptions,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NoticeItem(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('descriptions: $descriptions, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, descriptions, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NoticeItem &&
          other.id == this.id &&
          other.title == this.title &&
          other.descriptions == this.descriptions &&
          other.createdAt == this.createdAt);
}

class NoticeItemsCompanion extends UpdateCompanion<NoticeItem> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> descriptions;
  final Value<DateTime?> createdAt;
  const NoticeItemsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.descriptions = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  NoticeItemsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String descriptions,
    this.createdAt = const Value.absent(),
  })  : title = Value(title),
        descriptions = Value(descriptions);
  static Insertable<NoticeItem> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? descriptions,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (descriptions != null) 'descriptions': descriptions,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  NoticeItemsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? descriptions,
      Value<DateTime?>? createdAt}) {
    return NoticeItemsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      descriptions: descriptions ?? this.descriptions,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (descriptions.present) {
      map['descriptions'] = Variable<String>(descriptions.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NoticeItemsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('descriptions: $descriptions, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $NoticeItemsTable noticeItems = $NoticeItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [noticeItems];
}

typedef $$NoticeItemsTableCreateCompanionBuilder = NoticeItemsCompanion
    Function({
  Value<int> id,
  required String title,
  required String descriptions,
  Value<DateTime?> createdAt,
});
typedef $$NoticeItemsTableUpdateCompanionBuilder = NoticeItemsCompanion
    Function({
  Value<int> id,
  Value<String> title,
  Value<String> descriptions,
  Value<DateTime?> createdAt,
});

class $$NoticeItemsTableFilterComposer
    extends Composer<_$AppDatabase, $NoticeItemsTable> {
  $$NoticeItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get descriptions => $composableBuilder(
      column: $table.descriptions, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$NoticeItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $NoticeItemsTable> {
  $$NoticeItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get descriptions => $composableBuilder(
      column: $table.descriptions,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$NoticeItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $NoticeItemsTable> {
  $$NoticeItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get descriptions => $composableBuilder(
      column: $table.descriptions, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$NoticeItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $NoticeItemsTable,
    NoticeItem,
    $$NoticeItemsTableFilterComposer,
    $$NoticeItemsTableOrderingComposer,
    $$NoticeItemsTableAnnotationComposer,
    $$NoticeItemsTableCreateCompanionBuilder,
    $$NoticeItemsTableUpdateCompanionBuilder,
    (NoticeItem, BaseReferences<_$AppDatabase, $NoticeItemsTable, NoticeItem>),
    NoticeItem,
    PrefetchHooks Function()> {
  $$NoticeItemsTableTableManager(_$AppDatabase db, $NoticeItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NoticeItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NoticeItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NoticeItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> descriptions = const Value.absent(),
            Value<DateTime?> createdAt = const Value.absent(),
          }) =>
              NoticeItemsCompanion(
            id: id,
            title: title,
            descriptions: descriptions,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            required String descriptions,
            Value<DateTime?> createdAt = const Value.absent(),
          }) =>
              NoticeItemsCompanion.insert(
            id: id,
            title: title,
            descriptions: descriptions,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$NoticeItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $NoticeItemsTable,
    NoticeItem,
    $$NoticeItemsTableFilterComposer,
    $$NoticeItemsTableOrderingComposer,
    $$NoticeItemsTableAnnotationComposer,
    $$NoticeItemsTableCreateCompanionBuilder,
    $$NoticeItemsTableUpdateCompanionBuilder,
    (NoticeItem, BaseReferences<_$AppDatabase, $NoticeItemsTable, NoticeItem>),
    NoticeItem,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$NoticeItemsTableTableManager get noticeItems =>
      $$NoticeItemsTableTableManager(_db, _db.noticeItems);
}
