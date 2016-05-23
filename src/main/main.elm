module Main exposing (..)

import Html exposing (..)
import Html.App as HtmlApp
import Html.Attributes exposing (..)
import Html.Events exposing (..)

import Karta.View exposing(view)
import Karta.Model exposing (Karta, MouseEvent)
import Karta.Msg exposing (Msg(..))

import Karta.Ports as KartaPorts

import Debug

main : Program Never
main =
  HtmlApp.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

-- MODEL

type alias AppModel = 
  { karta : Karta
  , points: List Karta.Model.MouseEvent
  }
  
initialModel : AppModel
initialModel =
  { karta = { id = "mapa"
            , center = (48.816, 17.519)
            , zoom = 14
            },
    points = []
  }

init : (AppModel, Cmd Msg)
init =
  -- (initialModel, Cmd.none)
    (initialModel, KartaPorts.create initialModel.karta)

-- UPDATE

type Msg
  = KartaMsg Karta.Msg.Msg


update : Msg -> AppModel -> (AppModel, Cmd Msg)
update msg model =
  let
    _ = Debug.log "UPDATE msg =  " msg
    _ = Debug.log "UPDATE model =  " model
  in
    case msg of
      KartaMsg (Karta.Msg.Create karta) ->
        -- ( Model newWord [], Cmd.none )
        (model, Cmd.none)

      KartaMsg (Karta.Msg.MouseEvent event) ->
        ({model | points = event :: model.points}, Cmd.none)


-- SUBSCRIPTIONS

subscriptions : AppModel -> Sub Msg
subscriptions model =
  let
    _ = Debug.log "subscriptions model = " model
  in
    Sub.batch
      [  -- Sub.none
        KartaPorts.onMouseEvent (KartaMsg << Karta.Msg.MouseEvent)
        -- watching (WatcherMsg << Watcher.Event),
        -- watchingReady (WatcherMsg << Watcher.Ready)
        
      ]



-- VIEW

view : AppModel -> Html Msg
view model =
  div [] [ h1 [class "nadpis"] [Html.text "Mapový server"]
         , p [] [Html.text ("id mapy: #" ++ model.karta.id)]
         , HtmlApp.map KartaMsg (Karta.View.view model.karta)
        --  , viewClickedPoints 75
         , ul [] (List.map viewClickedPoints model.points)
        --  , HtmlApp.map KartaMsg (List.map viewClickedPoints model.points)
         ]


-- viewClickedPoints : Karta.Model.MouseEvent -> Html Karta.Msg.Msg
-- viewClickedPoints point =
--      text ("kliknuto na " ++ toString point.latLng.lat ++ ", ")

viewClickedPoints : Karta.Model.MouseEvent -> Html Msg
viewClickedPoints point =
     li [] [text ("kliknuto na "
            ++ toString (fst point.latLng)
            ++ ", "
            ++ toString (snd point.latLng)
            )
          ]
     
     
