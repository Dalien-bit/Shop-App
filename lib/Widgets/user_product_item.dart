import 'package:flutter/material.dart';

class UserProductItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  UserProductItem(this.imageUrl, this.title);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          imageUrl,
        ),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.edit),
              color: Colors.white,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
