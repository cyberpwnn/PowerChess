import 'package:app/logic/position.dart';
import 'package:flutter/material.dart';

class BoardTeam
{
  final Color color;
  final String name;
  final BoardPosition foward;
  BoardPosition selection;
  List<BoardPosition> lastOptions = List<BoardPosition>();

  BoardTeam({
    @required this.name,
    @required this.color,
    @required this.foward
  });

  void select(BoardPosition pos)
  {
    selection = pos;
  }

  BoardPosition fowards() => foward;
  BoardPosition backwards() => fowards().reverse();
  BoardPosition leftwards() => fowards().left();
  BoardPosition rightwards() => fowards().right();
  BoardPosition leftFowards() => fowards().left().add(pos: fowards());
  BoardPosition rightFowards() => fowards().right().add(pos: fowards());
  BoardPosition leftBackwards() => fowards().left().add(pos: backwards());
  BoardPosition rightBackwards() => fowards().right().add(pos: backwards());
}