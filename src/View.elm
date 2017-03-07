module View exposing (root)

import Html exposing (Html, div, text)
import Models exposing (Model, Msg)

root : Model -> Html Msg
root model = div []
    [ text ("hello, points is: ("++ toString model.points.x ++ ", " ++ toString model.points.y ++ ")")
    ]