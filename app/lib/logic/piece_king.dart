import 'package:app/logic/piece.dart';
import 'package:app/logic/position.dart';
import 'package:app/logic/team.dart';
import 'package:flutter/foundation.dart';

class KingPiece extends BoardPiece
{
KingPiece({
      @required BoardPosition position, 
      @required BoardTeam team,
      int health = 1, 
    }) : super(
      position: position,
      team: team,
      health: health,
    );

  @override
  List<BoardPosition> potentialMoves() => <BoardPosition>[
      position.add(pos: team.fowards()),
      position.add(pos: team.backwards()),
      position.add(pos: team.rightwards()),
      position.add(pos: team.leftwards()),
      position.add(pos: team.leftFowards()),
      position.add(pos: team.leftBackwards()),
      position.add(pos: team.rightBackwards()),
      position.add(pos: team.rightFowards()),
    ];
}