# 🦅 TQC - Turma 15 | Time BlackList

![Status do Projeto](https://img.shields.io/badge/Status-Concluído-success)
![Robot Framework](https://img.shields.io/badge/Robot%20Framework-Web%20%26%20API-blue)
![Postman](https://img.shields.io/badge/Postman-API%20Testing-orange)
![CI/CD](https://img.shields.io/badge/GitHub%20Actions-CI%2FCD-black)

## 📄 Sobre o Projeto

Este repositório contém o portfólio de atividades desenvolvidas durante o treinamento **TQC - Turma 15**.

Como integrante do time **BlackList**, desenvolvi soluções abrangentes de QA, cobrindo desde o planejamento de testes manuais até a automação completa de *Front-end* e *Back-end*, integrando tudo em uma esteira de CI/CD.

## 🛠️ Tecnologias Utilizadas

O projeto foi construído utilizando as seguintes ferramentas e bibliotecas:

* **Robot Framework:** Framework principal para automação de testes.
    * *SeleniumLibrary:* Para automação de interface web (Front-end).
    * *RequestsLibrary:* Para automação de serviços REST (Back-end).
* **Postman:** Criação de coleções e testes manuais/automatizados de API..
* **Python:** Linguagem base para o Robot Framework.
* **GitHub Actions:** Orquestração da integração contínua (CI), executando os testes automaticamente a cada push.
* **Git & GitHub:** Controle de versão.

## 📂 Estrutura do Repositório

O projeto está organizado da seguinte forma:

- `📂 tests/`
    - `📂 ui/`: Cenários de teste automatizados para Interface (Web).
    - `📂 api/`: Cenários de teste automatizados para API (Robot + Postman)..
- `📂 resources/`: Keywords, variáveis e Page Objects utilizados no Robot.
- `📂 docs/`: Artefatos de testes manuais (Planos de Teste, Casos de Teste e Report de Bugs).
- `📜 .github/workflows/`: Arquivos YAML de configuração do GitHub Actions.

## 🚀 Como Executar o Projeto

### Pré-requisitos

Certifique-se de ter o **Python** e o **Git** instalados. Em seguida, instale as dependências do Robot Framework:

```bash
pip install robotframework
pip install robotframework-seleniumlibrary
pip install robotframework-requests
