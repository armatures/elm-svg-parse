module Models exposing (..)

type alias Point =
  { x : Float
  , y : Float
  }

type alias Model = {points : List Point}

type Msg = NoOp
