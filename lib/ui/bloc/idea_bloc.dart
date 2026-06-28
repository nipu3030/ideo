import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ideo/data/local/db_helper.dart';
import 'package:ideo/data/model/ideo_model.dart';
import 'package:ideo/ui/bloc/idea_event.dart';
import 'package:ideo/ui/bloc/idea_state.dart';

class IdeaBloc extends Bloc<IdeaEvent,IdeaState>{
  DBHelper dbHelper;
  IdeaBloc({required this.dbHelper}) : super(InitialIdeaState()){
    
    
   on<AddIdeaEvent>((event, emit) async {
     emit(LoadingIdeaState());
     bool isAdded = await dbHelper.insertIdea(newIdea: event.newIdea);
     if(isAdded){
       List<IdeoModel> allIdea = await dbHelper.fetchIdea();
       emit(LoadedIdeaState(newIdea: allIdea));
     } else {
       emit(FailureIdeaState(errorMsg: 'Something Went Wrong!'));
     }
   }); 
   
   on<FetchAllIdeaEvent>((event,emit) async {
     emit(LoadingIdeaState());
     try {
       List<IdeoModel> allIdea = await dbHelper.fetchIdea();
       emit(LoadedIdeaState(newIdea: allIdea));
     } catch (e) {
       emit(FailureIdeaState(errorMsg: e.toString()));
     }
   });
  }
}