import 'package:cart_sample/widget/count_widget.dart';
import 'package:cart_sample/widget/order_button.dart';
import 'package:flutter/material.dart';

import 'widget/add_more.dart';
import 'widget/billing.dart';
import 'widget/menu.dart';
import 'widget/store_name.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _count = 0;

  void _increaseCount() {
    setState(() {
      _count++;
    });
  }

  void _decreaseCount() {
    setState(() {
      _count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CountWidget(
      count: _count,
      child: Scaffold(
          backgroundColor: const Color.fromRGBO(246, 246, 246, 1.0),
          appBar: AppBar(
            leading: const BackButton(
              color: Colors.black,
            ),
            title: const Text(
              '장바구니',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            elevation: 0,
            backgroundColor: Colors.white,
          ),
          body: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              StoreName(
                storeImageUrl: 'images/chickenCartoonImage.jpg',
                storeName: '치킨 잠실점',
              ),
              SizedBox(
                height: 1,
              ),
              Menu(
                menuName: '후라이드 치킨',
                menuImageUrl: 'images/chicken.png',
                menuDescription: '• 찜 & 리뷰 약속 : 참여. 서비스음료제공',
                menuPrice: 17500,
                onCancel: () => {},
                onIncrease: _increaseCount,
                onDecrease: _decreaseCount,
              ),
              SizedBox(
                height: 1,
              ),
              AddMore(
                onTap: () => {},
              ),
              Billing(
                totalAmount: 17500 * _count,
                deliveryFee: 3000,
              ),
            ],
          ),
          bottomNavigationBar: OrderButton(
            numberOfMenu: 1,
            totalPayAmount: 17500 * _count + 3000,
            onPressed: () => {},
          )),
    );
  }
}
