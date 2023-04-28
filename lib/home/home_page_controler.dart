import 'package:flutter/material.dart';

class HomePageControler {
  List<String> listaDeTarefas = [];

  void adicionarTarefa(String valor) {
    listaDeTarefas.add(valor);
  }

  void deletarTarefa(int index) {
    listaDeTarefas.removeAt(index);
  }
}
