*** Settings ***
Documentation    IQS - Automação FrontEnd (WEB)
Library    SeleniumLibrary
Test Setup    Run Keywords
...    Open Browser    https://trabalho-react-js-serratec-2023-2.vercel.app/    chrome    AND
...    Maximize Browser Window
Test Teardown    Close Browser

*** Keywords ***
Entrar na pagina Home do site e ir ate o login
    Wait Until Element Is Visible    xpath://button[@class='linkLogin']
    Click Element    xpath://button[@class='linkLogin']

Realizar login
    Wait Until Element Is Visible    id:formBasicEmail
    Input Text    id:formBasicEmail   admin@hotmail.com

    Wait Until Element Is Visible    id:formBasicPassword
    Input Text    id:formBasicPassword    12345678
    
    Wait Until Element Is Enabled    class:buttonFormLogin 
    Click Element    class:buttonFormLogin 

*** Test Cases ***
Exercicio - Trabalho Final IQS - Adilson Fernando - 2024.2
    [Tags]    FLUXO-POSITIVO
    Run Keywords
    ...    Entrar na pagina Home do site e ir ate o login
    ...    Realizar login

