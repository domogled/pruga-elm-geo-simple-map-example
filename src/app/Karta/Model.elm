module Karta.Model exposing (..)
-- import String

type alias Id =
  String

type alias Zoom = Int

type alias LatLong = (Float, Float)
type alias PointFloat = (Float, Float)
type alias Point = (Int, Int)

type alias Karta =
  { id : Id
  , center : LatLong
  , zoom : Zoom
  }
  
  
type alias MouseEvent = {
  latLng: LatLong,
  layerPoint: PointFloat,
  containerPoint: PointFloat
}