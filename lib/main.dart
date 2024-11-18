import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AluraQuest',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Alura Quest'),
          backgroundColor: Colors.lightGreen,
        ),
        body: ListView(
          children: [
            Task('Meliodas'),
            Task('Ban'),
            Task('Diane'),
            Task('Escanor'),
            Task('Gowther'),
            Task('King'),
            Task('Merlin'),
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){}),
      ),
    );
  }
}

class Task extends StatefulWidget {
  final String nome;

  const Task(this.nome, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int life = 10;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        child: Stack(
          children: [
            Container(
              color: Colors.lightGreen, height: 140,),
            Column(
              children: [
                Container(
                  color: Colors.white60, height: 100, child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(color: Colors.black26, width: 72, height: 100, ),
                    Container(width: 200, child: Text(widget.nome, style: TextStyle(fontSize: 18), overflow: TextOverflow.ellipsis,)),
                    Column(
                        children: [
                          ElevatedButton(onPressed: (){
                            setState(() {
                            life<10?life++:life;
                          });
                          print(life);
                          }, child: Icon(Icons.arrow_drop_up_outlined,)),
                          ElevatedButton(onPressed: (){
                            setState(() {
                              life>0?life--:life;
                            });
                            print(life);
                          }, child: Icon(Icons.arrow_drop_down_outlined)),
                        ]
                    ),
                  ],
                ),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(width: 200, child: LinearProgressIndicator(
                        color: Colors.green,
                        value: life/10,
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text('Vida ${life*10}', style: TextStyle(color: Colors.white, fontSize: 16),),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}



