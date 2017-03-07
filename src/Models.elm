module Models exposing (..)

type alias Point =
  { x : Float
  , y : Float
  }

type alias Model = {points : Point}

type Msg = NoOp
