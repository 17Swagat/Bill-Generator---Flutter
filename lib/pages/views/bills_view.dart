import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_billgenerator/invoice_service.dart';
import 'package:app_billgenerator/model/product.dart';
// import 'pdf_invoice';
// import 'package:pdf/pdf.dart';

// pdf:
class BillsView extends StatefulWidget {
  const BillsView({super.key});

  @override
  State<BillsView> createState() => _BillsViewState();
}

class _BillsViewState extends State<BillsView> {
  final PdfInvoiceService service = PdfInvoiceService();

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   decoration: const BoxDecoration(
    //     gradient: LinearGradient(
    //       begin: Alignment.topRight,
    //       end: Alignment.bottomLeft,
    //       colors: [
    //         Color(0xFFE8EAF6), // Very light indigo
    //         Color(0xFFE1F5FE), // Very light blue
    //       ],
    //     ),
    //   ),
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       const Icon(Icons.receipt, color: Color(0xFF6A1B9A), size: 64),
    //       const SizedBox(height: 16),
    //       Text(
    //         'Bill Management',
    //         style: GoogleFonts.merriweather(
    //           fontSize: 24,
    //           fontWeight: FontWeight.w500,
    //           color: const Color(0xFF4A0E4E),
    //         ),
    //       ),
    //     ],
    //   ),
    // );

    final PdfInvoiceService service = PdfInvoiceService();
    List<Product> soldProducts = [
      Product('Membership', 999, 19),
      Product('Nails', 252, 19),
      Product('Hammer', 1999, 19),
      Product('Pizza', 250, 7),
    ];

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
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // "old" :
              // const Icon(Icons.inventory, color: Color(0xFF6A1B9A), size: 64),
              // const SizedBox(height: 16),
              // Text(
              //   'Inventory Management',
              //   style: GoogleFonts.merriweather(
              //     fontSize: 24,
              //     fontWeight: FontWeight.w500,
              //     color: const Color(0xFF4A0E4E),
              //   ),
              // ),

              // "new" :
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // @forPDF generator
          // pdf-generator-stuff:
          // final data = await service.createHelloWorld();
          final data = await service.createInvoice(soldProducts);
          service.savePdfFile('Bill Name', data);
        },
        // backgroundColor: Colors.deepPurple[300],
        shape: const CircleBorder(),
        // child: const Icon(
        //   Icons.add,
        //   size: 28,
        // ),
        child: Center(
          child: Image.asset(
            'images/icons/pencil.png',
            color: Colors.deepPurple[300],
            height: 30,
            width: 30,
          ),
        ),
      ),
    );
  }
}
