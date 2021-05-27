part of 'pages.dart';

class SleepStartedPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/background_color.png',
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 155),
                  child: Text(
                    'Welcome to Sleep',
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 8, left: 32, right: 24, bottom: 24),
                  child: Text(
                    'Explore the new king of sleep. It uses sound and vesualization to create perfect conditions for refreshing sleep.',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        ?.copyWith(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 24, top: 24),
                  child: Image.asset(
                    'assets/images/sleep.png',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(left: 24, right: 24, top: 48),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder : (_) => SleepHomePage()));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: mainColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(38))),
                      child: Text(
                        'Get Started',
                        style: Theme.of(context).textTheme.button?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: sleepBackgroundColor,
    );
  }
}
