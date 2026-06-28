import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ideo/data/local/db_helper.dart';
import 'package:ideo/data/model/ideo_model.dart';
import 'package:ideo/ui/bloc/idea_state.dart';

class IdeaCubit extends Cubit<IdeaState>{
  DBHelper dbHelper;
  IdeaCubit({required this.dbHelper}) : super(InitialIdeaState());

  addIdea({required IdeoModel newIdea}) async {
    emit(LoadingIdeaState());

    bool isAdded = await dbHelper.insertIdea(newIdea: newIdea);
    if(isAdded){
      fetchIdea();
    }
  }

  fetchIdea() async {
    emit(LoadingIdeaState());
    List<IdeoModel> allIdea = await dbHelper.fetchIdea();
    emit(LoadedIdeaState(newIdea: allIdea));
  }

}