module Data exposing (Company, companies, relations)


type alias Company =
    { name : String
    }


companies : List Company
companies =
    [ { name = "ALE"
      }
    , { name = "Bigelow Aerospace"
      }
    , { name = "Blue Origine"
      }
    , { name = "ESA"
      }
    , { name = "ispace"
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
    , ( "Bigelow Aerospace", "NASA" )
    , ( "Bigelow Aerospace", "SpaceX" )
    , ( "ESA", "ispace" )
    , ( "ESA", "JAXA" )
    , ( "ESA", "NASA" )
    , ( "Blue Origine", "NASA" )
    , ( "ispace", "SpaceX" )
    , ( "JAXA", "MHI" )
    , ( "JAXA", "NASA" )
    , ( "NASA", "SpaceX" )
    ]
