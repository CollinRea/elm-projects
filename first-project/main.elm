module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.App as App


-- MODEL


type alias Model =
    String


init : ( Model, Cmd Msg )
init =
    ( "Hello", Cmd.none )



-- MESSAGES


type Msg
    = NoOp



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        noOp ->
            ( model, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    body []
        [ div [ id "container" ]
            [ div [ id "header" ]
                [ h2 []
                    [ text "Collin Rea" ]
                , ul []
                    [ li []
                        [ a [ href "" ]
                            [ text "Portfolio" ]
                        ]
                    , li []
                        [ a [ href "" ]
                            [ text "About" ]
                        ]
                    , li []
                        [ a [ href "" ]
                            [ text "Contact" ]
                        ]
                    ]
                ]
            , div [ id "content" ]
                [ p [ id "image" ]
                    [ a [ href "" ]
                        [ img [ src "mypicture" ]
                            []
                        ]
                    ]
                , h2 []
                    [ text model ]
                , h1 []
                    [ text "Collin Rea" ]
                , p []
                    [ text "Full Stack Web Developer" ]
                ]
            ]
        ]



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- MAIN


main : Program Never
main =
    App.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
