import 'dart:io';
import 'package:ideo/data/model/ideo_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._();

  static DBHelper getInstance() => DBHelper._();
  Database? mDB;

  static const String DB_NAME = 'ideo.db';
  static const String TABLE_IDEO = 'ideo';
  static const String COLUMN_IDEA_ID = 'i_id';
  static const String COLUMN_IDEA_TITLE = 'i_title';
  static const String COLUMN_IDEA_REMARK = 'i_remark';

  Future<Database> initDB() async {
    mDB ??= await openDB();
    return mDB!;
  }

 Future<Database> openDB() async {
     Directory appDir = await getApplicationDocumentsDirectory();
     String path = join(appDir.path,DB_NAME);

     return openDatabase(
       path, version: 1,
       onCreate: (db, version) async {
         await db.execute('''
         create table $TABLE_IDEO (
         $COLUMN_IDEA_ID integer primary key autoincrement,
         $COLUMN_IDEA_TITLE text not null,
         $COLUMN_IDEA_REMARK text not null
         )
         ''');
       }
     );
  }

  Future<bool> insertIdea({required IdeoModel newIdea}) async {
    var db = await initDB();
    int rowsEffected = await  db.insert(TABLE_IDEO, newIdea.toMap());
    return rowsEffected>0;
  }

 Future<List<IdeoModel>> fetchIdea()async{
    var db = await initDB();
   List<Map<String,dynamic>> getIdea = await  db.query(TABLE_IDEO);
   List<IdeoModel> allIdea = [];
   for(Map<String,dynamic> eachIdea in getIdea){
     allIdea.add(IdeoModel.fromMap(eachIdea));
   }
   return allIdea;
  }

}