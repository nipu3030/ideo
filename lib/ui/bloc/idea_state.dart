import 'package:ideo/data/model/ideo_model.dart';

abstract class IdeaState {}

class InitialIdeaState extends IdeaState{}
class LoadingIdeaState extends IdeaState{}
class LoadedIdeaState extends IdeaState{
  List<IdeoModel> newIdea;
  LoadedIdeaState({required this.newIdea});
}
class FailureIdeaState extends IdeaState{
  String errorMsg;
  FailureIdeaState({required this.errorMsg});
}