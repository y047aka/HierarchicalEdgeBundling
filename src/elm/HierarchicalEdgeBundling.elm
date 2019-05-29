module HierarchicalEdgeBundling exposing (graph)

import Curve
import Data exposing (Company)
import Html exposing (text)
import List.Extra as List
import Scale exposing (ContinuousScale)
import SubPath exposing (SubPath)
import TypedSvg exposing (circle, g, polyline, svg, text_)
import TypedSvg.Attributes exposing (points, transform, viewBox)
import TypedSvg.Attributes.InPx exposing (cx, cy, height, r, width, x, x1, x2, y, y1, y2)
import TypedSvg.Core exposing (Svg)
import TypedSvg.Types exposing (Transform(..))


graph : List Company -> List ( String, String ) -> Svg msg
graph companies relations =
    svg
        [ width 1000
        , height 1000
        , viewBox -500 -500 1000 1000
        ]
        [ g [ TypedSvg.Attributes.class [ "companies" ] ]
            [ g []
                (List.indexedMap viewNode companies)
            , g []
                (relations
                    |> List.map (\( a, b ) -> ( findCompanyIndex a companies, findCompanyIndex b companies ))
                    |> List.map (\( a, b ) -> viewCurve a b)
                )
            ]
        ]


viewCurve : Float -> Float -> Svg msg
viewCurve node1 node2 =
    let
        r =
            400

        angleScale : ContinuousScale Float
        angleScale =
            Scale.linear ( degrees 0, degrees 360 ) ( 0, 6 )

        flip : (a -> b -> c) -> b -> a -> c
        flip function argB argA =
            function argA argB
    in
    ( node1, node2 )
        |> (\( a, b ) ->
                [ ( r * cos (Scale.convert angleScale a)
                  , r * sin (Scale.convert angleScale a)
                  )
                , ( 0, 0 )
                , ( r * cos (Scale.convert angleScale b)
                  , r * sin (Scale.convert angleScale b)
                  )
                ]
           )
        |> Curve.bundle 0.2
        |> flip SubPath.element []


viewNode : Int -> Company -> Svg msg
viewNode i company =
    let
        angleScale : ContinuousScale Float
        angleScale =
            Scale.linear ( 0, 360 ) ( 0, 6 )

        angle =
            i
                |> toFloat
                |> Scale.convert angleScale
    in
    g [ transform [ Rotate angle 0 0 ] ]
        [ text_ [ x 405, y 0 ]
            [ text company.name ]
        ]


findCompanyIndex : String -> List Company -> Float
findCompanyIndex name companies =
    let
        index =
            List.findIndex (\item -> item.name == name) companies
    in
    case index of
        Just number ->
            toFloat number

        Nothing ->
            0
