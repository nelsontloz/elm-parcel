module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)


main =
    Browser.sandbox { init = init, update = update, view = view }


type alias Model =
    { name : String
    , password : String
    , confirmPassword : String
    }


init : Model
init =
    Model "" "" ""


type Msg
    = ChangeName String
    | ChangePassword String
    | ChangeConfirmPassword String


update : Msg -> Model -> Model
update msg model =
    case msg of
        ChangeName newName ->
            { model | name = newName }

        ChangePassword newPassword ->
            { model | password = newPassword }

        ChangeConfirmPassword newPassword ->
            { model | confirmPassword = newPassword }


view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ div [ class "field" ]
            [ label [ class "label" ] [ text "Name" ]
            , div [ class "control" ]
                [ viewInput model "text" "Name" model.name ChangeName
                ]
            ]
        , div [ class "field" ]
            [ label [ class "label" ] [ text "Password" ]
            , div [ class "control" ]
                [ viewInput model "password" "Password" model.password ChangePassword
                ]
            ]
        , div [ class "field" ]
            [ label [ class "label", classList [ ( "is-success", passwordsMatch model.password model.confirmPassword ) ] ] [ text "Confirm password" ]
            , div [ class "control" ]
                [ viewInput model "password" "Confirm Password" model.confirmPassword ChangeConfirmPassword
                ]
            ]
        ]


viewInput : Model -> String -> String -> String -> (String -> msg) -> Html msg
viewInput model t p v toMsg =
    input [ class "input", type_ t, placeholder p, value v, onInput toMsg, classList [ ( "is-success", passwordsMatch model.password model.confirmPassword ) ] ] []


passwordsMatch : String -> String -> Bool
passwordsMatch password confirmPassword =
    password == confirmPassword
