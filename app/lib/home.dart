import 'package:app/board_renderer.dart';
import 'package:app/logic/board.dart';
import 'package:app/logic/piece_bishop.dart';
import 'package:app/logic/piece_king.dart';
import 'package:app/logic/piece_knight.dart';
import 'package:app/logic/piece_pawn.dart';
import 'package:app/logic/piece_queen.dart';
import 'package:app/logic/piece_rook.dart';
import 'package:app/logic/position.dart';
import 'package:app/logic/team.dart';
import 'package:flutter/material.dart';

class PowerChess extends StatefulWidget {
  PowerChess({Key key}) : super(key: key);

  @override
  _PowerChessState createState() => _PowerChessState();
}

class _PowerChessState extends State<PowerChess> {
  ChessBoard board = ChessBoard(
    height: 8,
    width: 8
  )..setup((board) {
    BoardTeam white = BoardTeam(name: "White", color: Colors.white, foward: BoardPosition(0, 1));
    BoardTeam black = BoardTeam(name: "Black", color: Colors.black, foward: BoardPosition(0, -1));
    
    board.addTeam(white);
    //board.addTeam(black);

    board.addPiece(QueenPiece(
      position: BoardPosition(3,3),
      team: white,
    ));
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BoardRenderer(board: board),
      )
    );
  }
}