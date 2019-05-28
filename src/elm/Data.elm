module Data exposing (Company, companies)


type alias Company =
    { name : String
    }


companies : List Company
companies =
    [ { name = "ALE"
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
