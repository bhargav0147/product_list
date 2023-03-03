import 'package:flutter/material.dart';

class ProductHome extends StatefulWidget {
  const ProductHome({Key? key}) : super(key: key);

  @override
  State<ProductHome> createState() => _ProductHomeState();
}

class _ProductHomeState extends State<ProductHome> {
  double slide = 0;

  List pn = [
    "Cloth",
    "TV",
    "Refrigerator",
    "Mobile",
    "Kitchen Sets",
    "AC",
    "Iphone",
    "Laptop",
    "Computer",
    "Electric Bike",
    "Furniture",
    "Bike"
  ];
  List pr = [
    "2000",
    "10000",
    "20000",
    "20000",
    "25000",
    "25000",
    "30000",
    "30000",
    "40000",
    "50000",
    "60000",
    "80000"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Poducts Filter",
          style: TextStyle(
            letterSpacing: 1,
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Slider(
              value: slide,
              onChanged: (value) {
                setState(() {
                  slide = value;
                });
              },
              activeColor: Colors.blue,
              divisions: 8,
              inactiveColor: Colors.lightBlue,
              label: "Range",
              max: 80000,
              min: 0,
            ),
            Center(
                child: Text(
              "Products less than Rs.$slide",
              style: TextStyle(
                letterSpacing: 1,
                  fontSize: 25,
                  color: Colors.black,
              ),
            )),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return slide.toInt() >= int.parse(pr[index])
                      ? ViewProduct(pn[index], pr[index])
                      : SizedBox();
                },
                itemCount: pn.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ViewProduct(String n1, String p1) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.blue,
              blurRadius: 1,
              spreadRadius: 1
            )
          ],
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(10),

        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$n1 = ",
              style: TextStyle(
                letterSpacing: 1,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Text(
              "Rs.$p1",
              style: TextStyle(
                letterSpacing: 1,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
