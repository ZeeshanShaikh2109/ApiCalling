import 'package:flutter/material.dart';
import 'package:home_test/api_call.dart';
import 'package:home_test/api_modal.dart';

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
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
       
        title: Text(widget.title),
      ),
      body: Center(
        
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             Expanded(
               child: FutureBuilder<ApiCalling>(
                future: fetchUserData(),
                builder: (context, snapshot) {
                  if(snapshot.hasData){
                  return ListView.builder(
                  
                  itemCount:snapshot.data!.data.length,
                  
                  itemBuilder: 
                  (context, index){
               
                  
                   return ListTile (
                    leading:  CircleAvatar(
                      
                      backgroundImage: NetworkImage(snapshot.data!.data[index].avatar),
                      // NetworkImage(('https://googleflutter.com/sample_image.jpg'),
                      
                    
                    ),
                    title: Text(snapshot.data!.data[index].firstName + " " + snapshot.data!.data[index].lastName),
                    
                    subtitle:  Text(snapshot.data!.data[index].email ),
                    trailing: Text(snapshot.data!.data[index].id.toString()),

                   ) ;
                 
                   
                  }
                  );
                    
                  }else if (snapshot.hasError){
                    return Text('${snapshot.error}');

                  }
                  return Center(child: CircularProgressIndicator(
                    strokeWidth: 5,
                  ));
                },
               )
             )
          
            ],
          ),
        ),
      )
  
          );

  }
  }

                   
                   
                //  }, separatorBuilder: (BuildContext context, int index) { 
                //   return Divider(height: 20,thickness: 1,);
                //   },
                 
               


