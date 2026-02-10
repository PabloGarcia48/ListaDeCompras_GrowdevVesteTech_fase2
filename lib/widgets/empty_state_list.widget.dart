import 'package:flutter/material.dart';

class EmptyStateList extends StatelessWidget {
  const EmptyStateList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset("assets/images/lista-de-compras.png", height: 90),
        SizedBox(height: 30),
        Text(
          "Crie sua primeira lista",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
        Text(
          "toque no botão azul",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
