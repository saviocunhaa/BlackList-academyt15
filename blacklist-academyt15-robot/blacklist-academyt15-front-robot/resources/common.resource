
# modeo interface 

# *** Settings ***
# Library    SeleniumLibrary
# Library    OperatingSystem
# Resource    ../config/dev.robot
# Resource    generate_random_data.resource

# *** Keywords ***
# Abrir Navegador
#     Open Browser    ${BASE_URL_UI}    Chrome
#     Maximize Browser Window


# Fechar Navegador
#     Close Browser


#modo headless

*** Settings ***
Library    OperatingSystem
Resource    ../config/dev.robot
Library    SeleniumLibrary

*** Keywords ***
Abrir Navegador
    ${headless}=    Get Environment Variable    CI    default=False
    Run Keyword If    '${headless}' == 'true'    Abrir Navegador Headless
    ...    ELSE    Abrir Navegador Intereface

    
Abrir Navegador Intereface
    Open Browser    ${BASE_URL_UI}    Chrome
    Maximize Browser Window

Abrir Navegador Headless
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    headless
    Call Method    ${options}    add_argument    no-sandbox
    Call Method    ${options}    add_argument    disable-dev-shm-usage
    Open Browser    $(Ba${BASE_URL_UI}    chrome    options=${options}

Fechar Navegador
    Close Browser
