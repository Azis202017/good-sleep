part of 'pages.dart';

class PlayMusicPage extends StatefulWidget {
  final SleepMusic sleepMusic;
  PlayMusicPage({required this.sleepMusic});
  _PlayMusicPageState createState() => _PlayMusicPageState();
}

class _PlayMusicPageState extends State<PlayMusicPage> {
  AudioPlayer audioPlayer = AudioPlayer();
  Duration duration = Duration();
  Duration position = Duration();
  bool playing = false;

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background_color.png'),
                    fit: BoxFit.cover),),
          ),
          Container(
            margin: EdgeInsets.only(top: 16, left : 16),
            child: ElevatedButton(
              style : ElevatedButton.styleFrom(primary : Colors.transparent),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back, color: Colors.white),
            )
            ),
          Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.all(16),
                    child: Stack(
                      children: [
                        Image.asset('${widget.sleepMusic.image}', width: size),
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 80, right: 16),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: IconButton(
                              onPressed: () {
                                getAudio();
                              },
                              icon: playing == false
                                  ? Icon(
                                      Icons.play_arrow,
                                      color: Colors.white,
                                    )
                                  : Icon(
                                      Icons.pause,
                                      color: Colors.white,
                                    ),
                            ),
                          ),
                        ),
                      ],
                    )),
                Container(
                  margin: EdgeInsets.all(8),
                  child: Text(
                    '${widget.sleepMusic.name}',
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(bottom: 16),
                    child: Text(
                      '${widget.sleepMusic.genre}',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(color: Colors.white),
                    )),
                slider(),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: sleepBackgroundColor,
    );
  }

  Widget slider() {
    return Slider(
      min: 0.0,
      value: position.inSeconds.toDouble(),
      max: duration.inSeconds.toDouble(),
      onChanged: (double value) {
        setState(() {
          audioPlayer.seek(Duration(seconds: value.toInt()));
        });
      },
    );
  }

  void getAudio() async {
    var url =
        '${widget.sleepMusic.urlMusic}';
    if (playing) {
      var res = await audioPlayer.pause();
      if (res == 1) {
        setState(() {
          playing = false;
        });
      }
    } else {
      var res = await audioPlayer.play(url, isLocal: true);
      if (res == 1) {
        setState(() {
          playing = true;
        });
      }
    }
    audioPlayer.onDurationChanged.listen((Duration dd) {
      setState(() {
        duration = dd;
      });
    });
    audioPlayer.onAudioPositionChanged.listen((Duration dd) {
      setState(() {
        position = dd;
      });
    });
  }
}
