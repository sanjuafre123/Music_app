import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wynk_music_app/screens/Home_Screen/home_screen.dart';

import '../../provider/music_provider.dart';
import '../../utils/img_list.dart';
import 'components/Song_Slider.dart';
import 'components/Song_time.dart';
import 'components/controlbutton.dart';

class SongScreen extends StatefulWidget {
  const SongScreen({super.key});

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  @override
  void initState() {
    super.initState();
    // Initialize the player and open the audio file
    Future.delayed(Duration.zero, () {
      Provider.of<MusicProvider>(context, listen: false).initializePlayer();
    });
  }

  @override
  Widget build(BuildContext context) {
    MusicProvider providerTrue =
        Provider.of<MusicProvider>(context, listen: true);
    MusicProvider providerFalse =
        Provider.of<MusicProvider>(context, listen: false);

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                tileMode: TileMode.mirror,
                colors: [
              Colors.redAccent,
              Colors.black,
              Colors.black,
            ])),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HomeScreen()));
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 25,
                    )),
                Text(
                  "RECOMMENDED FOR YOU",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w400),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_vert_sharp,
                      color: Colors.white,
                      size: 25,
                    )),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 320,
              width: 350,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Img[providerTrue.currentIndex]['img']),
                  ),
                  borderRadius: BorderRadius.circular(20)),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 10, left: 20, right: 10, top: 50),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Img[providerTrue.currentIndex]['name'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star_border,
                            color: Colors.grey.shade300,
                          ),
                          Text(
                            Img[providerTrue.currentIndex]['SingerName']
                                .toString(),
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey.shade300),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                        size: 30,
                      )),
                ],
              ),
            ),
            Song_Slider(context, providerFalse, providerTrue),
            Song_time(providerTrue),
            control_button(providerTrue, providerFalse),
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.connected_tv,
                      size: 25,
                      color: Colors.white,
                    )),
                Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.share,
                      size: 25,
                      color: Colors.white,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
