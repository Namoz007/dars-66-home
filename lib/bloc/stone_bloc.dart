import 'package:bloc/bloc.dart';
import 'package:dars_66_home/bloc/stone_event.dart';
import 'package:dars_66_home/bloc/stone_state.dart';
import '../data/models/question.dart';

class StoneBloc extends Bloc<StoneEvent,StoneState>{
  List<Question> _questions = [
    Question(imgs: [
      "https://i.pinimg.com/originals/24/61/6a/24616a403174aa85efab89584bfd585a.png",
      "https://gstore.ua/content/images/1/950x950l85ml0/35551380390820.png",
      "https://cdn.mos.cms.futurecdn.net/yVfFygbWT5PTiUdjpyADsZ-1920-80.png",
      "https://telegra.ph/file/712811851cfe5cc5bdde3.png"
    ], answer: "Apple", options: [
      "A","B","P","I","O","N","L","P","H","E","J","A","Z","M",
    ],),
  ];
  StoneBloc() : super(InitialStoneState()){
    on<GetAllStoneEvent>(_getStones);
    on<FinalStoneEvent>(_finalStones);
  }

  void _finalStones(FinalStoneEvent event,emit){
    emit(InitialStoneState());
  }

  void _getStones(GetAllStoneEvent event,emit){
    emit(LoadedStoneState(_questions));
  }

}