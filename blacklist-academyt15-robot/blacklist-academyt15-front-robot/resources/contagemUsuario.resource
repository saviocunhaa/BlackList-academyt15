*** Settings ***
Library    SeleniumLibrary
Resource    ../config/dev.robot
Resource    login.resource
Resource    generate_random_data.resource

*** Variables ***
${BTN_PROXIMO}    xpath=(//button[contains(@class, "css-kab9pu")])[3]/*[name()='svg']
${LISTA_ITENS}    css=ul.css-1upcbd5 > li


*** Keywords ***
Acessar Pagina Usuario
    Wait Until Element Is Visible    id:Cadastros    timeout=10s
    Click Element    id:Cadastros

    Wait Until Element Is Visible    id:Usuários    timeout=10s
    Click Element    id:Usuários

    Wait Until Location Is    ${BASE_URL_UI}/user    timeout=10s
    Location Should Be    ${BASE_URL_UI}/user

    Wait Until Element Is Visible    xpath://h1[text()='Usuários']    timeout=10s
    Element Text Should Be    xpath://h1[text()='Usuários']    Usuários

# Contar Usuarios Na Lista
#     Wait Until Location Is    ${BASE_URL_UI}/user    timeout=10s
#     Location Should Be    ${BASE_URL_UI}/user

#     Wait Until Element Is Visible    locator=tag:ul    timeout=10s

#     # ${quantidade}=    Get Element Count    xpath=//ul[contains(@class, "css-1upcbd5")]/li
    
#     ${quantidade}=    Get Element Count    css=ul.css-1upcbd5 > li
#     Log To Console    A quantidade de itens na lista é: ${quantidade}

#     # Exemplo de validação: Verifica se a lista não está vazia
#     Should Be True    ${quantidade} > 0

Contar Usuarios Na Lista
    Wait Until Location Is    ${BASE_URL_UI}/user    timeout=10s
    
    # Inicializa o contador total com zero
    ${total_usuarios}=    Set Variable    0
    
    # Loop Infinito (vai quebrar quando não houver mais botão próximo)
    WHILE    True
        # 1. Aguarda a lista carregar nesta página
        Wait Until Element Is Visible    ${LISTA_ITENS}    timeout=10s
        
        # 2. Conta quantos itens tem NESTA página
        ${qtd_pagina}=    Get Element Count    ${LISTA_ITENS}
        Log To Console    Itens nesta página: ${qtd_pagina}
        Sleep    10s
        # Rola até o botão de próxima página ficar visível
        Press Keys    None    END
        Sleep    10s
        
        # Adicione /*[name()='svg'] ao final para clicar na imagem dentro do botão
        Click Element    ${BTN_PROXIMO}   
        
        # 3. Soma ao total geral (Matemática simples)
        ${total_usuarios}=    Evaluate    ${total_usuarios} + ${qtd_pagina}
        
        # 4. Verifica se o botão "Próximo" está habilitado para clicar
        # O keyword 'Run Keyword And Return Status' retorna True se o botão estiver visível e habilitado, False se falhar
        ${tem_proxima_pagina}=    Run Keyword And Return Status    Element Should Be Enabled    ${BTN_PROXIMO}
        
        # Lógica de saída ou continuação
        IF    ${tem_proxima_pagina}
            Click Element    ${BTN_PROXIMO}
            # Pequena pausa para garantir que a tabela comece a recarregar (evita contar a mesma página duas vezes rápido demais)
            Sleep    3s 
        ELSE
            # Se o botão não estiver habilitado ou não existir, sai do loop
            BREAK
        END
    END
    
    Log To Console    ----------------------------------------
    Log To Console    TOTAL FINAL DE USUÁRIOS: ${total_usuarios}
    Log To Console    ----------------------------------------
    
    # Validação final
    Should Be True    ${total_usuarios} > 0