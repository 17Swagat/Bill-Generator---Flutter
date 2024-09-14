import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

// class CounterWidget extends StatefulWidget {
//   const CounterWidget({Key? key}) : super(key: key);

//   @override
//   _CounterWidgetState createState() => _CounterWidgetState();
// }

// class _CounterWidgetState extends State<CounterWidget> {
//   int _counter = 0;
//   final TextEditingController _controller = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _controller.text = _counter.toString();
//   }

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//       _controller.text = _counter.toString();
//     });
//   }

//   void _decrementCounter() {
//     setState(() {
//       _counter--;
//       _controller.text = _counter.toString();
//     });
//   }

//   void _updateCounterFromText(String value) {
//     setState(() {
//       _counter = int.tryParse(value) ?? _counter;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         IconButton(
//           icon: const Icon(Icons.remove),
//           onPressed: _decrementCounter,
//         ),
//         SizedBox(
//           width: 50,
//           child: TextField(
//             controller: _controller,
//             textAlign: TextAlign.center,
//             keyboardType: TextInputType.number,
//             inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//             onChanged: _updateCounterFromText,
//           ),
//         ),
//         IconButton(
//           icon: const Icon(Icons.add),
//           onPressed: _incrementCounter,
//         ),
//       ],
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }

class CounterWidget extends StatefulWidget {
  final int initialValue;
  final void Function(int) onValueChanged;

  const CounterWidget({
    Key? key,
    this.initialValue = 0,
    required this.onValueChanged,
  }) : super(key: key);

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  late int _counter;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _counter = widget.initialValue;
    _controller = TextEditingController(text: _counter.toString());
  }

  void _updateCounter(int newValue) {
    setState(() {
      _counter = newValue;
      _controller.text = _counter.toString();
    });
    widget.onValueChanged(_counter);
  }

  void _incrementCounter() {
    _updateCounter(_counter + 1);
  }

  void _decrementCounter() {
    // _counter = (_counter < 0) ? 0: _counter;
    if (_counter <= 0) {
      _counter = 1;
    }
    _updateCounter(_counter - 1);
  }

  void _updateCounterFromText(String value) {
    final newValue = int.tryParse(value);
    if (newValue != null) {
      _updateCounter(newValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          // color: Colors.grey,
          color: Colors.grey.shade400,
          highlightColor: Colors.red,
          iconSize: 55,
          icon: Icon(
            Icons.remove,
          ), //color: Colors.grey,size: 18),
          onPressed: _decrementCounter,
        ),
        SizedBox(
          width: 80,
          child: TextField(
            controller: _controller,
            style: GoogleFonts.protestGuerrilla(
              fontSize: 55
            ),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: _updateCounterFromText,
          ),
        ),
    
        IconButton(
          // color: Colors.grey,
          color: Colors.grey.shade400,
          highlightColor: Colors.blue,
          iconSize: 55,
          icon: Icon(
            Icons.add,
          ), //color: Colors.grey,size: 18),
          onPressed: _incrementCounter,
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
