*** Settings ***

Resource    ../../resources/common.resource
Resource    ../../resources/login.resource
Resource    ../../resources/contagemUsuario.resource


Suite Setup       Abrir Navegador
Suite Teardown    Fechar Navegador

*** Test Cases ***
Cenario 01: Contar Usuarios Na Lista
    [Documentation]    Realizar Cadastro do Centro de Custos
    
    Realizar Login
    Verificar Redirecionamento Para Home
    Verificar Elemento Cadastros Visivel
    Acessar Pagina Usuario
    Contar Usuarios Na Lista