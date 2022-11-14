part of '../cart_screen.dart';

class Menu extends StatelessWidget {
  const Menu({
    Key? key,
    required this.name,
    required this.imageUrl,
    required this.price,
    this.description,
    required this.onUpdateCount,
  }) : super(key: key);

  final String name;
  final String imageUrl;
  final int price;
  final String? description;
  final Function(int value) onUpdateCount;

  @override
  Widget build(BuildContext context) {
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
                name,
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
                    imageUrl,
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
                    description ?? '',
                    style: TextStyle(
                      color: Color.fromRGBO(125, 125, 125, 1.0),
                    ),
                  ),
                  Text(NumberFormat('#,###원').format(price)),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildCount(context),
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

  Widget _buildCount(BuildContext context) {
    int menuCount = MenuCounter.of(context).count;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.4)),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.remove),
            disabledColor: Colors.grey,
            onPressed: menuCount == 1
                ? null
                : () {
                    onUpdateCount.call(menuCount - 1);
                  },
          ),
          Text('$menuCount'),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              onUpdateCount.call(menuCount + 1);
            },
          ),
        ],
      ),
    );
  }
}
