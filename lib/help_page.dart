import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajuda'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mini-Tutorial de Utilização:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'É possível navegar pelo app pelo drawer na parte superior esquerda do aplicativo, Va para a página de Entradas ou Saódas, Aperte o Botão "+" para adicionar uma entrada, com a entrada adicionada é possível tanto Editar ela quando a Remover da lista clicando nos botões ao lado do item.',
            ),
          ],
        ),
      ),
    );
  }
}
