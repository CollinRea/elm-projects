module Widget exposing (..)

import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)


-- MODEL


type alias Model =
    { count : Int
    }


initialModel : Model
initialModel =
    { count = 0
    }



-- MESSAGES


type Msg
    = Increase Int



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ div [] [ text (toString model.count) ]
        , button [ onClick (Increase 2) ] [ text "Click" ]
        ]



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
    case message of
        Increase number ->
            ( { model | count = model.count + number }, Cmd.none )
