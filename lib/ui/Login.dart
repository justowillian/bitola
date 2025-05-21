import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _CalculadoraBitolaScreenState();
}

class _CalculadoraBitolaScreenState extends State<Login> {
  final TextEditingController _correnteController = TextEditingController();
  final TextEditingController _distanciaController = TextEditingController();

  double bitola110 = 0.0;
  double bitola220 = 0.0;

  void calcularBitola() {
    double corrente = double.tryParse(_correnteController.text) ?? 0.0;
    double distancia = double.tryParse(_distanciaController.text) ?? 0.0;

    
    bitola110 = (2 * corrente * distancia) / 294.64;
    bitola220 = (2 * corrente * distancia) / 510.4;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bitola'),
        backgroundColor: const Color.fromARGB(255, 0, 170, 255),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: _correnteController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Corrente (A)',
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _distanciaController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Distância (m)',
              ),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: calcularBitola,
              child: Text('Calcular Bitola'),
            ),
            Text('Bitola para 110V: ${bitola110.toStringAsFixed(2)} mm²'),
            Text('Bitola para 220V: ${bitola220.toStringAsFixed(2)} mm²'),
          ],
        ),
      ),
    );
  }
}