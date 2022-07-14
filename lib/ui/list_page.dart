import 'package:flutter/material.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/data/restaurant.dart';
import 'package:restaurant_app/ui/detailresto_page.dart';

class ListPage extends StatefulWidget {
  static const routeName = '/list_page';

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant', style: TextStyle(color: Colors.white)),
      ),
      body: FutureBuilder<String?>(
          future: DefaultAssetBundle.of(context)
              .loadString('assets/local_restaurant.json'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final restaurants = restaurantsFromJson(snapshot.data!);
              return ListView.builder(
                  itemCount: restaurants.restaurants.length,
                  itemBuilder: ((context, index) {
                    return _buildRestaurantItem(
                        context, restaurants.restaurants[index]);
                  }));
            } else {
              return SizedBox.expand(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: const Center(child: CircularProgressIndicator()),
                ),
              );
            }
          }),
    );
  }

  Widget _buildRestaurantItem(BuildContext context, Restaurant restaurant) {
    return Padding(
      padding: const EdgeInsets.all(2.10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DetailRestoPage(restaurants: restaurant);
          }));
        },
        child: Card(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 110,
                width: 110,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  child: Image.network(
                    restaurant.pictureId,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Flexible(
                child: Container(
                  margin: const EdgeInsets.only(top: 8, right: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restaurant.name,
                        style: kTitle,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.location_pin,
                                color: locationColor,
                                size: 14,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                restaurant.city,
                                style: const TextStyle(color: kColorFour),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 18,
                          ),
                          Row(children: [
                            const Icon(
                              Icons.star_rate,
                              size: 14,
                              color: starColor,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(restaurant.rating.toString(),
                                style: const TextStyle(color: kColorFour)),
                          ]),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        restaurant.description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: ktitle,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
