import "package:flutter/material.dart";
import "package:flutter_swiper/flutter_swiper.dart";
import 'package:universe_ui/data.dart';
import 'constanst.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientEndColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [gradientStartColor, gradientEndColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.3, 0.7],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  children: <Widget>[
                    const Text(
                      "Explore",
                      style: TextStyle(
                        fontFamily: "Avenir",
                        fontSize: 44,
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    DropdownButton(
                      items: const [
                        DropdownMenuItem(
                          child: Text(
                            "Solar System",
                            style: TextStyle(
                                fontFamily: "Avenir",
                                fontSize: 24,
                                color: Color(0x7cdbf1ff),
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                      onChanged: null,
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Image.asset('assets/drop_down_icon.png'),
                      ),
                      underline: const SizedBox(),
                    )
                  ],
                ),
              ),
              Container(
                height: 400,
                padding: const EdgeInsets.only(left: 32),
                child: Swiper(
                  itemCount: planets.length,
                  itemWidth: 250, //MediaQuery.of(context).size.width - 4 * 64
                  layout: SwiperLayout.STACK,
                  pagination: const SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                      activeSize: 8,
                      space: 2,
                    ),
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, a, b) => DetailPage(
                              planetInfo: planets[index],
                            ),
                          ),
                        );
                      },
                      child: Stack(children: <Widget>[
                        Column(
                          children: <Widget>[
                            const SizedBox(
                              height: 100,
                            ),
                            Card(
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32),
                              ),
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(32.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const SizedBox(
                                      height: 100,
                                    ),
                                    Text(
                                      planets[index].name,
                                      style: const TextStyle(
                                        fontFamily: "Avenir",
                                        fontSize: 24,
                                        color: Color(0xff47455f),
                                        fontWeight: FontWeight.w900,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    const Text(
                                      "Solar System",
                                      style: TextStyle(
                                          fontFamily: "Avenir",
                                          fontSize: 23,
                                          color: Color(0x7cdbf1ff),
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.left,
                                    ),
                                    const SizedBox(
                                      height: 32,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          "Know More",
                                          style: TextStyle(
                                              fontFamily: "Avenir",
                                              fontSize: 16,
                                              color: secondaryTextColor,
                                              fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.left,
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: secondaryTextColor,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Hero(
                          tag: planets[index].position,
                          child: Image.asset(planets[index].iconImage),
                        ),
                        Positioned(
                          right: 24,
                          bottom: 60,
                          child: Text(
                            planets[index].position.toString(),
                            style: TextStyle(
                              fontFamily: "Avenir",
                              fontSize: 200,
                              color: primaryTextColor.withOpacity(0.08),
                              fontWeight: FontWeight.w900,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(36.0),
          ),
          color: navigationColor,
        ),
        padding: const EdgeInsets.all(24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Image.asset('assets/menu_icon.png'),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset('assets/search_icon.png'),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset('assets/profile_icon.png'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
