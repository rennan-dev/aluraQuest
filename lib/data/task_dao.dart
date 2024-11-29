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

  // save(Task tarefa) async {
  //
  // }
  //
  // Future<List<Task>> findAll() async {
  //   print('Estamos acessando o findAll');
  //   final Database bancoDeDados = await getDatabase();
  //   final List<Map<String, dynamic>> result = await bancoDeDados.query(_tablename);
  //   print('Procurando dados no banco de dados... encontrado: $result');
  //   return toList();
  // }
  //
  // Future<List<Task>> find(String nameTask) async {
  //
  // }
  //
  // delete(String nameTask) async {
  //
  // }
}