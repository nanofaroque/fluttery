import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demooo',
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
        primarySwatch: Colors.pink,
      ),
      home: BoringPage(title: 'Homey'),
    );
  }
}

class BoringPage extends StatelessWidget {
  var title;

  BoringPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PlaybackButton(),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class PlaybackButton extends StatefulWidget{
  @override
  _PlaybackButtonState createState()=> _PlaybackButtonState();
}

class _PlaybackButtonState extends State<PlaybackButton>{
  bool _isPlaying = false;
  void _stop(){}
  void _play() async{
    FlutterSound flutterSound = FlutterSound();
    String path='https://www.bensound.com/royalty-free-music/track/summer-chill-relaxed-tropical';
   await flutterSound.startPlayer(path);
    print('startPlayer: $path');

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return IconButton(
      icon: _isPlaying?Icon(Icons.stop):Icon(Icons.play_arrow),
      onPressed: (){
        if(_isPlaying){
          _stop();
        }else{
          _play();
        }
        setState(()=> _isPlaying=!_isPlaying);
      },
    );
  }

}


