

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart' show CarouselSlider;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradent/colors.dart';
import 'package:gradent/model.dart';
import 'package:gradent/productitem.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> items = [
    "assets/banners/Slider 1.png",
    "assets/banners/Slider 2.png",
    "assets/banners/Slider 3.png",
  ];

  List<CategoryModel> category = [
    CategoryModel(name: 'Fruits', image: "assets/category/fruits.png"),
    CategoryModel(name: 'Milk & Egg', image: "assets/category/egg.png"),
    CategoryModel(name: 'Bavergas', image: "assets/category/bavergas.png"),
    CategoryModel(name: 'luandry', image: "assets/category/luandry.png"),
    CategoryModel(name: 'luandry', image: "assets/category/luandry.png"),
    CategoryModel(name: 'luandry', image: "assets/category/luandry.png"),
    CategoryModel(name: 'luandry', image: "assets/category/luandry.png"),
  ];

  List<ProductModel> product = [
    ProductModel(
      name: "Banana",
      image: "assets/fruits/banana.png",
      price: "3.99",
      rate: "4",
      rateCount: "287",
    ),
    ProductModel(
      name: "Papper",
      image: "assets/fruits/papper.png",
      price: "2.99",
      rate: "4",
      rateCount: "287",
    ),
    ProductModel(
      name: "Orange",
      image: "assets/fruits/orange.png",
      price: "1.99",
      rate: "4",
      rateCount: "287",
    ),
    ProductModel(
      name: "Egg",
      image: "assets/category/egg.png",
      price: "1.99",
      rate: "4",
      rateCount: "287",
    ),
  ];

  List<ProductModel> basketList = [];

  void togglesSelection(ProductModel product) {
    setState(() {
      if (basketList.contains(product)) {
        basketList.remove(product);
      } else {
        basketList.add(product);
      }
    });
  }

  bool isSelected(ProductModel product) => basketList.contains(product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        leadingWidth: 0,
        title: Row(
          children: [
            SvgPicture.asset('assets/icons/motor.svg'),
            const SizedBox(width: 10),
            const Text("61 Hopper Street..", style: TextStyle(fontSize: 19)),
            const SizedBox(width: 10),
            const Icon(Icons.keyboard_arrow_down_rounded, size: 34),
            const Spacer(),
            SvgPicture.asset('assets/icons/basket.svg'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Banner slider
            CarouselSlider.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                  Image.asset(items[itemIndex]),
              options: CarouselOptions(
                height: 170,
                aspectRatio: 1,
                viewportFraction: 0.6,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 2),
                autoPlayAnimationDuration: const Duration(seconds: 2),
                autoPlayCurve: Curves.linear,
                enlargeCenterPage: true,
              ),
            ),

            const SizedBox(height: 10),

            // Categories
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(category.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(category[index].image, width: 60),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          category[index].name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),

            const SizedBox(height: 20),

            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Fruits",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Products horizontal list
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: List.generate(product.length, (index) {
                    final item = product[index];
                    return Productitem(
                      image: item.image,
                      name: item.name,
                      rate: item.rate,
                      rateCount: item.rateCount,
                      price: item.price,
                      onTap: () => togglesSelection(item),
                      icon: isSelected(item) ? const Icon(Icons.close) : const Icon(Icons.add),
                    );
                  }),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Cart/Basket Summary Section
            if (basketList.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  width: double.infinity,
                  height: 77,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        // Dynamic item list inside cart
                        SizedBox(
                          width: 208,
                          height: 50,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: basketList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(basketList[index].image),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                        const Spacer(),

                        Container(
                          width: 2,
                          height: 40,
                          color: Colors.white,
                        ),

                        const SizedBox(width: 10),
                        const Text(
                          "View basket",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Badge(
                          backgroundColor: Colors.red,
                          label: Text(
                            basketList.length.toString(),
                            style: const TextStyle(fontSize: 13),
                          ),
                          largeSize: 13,
                          child: SvgPicture.asset(
                            "assets/icons/basket.svg",
                            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}