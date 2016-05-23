port module Karta.Ports exposing (..)

import Karta.Model exposing (Karta, MouseEvent)

port create : Karta -> Cmd msg

port onMouseEvent : (MouseEvent -> msg) -> Sub msg