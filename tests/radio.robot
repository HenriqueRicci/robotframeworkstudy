*** Settings ***

Resource    ../resources/base.resource

*** Test Cases ***


Deve marcar todas as linguagens e parar na javascript como linguagem preferida
    
    Start session
    Get started
    Navigate to    Check e Radio
    Go to item    Botões de radio    	Escolha sua linguagem preferida

    @{techs}    Create List    Java    C#    Ruby    Python    Javascript    Elixir    Go Lang    Javascript

    FOR  ${tech}  IN  @{techs}

            Click Element                       xpath=//android.widget.RadioButton[contains(@text, "${tech}")]
            sleep    1
    
    END

    sleep    3

    Close session
