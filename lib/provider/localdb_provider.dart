import 'dart:ffi';

import 'package:bmi_calculator/model/localdb_model.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class LocalDbProvider extends ChangeNotifier {
  Isar? isar;
  List<DbModel> dbList = [];

  Future<void> initIsar() async {
    var dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([DbModelSchema],
        directory: dir.path, name: 'Local Isar Database');
  }

  Future<void> writeToDb(DbModel model) async {
    try {
      if (isar != null) {
        await isar!.writeTxn(() async {
          await isar!.dbModels.put(model);
        });
        readFromDb();
      }
    } catch (e) {
      print(e);
    }
  }

  readFromDb() async {
    var allListDatas = <DbModel>[];
    try {
      if (isar != null) {
        allListDatas = await isar!.dbModels.where().findAll();
        dbList = allListDatas;
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }
}
