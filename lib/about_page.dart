import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Descrição do App:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Um Aplicativo voltado para gerenciamento de Finanças, permitindo adicionar entradas de dinheiro ou saídas, e vizualizar uma soma na parte superior :)',
            ),
            SizedBox(height: 16),
            Text(
              'Para quem se destina:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'O aplicativo se destina a qualquer pessoa que deseje manter suas finanças organizadas em seus dispositivos móveis.',
            ),
            SizedBox(height: 16),
            Text(
              'Versão:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              '1.0.0',
            ),
            SizedBox(height: 16),
            Text(
              'Data de Criação:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              '13 de Dezembro de 2023',
            ),
            SizedBox(height: 16),
            Text(
              'Nome do Desenvolvedor:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Guilherme Campos',
            ),
          ],
        ),
      ),
    );
  }
}
