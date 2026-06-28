import 'package:ideo/data/local/db_helper.dart';

class IdeoModel {
  int? id;
  String title, remark;

  IdeoModel({required this.title, required this.remark, this.id});

  factory IdeoModel.fromMap(Map<String, dynamic> map){
    return IdeoModel(
        title: map[DBHelper.COLUMN_IDEA_TITLE] ?? "",
        remark: map[DBHelper.COLUMN_IDEA_REMARK] ?? "",
        id: map[DBHelper.COLUMN_IDEA_ID]
    );
  }

  Map<String,dynamic> toMap() {
    return {
      DBHelper.COLUMN_IDEA_ID : id,
      DBHelper.COLUMN_IDEA_TITLE : title,
      DBHelper.COLUMN_IDEA_REMARK : remark
    };
}
}