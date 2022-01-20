import 'package:e_commerce_ui/pages/details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';

Center buildProduct(
  String name,
  String room,
  String assetURL,
  int rating,
  double price,
  List colors,
  Color defaultColor,
  Color secondColor,
  Size size,
) {
  return Center(
    child: Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.04,
        ),
        child: InkWell(
          onTap: () => Get.to(
            () => DetailsPage(
              name: name,
              room: room,
              assetURL: assetURL,
              rating: rating,
              price: price,
              colors: colors,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.network(
                assetURL,
                height: size.width * 0.5,
                width: size.width * 0.5,
                fit: BoxFit.contain,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return SizedBox(
                    width: size.width * 0.5,
                    height: size.width * 0.5,
                    child: Align(
                      child: CircularProgressIndicator(
                        color: defaultColor,
                      ),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return SizedBox(
                    width: size.width * 0.5,
                    height: size.width * 0.5,
                    child: Align(
                      child: CircularProgressIndicator(
                        color: defaultColor,
                      ),
                    ),
                  );
                },
              ),
              Text(
                room,
                style: GoogleFonts.poppins(
                  color: defaultColor,
                  fontSize: size.height * 0.016,
                ),
              ),
              SizedBox(
                width: size.width * 0.5,
                child: Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.lato(
                    color: defaultColor,
                    fontSize: size.height * 0.02,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
                width: size.width * 0.3,
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    if (index < rating) {
                      return Icon(
                        Icons.star,
                        color: defaultColor,
                        size: size.height * 0.025,
                      );
                    } else {
                      return Icon(
                        Icons.star_outline,
                        color: defaultColor,
                        size: size.height * 0.025,
                      );
                    }
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$price\$',
                    style: GoogleFonts.poppins(
                      color: defaultColor,
                      fontSize: size.height * 0.03,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: size.width * 0.1,
                    width: size.width * 0.1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: defaultColor,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(
                            10,
                          ),
                        ),
                      ),
                      child: Icon(
                        UniconsLine.info_circle,
                        color: secondColor,
                        size: size.width * 0.055,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
