import 'package:flutter/material.dart';

class PEscolarScreen extends StatelessWidget {
  const PEscolarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(
        title: const Text('Periodo Escolar'),
        backgroundColor: Colors.purple,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _periodoItem('Inicio del Ciclo Escolar', '15 Agosto 2024'),
          _periodoItem('Primer Parcial', 'Septiembre 2024'),
          _periodoItem('Segundo Parcial', 'Noviembre 2024'),
          _periodoItem('Fin de Ciclo Escolar', '5 Julio 2025'),
        ],
      ),
    );
  }

  Widget _periodoItem(String titulo, String fecha) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: [Colors.white, Colors.purple.shade100],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            titulo,
            style: TextStyle(
              fontSize: 16,
              color: Colors.purple.shade900,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            fecha,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }
}
