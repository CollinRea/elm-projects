module Main exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick)
import Html.App as App
import Http
import Task exposing (Task)
import Json.Decode as Decode


-- MODEL


type alias Model =
    String


init : ( Model, Cmd Msg )
init =
    ( "", Cmd.none )



-- MESSAGES


type Msg
    = Fetch
    | FetchSuccess String
    | FetchError Http.Error



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Fetch ->
            ( model, fetchCmd )

        FetchSuccess name ->
            ( name, Cmd.none )

        FetchError error ->
            ( toString error, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Fetch ] [ text "Fetch" ]
        , text model
        ]


decode : Decode.Decoder String
decode =
    Decode.at [ "name" ] Decode.string


url : String
url =
    "http://swapi.co/api/planets/1/?format=json"


fetchTask : Task Http.Error String
fetchTask =
    Http.get decode url


fetchCmd : Cmd Msg
fetchCmd =
    Task.perform FetchError FetchSuccess fetchTask



--div []
--    [ body []
--        [ div [ id "container" ]
--            [ div [ id "header" ]
--                [ h2 []
--                    [ text "Collin Rea" ]
--                , ul []
--                    [ li []
--                        [ a [ href "" ]
--                            [ text "Portfolio" ]
--                        ]
--                    , li []
--                        [ a [ href "" ]
--                            [ text "About" ]
--                        ]
--                    , li []
--                        [ a [ href "" ]
--                            [ text "Contact" ]
--                        ]
--                    ]
--                ]
--            , div [ id "content" ]
--                [ p [ id "image" ]
--                    [ a [ href "" ]
--                        [ img [ src "mypicture" ]
--                            []
--                        ]
--                    ]
--                , h1 []
--                    [ text "Collin Rea" ]
--                , p []
--                    [ text "Full Stack Web Developer" ]
--                ]
--            ]
--        ]
--    , App.map WidgetMsg (Widget.view model.widgetModel)
--    ]
-- SUBSCRIPTIONS
-- MAIN


main : Program Never
main =
    App.program
        { init = init
        , view = view
        , update = update
        , subscriptions = (always Sub.none)
        }
