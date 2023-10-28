import 'package:flutter/material.dart';
import 'package:sneaker_shop/models/shoe.dart';

class Cart extends ChangeNotifier{

  //list of shoes for sale
List<Shoe> shoeShop = [
  Shoe(
    name: 'Zoom Freak', 
    price: '98000', 
    description: 'Forward thinking design', 
    imagePath: 'lib/images/aj2.jpg'
    ),
    Shoe(
    name: 'Air Jordans', 
    price: '80000', 
    description: 'Cool shoe', 
    imagePath: 'lib/images/aj1.jpeg'
    ),
    Shoe(
    name: 'KD Treys', 
    price: '94000', 
    description: 'Better grip', 
    imagePath: 'lib/images/aj4sm.jpg'
    ),
    Shoe(
    name: 'Kyrie 6', 
    price: '84000', 
    description: 'Bouncy cushion', 
    imagePath: 'lib/images/aj3.jpg'
    ),
];
  //list of items in cart
List<Shoe> userCart = [];
  //get list of shoes for sale
List<Shoe> getShoeList() {
  return shoeShop;
}
  //get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  //add items to cart
void addItemToCart(Shoe shoe) {
  userCart.add(shoe);
  notifyListeners();
}
  //remove items from cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}