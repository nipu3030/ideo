import 'package:flutter/cupertino.dart';
import 'package:ideo/data/local/db_helper.dart';
import 'package:ideo/data/model/ideo_model.dart';

class IdeaProvider extends ChangeNotifier{
  DBHelper dbHelper;
  IdeaProvider({required this.dbHelper});
  List<IdeoModel> _allIdea = [];

  List<IdeoModel> getIdea() => _allIdea;

  addIdea({required IdeoModel newIdea}) async {
    bool isAdded = await  dbHelper.insertIdea(newIdea: newIdea);
    if(isAdded){
       fetchAllIdea();
       notifyListeners();
    }
  }


  fetchAllIdea() async {
    _allIdea = await dbHelper.fetchIdea();
    notifyListeners();
  }
}