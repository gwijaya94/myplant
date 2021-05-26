import 'package:flutter/material.dart';

var checkoutData = [];
var favoriteData = [];

class PlantData {
  String name;
  String bioName;
  String category;
  String desc;
  double price;
  String image;

  PlantData({
    @required this.name,
    @required this.bioName,
    @required this.category,
    @required this.desc,
    @required this.price,
    @required this.image,
  });
}

var itemData = [
  PlantData(
    name: 'Kalanchoe',
    bioName: 'Kalanchoe blossfeldiana',
    category: 'indoor',
    desc:
        "These flowering Kalanchoes like bright, natural light. A medium or high light situation is best as long as they’re not getting too much direct sun. Be sure to keep them out of any hot windows because they’ll burn.\n\nThese plants are Succulents with fleshy leaves and stems (which they store water in) and you don’t want to keep them constantly wet. They need good drainage.",
    price: 9.99,
    image: 'kalanchoe.png',
  ),
  PlantData(
    name: 'Snake Plant',
    bioName: 'Dracaena trifasciata',
    category: 'indoor',
    desc:
        "After they have been propagated, the care of snake plants is very easy. Put them in indirect sunlight and don’t water them too much, especially during the winter. In fact, it’s better to let these plants dry out some between waterings.\n\nA little general purpose fertilizer can be used if the plants are in a pot, and that’s about it.",
    price: 37.99,
    image: 'snake-plant.png',
  ),
  PlantData(
    name: 'Chinese Money Plant',
    bioName: 'Pilea peperomioides',
    category: 'indoor',
    desc:
        "The Chinese money plant (or Pilea) is frequently featured in Scandinavian interiors, where its bright green pancake-shaped leaves provide an adorable and welcome burst of color against white walls.\n\nThey’re said to be easy to grow, but if you’ve ever tried to find one of your own in a plant shop, you likely came home empty-handed.",
    price: 10.39,
    image: 'chinese-money-plant.png',
  ),
  PlantData(
    name: 'Peace Lily',
    bioName: 'Spathiphyllum ',
    category: 'indoor',
    desc:
        "If you're prone to overwatering, try Spathiphyllum. Peace lilies can \"almost grow in a fish tank,\" Fried says. With enough light, they'll also produce their spade-shaped flowers throughout the year.",
    price: 12.00,
    image: 'peace-lily.png',
  ),
  PlantData(
    name: 'Aloe Vera',
    bioName: 'Aloe Vera',
    category: 'indoor',
    desc:
        "An evergreen perennial, it originates from the Arabian Peninsula, but grows wild in tropical, semi-tropical, and arid climates around the world.  It is cultivated for agricultural and medicinal uses. The species is also used for decorative purposes and grows successfully indoors as a potted plant. It is found in many consumer products including beverages, skin lotion, cosmetics, ointments or in the form of gel for minor burns and sunburns.",
    price: 17.14,
    image: 'aloe-vera.png',
  ),
];

var plantCategories = ['All', 'Indoor', 'Outdoor'];

List<dynamic> addFilteredData(String category) {
  var arrayTemp = [];
  itemData.shuffle();
  itemData.forEach((element) {
    if (category == 'all') {
      arrayTemp.add(element);
    } else if (element.category == category) {
      arrayTemp.add(element);
    }
  });
  return arrayTemp;
}
