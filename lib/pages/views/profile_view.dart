import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color(0xFFE1F5FE), // Very light blue
            Color(0xFFF3E5F5), // Very light purple
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.person, color: Color(0xFF6A1B9A), size: 64),
          const SizedBox(height: 16),
          Text(
            'UserProfile',
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
