import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: Container(),
            title: const Text('Nova Tarefa', style: TextStyle(color: Colors.white),),
            backgroundColor: Colors.blue, // Cor da sua escolha
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Container(
                height: 650,
                width: 375,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 3),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (String? value) {
                          if(value!=null && value.isEmpty) {
                            return 'Insira o nome da Tarefa';
                          }else {
                            return null;
                          }
                        },
                        controller: nameController,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          hintText: 'Digite sua Tarefa:',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 2),
                          ),
                          fillColor: Colors.white70,
                          filled: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value) {
                          if(value!.isEmpty || int.parse(value)<1 || int.parse(value)>5) {
                            return 'Insira uma dificuldade entre 1 e 5';
                          }else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.number,
                        controller: difficultyController,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          hintText: 'Digite a Dificuldade da Tarefa:',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 2),
                          ),
                          fillColor: Colors.white70,
                          filled: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value) {
                          if(value!.isEmpty) {
                            return 'Insira um url de imagem';
                          }else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.url,
                        onChanged: (text) {
                          setState(() {
              
                          });
                        },
                        controller: imageController,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          hintText: 'Adicione uma imagem:',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 2),
                          ),
                          fillColor: Colors.white70,
                          filled: true,
                        ),
                      ),
                    ),
                    Container(
                      width: 72,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.blue,
                        border: Border.all(width: 2, color: Colors.blue),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.network(
                          imageController.text,
                          errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                            return Image.asset('assets/images/sem_foto.webp', fit: BoxFit.cover,);
                          },
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: (){
                        if(_formKey.currentState!.validate()) {
                          print(nameController.text);
                          print(int.parse(difficultyController.text));
                          print(imageController.text);
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Salvando nova tarefa.')));
                        }
                      },
                      child: const Text('Adicionar')),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
