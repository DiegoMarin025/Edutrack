import 'package:flutter/material.dart';

// 1. AQUÍ VAN LOS IMPORTS DE TUS PANTALLAS
// Asegúrate de que estén al inicio del archivo.
import 'pantallas/inicio_screen.dart';
import 'pantallas/grupos_screen.dart';
import 'pantallas/pescolar_screen.dart';
import 'pantallas/calificaciones_screen.dart';
import 'pantallas/ayuda_screen.dart';

// El resto de tu clase
class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;

  // 2. AQUÍ VA LA LISTA DE WIDGETS
  static final List<Widget> _widgetOptions = <Widget>[
    InicioScreen(),
    GruposScreen(),
    PEscolarScreen(),
    CalificacionesScreen(),
    AyudaScreen(),
  ];

  void _onSelectItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.of(context).pop(); // Cierra el Drawer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenido'),
        elevation: 4.0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              // Lógica para notificaciones
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              _buildDrawerHeader(),
              _buildDrawerItem(icon: Icons.home_rounded, text: 'Inicio', index: 0),
              _buildDrawerItem(icon: Icons.group_rounded, text: 'Grupos', index: 1),
              _buildDrawerItem(icon: Icons.calendar_today_rounded, text: 'P. escolar', index: 2),
              _buildDrawerItem(icon: Icons.assessment_rounded, text: 'Calificaciones', index: 3),
              const Divider(color: Colors.grey, indent: 16, endIndent: 16),
              _buildDrawerItem(icon: Icons.help_outline_rounded, text: '¿Necesitas ayuda?', index: 4),
            ],
          ),
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }

  // --- Widgets de Ayuda para el Drawer (sin cambios) ---

  Widget _buildDrawerHeader() {
    return UserAccountsDrawerHeader(
      accountName: const Text(
        'Usuario: XXXXX',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      accountEmail: const Text(
        'usuario@ejemplo.com',
        style: TextStyle(fontSize: 14),
      ),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.white,
        child: Icon(
          Icons.person_outline_rounded,
          size: 45,
          color: Colors.purple.shade700,
        ),
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purple.shade700, Colors.purple.shade400],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    required int index,
  }) {
    final bool isSelected = _selectedIndex == index;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        gradient: isSelected
            ? LinearGradient(
          colors: [Colors.purple.shade100, Colors.purple.shade50.withOpacity(0.5)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        )
            : null,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: isSelected ? Colors.purple.shade800 : Colors.grey.shade700,
        ),
        title: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.purple.shade900 : Colors.black87,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        onTap: () => _onSelectItem(index),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}