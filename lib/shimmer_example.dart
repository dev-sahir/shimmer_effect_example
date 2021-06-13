import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerExample extends StatefulWidget {
  const ShimmerExample({Key? key}) : super(key: key);

  @override
  _ShimmerExampleState createState() => _ShimmerExampleState();
}

class _ShimmerExampleState extends State<ShimmerExample> {
  final List<String> images = [
    'https://media.istockphoto.com/photos/young-woman-snorkeling-with-coral-reef-fishes-picture-id939931682?s=612x612',
    'https://media.istockphoto.com/photos/woman-relaxing-in-sleeping-bag-on-red-mat-camping-travel-vacations-in-picture-id1210134412?s=612x612',
    'https://media.istockphoto.com/photos/green-leaf-with-dew-on-dark-nature-background-picture-id1050634172?s=612x612',
    'https://media.istockphoto.com/photos/mountain-landscape-picture-id517188688?s=612x612',
    // 'https://www.istockphoto.com/en/photo/woman-standing-and-looking-at-lago-di-carezza-in-dolomites-gm1038870630-278083784',
    'https://media.istockphoto.com/photos/picturesque-morning-in-plitvice-national-park-colorful-spring-scene-picture-id1093110112?s=612x612',
    'https://media.istockphoto.com/photos/connection-with-nature-picture-id1174472274?s=612x612',
    'https://media.istockphoto.com/photos/in-the-hands-of-trees-growing-seedlings-bokeh-green-background-female-picture-id1181366400',
    'https://media.istockphoto.com/photos/winding-road-picture-id1173544006?s=612x612',
    'https://media.istockphoto.com/photos/sunset-with-pebbles-on-beach-in-nice-france-picture-id1157205177?s=612x612',
    'https://media.istockphoto.com/photos/waves-of-water-of-the-river-and-the-sea-meet-each-other-during-high-picture-id1166684037?s=612x612',
    'https://media.istockphoto.com/photos/happy-family-mother-father-children-son-and-daughter-on-sunset-picture-id1159094800?s=612x612',
    'https://media.istockphoto.com/photos/butterflies-picture-id1201252148?s=612x612',
    'https://media.istockphoto.com/photos/beautiful-young-woman-blows-dandelion-in-a-wheat-field-in-the-summer-picture-id1203963917?s=612x612',
    'https://media.istockphoto.com/photos/summer-meadow-picture-id1125637203?s=612x612',
  ];

  bool isLoading = false;

  Widget buildEffect() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade400,
      highlightColor: Colors.grey.shade200,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          color: Colors.grey,
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getEffect();
  }

  getEffect() async {
    setState(() {
      isLoading = true;
    });
    await Future.delayed(Duration(seconds: 7), () {});

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.blueGrey,
        title: Text('Shimmer Effect'),
      ),
      body: StaggeredGridView.countBuilder(
        padding: EdgeInsets.all(12),
        itemCount: images.length,
        crossAxisCount: 4,
        mainAxisSpacing: 12.0,
        crossAxisSpacing: 12.0,
        itemBuilder: (context, index) {
          if (isLoading) {
            return buildEffect();
          } else {
            return ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                images[index],
                fit: BoxFit.cover,
              ),
            );
          }
        },
        staggeredTileBuilder: (index) =>
            StaggeredTile.count(2, index.isEven ? 2 : 1),
      ),
    );
  }
}
