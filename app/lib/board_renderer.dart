import 'package:app/logic/board.dart';
import 'package:app/logic/position.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class BoardRenderer extends StatefulWidget {
  final ChessBoard board;
  
  BoardRenderer({Key key, @required this.board}) : super(key: key);

  @override
  _BoardRendererState createState() => _BoardRendererState();
}

class _BoardRendererState extends State<BoardRenderer> {
  void update()
  {
    setState(() {
      
    });
  }

  

  @override
  Widget build(BuildContext context) {
    double cellSize = 50;

    return PhotoView.customChild(
      enableRotation: true,
      initialScale: PhotoViewComputedScale.contained,
      childSize: Size(cellSize * widget.board.width, cellSize * widget.board.height),
      backgroundDecoration: BoxDecoration(
        color: Colors.transparent
      ),
      basePosition: Alignment.center,
      child: Center(
        child: Material(
          child: Container(
          child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: widget.board.height,
          cacheExtent: cellSize,
          itemBuilder: (context, y) =>Container(
            child:  ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: widget.board.height,
            cacheExtent: cellSize,
            itemBuilder: (context, x) => Material(
                color: x % 2 == y % 2 ? Colors.blueGrey.shade100 : Colors.blueGrey.shade500, 
              child: InkWell(
                child: Container(
                width: cellSize,
                height: cellSize,
                child: widget.board.render(BoardPosition(x, y)),
            ),
            splashColor: Colors.black.withOpacity(0.45),
            onTap: () => Future.delayed(Duration(milliseconds: 250), () => setState(() => widget.board.select(BoardPosition(x, y)))),
              ),
            ),
          ),
          width: widget.board.width * cellSize,
          height: cellSize,
          ),
        ),
        width: widget.board.width * cellSize,
        height: widget.board.height * cellSize,
        ),
        elevation: 24,
        ),
      )
    );
  }
}