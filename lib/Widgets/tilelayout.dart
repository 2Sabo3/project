import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:project/Widgets/card.dart';

class GridViewLayout extends StatelessWidget {
  const GridViewLayout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
        shrinkWrap: true,
        primary: false,
        crossAxisCount: 4,
        staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
        itemCount: 50,
        itemBuilder: (context, index) {
          return CardLayout(index);
        });
  }
}
