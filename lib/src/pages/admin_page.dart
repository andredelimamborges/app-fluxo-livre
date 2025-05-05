import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: AdminPage()));
}

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin'),
        backgroundColor: Colors.grey[800],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            color: Colors.grey[300],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.people, size: 50),
                Text('Usuários'),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            color: Colors.grey[300],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.bar_chart, size: 50),
                Text('Relatórios'),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            color: Colors.grey[300],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.settings, size: 50),
                Text('Configurações'),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            color: Colors.grey[300],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.exit_to_app, size: 50),
                Text('Sair'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
