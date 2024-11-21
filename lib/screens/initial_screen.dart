import 'package:alura/components/task.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {

  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: const Text('Nanatsu no Taizai', style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.blue, // Cor da sua escolha
        ),
        body: AnimatedOpacity(
          opacity: opacidade?1:0,
          duration: const Duration(milliseconds: 1000),
          child: ListView(
            children: const [
              Task('Diane', 3, 'assets/images/diane.jpg'),
              Task('King', 4, 'assets/images/king.png'),
              Task('Ban', 4, 'assets/images/ban.png'),
              Task('Meliodas', 5, 'assets/images/meliodas.png'),
              Task('Hawk', 1, 'assets/images/hawk.png'),
              Task('Gilthunder', 2, 'assets/images/gilthunder.png'),
              Task('Elizabeth', 2, 'assets/images/elizabeth.png'),
              SizedBox(height: 80,),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlue,
          onPressed: () {
            setState(() {
              opacidade = !opacidade;
            });
          },
          child: const Icon(Icons.remove_red_eye),
        ),
      ),
    );
  }
}