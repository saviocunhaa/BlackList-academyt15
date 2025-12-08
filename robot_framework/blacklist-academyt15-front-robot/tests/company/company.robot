*** Settings ***

Resource    ../resources/common.resource
Resource    ../resources/login.resource
Resource    ../resources/generate_random_data.resource
Resource    ../resources/company.resource

Suite Setup       Abrir Navegador
Suite Teardown    Fechar Navegador

*** Test Cases ***
Cenario 01: Cadastrar Nova Empresa com Sucesso
    [Documentation]    Realiza login, navega até Clientes e cadastra um novo cliente com dados aleatórios
    
    Realizar Login
    Verificar Redirecionamento Para Home
    Verificar Elemento Cadastros Visivel
    Acessar Pagina Company
    Cadastrar Nova Company


Cenario 02: Editar empresa com sucesso
    [Documentation]    Realiza login, navega até Clientes e atualiza um cliente ja cadastrado

    # Realizar Login
    # Verificar Redirecionamento Para Home
    # Verificar Elemento Cadastros Visivel
    # Acessar Pagina Company Editar
    Editar Company



