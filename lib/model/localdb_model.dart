import 'package:isar/isar.dart';

part 'localdb_model.g.dart';

@Collection()
class DbModel {
  Id id = Isar.autoIncrement;
  int height;
  int weight;
  int age;
  int totalBmi;

  DbModel(this.age, this.height, this.id, this.weight, this.totalBmi);
}
