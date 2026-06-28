import 'package:ideo/data/model/ideo_model.dart';

abstract class IdeaEvent {}

class AddIdeaEvent extends IdeaEvent{
  IdeoModel newIdea;
  AddIdeaEvent({required this.newIdea});
}
class FetchAllIdeaEvent extends IdeaEvent{}