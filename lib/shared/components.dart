
import 'package:flutter/material.dart';
import 'package:shop_app_tharwat/models/product_model.dart';
import 'package:shop_app_tharwat/screens/update_screen.dart';

Widget CustomCard(ProductModel product,BuildContext context){
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Container(
        //34an at7km f shadow al card al gwa al container
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 40.0,
              color: Colors.grey.shade300,
              //74gm t7rok al shadow
              spreadRadius: 0.0,
              //mkdar t7rok al shadow h v
              offset: Offset(10,10 ),
            ),
          ],
        ),
        child: GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, UpdateScreen.id,arguments:product );
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                     '${product.title}',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    // btb3dhom 3n b3d ll a5r
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        r'$' '${product.price}',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.0,
                        ),
                      ),
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      Container(
        child: Positioned(
          top: -50,
          right: 32,
          child: Image.network(
            product.image,
              height: 125,
              width:150,
          ),
        ),
      ),
    ],
  );
}