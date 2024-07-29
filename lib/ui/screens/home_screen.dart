import 'package:dars_66_home/bloc/stone_bloc.dart';
import 'package:dars_66_home/bloc/stone_event.dart';
import 'package:dars_66_home/bloc/stone_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _questionIndex = 0;
  List<String> _optins = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<StoneBloc, StoneState>(
        builder: (context, state) {
          if (state is InitialStoneState) {
            return Center(
              child: FilledButton(
                onPressed: () {
                  context.read<StoneBloc>().add(GetAllStoneEvent());
                },
                child: const Text("Start"),
              ),
            );
          }

          if(state is LoadedStoneState){
            if(_questionIndex == state.questions.length){
              context.read<StoneBloc>().add(FinalStoneEvent());
              _questionIndex = 0;
            }else{
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${_questionIndex + 1}/${state.questions.length}"),
                    const Text("4 PICS 1 WORD",style: TextStyle(fontSize: 30,color: Colors.green),),
                    const SizedBox(height: 50,),
                    Container(
                      height: 370,
                      width: 370,
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.grey,width: 5)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 170,
                                height: 170,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(state.questions[_questionIndex].imgs[0]),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                              Container(
                                width: 170,
                                height: 170,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(state.questions[_questionIndex].imgs[1],),
                                      fit: BoxFit.cover
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 170,
                                height: 170,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(state.questions[_questionIndex].imgs[2]),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                              Container(
                                width: 170,
                                height: 170,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(state.questions[_questionIndex].imgs[3]),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 50,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for(int i = 0; i < state.questions[_questionIndex].answer.length;i++)
                          Container(
                            height: 50,
                            width: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                            decoration: BoxDecoration(
                                color: i + 1 <= _optins.length ? Colors.red : Colors.white
                            ),
                            alignment: Alignment.center,
                            child: Text("${i + 1 <= _optins.length ? _optins[i] : ''}",style: TextStyle(fontSize: 40,color: Colors.white),),
                          ),
                      ],
                    ),
                    Wrap(
                      children: [
                        for(int i = 0;i < state.questions[_questionIndex].options.length;i++)
                          InkWell(
                            onTap: (){
                              _optins.add(state.questions[_questionIndex].options[i]);
                              if(_optins.length == state.questions[_questionIndex].answer.length){
                                if(state.questions[_questionIndex].answer.toLowerCase() == _optins.join('').toLowerCase()){
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("To'g'ri topdingiz")));
                                  _questionIndex++;
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No to'g'ri javob")));
                                }
                                _optins = [];
                              }
                              setState(() {

                              });
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    end: Alignment.bottomLeft,
                                    begin: Alignment.topLeft,
                                    colors: [
                                      Colors.blue,
                                      Colors.green,
                                      Colors.pink,
                                      Colors.yellow,
                                      Colors.amber,
                                      Colors.red
                                    ],
                                  )
                              ),
                              alignment: Alignment.center,
                              child: Text("${state.questions[_questionIndex].options[i]}",style: const TextStyle(fontSize: 40,color: Colors.white),),
                            ),
                          )
                      ],
                    )
                  ],
                ),
              );
            }
          }
          
          

          return Container();
        },
      ),
    );
  }
}
