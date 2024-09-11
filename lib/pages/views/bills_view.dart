import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BillsView extends StatefulWidget {
  const BillsView({super.key});

  @override
  State<BillsView> createState() => _BillsViewState();
}

class _BillsViewState extends State<BillsView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xFFE8EAF6), // Very light indigo
            Color(0xFFE1F5FE), // Very light blue
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.receipt, color: Color(0xFF6A1B9A), size: 64),
          const SizedBox(height: 16),
          Text(
            'Bill Management',
            style: GoogleFonts.merriweather(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF4A0E4E),
            ),
          ),
        ],
      ),
    );
  }
}
