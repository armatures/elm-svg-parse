module Main exposing (..)

import Html
import Models exposing (Model, Msg, Point)
import Parsing
import View exposing (..)


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , subscriptions = \_ -> Sub.none
        , view = View.root
        }

init : (Model, Cmd Msg)
init = {points = Parsing.parsePoint "(4,4)" } ! []

update : Msg -> Model -> (Model, Cmd Msg)
update _ model = (model, Cmd.none)