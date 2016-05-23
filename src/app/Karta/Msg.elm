module Karta.Msg exposing (..)

import Karta.Model exposing (Karta, MouseEvent)

type Msg
  = Create Karta
    | MouseEvent Karta.Model.MouseEvent
  
  
  
