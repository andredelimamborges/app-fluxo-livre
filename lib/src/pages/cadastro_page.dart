import 'package:app_nivardo/src/pages/home_page.dart';
import 'package:flutter/material.dart';

class CadastroScreen extends StatefulWidget {
  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _cpfController = TextEditingController();
  final _senhaController = TextEditingController();
  final _confirmarSenhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/img_fundologin.png'), // Sua imagem de fundo
            fit: BoxFit.cover, // Para cobrir toda a tela
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: TextFormField(
                    controller: _nomeController,
                    decoration: InputDecoration(labelText: 'Nome',
                    labelStyle: TextStyle(color: Colors.white),),
                     style: TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira seu nome';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                      labelStyle: TextStyle(color: Colors.white),),
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira seu e-mail';
                      } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        return 'Por favor, insira um e-mail válido';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: TextFormField(
                    controller: _cpfController,
                    decoration: InputDecoration(  
                    labelText: 'CPF',
                    labelStyle: TextStyle(color: Colors.white),),
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira seu CPF';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: TextFormField(
                    controller: _senhaController,
                    decoration: InputDecoration(labelText: 'Senha',
                    labelStyle: TextStyle(color: Colors.white),),
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira sua senha';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: TextFormField(
                    controller: _confirmarSenhaController,
                    decoration: InputDecoration(labelText: 'Confirmar Senha',
                    labelStyle: TextStyle(color: Colors.white),),
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, confirme sua senha';
                      } else if (value != _senhaController.text) {
                        return 'As senhas não coincidem';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          // Realize o cadastro aqui
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content:
                                    Text('Cadastro realizado com sucesso')),
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                      ),
                      child: Text('Cadastrar'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancelar'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
