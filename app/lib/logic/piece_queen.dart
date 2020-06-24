import 'package:app/logic/piece.dart';
import 'package:app/logic/position.dart';
import 'package:app/logic/ray.dart';
import 'package:app/logic/team.dart';
import 'package:flutter/cupertino.dart';

class QueenPiece extends BoardPiece
{
  QueenPiece({
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
      BoardRay.of(position, team.leftFowards()),
      BoardRay.of(position, team.rightFowards()),
      BoardRay.of(position, team.leftBackwards()),
      BoardRay.of(position, team.rightBackwards()),
      BoardRay.of(position, team.fowards()),
      BoardRay.of(position, team.backwards()),
      BoardRay.of(position, team.leftwards()),
      BoardRay.of(position, team.rightwards()),
    ];
}