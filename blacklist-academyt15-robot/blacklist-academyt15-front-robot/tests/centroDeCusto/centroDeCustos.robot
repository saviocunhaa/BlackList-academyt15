*** Settings ***

Resource    ../../resources/common.resource
Resource    ../../resources/login.resource
Resource    ../../resources/generate_random_data.resource
Resource    ../../resources/centroDeCustos.resource

Suite Setup       Abrir Navegador
Suite Teardown    Fechar Navegador

*** Test Cases ***
Cenario 01: Cadastrar novo Centro de Custo
    [Documentation]    Realizar Cadastro do Centro de Custos
    
    Realizar Login
    Verificar Redirecionamento Para Home
    Verificar Elemento Cadastros Visivel
    # Acessar Pagina Centro de Custos
    # Cadastrar Novo Centro de Custos
    