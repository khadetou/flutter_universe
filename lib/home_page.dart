import "package:flutter/material.dart";
import "package:flutter_swiper/flutter_swiper.dart";
import 'package:universe_ui/data.dart';
import 'constanst.dart';

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
                height: 500,
                padding: const EdgeInsets.only(left: 32),
                child: Swiper(
                  itemCount: planets.length,
                  itemWidth: MediaQuery.of(context).size.width - 4 * 64,
                  layout: SwiperLayout.STACK,
                  pagination: const SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                      activeSize: 8,
                      space: 2,
                    ),
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(onTap: () {
                      // Navigator.push(context, PageRouteBuilder(pageBuilder: (context, a, b) => DetailPage))
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
