import 'package:app_billgenerator/components/counter_widget.dart';
import 'package:app_billgenerator/components/mybutton_1.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DialogBox extends StatefulWidget {
  const DialogBox({super.key});

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  TextEditingController itemNameController = TextEditingController(text: '0');
  TextEditingController itemCountController = TextEditingController(text: '0');

  // item count:
  int _currentValue = 0;
  void _onCounterValueChanged(int newValue) {
    setState(() {
      _currentValue = newValue;
    });
    // print('Current counter value: $_currentValue');
  }

  // scaffold message:
  void showScaffoldMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(10),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple[300],
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              // controller: itemNameController,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade400, width: 5)),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 5)),
                  hintText: 'N E W   I T E M   N A M E . . .',
                  hintStyle: GoogleFonts.protestGuerrilla(
                    color: Colors.grey.shade400,
                    fontSize: 20,
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            CounterWidget(
              initialValue: 0,
              onValueChanged: _onCounterValueChanged,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                // save button
                MyButton1(
                    text: 'S A V E',
                    onPressed: () {
                      showScaffoldMessage(context, 'S A V E');
                    }),
                const SizedBox(
                  width: 20,
                ),
                // cancle button
                MyButton1(
                    text: 'C A N C E L',
                    onPressed: () {
                      showScaffoldMessage(context, 'C A N C E L');
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
