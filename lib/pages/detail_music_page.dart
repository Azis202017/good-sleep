part of 'pages.dart';

class DetailMusicPage extends StatefulWidget {
  final SleepMusic sleepMusic;
  DetailMusicPage({required this.sleepMusic});
  _DetailMusicPageState createState() => _DetailMusicPageState();
}

class _DetailMusicPageState extends State<DetailMusicPage> {
  bool _isFavorite = true;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorite) {
        widget.sleepMusic.countFavorite =
            widget.sleepMusic.countFavorite! + 1.0;

        _isFavorite = false;
      } else {
        widget.sleepMusic.countFavorite =
            widget.sleepMusic.countFavorite! - 1.0;
        _isFavorite = true;
      }
    });
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.asset('${widget.sleepMusic.image}'),
                    Container(
                      margin: EdgeInsets.only(top: 24, left: 16),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.transparent),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16, top: 24),
                  child: Text(
                    '${widget.sleepMusic.name}',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    '${widget.sleepMusic.timeDuration} * ${widget.sleepMusic.genre}',
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        ?.copyWith(color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Text(
                    '${widget.sleepMusic.description}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        ?.copyWith(color: Colors.grey),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                          top: 24,
                          left: 16,
                        ),
                        child: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Icon(
                                  Icons.headphones_outlined,
                                  color: Colors.white,
                                )),
                            Padding(
                                padding: EdgeInsets.only(left: 8, top: 8),
                                child: Text(
                                    '${widget.sleepMusic.countListening} Listening',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        ?.copyWith(color: Colors.white))),
                          ],
                        )),
                    Container(
                      margin: EdgeInsets.only(top: 24, left: 16, right: 24),
                      child: Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: IconButton(
                                onPressed: _toggleFavorite,
                                icon: _isFavorite
                                    ? Icon(
                                        Icons.favorite_outline,
                                        color: Colors.white,
                                      )
                                    : Icon(Icons.favorite, color: Colors.white),
                              )),
                          Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: Text(
                                  '${widget.sleepMusic.countFavorite} Favorite',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      ?.copyWith(color: Colors.white))),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 16, top: 24),
                  child: Text(
                    'Related',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
                Container(
                  height: 300,
                  margin: EdgeInsets.only(bottom: 16, top: 16),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: widget.sleepMusic.relatedMusic!.map((related) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 8, left: 8, top: 16),
                            child: Image.asset(
                              '${related.image}',
                              height: 200,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 16, top: 8),
                            child: Text(
                              '${related.name}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(color: Colors.white),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 16,
                              top: 8,
                            ),
                            child: Text(
                              '${related.timeDuration} * ${related.genre}',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  ?.copyWith(color: Colors.white),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 32, left : 16, right: 16),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurple.shade300
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => PlayMusicPage(sleepMusic: widget.sleepMusic)));
                    },
                    child: Text('Play Music'),
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: sleepBackgroundColor,
      ),
    );
  }
}
