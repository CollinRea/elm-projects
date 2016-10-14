module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Html.App as App


-- MODEL


type alias Model =
    Bool


init : ( Model, Cmd Msg )
init =
    ( False, Cmd.none )



-- MESSAGES


type Msg
    = Expand
    | Collapse



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Expand ->
            ( True, Cmd.none )

        Collapse ->
            ( False, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    if model then
        div []
            [ button [ onClick Collapse ] [ text "Hide" ]
            , body []
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
                        , h1 []
                            [ text "Collin Rea" ]
                        , p []
                            [ text "Full Stack Web Developer" ]
                        ]
                    ]
                ]
            ]
    else
        div []
            [ button [ onClick Expand ] [ text "Show" ] ]



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
