import 'package:alura/components/task.dart';
import 'package:alura/data/task_dao.dart';
import 'package:alura/screens/form_screen.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: const Icon(Icons.refresh),
            ),
          ],

          title: const Text(
            'Nanatsu no Taizai',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue, // Cor da sua escolha
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 70),
          child: FutureBuilder<List<Task>>(
            future: TaskDao().findAll(),
            builder: (context, snapshot) {
              List<Task>? items = snapshot.data;
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Center(child: Column(children: [CircularProgressIndicator(), Text('Carregando...')],),);
                  break;
                case ConnectionState.waiting:
                  return const Center(child: Column(children: [CircularProgressIndicator(), Text('Carregando...')],),);
                  break;
                case ConnectionState.active:
                  return const Center(child: Column(children: [CircularProgressIndicator(), Text('Carregando...')],),);
                  break;
                case ConnectionState.done:
                  if (snapshot.hasData && items != null) {
                    if (items.isNotEmpty) {
                      return ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (BuildContext context, int index) {
                            final Task tarefa = items[index];
                            return tarefa;
                          });
                    }
                    return const Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.error_outline,
                            size: 128,
                          ),
                          Text('Não há nenhuma tarefa', style: TextStyle(fontSize: 32),),
                        ],
                      ),
                    );
                  }
                  return const Text('Error ao carregar tarefas');
                  break;
              }
              return const Text('Error desconhecido');
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlue,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (contextNew) => FormScreen(
                          taskContext: context,
                        ))
            ).then((value) => setState(() {
              print('recarregando a tela inicial');
            }));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
