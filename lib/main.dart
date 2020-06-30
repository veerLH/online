import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:zinonline/bloc/task/task_bloc.dart';
import 'package:zinonline/network/api_service.dart';
import 'package:zinonline/ui/my_home.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<ApiService>(
      create: (context)=>ApiService.create(),
      child: Consumer<ApiService>(builder: (context,apiservice,child){
        return BlocProvider<TaskBloc>(
          create: (context)=>TaskBloc(apiservice),
          child: MaterialApp(
            title: "Test Bloc",
            theme: ThemeData(
              primaryColor: Colors.orangeAccent
            ),
            home: MyHome(),
          ),
        );
      }),
    );
  }
}
