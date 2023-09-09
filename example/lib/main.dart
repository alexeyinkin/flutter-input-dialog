import 'package:flutter/material.dart';
import 'package:input_dialog/input_dialog.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'input_dialog Demo'),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      title: 'input_dialog Demo',
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? _text;

  Future<void> _prompt() async {
    final result = await InputDialog.show(
      context: context,
      title: 'Enter Text',
    );

    setState(() {
      _text = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_text ?? 'Click the button.'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _prompt,
        tooltip: 'Show input_dialog',
        child: const Icon(Icons.open_in_new),
      ),
    );
  }
}
