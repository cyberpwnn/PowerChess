import 'package:app/logic/piece.dart';
import 'package:app/logic/position.dart';
import 'package:app/logic/ray.dart';
import 'package:app/logic/team.dart';
import 'package:flutter/material.dart';

typedef BoardSetup(ChessBoard board);

class ChessBoard
{
  final int width;
  final int height;
  final List<BoardPiece> pieces = List<BoardPiece>();
  final List<BoardTeam> teams = List<BoardTeam>();
  BoardTeam turn;

  ChessBoard({
    this.width = 8,
    this.height = 8
  });

  void select(BoardPosition pos)
  {
    if(turn == null)
    {
      turn = teams[0];
    }
    BoardPosition lastSelection = turn.selection;
    turn.select(pos);

    if(lastSelection != null && turn.lastOptions.contains(turn.selection))
    {
      BoardPiece bp = getPieceAt(lastSelection);
      bp.moveTo(pos);
      turn.selection = null;
    }

    turn.lastOptions.clear();
  }

  void setup(BoardSetup c)
  {
    c(this);
  }

  List<BoardPiece> getPiecesAt(BoardPosition pos)
  {
    List<BoardPiece> at = List<BoardPiece>();

    for(int i = 0; i < pieces.length; i++)
    {
      if(pieces[i].position.isAt(pos))
      {
        at.add(pieces[i]);
      }
    }

    return at;
  }

  BoardPiece getPieceAt(BoardPosition pos)
  {
    List<BoardPiece> pieces = getPiecesAt(pos);

    if(pieces.isEmpty)
    {
      return null;
    }

    return pieces[0];
  }

  Widget render(BoardPosition pos)
  {
    List<BoardPiece> at = getPiecesAt(pos);
    List<Widget> ws = List<Widget>();
    Widget highlight = Material(
      child: Container(
      ),
            color: Colors.deepOrange.shade500.withOpacity(0.55),
          );
    if(turn.selection != null)
    {
      BoardPiece piece = getPieceAt(turn.selection);

      if(piece != null )
      {
        List<BoardPosition> m = piece.potentialMoves();
        
        if(m.contains(pos))
        {
                          ws.add(highlight);

          if(!turn.lastOptions.contains(pos))
          {
            turn.lastOptions.add(pos);
          }
        }

        else
        {
          for(int i = 0; i < m.length; i++)
          {
            if(m[i] is BoardRay)
            {
              if((m[i] as BoardRay).isInRay(pos))
              {
                ws.add(highlight);
          
          if(!turn.lastOptions.contains(pos))
          {
            turn.lastOptions.add(pos);
          }
          break;
              }
            }
          }
        }

        
      }
    }

    if(at.isNotEmpty)
    {
      ws.add(at[0].render());
    }

    return Stack(
      alignment: Alignment.center,
      children: ws,
    );
  }

  void nextTurn()
  {
    //TODO: NExt turn
  }

  void addTeam(BoardTeam team)
  {
    this.teams.add(team);
    turn = team;
  }

  void addPiece(BoardPiece piece)
  {
    pieces.add(piece);
  }

  BoardPosition minPosition() => const BoardPosition(0, 0);
  BoardPosition maxPosition() => BoardPosition(width - 1, height - 1);
  bool isInBounds(BoardPosition pos) => !isOutOfBounds(pos);
  bool isOutOfBounds(BoardPosition pos) => pos.x > maxPosition().x || pos.y > maxPosition().y || 
                                        pos.x < minPosition().x || pos.y < minPosition().y;
}