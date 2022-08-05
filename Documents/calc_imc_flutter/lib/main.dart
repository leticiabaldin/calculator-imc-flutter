import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      color: Colors.pink,
      scrollBehavior: ScrollBehaviorModified(),
    ),
  );
}

class ScrollBehaviorModified extends ScrollBehavior {
  const ScrollBehaviorModified();

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
      case TargetPlatform.android:
        return const BouncingScrollPhysics();
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return const ClampingScrollPhysics();
      default:
        return const ClampingScrollPhysics();
    }
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String infoText = 'Informe seus dados:';

  void _resetFields() {
    weightController.text = '';
    heightController.text = '';
    setState(() => infoText = 'Informe seus dados:');
  }

  double? calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double resultImc = weight / (height * height);

      if (resultImc < 18.6) {
        infoText = 'Abaixo do peso: ${resultImc.toStringAsPrecision(2)}';
      } else if (resultImc >= 18.6 && resultImc < 24.9) {
        infoText = 'Peso Ideal: ${resultImc.toStringAsPrecision(2)}';
      } else if (resultImc >= 24.9 && resultImc < 29.9) {
        infoText =
            'Levemente acima do peso: ${resultImc.toStringAsPrecision(2)}';
      } else if (resultImc >= 29.9 && resultImc < 34.9) {
        infoText = 'Obesidade Grau I: ${resultImc.toStringAsPrecision(2)}';
      } else if (resultImc >= 34.9 && resultImc < 39.9) {
        infoText = 'Obesidade Grau II: ${resultImc.toStringAsPrecision(2)}';
      } else if (resultImc >= 40) {
        infoText = 'Obesidade Grau III: ${resultImc.toStringAsPrecision(2)}';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Calculadora de IMC'),
          centerTitle: true,
          elevation: 2,
          backgroundColor: Colors.pink,
          actions: [
            IconButton(
              onPressed: _resetFields,
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Image.asset(
                        'assets/images/barbie.png',
                        fit: BoxFit.fitHeight,
                      ),
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      width: 200,
                      height: 200,
                      clipBehavior: Clip.antiAliasWithSaveLayer,

                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Insira seu peso!';
                      }
                    },
                    keyboardType: TextInputType.number,
                    controller: weightController,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: 'Peso(Kg)',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.2,
                            style: BorderStyle.solid),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(0x00000000),
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Insira sua altura!';
                      }
                    },
                    keyboardType: TextInputType.text,
                    controller: heightController,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: 'Altura(cm)',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.2,
                            style: BorderStyle.solid),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(0x00000000),
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
                  Container(
                    height: 42,
                    margin: const EdgeInsets.symmetric(vertical: 24),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          calculate();
                        }
                      },
                      child: const Text('Calcular'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pink,
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Text(
                        infoText,
                        style: TextStyle(fontSize: 18),
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}
