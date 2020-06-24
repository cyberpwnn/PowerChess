import 'package:app/logic/piece.dart';
import 'package:app/logic/position.dart';
import 'package:app/logic/team.dart';
import 'package:flutter/foundation.dart';

class PawnPiece extends BoardPiece
{
  bool hasMoved = false;

PawnPiece({
      @required BoardPosition position, 
      @required BoardTeam team,
      int health = 1, 
    }) : super(
      position: position,
      team: team,
      health: health,
    );

  @override
  void moveTo(BoardPosition position)
  {
    this.position = position;
    hasMoved = true;
  }

  bool canDoubleMove()
  {
    return !hasMoved;
  }

  @override
  List<BoardPosition> potentialMoves() {
    List<BoardPosition> p = <BoardPosition>[
      position.add(pos: team.foward),
    ];

    if(canDoubleMove())
    {
      p.add(position.add(pos: team.foward.multiply(2)));
    }

    return p;
  }

  @override
  List<BoardPosition> potentialAttacks() => <BoardPosition>[
      position.add(pos: team.leftFowards()),
      position.add(pos: team.rightFowards())
    ];
}