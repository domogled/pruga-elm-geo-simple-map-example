module Karta.View exposing (..)

import Html exposing (Html)
import Html exposing (div)
import Html.Attributes exposing (style, id, class)

import Karta.Model exposing (Karta, Id)
import Karta.Msg exposing (Msg)


view : Karta -> Html Msg
view karta = div [id "container"] [mapovy_div karta.id]

mapovy_div : Id -> Html Msg
mapovy_div kartaId = div [mapovy_div_styl, id kartaId] [Html.text "zde bude mapa"]

mapovy_div_styl : Html.Attribute Msg
mapovy_div_styl =
  Html.Attributes.style
    [ ("width", "100%")
    , ("height", "500px")
    , ("background-color", "red")
    -- , ("padding", "10px 0")
    -- , ("font-size", "2em")
    -- , ("text-align", "center")
    ]