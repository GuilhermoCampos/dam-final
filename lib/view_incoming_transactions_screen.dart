import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projetofinal/EditIncomingTransactionScreen.dart';
import 'package:projetofinal/add_incoming_transaction_screen.dart';

class ViewIncomingTransactionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entradas'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('incoming_transactions').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }

          var transactions = snapshot.data!.docs;

          // Calcula a soma total dos valores
          double totalAmount = transactions.fold(0.0, (sum, transaction) {
            var transactionData = transaction.data() as Map<String, dynamic>;
            return sum + (transactionData['amount'] ?? 0.0);
          });

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Adiciona o contador no topo da página
              Container(
                padding: EdgeInsets.all(16),
                color: Colors.blue,
                child: Text(
                  'Total Ganho: R\$ ${totalAmount.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              // Adiciona a lista de transações
              Expanded(
                child: ListView.builder(
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    var transaction = transactions[index];
                    var transactionData = transaction.data() as Map<String, dynamic>;

                    return ListTile(
                      title: Text(transactionData['description']),
                      subtitle: Text('R\$ ${transactionData['amount']}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              _editTransaction(context, transaction);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              _deleteTransaction(transaction);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddIncomingTransactionScreen()),
          ).then((_) => ());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

void _editTransaction(BuildContext context, DocumentSnapshot transaction) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => EditIncomingTransactionScreen(transaction)),
  ).then((_) => () {});
}

void _deleteTransaction(DocumentSnapshot transaction) {
  var docRef = FirebaseFirestore.instance
      .collection('incoming_transactions')
      .doc(transaction.id);

  docRef.delete().then((value) {
    print("Documento excluído com sucesso!");
  }).catchError((error) {
    print("Erro ao excluir documento: $error");
  });
}
