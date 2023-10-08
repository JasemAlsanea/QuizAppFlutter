import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign up"),
      ),
      body: SignupForm(),
    );
  }
}

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool _validateEmail(String email) {
    final RegExp emailRegex = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegex.hasMatch(email);
  }

  void _handleSignup() {
    if (_validateEmail(_emailController.text)) {
      print('Success: Email is valid');
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Invalid Email'),
            content: Text('Please enter a valid email address'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: 'UserID',
            prefixIcon: const Icon(Icons.person),
            prefixIconColor:
                MaterialStateColor.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.focused)) {
                return Colors.green;
              }
              if (states.contains(MaterialState.error)) {
                return Colors.red;
              }
              return Colors.grey;
            }),
          ),
        ),
        SizedBox(height: 20),
        TextFormField(
          obscureText: _obscureText,
          decoration: InputDecoration(
              hintText: 'Password',
              prefixIcon: const Icon(Icons.password),
              prefixIconColor:
                  MaterialStateColor.resolveWith((Set<MaterialState> states) {
                if (states.contains(MaterialState.focused)) {
                  return Colors.green;
                }
                if (states.contains(MaterialState.error)) {
                  return Colors.red;
                }
                return Colors.grey;
              }),
              suffixIcon: IconButton(
                icon: Icon(
                  // Choose the icon based on _obscureText
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Theme.of(context).primaryColorDark,
                ),
                onPressed: () {
                  // Toggle the state of _obscureText on press
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )),
        ),
        SizedBox(height: 20),
        TextField(
          controller: _emailController,
          decoration: InputDecoration(
            hintText: 'Email',
            prefixIcon: const Icon(Icons.email),
            prefixIconColor:
                MaterialStateColor.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.focused)) {
                return Colors.green;
              }
              if (states.contains(MaterialState.error)) {
                return Colors.red;
              }
              return Colors.grey;
            }),
          ),
        ),
        SizedBox(height: 20),
        TextButton(
          onPressed: _handleSignup,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.teal,
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            elevation: 5.0,
            shadowColor: Colors.teal.withOpacity(0.5),
          ),
          child: Text(
            'Sign up',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
