module Data exposing (Company, companies)


type alias Company =
    { binomialName : String
    , japaneseName : String
    }


companies : List Company
companies =
    []
