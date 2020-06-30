import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zinonline/bloc/task/task_bloc.dart';
import 'package:zinonline/bloc/task/task_event.dart';
import 'package:zinonline/bloc/task/task_state.dart';
import 'package:zinonline/network/model/task_model.dart';


class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Testing Bloc"),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
                child: BlocBuilder<TaskBloc,TaskState>(builder: (context,state){
                  if(state is InitialTaskState){
                    return Center(
                      child: Text("Data Not yet"),
                    );
                  }
                  if(state is LoadingState){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if(state is LoadedState){
                    return _loadState(state.taskModels);
                  }
                  if(state is FailTaskState){
                    return Center(
                      child: Text("${state.error}"),
                    );
                  }
                  return null;
                })),
            Padding(padding: EdgeInsets.only(top: 20)),
            FlatButton(color:Colors.blueAccent,onPressed: (){
              BlocProvider.of<TaskBloc>(context)..add(GetTaskEvent());
            }, child: Text("Load Data",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white),),padding: EdgeInsets.all(10),)
          ],
        )
      )
    );
  }
  ListView _loadState(List<TaskModel> tasks){
      return ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (BuildContext context,int index){
            final image = tasks[index].thumbnailUrl;
            return Card(
              child: ListTile(
                leading: image == null ? Image.network("https://pub.dev/static/img/ff.svg?hash=e6eqku0t4nirho4jt8akssianh0lvuiv") : Image.network("${image}"),
                title: Text("${tasks[index].title}"),
                subtitle: Text("${tasks[index].id.toString()}"),

              ),
            );
          });
  }
}
