*** Settings ***

Resource    ../resources/base.resource

*** Test Cases ***


Realizar um clique simples
    
    Start session
    Get started
    Navigate to    Clique em Botões
    Go to item    Clique simples    Botão clique simples

            Click Text                          CLIQUE SIMPLES
            Wait Until Page Contains            Isso é um clique simples


    Close session


Realizar um clique longo
    [Tags]    long

    
    Start session
    Get started
    Navigate to    Clique em Botões
    Go to item    Clique longo    Botão clique longo

    # Variavel locator pega o elemento que corresponde ao botão de clicar e positions pega a posição x/y desse elemento através do get element e depois usamos esses dados no tap with positions

    ${locator}    Set Variable    id=com.qaxperience.yodapp:id/long_click
    ${positions}    Get Element Location    ${locator}

            Tap With Positions                  1000    ${${positions}[x], ${positions}[y]}
            Wait Until Page Contains            Isso é um clique longo


    Close session

