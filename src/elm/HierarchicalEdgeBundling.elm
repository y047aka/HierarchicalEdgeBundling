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
            [ viewNodes companies
            , viewCurves companies relations
            ]
        ]


viewCurves : List Company -> List ( String, String ) -> Svg msg
viewCurves companies relations =
    let
        angleScale : ContinuousScale Float
        angleScale =
            Scale.linear ( degrees 0, degrees 360 ) ( 0, companies |> List.length |> toFloat )
    in
    relations
        |> List.map
            (\( a, b ) ->
                viewCurve
                    ( a
                        |> findCompanyIndex companies
                        |> Scale.convert angleScale
                    , b
                        |> findCompanyIndex companies
                        |> Scale.convert angleScale
                    )
            )
        |> g []


viewCurve : ( Float, Float ) -> Svg msg
viewCurve ( thetaA, thetaB ) =
    let
        r =
            400

        points =
            [ ( r * cos thetaA, r * sin thetaA )
            , ( 0, 0 )
            , ( r * cos thetaB, r * sin thetaB )
            ]

        flip : (a -> b -> c) -> b -> a -> c
        flip function argB argA =
            function argA argB
    in
    points
        |> Curve.bundle 0.2
        |> flip SubPath.element []


viewNodes : List Company -> Svg msg
viewNodes companies =
    let
        angleScale : ContinuousScale Float
        angleScale =
            Scale.linear ( 0, 360 ) ( 0, toFloat (List.length companies) )
    in
    g []
        (companies
            |> List.indexedMap (viewNode angleScale)
        )


viewNode : ContinuousScale Float -> Int -> Company -> Svg msg
viewNode angleScale i company =
    let
        angle =
            i |> toFloat |> Scale.convert angleScale
    in
    g [ transform [ Rotate angle 0 0 ] ]
        [ text_ [ x 405, y 0 ]
            [ text company.name ]
        ]


findCompanyIndex : List Company -> String -> Float
findCompanyIndex companies name =
    let
        index =
            List.findIndex (\item -> item.name == name) companies
    in
    case index of
        Just number ->
            toFloat number

        Nothing ->
            0
