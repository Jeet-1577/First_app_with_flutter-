class CatalogModel {
  static final items = [
    Item(
        id: 1,
        name: "iphone 15 pro",
        desc: "iphone 15th generation",
        price: 999,
        color: "#3350a",
        image: "assets/images/iphon.jpeg")
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}
