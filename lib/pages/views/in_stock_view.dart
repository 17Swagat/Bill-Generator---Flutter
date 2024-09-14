import 'package:app_billgenerator/components/dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InStockView extends StatefulWidget {
  const InStockView({super.key});

  @override
  State<InStockView> createState() => _InStockViewState();
}

class _InStockViewState extends State<InStockView> {
  // add new Item
  // name, price, gst
  void addNewItem() {
    showDialog(
      context: context,
      builder: (context) => const DialogBox(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFF3E5F5), // Very light purple
              Color(0xFFE8EAF6), // Very light indigo
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.inventory, color: Color(0xFF6A1B9A), size: 64),
              const SizedBox(height: 16),
              Text(
                'Inventory Management',
                style: GoogleFonts.merriweather(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF4A0E4E),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addNewItem(),
        backgroundColor: Colors.deepPurple[300],
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          size: 28,
        ),
      ),
    );
  }
}
