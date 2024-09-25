import 'package:flutter/material.dart';

class Page_1 extends StatelessWidget {
  const Page_1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: EdgeInsets.all(40),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: Colors.grey[300],
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://play-lh.googleusercontent.com/L3gM20z_04m-8BHKBRf_utP7o9GiEiHtjmrojfQGGRAIfdQcTjlv2D03rHiOg0ARUIo=w648-h364-rw"))),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
