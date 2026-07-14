

import 'package:flutter/material.dart';

class Productitem extends StatelessWidget {
   Productitem({super.key, required this.name, required this.image, required this.rate, required this.rateCount,
    required this.price,required this.onTap, required this.icon});
  final String name;
  final String image;
  final String rate;
  final String rateCount;
  final String price;
  void Function()? onTap;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return   Card(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children:[ Container(

                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 120,
                width: 140,
                child: Image.asset(image, width: 120,fit: BoxFit.cover,),
              ),

                Positioned(
                  bottom: 6,
                    right: 5,

                    child: GestureDetector(
                      onTap: onTap,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                          radius: 16,
                          child: icon,
                    )),
                ),

              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(image, width: 18),
                    SizedBox(width: 5),
                    Text(
                      "$rate ($rateCount)",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10),
                Text("\$ $price",style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 10),


              ],
            ),
          ),
        ],
      ),
    );


  }
}
