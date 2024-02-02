import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
   MyHomePage({super.key, required this.title});


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

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: () {
            print("add");
          },
          ),
          IconButton(icon: Icon(Icons.remove), onPressed: () {
            print("remove");
          },
          ),

        ],
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${_counter}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Yazi("şuan ki deger $_counter"),
            Sayac("dışardaki deger $_counter",ilkdeger: 12),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit),label: "Bir"),
          BottomNavigationBarItem(
              icon: Icon(Icons.add),label: "İki"),

        ],
      ),
    );
  }
}


class Yazi extends StatelessWidget {
  final String icerik;

  const Yazi(this.icerik ,{super.key});

  @override
  Widget build(BuildContext context) {
    return Text(icerik);
  }
}

class Sayac extends StatefulWidget {
  final String baslik;
  final int ilkdeger;
  const Sayac(this.baslik, {super.key,required this.ilkdeger} );


  @override
  State<Sayac> createState() => _SayacState();
}

class _SayacState extends State<Sayac> {
  int sayi=0;
  //bir kere çalışan istenilen değer
  @override
  void initState() {
    sayi = widget.ilkdeger;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {
      setState(() { //build fonksiyonu tetikler.State değişkenlerini değiştiren satırlar
        sayi++;
      });
    },
    child: Text("$sayi"),

    );
  }
}


