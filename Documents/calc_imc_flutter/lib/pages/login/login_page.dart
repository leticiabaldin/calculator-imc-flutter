import 'package:calc_imc_flutter/pages/calculator/calculator_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController username = TextEditingController();
    TextEditingController password = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: SingleChildScrollView(
          child: Form(
            child: Stack(
              children: [
                Column(
                  children: [
                    const SizedBox(height: 24),
                    const Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFC1006F),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Seja bem-vindo ao App de calcular seu IMC :)',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      controller: username,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: 'Username or email',
                        floatingLabelStyle: TextStyle(
                          color: Color(0xFFC1006F),
                        ),
                        disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Color(0xFFC1006F),
                          width: 1.2,
                          style: BorderStyle.solid,
                        )),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(0xFFC1006F),
                              width: 1.2,
                              style: BorderStyle.solid),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(0xFFC1006F),
                              width: 1.2,
                              style: BorderStyle.solid),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.red,
                              width: 1.2,
                              style: BorderStyle.solid),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.red,
                              width: 1.2,
                              style: BorderStyle.solid),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      controller: password,
                      decoration: const InputDecoration(
                        floatingLabelStyle: TextStyle(
                          color: Color(0xFFC1006F),
                        ),
                        labelText: 'Password',
                        disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Color(0xFFC1006F),
                          width: 1.2,
                          style: BorderStyle.solid,
                        )),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(0xFFC1006F),
                              width: 1.2,
                              style: BorderStyle.solid),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(0xFFC1006F),
                              width: 1.2,
                              style: BorderStyle.solid),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.red,
                              width: 1.2,
                              style: BorderStyle.solid),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.red,
                              width: 1.2,
                              style: BorderStyle.solid),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: const [
                        Text('Remember me'),
                      ],
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CalculatorPage()),
                        );
                      },
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFFC1006F),
                        fixedSize: const Size(400, 40),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Color(0xFFC1006F),
                          fontSize: 16,
                        ),
                      ),
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
