import 'package:ecommerce_app/model/item.dart';
import 'package:ecommerce_app/model/products.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    List<Item> item = List.empty(growable: true);
    item.add(items("Summer"));
    item.add(items("T-Shirts"));
    item.add(items("Shirts"));
    item.add(items("Dresses"));

    final List<Product> products = [
      Product("LIME", "Shirt", "Yellow", "L", 32, 4.5, "images/shirt1.jpg",
          true, Icons.close, false, false, false),
      Product("Mango", "Shirt", "Brown", "S", 46, 0, "images/shirt2.jpg", true,
          Icons.close, true, false, false),
      Product("Olivier", "Shirt", "Black", "M", 52, 3, "images/shirt3.jpg",
          false, Icons.close, false, true, false),
      Product("&Berries", "Shirt", "Orange", "S", 39, 3, "images/shirt4.jpg",
          true, Icons.close, false, false, true),
      Product("LIME", "Shirt", "White", "L", 32, 4.5, "images/shirt5.jpg", true,
          Icons.close, false, false, true),
      Product("LIME", "Shirt", "Beige ", "S", 32, 2, "images/shirt6.jpg", true,
          Icons.close, false, false, false),
      Product("LIME", "Shirt", "White", "XL", 32, 4.5, "images/shirt7.jpg",
          true, Icons.close, false, true, false),
      Product("LIME", "Shirt", "Brown", "S", 32, 0, "images/shirt8.jpg", true,
          Icons.close, true, false, false),
      Product("LIME", "Shirt", "Yellow", "L", 32, 0, "images/shirt9.jpg", true,
          Icons.close, true, false, false),
      Product("LIME", "Shirt", "White", "M", 32, 4.5, "images/shirt10.jpg",
          true, Icons.close, false, false, true),
    ];
    String oldPrice = "55";
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color(0xffF8FAFB),
            body: Column(children: [
              Container(
                  padding: const EdgeInsets.only(left: 320),
                  margin: const EdgeInsets.only(top: 20, left: 5, right: 10),
                  child: const Icon(
                    Icons.search,
                    size: 30,
                  )),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(top: 5, left: 10),
                padding: const EdgeInsets.only(right: 190),
                child: const Text(
                  "Favorites",
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1E1E1E)),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(top: 10, left: 10),
                        height: 50,
                        width: double.infinity,
                        child: ListView.builder(
                            itemCount: item.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (ctx, i) {
                              return Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: 100,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: const Color(0xff212121)),
                                  child: Center(
                                    child: Text(
                                      item[i].name,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          color: Color(0xffFEFEFE)),
                                    ),
                                  ),
                                ),
                              );
                            })),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.filter_list,
                          size: 27,
                        ),
                        SizedBox(width: 5),
                        Text("Filters")
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.swap_vert, size: 27),
                        SizedBox(width: 5),
                        Text("Price: lowest to high")
                      ],
                    ),
                    Icon(Icons.view_list, size: 30),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Expanded(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 2,
                          mainAxisSpacing: 5,
                          childAspectRatio: 0.6),
                      itemCount: products.length,
                      itemBuilder: (ctx, i) {
                        bool isSoldOut =
                            products[i].isSoldOut || !products[i].available;
                        bool hideCartIcon = i == 2 || i == 6;
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Card(
                            margin: const EdgeInsets.all(8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            color: isSoldOut
                                ? const Color(0xffF1F1F1)
                                : Colors.white,
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Column(
                                  children: [
                                    Stack(clipBehavior: Clip.none, children: [
                                      Image.asset(
                                        products[i].image,
                                        width: 300,
                                        height: 150,
                                        fit: BoxFit.fill,
                                      ),
                                      Positioned(
                                        left: 130,
                                        top: 5,
                                        child: Icon(
                                          products[i].icon,
                                          size: 20,
                                          color: const Color(0xff8F8F8F),
                                        ),
                                      ),
                                      if (!hideCartIcon)
                                        Positioned(
                                          left: 110,
                                          top: 120,
                                          child: InkWell(
                                            onTap: () {
                                              _addCart(context);
                                            },
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color(0xffF20905)),
                                              width: 40,
                                              height: 50,
                                              child: const Icon(
                                                  Icons.shopping_bag_sharp,
                                                  color: Color(0xffFFF0F3),
                                                  size: 20),
                                            ),
                                          ),
                                        ),
                                    ]),
                                    const SizedBox(height: 5),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children:
                                                  List.generate(5, (starIndex) {
                                                return Icon(
                                                  starIndex < products[i].rating
                                                      ? Icons.star
                                                      : Icons.star_border,
                                                  color: Colors.yellow,
                                                  size: 18,
                                                );
                                              }),
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  products[i].brand,
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xffBABABA)),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              products[i].name,
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xff5A5A5A)),
                                            ),
                                            const SizedBox(height: 5),
                                            Row(
                                              children: [
                                                const Text("Color: ",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color:
                                                            Color(0xffBABABA))),
                                                Text(products[i].color,
                                                    style: const TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Color(0xff5A5A5A))),
                                                const SizedBox(width: 20),
                                                const Text("Size: ",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color:
                                                            Color(0xffBABABA))),
                                                Text(products[i].size,
                                                    style: const TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Color(0xff5A5A5A))),
                                              ],
                                            ),
                                            const SizedBox(height: 5),
                                            Row(
                                              children: [
                                                if (products[i].isDiscount)
                                                  Text(
                                                    "\$${oldPrice}",
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Color(0xffBABABA),
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough),
                                                  ),
                                                const SizedBox(width: 5),
                                                Text(
                                                  "${products[i].price}\$",
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xff5A5A5A),
                                                  ),
                                                ),
                                                const SizedBox(width: 20),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                if (isSoldOut)
                                  const Positioned(
                                    bottom: 110,
                                    left: 5,
                                    child: Text(
                                      "Sorry, this item is currently sold out",
                                      style: TextStyle(
                                        color: Color(0xffB3B3B3),
                                        fontSize: 9,
                                      ),
                                    ),
                                  ),
                                if (products[i].isNew)
                                  Positioned(
                                    bottom: 240,
                                    left: 7,
                                    child: Container(
                                        width: 40,
                                        height: 20,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: const Color(0xff242424)),
                                        child: const Center(
                                          child: Text(
                                            "NEW",
                                            style: TextStyle(
                                                color: Color(0xffB3B3B3),
                                                fontSize: 10),
                                          ),
                                        )),
                                  ),
                                if (products[i].isDiscount)
                                  Positioned(
                                    bottom: 240,
                                    left: 7,
                                    child: Container(
                                        width: 40,
                                        height: 20,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: const Color(0xffE50F0D)),
                                        child: const Center(
                                          child: Text(
                                            "-30%",
                                            style: TextStyle(
                                                color: Color(0xffFFDADB),
                                                fontSize: 10),
                                          ),
                                        )),
                                  ),
                              ],
                            ),
                          ),
                        );
                      }))
            ])));
  }

  Item items(String name) {
    return Item(name: name);
  }

  _addCart(context) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
        ),
        builder: (ctx) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Center(
                    child: Text(
                  "Select Size",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff131313)),
                )),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: ["XS", "S", "M", "L", "XL"]
                      .map((size) => Container(
                            width: 100,
                            padding: const EdgeInsets.all(5),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xffFFFFFF),
                                foregroundColor: const Color(0xff0F0F0F),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: const BorderSide(
                                      color: Color(0xffE0E0E0)),
                                ),
                              ),
                              onPressed: () {},
                              child: Text(size),
                            ),
                          ))
                      .toList(),
                ),
                const SizedBox(height: 10),
                const ListTile(
                  title: Text(
                    "Size info",
                    style: TextStyle(fontSize: 16, color: Color(0xff131313)),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffEE0604),
                      foregroundColor: const Color(0xffFFDFD5),
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text("ADD TO FAVORITES")),
              ],
            ),
          );
        });
  }
}
