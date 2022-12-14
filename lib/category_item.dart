import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String? name;
  final String? image;

  const CategoryItem({Key? key, this.name, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(children: [
        Image.asset(image!, width: 32),
        const SizedBox(
          height: 5,
        ),
        Text(
          name!,
          style: TextStyle(fontSize: 12),
        )
      ]),
    );
  }
}
