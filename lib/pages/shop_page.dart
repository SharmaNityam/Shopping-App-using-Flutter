import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/models/cart.dart';
import 'package:sneaker_shop/models/shoe.dart';

import '../components/shoe_tile.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  //add shoe to cart
void addShoeToCart(Shoe shoe) {
  Provider.of<Cart>(context, listen: false).addItemToCart(shoe);


}

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>
    (builder: (context, value, child) => Column(
      children: [
        //search box
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 25.0),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
            ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,  //used this for putting the search icon to the far right end
            children: [
              Text(
                'Search',
                 style: TextStyle(color: Colors.grey),
                 ),
              Icon(
                Icons.search,
                color: Colors.grey,
                ),
            ],
            ),
        ),

        //message
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0),
          child: Text(
          'Everyone flies, some just fly longer than the others...', 
          style: TextStyle(color: Colors.grey[600]),
          ),
        ),

        //hot picks
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
            Text(
              'Hot Picks 🔥',
               style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
               ), ),
            Text(
              'See All',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red
              ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 10),

      //List of shoes for sale
        Expanded(
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            Shoe shoe= value.getShoeList()[index];

                //return the shoe
          return ShoeTile(
            shoe: shoe,
            onTap: () => addShoeToCart(shoe) ,
          );
        },
        ),
        ),

        const Padding(
          padding: EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
          child: Divider(
            color: Colors.white,
          ),
        )
      ],
    ));
  }
}