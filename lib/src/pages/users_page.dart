import 'package:flutter/material.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  Future<List<Map<String, dynamic>>> fetchUsers() async {
    // Aqui você faria a requisição HTTP real, exemplo com dados mockados:
    await Future.delayed(const Duration(seconds: 1)); // simula carregamento
    return [
      {'id': 1, 'name': 'João Silva'},
      {'id': 2, 'name': 'Maria Oliveira'},
      {'id': 3, 'name': 'Carlos Souza'},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuários'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Erro ao carregar usuários.'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhum usuário encontrado.'));
          }

          final users = snapshot.data!;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                title: Text(user['name']),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      onPressed: () {
                        // Ação de editar
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Editar ${user['name']}')),
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        // Ação de excluir
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Excluir ${user['name']}')),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
