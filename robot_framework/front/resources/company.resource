*** Settings ***
Library    SeleniumLibrary
Resource    ../config/dev.robot
Resource    login.resource
Resource    generate_random_data.resource



*** Keywords ***
Acessar Pagina Company
    Click Element    id:Cadastros

    Wait Until Element Is Visible    id:Empresas    timeout=10s
    Click Element    id:Empresas

    Wait Until Location Is    ${BASE_URL_UI}/company    timeout=10s
    Location Should Be    ${BASE_URL_UI}/company

    Wait Until Element Is Visible    xpath://h1[text()='Empresas']    timeout=10s
    Element Text Should Be    xpath://h1[text()='Empresas']    Empresas

Acessar Pagina Company Editar


    Wait Until Location Is    ${BASE_URL_UI}/company    timeout=10s
    Location Should Be    ${BASE_URL_UI}/company

    Wait Until Element Is Visible    xpath://h1[text()='Empresas']    timeout=10s
    Element Text Should Be    xpath://h1[text()='Empresas']    Empresas

Cadastrar Nova Company
    Wait Until Element Is Visible    xpath://button[text()='Nova Empresa']    timeout=10s
    Click Button    xpath://button[text()='Nova Empresa']

    Wait Until Element Is Visible    xpath://h5[text()='Novo Cadastro']    timeout=10s
    Element Should Be Visible    xpath://h5[text()='Novo Cadastro']

    Preencher Formulario Empresa
    
    Wait Until Element Is Visible    xpath://button[text()='Salvar']    timeout=10s
    Click Button    xpath://button[text()='Salvar']
    Sleep    10s


Editar Company
    Sleep    10s
    Wait Until Element Is Visible    xpath://h1[text()='Empresas']    timeout=50s
    Wait Until Element Is Visible    xpath://button[text()='Editar']    timeout=50s
    Click Button    xpath://button[text()='Editar']

    Preencher Formulario Empresa

    Wait Until Element Is Visible    xpath://button[text()='Salvar']    timeout=10s
    Click Button    xpath://button[text()='Salvar']


Preencher Formulario Empresa
    ${dados_empresa}=    Gerar Empresa Fake
    
    
    Preencher Campo Razao Social            ${dados_empresa['razao_social']}
    Preencher Campo Nome Fantasia           ${dados_empresa['nome_fantasia']}
    Preencher Campo Email Empresa           ${dados_empresa['email']}
    Preencher Campo CNPJ                    ${dados_empresa['cnpj']}
    Preencher Campo Telefone Empresa        ${dados_empresa['telefone']}
    Preencher Campo Nome Responsavel Empresa    ${dados_empresa['nome_responsavel']}
    Preencher Campo Descricao Servico       ${dados_empresa['descricao_servico']}
    Preencher Campo CEP Empresa             ${dados_empresa['cep']}
    Preencher Campo Pais Empresa            ${dados_empresa['pais']}
    Preencher Campo Cidade Empresa          ${dados_empresa['cidade']}
    Preencher Campo Estado Empresa          ${dados_empresa['estado']}
    Preencher Campo Bairro Empresa          ${dados_empresa['bairro']}
    Preencher Campo Rua Empresa             ${dados_empresa['rua']}
    Preencher Campo Numero Imovel Empresa   ${dados_empresa['numero_imovel']}
    Preencher Campo Complemento Empresa     ${dados_empresa['complemento']}

Preencher Campo Razao Social
    [Arguments]    ${razao_social}
    Wait Until Element Is Visible    id:companyName    10s
    Input Text    id:companyName    ${razao_social}

Preencher Campo Nome Fantasia
    [Arguments]    ${nome_fantasia}
    Wait Until Element Is Visible    id:fantasyName    10s
    Input Text    id:fantasyName    ${nome_fantasia}

Preencher Campo Email Empresa
    [Arguments]    ${email}
    Wait Until Element Is Visible    id:companyMail    10s
    Input Text    id:companyMail    ${email}

Preencher Campo CNPJ
    [Arguments]    ${cnpj}
    Wait Until Element Is Visible    id:matriz    10s
    Input Text    id:matriz    ${cnpj}

Preencher Campo Telefone Empresa
    [Arguments]    ${telefone}
    Wait Until Element Is Visible    id:telephone    10s
    Input Text    id:telephone    ${telefone}

Preencher Campo Nome Responsavel Empresa
    [Arguments]    ${nome_responsavel}
    Wait Until Element Is Visible    id:fullName    10s
    Input Text    id:fullName    ${nome_responsavel}

Preencher Campo Descricao Servico
    [Arguments]    ${descricao_servico}
    Wait Until Element Is Visible    id:serviceDescription    10s
    Input Text    id:serviceDescription    ${descricao_servico}

Preencher Campo CEP Empresa
    [Arguments]    ${cep}
    Wait Until Element Is Visible    id:zipCode    10s
    Input Text    id:zipCode    ${cep}

Preencher Campo Pais Empresa
    [Arguments]    ${pais}
    Wait Until Element Is Visible    id:country    10s
    Input Text    id:country    ${pais}

Preencher Campo Cidade Empresa
    [Arguments]    ${cidade}
    Wait Until Element Is Visible    id:city    10s
    Input Text    id:city    ${cidade}

Preencher Campo Estado Empresa
    [Arguments]    ${estado}
    Wait Until Element Is Visible    id:state    10s
    Input Text    id:state    ${estado}

Preencher Campo Bairro Empresa
    [Arguments]    ${bairro}
    Wait Until Element Is Visible    id:district    10s
    Input Text    id:district    ${bairro}

Preencher Campo Rua Empresa
    [Arguments]    ${rua}
    Wait Until Element Is Visible    id:street    10s
    Input Text    id:street    ${rua}

Preencher Campo Numero Imovel Empresa
    [Arguments]    ${numero_imovel}
    Wait Until Element Is Visible    id:number    10s
    Input Text    id:number    ${numero_imovel}

Preencher Campo Complemento Empresa
    [Arguments]    ${complemento}
    Wait Until Element Is Visible    id:complement    10s
    Input Text    id:complement    ${complemento}