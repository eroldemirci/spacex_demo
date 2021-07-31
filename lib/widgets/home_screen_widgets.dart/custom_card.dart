import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spacex_lastmission/model/last_mission_model.dart';
import 'package:spacex_lastmission/utils/text_styles.dart';
import 'package:intl/intl.dart' as intl;

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget(
      {Key? key, this.name, this.date, this.flickr, this.detail})
      : super(key: key);

  final String? name;
  final DateTime? date;
  final String? detail;
  final Flickr? flickr;

  @override
  Widget build(BuildContext context) {
    intl.DateFormat dateFormat = intl.DateFormat('MMMM dd, yyyy');
    String dateString = dateFormat.format(date!);

    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      child: flickr!.original!.length != 0
          ? Column(
              children: [
                carouselSlider(size),
                SizedBox(
                  height: 20,
                ),
                dateStr(dateString),
                titleString(),
                description(),
              ],
            )
          : Center(),
    );
  }

  Padding description() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: Text(
        detail!,
        style: bodyTextStyle,
      ),
    );
  }

  Padding titleString() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          name! + ' MISSION',
          style: titleTextStyle,
        ),
      ),
    );
  }

  Align dateStr(String dateString) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        dateString.toString(),
        style: dateTextStyle,
      ),
    );
  }

  CarouselSlider carouselSlider(Size size) {
    return CarouselSlider.builder(
      itemCount: flickr!.original!.length,
      itemBuilder: (context, index, index2) {
        String? imageUrl = flickr!.original![index];
        return ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: CachedNetworkImage(
            imageUrl: imageUrl!,
            width: size.width,
            placeholder: (context, url) => Container(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
            ),
            errorWidget: (context, url, error) => Container(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Icon(Icons.person),
            ),
            fit: BoxFit.fill,
          ),
        );
      },
      options: CarouselOptions(
          autoPlay: true,
          height: size.width <= 480 ? size.height * 0.4 : size.height * 0.7,
          viewportFraction: 1,
          aspectRatio: 1.4,
          autoPlayAnimationDuration: Duration(milliseconds: 200),
          pauseAutoPlayOnTouch: true,
          pauseAutoPlayOnManualNavigate: true,
          autoPlayInterval: Duration(seconds: 6)),
    );
  }
}
