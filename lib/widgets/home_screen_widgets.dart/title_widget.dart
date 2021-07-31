import 'package:flutter/material.dart';
import 'package:spacex_lastmission/utils/text_styles.dart';

class CustomTitleWidget extends StatelessWidget {
  const CustomTitleWidget({Key? key, this.imageUrl}) : super(key: key);
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(left: size.width <= 480 ? 30.0 : 40),
      child: Align(
        alignment: Alignment.topLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height:
                  size.width <= 480 ? size.height * 0.15 : size.height * 0.25,
              width: size.width <= 480 ? size.width * 0.35 : size.width * 0.2,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(imageUrl!), fit: BoxFit.fill)),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              'Tesla Last Mission',
              overflow: TextOverflow.ellipsis,
              style: titleTextStyle,
            )
          ],
        ),
      ),
    );
  }
}
