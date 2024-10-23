class Data {
  final String name;
  final String text;
  final String price;
  final String img;

  Data(
      {required this.name,
      required this.text,
      required this.price,
      required this.img});
}

final List datas1 = [
  Data(name: "Iphone 14", text: text, price: "\$ 7.000.000", img: "assets/shop.jpg"),
  Data(name: "Iphone 14", text: text, price: "\$ 7.000.000", img: "assets/shop.jpg")
  ];
final datas2 = [
  Data(name: "Iphone 9", text: text, price: "\$ 7.000.000", img: iphone_img),
  Data(name: "Iphone 14", text: text, price: "\$ 7.000.000", img: iphone_img)
];

final List datas3 = [
  Data(name: "Samsung Galaxy Book", text: text, price: "\$ 7.000.000", img: macbooks_img_list[0]),
  Data(name: "Microsoft Surface laptop 4", text: text, price: "\$ 7.000.000", img: macbooks_img_list[1])
];

final String iphone_img = "iphone.jpeg";
final List macbooks_img_list = ["macbook.jpg", "macbook2.jpeg"];
final String text = "Lorem ipsum asdasd as the shogun lighten ups high";