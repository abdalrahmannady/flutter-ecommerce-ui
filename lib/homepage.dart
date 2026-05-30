import 'package:flutter/material.dart';
import 'package:ui_1_ex/categoryitems.dart';
import 'package:ui_1_ex/customizedcard.dart';
import 'package:ui_1_ex/details.dart'; 

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int selectedindex = 0;
  
  final List<Map<String, String>> products = [
    {"image": "images/bestseller1.png", "title": "Timberland Oxford", "category": "Men Shoes", "price": "\$120"},
    {"image": "images/bestseller2.png", "title": "Allbirds Wool Runners", "category": "Men Shoes", "price": "\$95"},
    {"image": "images/bestseller3.png", "title": "Puma Smash v2", "category": "Men Shoes", "price": "\$65"},
    {"image": "images/bestseller4.png", "title": "Levi's Canvas Sneakers", "category": "Men Shoes", "price": "\$55"},
    {"image": "images/bestseller5.png", "title": "Tommy Hilfiger Retro", "category": "Men Shoes", "price": "\$110"},
    {"image": "images/bestseller6.png", "title": "Vans Old Skool", "category": "Men Shoes", "price": "\$70"},
  ];

  @override
  Widget build(BuildContext context) {
    // ---- Navigation Tabs Layout ----
    final List<Widget> tabs = [
      buildHomeContent(), 
      const Center(child: Text("Your Bag is Empty 🛒", style: TextStyle(fontSize: 18, color: Colors.grey))), 
      const Center(child: Text("Welcome, Younis! 👤", style: TextStyle(fontSize: 18, color: Colors.grey))), 
    ];

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: tabs[selectedindex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 26,
        selectedItemColor: Colors.blueGrey,
        currentIndex: selectedindex,
        onTap: (val) {
          setState(() {
            selectedindex = val;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: "Bag"),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_rounded), label: "Profile"),
        ],
      ),
    );
  }

  // ---- Main Home Content View ----
  Widget buildHomeContent() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [
          // 1. Search Bar & Menu
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.black54),
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.black45),
                    border: InputBorder.none,
                    fillColor: Color.fromARGB(255, 230, 228, 228),
                    filled: true,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.menu, size: 28),
              ),
            ],
          ),
          const SizedBox(height: 25),
          
          // 2. Categories Section
          const Text("Categories", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: [
                CategoryItem(imagePath: "images/running-shoes.png", label: "Men"),
                const SizedBox(width: 20),
                CategoryItem(imagePath: "images/high-heel.png", label: "Women"),
                const SizedBox(width: 20),
                CategoryItem(imagePath: "images/flash.png", label: "Electricity"),
                const SizedBox(width: 20),
                CategoryItem(imagePath: "images/hobbies.png", label: "Hobbies"),
              ],
            ),
          ),
          const SizedBox(height: 30),
          
          // 3. Best Seller Grid Section
          const Text("Best seller", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 20),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 220,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 0.65,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => itemDetails(dataitems: products[index]),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(15),
                child: ProductCard(
                  imagePath: products[index]['image']!,
                  title: products[index]['title']!,
                  category: products[index]['category']!,
                  price: products[index]['price']!,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}