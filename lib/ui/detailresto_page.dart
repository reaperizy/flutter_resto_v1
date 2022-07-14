import 'package:flutter/material.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/data/restaurant.dart';
import 'package:restaurant_app/ui/error_screen.dart';

class DetailRestoPage extends StatelessWidget {
  static const routeName = '/resto_detail_page';
  final Restaurant restaurants;

  const DetailRestoPage({Key? key, required this.restaurants})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(elevation: 0),
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: primaryColor,
              onPrimary: Colors.black,
              secondary: secondaryColor,
            ),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        body: NestedScrollView(
          headerSliverBuilder: (context, isScrolled) {
            return [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                expandedHeight: 250,
                flexibleSpace: FlexibleSpaceBar(
                  background: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    child: Stack(
                      children: [
                        const SizedBox(width: 10),
                        SafeArea(
                          child: Image.network(
                            restaurants.pictureId,
                            width: MediaQuery.of(context).size.width,
                            height: 330,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 28, vertical: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ErrorScreen(),
                                    ),
                                  );
                                },
                                child: Image.asset(
                                  'assets/icons/share.png',
                                  width: 40,
                                ),
                              ),
                              Image.asset(
                                'assets/icons/btn_wishlist.png',
                                width: 40,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ];
          },
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      restaurants.name,
                      style: kTitle.copyWith(fontSize: 18),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.location_pin,
                      color: locationColor,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(restaurants.city),
                    const SizedBox(
                      width: 12,
                    ),
                    const Icon(
                      Icons.star_rate,
                      color: starColor,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      restaurants.rating.toString(),
                    )
                  ],
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(4, 16, 0, 0),
                    child: Text(
                      "Description",
                      style: kTitle,
                    )),
                Card(
                  elevation: 4,
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    child: Text(restaurants.description),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(4, 16, 0, 0),
                  child: Text(
                    "Menu",
                    style: kTitle,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(4, 16, 0, 0),
                  child: Text(
                    "Food",
                    style: ktitle.copyWith(
                      color: kColorFour,
                    ),
                  ),
                ),
                listMenu(restaurants.menus.foods),
                Container(
                  margin: const EdgeInsets.fromLTRB(4, 16, 0, 0),
                  child: Text(
                    "Drink",
                    style: ktitle.copyWith(
                      color: kColorFour,
                    ),
                  ),
                ),
                listMenu(restaurants.menus.drinks),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                      child: const Text('Pesan Sekarang',
                          style: TextStyle(color: Colors.white)),
                      onPressed: () async {
                        Navigator.pushNamed(context, ErrorScreen.routeName);
                      }),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }

  listMenu(List<dynamic> menus) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: menus.map((list) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(4),
                  height: 150,
                  width: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      "https://blogunik.com/wp-content/uploads/2019/02/Makanan-Dan-Minuman-Khas-Bandung.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                    child: Text(list.name))
              ]);
        }).toList(),
      ),
    );
  }
}

class LikeButton extends StatefulWidget {
  const LikeButton({Key? key}) : super(key: key);

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool isLike = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isLike ? Icons.thumb_up_alt : Icons.thumb_up_alt_outlined,
        color: const Color(0xFF0000FF),
        size: 28,
      ),
      onPressed: () {
        setState(() {
          isLike = !isLike;
        });
      },
    );
  }
}
