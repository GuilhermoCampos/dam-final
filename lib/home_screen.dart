import 'package:flutter/material.dart';
import 'package:projetofinal/about_page.dart';
import 'package:projetofinal/help_page.dart';
import 'package:projetofinal/view_incoming_transactions_screen.dart';
import 'add_outcoming_transaction_screen.dart';
import 'view_outcoming_transactions_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('💸️Organizador Financeiro💸️🤑️'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.attach_money,
                color: Colors.green,
                size: 100.0,
              ),
              SizedBox(height: 20.0),
              Text(
                'Gerenciador Financeiro',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Mantenha suas finanças sob controle',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 50.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HelpPage()),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Text(
                    'Começar',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Entradas'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewIncomingTransactionsScreen()),
                );
              },
            ),
            ListTile(
              title: Text('Saídas'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewOutcomingTransactionsScreen()),
                );
              },
            ),
            ListTile(
              title: Text('Ajuda'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HelpPage()),
                );
              },
            ),
            ListTile(
              title: Text('Sobre'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
