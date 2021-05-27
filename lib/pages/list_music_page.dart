part of 'pages.dart';

class ListMusicPage extends StatelessWidget {
  final List<SleepMusic> sleepMusic = [
    SleepMusic(
      name: 'Night Island',
      timeDuration: '10 MIN',
      description:
          'Ease the mind into a restful night’s sleep  with these deep, amblent tones.',
      image: 'assets/images/nigh_sleep.png',
      countFavorite: 120,
      countListening: 120,
      genre: 'SLEEP MUSIC',
      urlMusic:
          'https://audio-previews.elements.envatousercontent.com/files/66131698/preview.mp3',
      relatedMusic: [
        SleepMusic(
          name: 'Sweet Sleep',
          timeDuration: '5 MIN',
          image: 'assets/images/sweet_sleep.png',
          countFavorite: 120,
          countListening: 120,
          genre: 'SLEEP MUSIC',
        ),
        SleepMusic(
            name: 'Good Night',
            timeDuration: '45 MIN',
            image: 'assets/images/moon_clouds.png',
            genre: 'SLEEP MUSIC',
            countFavorite: 125,
            countListening: 200,
            description:
                'Ease the mind into a restful night’s sleep  with these deep, amblent tones.'),
      ],
    ),
    SleepMusic(
      name: 'Sweet Sleep',
      timeDuration: '5 MIN',
      image: 'assets/images/sweet_sleep.png',
      countFavorite: 190,
      countListening: 400,
      genre: 'SLEEP MUSIC',
      description:
          'Ease the mind into a restful night’s sleep  with these deep, amblent tones.',
      urlMusic:
          'https://assets.mixkit.co/music/preview/mixkit-wedding-01-657.mp3',
      relatedMusic: [
        SleepMusic(
          name: 'Night Island',
          timeDuration: '12 MIN',
          description:
              'Ease the mind into a restful night’s sleep  with these deep, amblent tones.',
          image: 'assets/images/nigh_sleep.png',
          countFavorite: 120,
          countListening: 120,
          genre: 'SLEEP MUSIC',
        ),
        SleepMusic(
          name: 'Good Night',
          timeDuration: '10 MIN',
          image: 'assets/images/moon_clouds.png',
          genre: 'SLEEP MUSIC',
        ),
      ],
    ),
    SleepMusic(
      name: 'Good Night',
      timeDuration: '5 MIN',
      countFavorite: 1200,
      countListening: 1500,
      image: 'assets/images/moon_clouds.png',
      genre: 'SLEEP MUSIC',
      description:
          'Ease the mind into a restful night’s sleep  with these deep, amblent tones.',
      urlMusic:
          'https://assets.mixkit.co/music/preview/mixkit-cold-day-504.mp3',
      relatedMusic: [
        SleepMusic(
          name: 'Night Island',
          timeDuration: '10 MIN',
          description:
              'Ease the mind into a restful night’s sleep  with these deep, amblent tones.',
          image: 'assets/images/nigh_sleep.png',
          countFavorite: 120,
          countListening: 120,
          genre: 'SLEEP MUSIC',
        ),
        SleepMusic(
          name: 'Sweet Sleep',
          timeDuration: '5 MIN',
          image: 'assets/images/sweet_sleep.png',
          countFavorite: 120,
          countListening: 120,
          genre: 'SLEEP MUSIC',
        ),
      ],
    ),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                width: double.infinity,
                child: Row(children: [
                  Container(
                    margin: EdgeInsets.only(right: 24, top: 24, left : 16),
                    child: ElevatedButton(
                      style : ElevatedButton.styleFrom(
                        primary: Colors.transparent
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                        top: 24,
                      ),
                      child: Text('Sleep Music',
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              ?.copyWith(color: Colors.white)))
                ]),
              ),
            ]),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 2),
            delegate: SliverChildListDelegate(
              sleepMusic.map((sleep) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => DetailMusicPage(
                                  sleepMusic: sleep,
                                )));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(
                            top: 32,
                            left: 16,
                          ),
                          child: Image.asset('${sleep.image}'),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 16, top: 8),
                        child: Text(
                          '${sleep.name}',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 16, top: 8),
                        child: Row(
                          children: [
                            Text('${sleep.timeDuration}',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    ?.copyWith(color: Colors.grey)),
                            Text(
                              ' * ${sleep.genre}',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  ?.copyWith(color: Colors.grey),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
      backgroundColor: sleepBackgroundColor,
    );
  }
}
