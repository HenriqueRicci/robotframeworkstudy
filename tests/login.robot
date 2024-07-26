*** Settings ***

Library    AppiumLibrary
Resource    ../resources/base.resource

*** Variables ***

${email_valido}       yoda@qax.com
${senha_valida}       jedi
${email_incorreto}    yoda@qa.com
${senha_incorreta}    jedai
${email_invalido}     teste.com
${imput_email}        com.qaxperience.yodapp:id/etEmail
${imput_senha}        com.qaxperience.yodapp:id/etPassword
${submit_button}      com.qaxperience.yodapp:id/btnSubmit


*** Test Cases ***

Efetuar login com sucesso

    Start session
    Get started
    Navigate to    Formulários
    Go to item     Login    Olá Padawan, vamos testar o login?
        
           Input Text        ${imput_email}       ${email_valido}
           Input Password    ${imput_senha}       ${senha_valida} 
           Click Element     ${submit_button}

           Wait Until Page Contains    Boas vindas, logado você está.    5

    Close session

Tentativa de login com dados incorretos


    Start session
    Get started
    Navigate to    Formulários
    Go to item     Login    Olá Padawan, vamos testar o login?
        
           Input Text        ${imput_email}       ${email_incorreto}
           Input Password    ${imput_senha}       ${senha_incorreta} 
           Click Element     ${submit_button}

           Wait Until Page Contains    Oops! Credenciais incorretas.    5

    Close session

Tentativa de login sem preenchimento de email


    Start session
    Get started
    Navigate to    Formulários
    Go to item     Login    Olá Padawan, vamos testar o login?
        
           Input Password    ${imput_senha}        ${senha_valida} 
           Click Element     ${submit_button}

           Wait Until Page Contains    Email válido você deve informar!    5

    Close session

Tentativa de login sem preenchimento de email e senha


    Start session
    Get started
    Navigate to    Formulários
    Go to item     Login    Olá Padawan, vamos testar o login?
        
           Click Element     ${submit_button}

           Wait Until Page Contains    Email válido você deve informar!    5

    Close session


Tentativa de login com preenchimento de email invalido


    Start session
    Get started
    Navigate to    Formulários
    Go to item     Login    Olá Padawan, vamos testar o login?
        
           Input Text        ${imput_email}       ${email_invalido}
           Input Password    ${imput_senha}       ${senha_valida} 
           Click Element     ${submit_button}

           Wait Until Page Contains    Email válido você deve informar!    5

    Close session

Tentativa de login sem preenchimento de senha


    Start session
    Get started
    Navigate to    Formulários
    Go to item     Login    Olá Padawan, vamos testar o login?
        
           Input Text        ${imput_email}       ${email_valido}
           Click Element     ${submit_button}

           Wait Until Page Contains    Uma senha você deve informar!    5

    Close session