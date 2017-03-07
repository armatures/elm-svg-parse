module Parsing exposing (..)

import Models exposing (Point)
import Parser exposing (..)

parsePoint : String -> Point
parsePoint s =
    let
        _ = Debug.log s s
    in
        case run point s of
            Err error ->
                Debug.log "parse failed with error" {x=0,y=0}
            Ok p ->
                p

point : Parser Point
point =
  succeed Point
    |. symbol "("
    |. spaces
    |= float
    |. spaces
    |. symbol ","
    |. spaces
    |= float
    |. spaces
    |. symbol ")"


spaces : Parser ()
spaces =
  ignoreWhile (\char -> char == ' ')

