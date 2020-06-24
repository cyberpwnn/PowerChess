import 'dart:math';

import 'package:app/logic/ray.dart';

class BoardPosition
{
  static const ZERO = BoardPosition(0, 0);

  final int x;
  final int y;

  const BoardPosition(this.x, this.y);
  @override
  bool operator == (Object other) => other is BoardPosition && other.x == x && other.y == y;
  @override
  int get hashCode => super.hashCode;

  bool isAt(BoardPosition pos)
  {
    return pos.x == x && pos.y == y;
  }

  BoardPosition add({
    BoardPosition pos,
    int x, int y
  }) => pos != null ? BoardPosition(this.x + pos.x, this.y + pos.y) : BoardPosition(this.x + x, this.y + y);

  BoardPosition subtract({
    BoardPosition pos,
    int x, int y
  }) => pos != null ? BoardPosition(this.x - pos.x, this.y - pos.y) : BoardPosition(this.x - x, this.y - y);

  BoardPosition multiply(int f) => BoardPosition(this.x * f, this.y * f);

  int manhattanSize() => manhattanDistance(BoardPosition.ZERO);

  int manhattanDistance(BoardPosition pos) => (x - pos.x).abs() + (y - pos.y).abs();

  double distanceSquared(BoardPosition pos) => pow((x - pos.x), 2) + pow(y - pos.y, 2);

  double distance(BoardPosition pos) => sqrt(distanceSquared(pos));

  BoardPosition normalize() => BoardPosition(x > 0 ? 1 : x < 0 ? -1 : 0, y > 0 ? 1 : y < 0 ? -1 : 0);

  bool isRay() => this is BoardRay;

  BoardPosition reverse() => BoardPosition(-x, -y);

  BoardPosition right() => BoardPosition(y, -x);

  BoardPosition left() => BoardPosition(-y, x);
}