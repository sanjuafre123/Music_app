import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/audio_list.dart';
import '../../utils/img_list.dart';
import '../Song_Screen/song_screen.dart';
import 'components/NewReleases.dart';
import 'components/TopSearches.dart';
import 'components/bootom_navigation.dart';
import '../../provider/music_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MusicProvider providerTrue =
        Provider.of<MusicProvider>(context, listen: true);
    MusicProvider providerFalse =
        Provider.of<MusicProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 70,
                width: 180,
                child: Image.asset(
                  'assets/pre.png',
                  color: Colors.white,
                  fit: BoxFit.cover,
                ),
              ),
              Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search_rounded,
                    size: 28,
                    color: Colors.white,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.settings_outlined,
                    size: 27,
                    color: Colors.white,
                  )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 150,
              aspectRatio: 15 / 8,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
            ),
            items: [
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    ),
                alignment: Alignment.center,
                child: Image.asset('assets/bg.jpeg',fit: BoxFit.cover,width: 400,),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage("assets/ba.jpg"), fit: BoxFit.cover)),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage("assets/img/poster3.jpg"),
                        fit: BoxFit.cover)),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          TopSearches(),
          NewReels(),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: Row(
                  children: [
                    Text(
                      "Love Song",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 23,
                          letterSpacing: 1),
                    )
                  ],
                ),
              ),
              ...List.generate(
                Img3.length,
                (index) => CupertinoButton(
                  onPressed: () {
                    providerTrue.isplay = false;
                    Audio audio = audioList3[index];
                    providerFalse.changeIndex(index);

                    providerFalse.assetsAudioPlayer!.open(audio);

                    Navigator.of(context)
                        .pushNamed('/song3', arguments: Img3[index]);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 5,
                    ),
                    child: Row(
                      children: [
                        Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: AssetImage(Img3[index]['img']),
                                  fit: BoxFit.cover),
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Img3[index]['name1'],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            ),
                            Text(
                              Img3[index]['name'],
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                        Spacer(),
                        Icon(
                          Icons.more_vert_outlined,
                          color: Colors.white,
                          size: 23,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ]),
      ),
      bottomNavigationBar: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SongScreen(),
            ));
          },
          child: bottomNavigation(providerFalse, providerTrue)),
    );
  }
}
