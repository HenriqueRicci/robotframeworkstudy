*** Settings ***

Library    AppiumLibrary

*** Test Cases ***

# {
#   "platformName": "Android",
#   "appium:deviceName": "Android Emulator",
#   "appium:automationName": "UIAutomator2",
#   "appium:app": "C:\\QAx\\projects\\yodapp\\app\\yodapp-beta.apk",
#   "appium:udid": "emulator-5554",
#   "autoGrantPermissions": true
# }

# Nessa sessão, precisamos configurar os capabilities do appium inspector para a robot conseguir se comunicar corretamente

# O ${EXECDIR} serve para ir direto ao diretório de execução do projeto, ai pasta passar o caminho relativo para locar o app que já está nesse diretório

Abrir a tela principal

    Open Application    http://localhost:4723
    ...                 platformName=Android
    ...                 deviceName=Android Emulator
    ...                 automationName=UIAutomator2
    ...                 app=${EXECDIR}/app/yodapp-beta.apk
    ...                 udid=emulator-5554
    ...                 autoGrantPermissions=true

    # Abaixo estou criando um teste simples conforme documentação do robot para aguardar que essas linhas de textos abaixo apareçam no app para saber se o mesmo foi aberto corretamente

    # É possivel também acrescentar um timeout no processo, para que o robot aguarde por exemplo 10 segundos até ver os textos abaixo na tela, caso o computador esteja lento essa é uma pratica que pode ajudar, ai ficaria por exemplo: Wait Until Page Contains    Yodapp    10

    Wait Until Page Contains    Yodapp
    Wait Until Page Contains    Mobile Training
    Wait Until Page Contains    by Papito!

    Close Application