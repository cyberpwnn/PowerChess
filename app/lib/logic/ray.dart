import 'package:app/logic/position.dart';

class BoardRay extends BoardPosition
{
  final BoardPosition direction;

  BoardRay(int x, int y, this.direction): super(x, y);
  
  static BoardRay of(BoardPosition pos, BoardPosition direction) => BoardRay(pos.x, pos.y, direction);

  BoardRay jump({int iterations = 1})
  {
    BoardPosition next = add(pos: direction.multiply(iterations));
    return BoardRay(next.x, next.y, direction);
  }

  @override
  bool isRay() => true;

  bool isInRay(BoardPosition pos) {
    if(direction.manhattanSize() == 0)
    {
      return false;
    }

    if(direction.manhattanSize() > 2)
    {
      return false;
    }

    if(pos.x == x && pos.y == y)
    {
      return true;
    }

    if((pos.x - x).abs() == (pos.y - y).abs() && direction.x.abs() == direction.y.abs())
    {
      return true;
    }

    if(direction.x == 0 && direction.y != 0 && pos.x == x)
    {
      return true;
    }

    if(direction.y == 0 && direction.x != 0 && pos.y == y)
    {
      return true;
    }

    return false;
  }
}