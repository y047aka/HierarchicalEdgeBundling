module Main exposing (main)

import Browser
import Data exposing (Company, companies, relations)
import HierarchicalEdgeBundling exposing (graph)
import Html exposing (Html, footer, h1, header, li, node, p, text, ul)
import Html.Attributes exposing (class, id, src)


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
        , node "main" [] [ graph companies relations ]
        , footer [ class "site-footer" ]
            [ p [ class "copyright" ] [ text "© 2019 y047aka" ]
            ]
        ]
    }
