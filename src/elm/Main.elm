module Main exposing (main)

import Browser
import Data exposing (Company, companies)
import Html exposing (Html, footer, h1, header, li, node, p, text, ul)
import Html.Attributes exposing (class, id, src)
import TypedSvg exposing (circle, svg)
import TypedSvg.Attributes exposing (viewBox)
import TypedSvg.Attributes.InPx exposing (cx, cy, height, r, width, x, y)
import TypedSvg.Core exposing (Svg)


main =
    Browser.document
        { init = init
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        }



-- MODEL


type alias Model =
    { companies : List Company }


init : () -> ( Model, Cmd Msg )
init _ =
    ( Model companies
    , Cmd.none
    )



-- UPDATE


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )



-- VIEW


view : Model -> Browser.Document Msg
view model =
    { title = "Hierarchical Edge Bundling"
    , body =
        [ header [ class "site-header" ]
            [ h1 [] [ text "Hierarchical Edge Bundling" ]
            ]
        , node "main" [] [ graph ]
        , footer [ class "site-footer" ]
            [ p [ class "copyright" ] [ text "© 2019 y047aka" ]
            ]
        ]
    }


graph : Svg Msg
graph =
    svg
        [ width 500
        , height 500
        , viewBox -250 -250 500 500
        ]
        [ circle [ cx 0, cy 0, r 200 ] []
        ]
