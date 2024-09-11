// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class InStockView extends StatefulWidget {
//   const InStockView({super.key});

//   @override
//   State<InStockView> createState() => _InStockViewState();
// }

// class _InStockViewState extends State<InStockView> {
//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;

//     return Container(
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [
//             Color(0xFFF3E5F5), // Very light purple
//             Color(0xFFE8EAF6), // Very light indigo
//           ],
//         ),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Icon(Icons.inventory, color: Color(0xFF6A1B9A), size: 64),
//           const SizedBox(height: 16),
//           Text(
//             'InventoryManagement',
//             style: GoogleFonts.merriweather(
//               fontSize: 24,
//               fontWeight: FontWeight.w500,
//               color: const Color(0xFF4A0E4E),
//             ),
//           ),

//           Positioned(
//             right: 16,
//             bottom: 16,
//             child: FloatingActionButton(
//               onPressed: () {
//                 // Add your FAB onPressed logic here
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text('Add new inventory item')),
//                 );
//               },
//               backgroundColor: const Color(0xFF6A1B9A),
//               child: const Icon(Icons.add),
//             ),
//           ),
//           //   Positioned(
//           //   right: screenWidth - 15, //16,
//           //   bottom: 16,
//           //   child: FloatingActionButton(
//           //     onPressed: () => (),//widget.onFabPressed(),
//           //     backgroundColor: const Color(0xFF6A1B9A),
//           //     child: const Icon(Icons.add),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InStockView extends StatefulWidget {
  const InStockView({super.key});

  @override
  State<InStockView> createState() => _InStockViewState();
}

class _InStockViewState extends State<InStockView> {
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
          onPressed: () {
          },
          backgroundColor: Colors.deepPurple[300],
          shape: const CircleBorder() ,
          child: const Icon(Icons.add, size: 28,),
        ),
        );
  }
}
