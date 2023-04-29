import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lista_de_tarefas/home/home_page_controler.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageControler homePageControler = HomePageControler();
  TextEditingController textcontroler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
            body: SizedBox(
          height: constraints.maxHeight,
          child: Stack(
            children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Lista de Tarefas',
                        style: TextStyle(
                            fontSize: constraints.maxWidth * 0.07,
                            color: Colors.white),
                      ),
                      TextField(
                        controller: textcontroler,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            hintText: 'Digite um Texto',
                            hintStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (textcontroler.text.isEmpty) {
                            return;
                          }

                          setState(() {
                            homePageControler
                                .adicionarTarefa(textcontroler.text);
                            textcontroler.clear();
                          });
                        },
                        child: Text('Adicionar'),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange),
                      )
                    ],
                  ),
                ),
                height: constraints.maxHeight * 0.45,
                width: constraints.maxWidth,
                color: Colors.blue,
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  child: ListView.builder(
                    itemCount: homePageControler.listaDeTarefas.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          trailing: IconButton(
                              onPressed: () {
                                setState(() {
                                  homePageControler.deletarTarefa(index);
                                });
                              },
                              icon: Icon(
                                Icons.remove_circle,
                                color: Colors.red,
                              )),
                          title: Text(
                              '${homePageControler.listaDeTarefas[index]}'),
                        ),
                      );
                    },
                  ),
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  height: constraints.maxHeight * 0.60,
                  width: constraints.maxWidth,
                ),
              ),
            ],
          ),
        ));
      },
    );
  }
}
