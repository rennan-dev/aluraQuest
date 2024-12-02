import 'package:alura/components/task.dart';
import 'package:alura/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {

  static const String tableSQL = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT)';

  static const String _tablename = 'taskTable';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';

  save(Task tarefa) async {
    print('acessando o método save');
    final Database bancoDeDados = await getDatabase();
    Map<String, dynamic> taskMap = toMap(tarefa);
    var itemExists = await find(tarefa.titulo);
    if(itemExists.isEmpty) {
      print('a tarefa não existia');
      return await bancoDeDados.insert(_tablename, taskMap);
    }else {
      print('a tarefa já existia');
      return await bancoDeDados.update(_tablename, taskMap, where: '$_name = ?', whereArgs: [tarefa.titulo]);
    }
  }

  Map<String, dynamic> toMap(Task tarefa) {
    print('convertendo tarefa em map');
    final Map<String, dynamic> mapaDeTarefas = {};
    mapaDeTarefas[_name] = tarefa.titulo;
    mapaDeTarefas[_difficulty] = tarefa.difficulty;
    mapaDeTarefas[_image] = tarefa.foto;
    print('mapa de tarefas: $mapaDeTarefas');
    return mapaDeTarefas;
  }

  Future<List<Task>> findAll() async {
    print('Estamos acessando o findAll');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(_tablename);
    print('Procurando dados no banco de dados... encontrado: $result');
    return toList(result);
  }

  List<Task> toList(List<Map<String, dynamic>> mapaDeTarefas) {
    print('Convertendo to List:');
    final List<Task> tarefas = [];
    for(Map<String,dynamic> linha in mapaDeTarefas) {
      final Task tarefa = Task(linha[_name], linha[_difficulty], linha[_image]);
      tarefas.add(tarefa);
    }
    print('print de tarefas: $tarefas');
    return tarefas;
  }

  Future<List<Task>> find(String nameTask) async {
    print('Acessando o find');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(_tablename, where: '$_name = ?', whereArgs: [nameTask]);
    print('Tarefa encontrada: ${toList(result)}');
    return toList(result);
  }

  delete(String nameTask) async {
    print('deletando tarefa $nameTask');
    final Database bancoDeDados = await getDatabase();
    return bancoDeDados.delete(_tablename, where: '$_name = ?', whereArgs: [nameTask]);
  }
}