module Parsing exposing (..)

import Models exposing (Point)
import Parser exposing (..)

parsePoint : String -> List Point
parsePoint s =
    let
        _ = Debug.log s s
    in
        case run parsePoints s of
            Err error ->
                Debug.log "parse failed with error" [{x=0,y=0}]
            Ok p ->
                p

parsePoints : Parser (List Point)
parsePoints =
    succeed identity
        |. symbol "["
        |. spaces
        |= andThen (\n -> pointListHelp [n]) point
        |. spaces
        |. symbol "]"

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


nextPoint : Parser Point
nextPoint =
  delayedCommit spaces <|
    succeed identity
      |. symbol ","
      |. spaces
      |= point

pointListHelp : List Point -> Parser (List Point)
pointListHelp revPoints =
    oneOf
      [ nextPoint
          |> andThen (\n -> pointListHelp (n :: revPoints))
      , succeed (List.reverse revPoints)
      ]

spaces : Parser ()
spaces =
    ignoreWhile (\char -> (char == '\n') || (char == ' ') )

