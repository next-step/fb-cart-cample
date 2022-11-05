import 'package:cart_sample/component/menu_count.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Menu extends StatelessWidget {

  final format = NumberFormat.currency(locale: "ko_KR", name: "", decimalDigits: 0);
  final String menuName;
  final String menuImage;
  final int price;
  final String menuDescription;


  Menu(
      {Key? key,
      required this.menuName,
      required this.menuImage,
      required this.price,
      required this.menuDescription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _price = format.format(price);
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                menuName,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.grey,
                ),
                onPressed: () {},
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.3),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    menuImage,
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    menuDescription,
                    style: TextStyle(
                      color: Color.fromRGBO(125, 125, 125, 1.0),
                    ),
                  ),
                  Text('$_price원'),

                ],
              ),

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MenuCount(),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
