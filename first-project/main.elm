module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.App as App
import Widget


-- MODEL


type alias AppModel =
    { widgetModel : Widget.Model
    }


initialModel : AppModel
initialModel =
    { widgetModel = Widget.initialModel
    }


init : ( AppModel, Cmd Msg )
init =
    ( initialModel, Cmd.none )



-- MESSAGES


type Msg
    = WidgetMsg Widget.Msg



-- UPDATE


update : Msg -> AppModel -> ( AppModel, Cmd Msg )
update message model =
    case message of
        WidgetMsg subMsg ->
            let
                ( updatedWidgetModel, widgetCmd ) =
                    Widget.update subMsg model.widgetModel
            in
                ( { model | widgetModel = updatedWidgetModel }, Cmd.map WidgetMsg widgetCmd )



-- VIEW


view : AppModel -> Html Msg
view model =
    div []
        [ body []
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
        , App.map WidgetMsg (Widget.view model.widgetModel)
        ]



-- SUBSCRIPTIONS


subscriptions : AppModel -> Sub Msg
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
