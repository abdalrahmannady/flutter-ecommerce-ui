import 'package:flutter/material.dart';

class itemDetails extends StatefulWidget {
  final Map dataitems;
  const itemDetails({super.key, required this.dataitems});

  @override
  State<itemDetails> createState() => _itemDetailsState();
}

class _itemDetailsState extends State<itemDetails> {
  String selectedSize = "39";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const Drawer(),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 240, 234, 234),
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add_shopping_cart_outlined, color: Colors.black),
            Text(" Ecommerce", style: TextStyle(color: Colors.black)),
            Text("Younis", style: TextStyle(color: Color.fromARGB(255, 252, 148, 12))),
          ],
        ),
      ),
      
      body: ListView(
        children: [
          // ---- Product Image ----
          Image.asset(
            widget.dataitems["image"],
            height: 250,
            width: double.infinity,
            fit: BoxFit.contain,
          ),
          
          // ---- Titles Section ----
          Column(
            children: [
              const SizedBox(height: 5),
              Text(widget.dataitems["title"], style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              Text(widget.dataitems["category"], style: const TextStyle(color: Color.fromARGB(255, 204, 203, 203))),
              const SizedBox(height: 10),
            ],
          ),
          
          // ---- Colors Selection ----
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Color: "),
              const SizedBox(width: 8),
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Sorry!"),
                      content: const Text("This color is currently out of stock"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text("OK", style: TextStyle(color: Colors.deepOrange)),
                        ),
                      ],
                    ),
                  );
                },
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.black54),
                  ),
                ),
              ),
              const SizedBox(width: 5),
              const Text("Grey"),
              const SizedBox(width: 15),
              InkWell(
                onTap: () => print("Black color selected"),
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(width: 5),
              const Text("Black"),
            ],
          ),
          const SizedBox(height: 15),
          
          // ---- Sizes Selection ----
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Size : ", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(width: 8),
              ...["39", "40", "41", "42"].map((size) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedSize = size;
                      });
                    },
                    child: Container(
                      width: 35,
                      height: 35,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: selectedSize == size ? Colors.grey[300] : Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: Text(size, style: const TextStyle(color: Colors.black)),
                    ),
                  ),
                );
              }).toList(),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(height: 1, color: Color.fromARGB(255, 230, 230, 230)),
          
          // ---- Product Description ----
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Description", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(
                  "This premium shoes offers breathable materials, an ultra-lightweight sole for maximum daily comfort, and a sleek modern design perfect for sports and casual look.",
                  style: TextStyle(color: Colors.grey[600], height: 1.4, fontSize: 14),
                ),
              ],
            ),
          ),
          
          // ---- Suggestions Section ----
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: const Text("You may also like", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 110,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                  width: 100,
                  margin: const EdgeInsets.only(left: 16, bottom: 10),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 245, 245, 245),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(widget.dataitems["image"], fit: BoxFit.contain),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
      
      // ---- Bottom Action Bar ----
      bottomNavigationBar: Container(
        height: 85,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              spreadRadius: 1,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Price", style: TextStyle(color: Colors.grey, fontSize: 12)),
                Text(
                  widget.dataitems["price"],
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Color.fromARGB(255, 89, 119, 134)),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: 190,
              height: 50,
              child: MaterialButton(
                color: Colors.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Congratulation!", style: TextStyle(color: Colors.greenAccent)),
                      content: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text("Added successfully to your cart "),
                          const Icon(Icons.assignment_turned_in_sharp),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text("Horaay!", style: TextStyle(color: Colors.greenAccent)),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text("Add To Cart", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}