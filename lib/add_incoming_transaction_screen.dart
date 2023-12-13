import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddIncomingTransactionScreen extends StatelessWidget {
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Transação'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Descrição'),
            ),
            TextField(
              controller: amountController,
              decoration: InputDecoration(labelText: 'Valor'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _addTransaction();
                Navigator.pop(context);
              },
              child: Text('Adicionar'),
            ),
          ],
        ),
      ),
    );
  }

  void _addTransaction() {
    FirebaseFirestore.instance.collection('incoming_transactions').add({
      'description': descriptionController.text,
      'amount': double.parse(amountController.text),
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}
