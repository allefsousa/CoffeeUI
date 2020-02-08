import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  @override
  void initState(){
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coofe App',
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
      home: AuthPage(),
    );
  }


}

class AuthPage extends StatelessWidget {

  final image = <String> [
    'https://img.etimg.com/thumb/msid-66650613,width-643,imgsize-801611,resizemode-4/coffee.jpg',
    'https://img.etimg.com/thumb/msid-66650613,width-643,imgsize-801611,resizemode-4/coffee.jpg',
    'https://img.etimg.com/thumb/msid-66650613,width-643,imgsize-801611,resizemode-4/coffee.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height /1.2,
              width: double.infinity,
              child: PageView(
                children: image.map((link){
                  return PageViewItem(
                    imageUrl: link,
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PageViewItem extends StatelessWidget {
  final String imageUrl;

  const PageViewItem({Key key,
    @required this.imageUrl}) : assert(imageUrl != null),
        assert(imageUrl != '');
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12,12,12,0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.black,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imageUrl)
        )
      ),
    );
  }
}



