*** Settings ***
Library    Collections
Library    String
Library    BuiltIn

*** Keywords ***
Gerar Empresa Fake
    # Listas base para montar nome da empresa
    @{PREFIXOS}=    Create List    Tech    Global    Prime    Nova    Alpha    Sigma    Atlas    Nexa
    @{SEGMENTOS}=   Create List    Sistemas    Soluções    Serviços    Digital    Tecnologia    Consultoria
    @{SOBRENOMES}=  Create List    Silva    Souza    Oliveira    Santos    Lima    Costa    Mendes    Freitas
    @{CIDADES_ESTADOS}=    Create List
    ...    Fortaleza/CE
    ...    São Paulo/SP
    ...    Rio de Janeiro/RJ
    ...    Belo Horizonte/MG
    ...    Salvador/BA
    ...    Curitiba/PR
    ...    Recife/PE
    ...    Porto Alegre/RS
    @{BAIRROS}=    Create List    Centro    Jardim das Flores    Vila Nova    Industrial    Alto da Serra    Bela Vista
    @{TIPO_LOGRADOURO}=    Create List    Rua    Avenida    Travessa    Alameda    Rodovia

    # Escolhas aleatórias usando Python random (sem instalar nada)
    ${prefixo}=         Evaluate    random.choice($PREFIXOS)    random
    ${segmento}=        Evaluate    random.choice($SEGMENTOS)    random
    ${sobrenome_resp}=  Evaluate    random.choice($SOBRENOMES)   random
    ${cidade_estado}=   Evaluate    random.choice($CIDADES_ESTADOS)    random
    ${bairro}=          Evaluate    random.choice($BAIRROS)      random
    ${tipo_logradouro}=    Evaluate    random.choice($TIPO_LOGRADOURO)    random

    # Quebra Cidade/Estado
    @{partes_local}=    Split String    ${cidade_estado}    /
    ${cidade}=          Get From List    ${partes_local}    0
    ${estado}=          Get From List    ${partes_local}    1

    # Monta razão social e nome fantasia
    ${razao_social}=    Set Variable    ${prefixo} ${segmento} ${sobrenome_resp} LTDA
    ${nome_fantasia}=   Set Variable    ${prefixo} ${segmento}

    # Nome do responsável
    ${nome_responsavel}=    Set Variable    João ${sobrenome_resp}

    # E-mail com base no nome fantasia
    ${base_email}=      Replace String    ${nome_fantasia}    ${SPACE}    _
    ${base_email}=      Convert To Lower Case    ${base_email}
    ${email}=           Set Variable    contato@${base_email}.com.br

    # Descrição do serviço
    ${descricao_servico}=    Set Variable
    ...    Empresa fictícia gerada automaticamente para testes de cadastro de companhias.

    # Geração de CNPJ (14 dígitos – não necessariamente válido, mas suficiente para teste)
    ${cnpj_num}=        Generate Random String    14    [NUMBERS]
    # Opcional: formato 00.000.000/0000-00
    ${cnpj_formatado}=  Set Variable    ${cnpj_num[0:2]}.${cnpj_num[2:5]}.${cnpj_num[5:8]}/${cnpj_num[8:12]}-${cnpj_num[12:14]}

    # Telefone (formato simples)
    ${ddd}=             Generate Random String    2    [NUMBERS]
    ${tel_base}=        Generate Random String    8    [NUMBERS]
    ${telefone}=        Set Variable    (${ddd})${tel_base}

    # CEP (8 dígitos)
    ${cep}=             Generate Random String    8    [NUMBERS]

    # Rua e número
    ${rua}=             Set Variable    ${tipo_logradouro} ${sobrenome_resp}
    ${numero_imovel}=   Evaluate    random.randint(10, 999)    random

    # País e complemento
    ${pais}=            Set Variable    Brasil
    ${complemento}=     Set Variable    Sala 10

    # Monta dicionário final
    &{empresa}=    Create Dictionary
    ...    razao_social=${razao_social}
    ...    nome_fantasia=${nome_fantasia}
    ...    email=${email}
    ...    cnpj=${cnpj_formatado}
    ...    telefone=${telefone}
    ...    nome_responsavel=${nome_responsavel}
    ...    descricao_servico=${descricao_servico}
    ...    cep=${cep}
    ...    pais=${pais}
    ...    cidade=${cidade}
    ...    estado=${estado}
    ...    bairro=${bairro}
    ...    rua=${rua}
    ...    numero_imovel=${numero_imovel}
    ...    complemento=${complemento}

    RETURN    &{empresa}


Gerar Centro de Custo Fakes
    # Listas base para montar nome do centroDeCustos
    @{PREFIXOS}=    Create List    CentroTech    CentroGlobal    CentroPrime    CentroNova    CentroAlpha    CentroSigma    CentroAtlas    CentroNexa
    @{SEGMENTOS}=   Create List    Sistemas    Soluções    Serviços    Digital    Tecnologia    Consultoria


    # Escolhas aleatórias usando Python random (sem instalar nada)
    ${prefixo}=         Evaluate    random.choice($PREFIXOS)    random
    ${segmento}=        Evaluate    random.choice($SEGMENTOS)    random
  
  
    # Monta razão social e nome fantasia
    ${nome_centro_de_custos}=   Set Variable    ${prefixo} ${segmento}

    &{centroDeCustos}=    Create Dictionary
    
    ...    nome_centro_de_custos=${nome_centro_de_custos}
  

    RETURN    &{centroDeCustos}