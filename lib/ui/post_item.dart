import 'package:flutter/material.dart';

import '../models/post.dart';

class PostItem extends StatelessWidget {
  final Post post;
  // const PostItem({Key? key}) : super(key: key);

  PostItem(this.post);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 8,
        bottom: 8,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width - 40 * 7 / 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Text(post.title!),
            ),
            Expanded(
              flex: 1,
              child: Text(post.body!),
            ),
          ],
        ),
      ),
    );
  }
}
