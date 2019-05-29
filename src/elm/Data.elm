module Data exposing (Company, companies, relations)


type alias Company =
    { name : String
    }


companies : List Company
companies =
    [ { name = "ALE"
      }
    , { name = "Blue Origine"
      }
    , { name = "JAXA"
      }
    , { name = "MHI"
      }
    , { name = "NASA"
      }
    , { name = "SpaceX"
      }
    ]


relations =
    [ ( "ALE", "MHI" )
    , ( "ALE", "JAXA" )
    , ( "Blue Origine", "NASA" )
    , ( "JAXA", "MHI" )
    , ( "JAXA", "NASA" )
    , ( "NASA", "SpaceX" )
    ]
