module Data exposing (Company, companies, relations)


type alias Company =
    { name : String
    }


companies : List Company
companies =
    [ { name = "ESA" }
    , { name = "JAXA" }
    , { name = "NASA" }
    , { name = "ALE" }
    , { name = "Bigelow Aerospace" }
    , { name = "ispace" }
    , { name = "Blue Origine" }
    , { name = "IST" }
    , { name = "三菱重工" }
    , { name = "SpaceX" }
    ]


relations =
    [ ( "ALE", "三菱重工" )
    , ( "ALE", "JAXA" )
    , ( "Bigelow Aerospace", "NASA" )
    , ( "Bigelow Aerospace", "SpaceX" )
    , ( "ESA", "ispace" )
    , ( "ESA", "JAXA" )
    , ( "ESA", "NASA" )
    , ( "Blue Origine", "NASA" )
    , ( "ispace", "JAXA" )
    , ( "ispace", "NASA" )
    , ( "ispace", "SpaceX" )
    , ( "IST", "JAXA" )
    , ( "JAXA", "三菱重工" )
    , ( "JAXA", "NASA" )
    , ( "NASA", "SpaceX" )
    ]
