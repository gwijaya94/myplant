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
    name: 'Asparagus Fern',
    bioName: 'Asparagus setaceus',
    category: 'indoor',
    desc: '',
    price: 13.99,
    image: 'chinese-money-plant.png',
  ),
  PlantData(
    name: 'Chinese Money Plant',
    bioName: 'Pilea peperomioides',
    category: 'indoor',
    desc: '',
    price: 10.39,
    image: 'chinese-money-plant.png',
  ),
  PlantData(
    name: 'Peace Lily',
    bioName: 'Spathiphyllum ',
    category: 'indoor',
    desc: '',
    price: 0.00,
    image: 'chinese-money-plant.png',
  ),
  PlantData(
    name: 'Dragon Tree',
    bioName: 'Dracaena marginata',
    category: 'indoor',
    desc: '',
    price: 0.00,
    image: 'chinese-money-plant.png',
  ),
  PlantData(
    name: 'Ponytail Palm',
    bioName: 'Beaucarnea recurvata',
    category: 'indoor',
    desc: '',
    price: 0.00,
    image: 'chinese-money-plant.png',
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
