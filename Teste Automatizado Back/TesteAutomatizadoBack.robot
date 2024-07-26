*** Settings ***
Library    Collections
Library    RequestsLibrary
Library    JSONLibrary

Suite Setup    Create Session    ${SESSION_NAME}    ${BASE_URL}    verify=${VERIFY}

*** Variables ***
${BASE_URL}        https://deploy-db-json-vercel-react-serra-tec2023-3.vercel.app/
${SESSION_NAME}    TrabalhoIqsAdilsonFernando
${VERIFY}          False
${EMAIL}           admin@hotmail.com
${SENHA}           12345678

*** Keywords ***
GET /${endpoint}
    [Arguments]    ${params}    ${expected_status}
    ${response}    GET On Session    alias=${SESSION_NAME}    url=${endpoint}?${params}
    Status Should Be    ${response}    ${expected_status}
    Log    ${response.content}
    RETURN    ${response}

*** Test Cases ***
TC1: realizar autenticação com usuário válido
    ${params}    Set Variable    email=${EMAIL}&senha=${SENHA}
    ${response}    GET /usuarios    ${params}    200
    Log    ${response.content}
