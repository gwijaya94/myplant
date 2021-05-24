import 'package:flutter/material.dart';

var checkoutData = [];

class PlantData {
  String name;
  String family;
  String category;
  String desc;
  String price;
  String image;

  PlantData({
    @required this.name,
    @required this.family,
    @required this.category,
    @required this.desc,
    @required this.price,
    @required this.image,
  });
}

var itemData = [
  PlantData(
    name: 'Red Rose',
    family: 'Rosaceae',
    category: 'outdoor',
    desc: '',
    price: '',
    image: '',
  ),
  PlantData(
    name: 'White Rose',
    family: 'Rosaceae',
    category: 'indoor',
    desc: '',
    price: '',
    image: '',
  ),
  PlantData(
    name: 'Blue Rose',
    family: 'Rosaceae',
    category: 'indoor',
    desc: '',
    price: '',
    image: '',
  ),
  PlantData(
    name: 'Red Rose',
    family: 'Rosaceae',
    category: 'indoor',
    desc: '',
    price: '',
    image: '',
  ),
  PlantData(
    name: 'Red Rose',
    family: 'Rosaceae',
    category: 'indoor',
    desc: '',
    price: '',
    image: '',
  ),
  PlantData(
    name: 'Red Rose',
    family: 'Rosaceae',
    category: 'indoor',
    desc: '',
    price: '',
    image: '',
  ),
];

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
