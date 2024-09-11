import 'package:app_billgenerator/pages/views/bills_view.dart';
import 'package:app_billgenerator/pages/views/in_stock_view.dart';
import 'package:app_billgenerator/pages/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFF0E6FF), // Light lavender
          centerTitle: true,
          toolbarHeight: 140,

          title: Text(
            'I N V O I C E \nG E N E R A T O R',
            textAlign: TextAlign.center,
            // style: GoogleFonts.playfairDisplay(
            style: GoogleFonts.protestGuerrilla(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF4A0E4E), // Deep purple
              letterSpacing: 1.2,
            ),
          ),
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFF0E6FF), // Light lavender
                  Color(0xFFE1BEE7), // Lighter purple
                ],
              ),
            ),
          ),
          bottom: TabBar(
            indicatorColor: const Color(0xFF8E24AA), // Deep purple
            indicatorWeight: 4,//3.5,
            tabs: [
              Tab(
                child: Text(
                  'I N  S T O C K',
                  // style: GoogleFonts.quicksand(
                  style: GoogleFonts.protestGuerrilla(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF4A0E4E), // Deep purple
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'B I L L S',
                  // style: GoogleFonts.quicksand(
                  style: GoogleFonts.protestGuerrilla(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF4A0E4E), // Deep purple
                  ),
                ),
              ),
              // Tab(
              //   child: Text(
              //     'P R O F I L E',
              //     // style: GoogleFonts.quicksand(
              //     style: GoogleFonts.protestGuerrilla(
              //       fontSize: 18,
              //       fontWeight: FontWeight.bold,
              //       color: const Color(0xFF4A0E4E), // Deep purple
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            InStockView(),
            BillsView(),
            // ProfileView(),
          ],
        ),
      ),
    );
  }
}
