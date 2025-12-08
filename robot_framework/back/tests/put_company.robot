*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    String
Library    RequestsLibrary


*** Variables ***
${BASE_URL}                 https://api-blacklist.qacoders.dev.br/api
${EMAIL}                    blacklist@qacoders.com
${PASSWORD}                 1234@Test

# ---------- Altere para a empresa que deseja editar ----------
${COMPANY_ID}               691345d85d3e5cb01f1a4b76
${CORPORATE_NAME}           Teste Teste ok
${REGISTER_COMPANY}         44776403000898
${COMPANY_MAIL}             contasct@bluenetworksbrasil.com
${MATRIZ}                   Teste Partners
${RESPONSIBLE_CONTACT}      Marcio Sousa
${TELEPHONE}                41962316808
${SERVICE_DESCRIPTION}      Testes Sousa
# -------------------------------------------------------------

*** Test Cases ***
Atualizar dados da empresa
    Atualizar dados da empresa cadastrada por id

*** Keywords ***
Criar Sessao
    ${headers}=    Create Dictionary   accept=application/json    Content-Type=application/json
    Create Session   alias=develop   url=${BASE_URL}    headers=${headers}

Realizar login com credenciais validas e armazenar token
    ${body}=    Create Dictionary    mail=${EMAIL}    password=${PASSWORD}
    Criar Sessao
    ${resp}=    POST On Session    alias=develop    url=/login    json=${body}    verify=${True}
    Log     ${resp.json()}
    Status Should Be    200    ${resp}
    ${token}=    Set Variable    ${resp.json()['token']}
    RETURN    ${token}

Atualizar dados da empresa cadastrada por id
    ${token}=    Realizar login com credenciais validas e armazenar token
    ${body}=    Create Dictionary
    ...    corporateName=${CORPORATE_NAME}
    ...    registerCompany=${REGISTER_COMPANY}
    ...    mail=${COMPANY_MAIL}
    ...    matriz=${MATRIZ}
    ...    responsibleContact=${RESPONSIBLE_CONTACT}
    ...    telephone=${TELEPHONE}
    ...    serviceDescription=${SERVICE_DESCRIPTION}
    ${response}=    PUT On Session
    ...    alias=develop
    ...    url=/company/${COMPANY_ID}?token=${token}
    ...    json=${body}
    ...    verify=${True}
    Status Should Be    200    ${response}

