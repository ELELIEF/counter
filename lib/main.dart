import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
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
            const Text('You have pushed the button this many times:'),
            CounterDisplay(counter: _counter),
            CounterStatus(counter: _counter),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DecrementButton(onPressed: _decrementCounter),
                const SizedBox(width: 16),
                ResetButton(onPressed: _resetCounter),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

// 组件1：计数器显示
class CounterDisplay extends StatelessWidget {
  final int counter;
  const CounterDisplay({super.key, required this.counter});

  @override
  Widget build(BuildContext context) {
    return Text('$counter', style: Theme.of(context).textTheme.headlineMedium);
  }
}

// 组件2：计数器状态（奇偶性）
class CounterStatus extends StatelessWidget {
  final int counter;
  const CounterStatus({super.key, required this.counter});

  @override
  Widget build(BuildContext context) {
    return Text(
      counter % 2 == 0 ? '当前为偶数' : '当前为奇数',
      style: TextStyle(color: Colors.grey[700]),
    );
  }
}

// 组件3：重置按钮
class ResetButton extends StatelessWidget {
  final VoidCallback onPressed;
  const ResetButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: const Text('重置'));
  }
}

// 组件4：减少按钮
class DecrementButton extends StatelessWidget {
  final VoidCallback onPressed;
  const DecrementButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: const Text('减少'));
  }
}
