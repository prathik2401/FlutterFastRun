import 'package:flutter/material.dart';
import 'package:flutter_intro_project/widget/home_widgets/catalog_image.dart';
import 'package:flutter_intro_project/products/product_catalog.dart';
// import 'package:flutter_intro_project/widget/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({
    Key? key,
    required this.catalog,
    // ignore: unnecessary_null_comparison
  })  : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
              tag: Key(catalog.id.toString()),
              child: CatalogImage(image: catalog.image)),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.bold.lg.color(context.accentColor).make(),
              catalog.desc.text
                  .textStyle(context.captionStyle)
                  .color(context.accentColor)
                  .make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(context.primaryColor),
                        shape:
                            MaterialStateProperty.all(const StadiumBorder())),
                    child: "Add to cart"
                        .text
                        .textStyle(context.bodySmall)
                        .color(Colors.white)
                        .make(),
                  )
                ],
              ).pOnly(right: 8.0)
            ],
          ))
        ],
      ),
    ).color(context.cardColor).rounded.square(150).make().py16();
  }
}