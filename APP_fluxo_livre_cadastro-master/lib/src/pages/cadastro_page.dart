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
            image: AssetImage('assets/images/img_fundologin.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                buildTextField('Nome Completo', _nomeController, TextInputType.text),
                buildTextField('E-mail de Contato', _emailController, TextInputType.emailAddress),
                buildTextField('Número do CPF', _cpfController, TextInputType.number),
                buildTextField('Senha de Acesso', _senhaController, TextInputType.text, obscureText: true),
                buildTextField('Confirmar Senha', _confirmarSenhaController, TextInputType.text, obscureText: true, validateConfirm: true),
                SizedBox(height: 20),
                buildButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller, TextInputType type, {bool obscureText = false, bool validateConfirm = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.white),
        ),
        keyboardType: type,
        obscureText: obscureText,
        style: TextStyle(color: Colors.white, fontSize: 18),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor, insira $label';
          }
          if (label.contains('E-mail') && !RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
            return 'Por favor, insira um e-mail válido';
          }
          if (validateConfirm && value != _senhaController.text) {
            return 'As senhas não coincidem';
          }
          return null;
        },
      ),
    );
  }

  Widget buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState?.validate() ?? false) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Cadastro realizado com sucesso')),
              );
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            }
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
          child: Text('Cadastrar'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancelar'),
        ),
      ],
    );
  }
}