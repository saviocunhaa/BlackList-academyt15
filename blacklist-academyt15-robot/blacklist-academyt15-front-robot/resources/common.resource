*** Settings ***
Library    SeleniumLibrary
Resource    ../config/dev.robot
Resource    generate_random_data.resource

*** Keywords ***
Abrir Navegador
    Open Browser    ${BASE_URL_UI}    Chrome
    Maximize Browser Window


Fechar Navegador
    Close Browser