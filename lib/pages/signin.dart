import 'package:flutter/material.dart';

class Signin extends StatelessWidget {
  const Signin({Key? key}) : super(key: key);  // Added 'Key? key' to constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign in"),
      ),
      body: SigninForm(),  // Removed 'const' for StatefulWidget
    );
  }
}

class SigninForm extends StatefulWidget {  // Changed to StatefulWidget
  const SigninForm({Key? key}) : super(key: key);  // Added 'Key? key' to constructor

  @override
  _SigninFormState createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {  // New state class
  bool _obscureText = true;  // Added to manage password visibility

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
          obscureText: _obscureText,  // Used _obscureText state variable
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
            suffixIcon: IconButton(  // Added suffix icon for visibility toggle
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color: Theme.of(context).primaryColorDark,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;  // Toggle password visibility
                });
              },
            ),
          ),
        ),
        SizedBox(height: 20),
        TextButton(
          onPressed: () {
            // Add your sign-in logic here
          },
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
            'Sign in',
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
