*** Settings ***
Library    SeleniumLibrary
Resource    ../config/dev.robot
Resource    login.resource
Resource    generate_random_data.resource



*** Keywords ***
Acessar Pagina Centro de Custos
    Click Element    id:Cadastros

    Wait Until Element Is Visible    id:Centro de Custo    timeout=10s
    Click Element    id:Centro de Custo

    Wait Until Location Is    ${BASE_URL_UI}/costCenter    timeout=10s
    Location Should Be    ${BASE_URL_UI}/costCenter

    Wait Until Element Is Visible    xpath://h1[text()='Centro de Custo']    timeout=10s
    Element Text Should Be    xpath://h1[text()='Centro de Custo']    Centro de Custo

Cadastrar Novo Centro de Custos
    Wait Until Element Is Visible    xpath://button[text()='Novo Centro de Custo']    timeout=10s
    Click Button    xpath://button[text()='Novo Centro de Custo']

    Wait Until Element Is Visible    xpath://h2[text()='Novo Centro de Custo']    timeout=10s
    Element Should Be Visible    xpath://h2[text()='Novo Centro de Custo']

    Preencher Centro de Custo
    
    Wait Until Element Is Visible    xpath://button[text()='Salvar']    timeout=10s
    Click Button    xpath:/html/body/div/div/div[2]/div/div[3]/button[2]  
    Sleep    10s



Preencher Centro de Custo
    ${dados_centro_de_custo}=    Gerar Centro de Custo Fakes

    Preencher Nome do Centro de Custo    ${dados_centro_de_custo['nome_centro_de_custos']}


Preencher Nome do Centro de Custo
    [Arguments]    ${nome_centro_de_custo}
    Wait Until Element Is Visible    id:costCentername    10s
    Input Text    id:costCentername    ${nome_centro_de_custo}
