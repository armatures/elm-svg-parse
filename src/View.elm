module View exposing (root)

import Html exposing (Html, div, text)
import Models exposing (Model, Msg)

root : Model -> Html Msg
root model = div []
    ([ text "hello, points is: "
    ]
    ++ List.map viewPoint model.points)

viewPoint point =
    text <| "("++ toString point.x ++ ", " ++ toString point.y ++ ")"