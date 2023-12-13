import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditIncomingTransactionScreen extends StatefulWidget {
  final DocumentSnapshot transaction;

  EditIncomingTransactionScreen(this.transaction);

  @override
  _EditTransactionScreenState createState() => _EditTransactionScreenState();
}

class _EditTransactionScreenState extends State<EditIncomingTransactionScreen> {
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  @override
  void initState() {
    super.initState();

    var transactionData = widget.transaction.data() as Map<String, dynamic>;

    descriptionController.text = transactionData['description'];
    amountController.text = transactionData['amount'].toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Transação'),
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
                _updateTransaction();
                Navigator.pop(context);
              },
              child: Text('Atualizar'),
            ),
          ],
        ),
      ),
    );
  }

  void _updateTransaction() {
    var docRef = FirebaseFirestore.instance
        .collection('incoming_transactions')
        .doc(widget.transaction.id);

    docRef.update({
      'description': descriptionController.text,
      'amount': double.parse(amountController.text),
    });
  }
}
