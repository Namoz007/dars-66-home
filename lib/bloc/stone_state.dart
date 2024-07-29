import 'package:dars_66_home/data/models/question.dart';

sealed class StoneState{}

final class InitialStoneState extends StoneState{}

final class LoadingStoneState extends StoneState{}

final class LoadedStoneState extends StoneState{
  List<Question> questions;

  LoadedStoneState(this.questions);
}

final class FinalStoneState extends StoneState{}


final class ErrorStoneState extends StoneState{}