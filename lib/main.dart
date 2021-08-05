import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

// first

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late BannerAd myBannerAd;
  //late InterstitialAd myInterstitialAd;

  @override
  void initState() {
    super.initState();
    myBannerAd = BannerAd(
        size: AdSize.fullBanner,
        adUnitId: "ca-app-pub-3940256099942544/6300978111",
        request: AdRequest(),
        listener: BannerAdListener());
    myBannerAd.load();
  }

  @override
  void dispose() {
    super.dispose();
    myBannerAd.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test ads"),
      ),
      body: Center(
        child: AdWidget(ad: myBannerAd),
      ),
    );
  }
}
