import 'package:app/logic/position.dart';
import 'package:app/logic/team.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoardPiece
{
  BoardPosition position;
  int health;
  final BoardTeam team;

  BoardPiece({
    @required this.position, 
    @required this.team,
    this.health = 1, 
  });

  void moveTo(BoardPosition position)
  {
    this.position = position;
  }

  void setHealth(int health)
  {
    this.health = health;
  }
  
  List<BoardPosition> potentialMoves() => List<BoardPosition>();
  List<BoardPosition> potentialAttacks() => potentialMoves();

  Widget render()
  {
    return Icon(Icons.radio_button_checked);
  }
}