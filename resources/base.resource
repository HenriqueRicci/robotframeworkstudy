*** Settings ***

Library    AppiumLibrary


*** Variables ***

#Variavel global como padrão usamos caixa alta para poder identificar

${START}    QAX 


*** Keywords ***
    
Start session

    Open Application    http://localhost:4723
    ...                 platformName=Android
    ...                 deviceName=Android Emulator
    ...                 automationName=UIAutomator2
    ...                 app=${EXECDIR}/app/yodapp-beta.apk
    ...                 udid=emulator-5554
    ...                 autoGrantPermissions=true

    #Colocado um checkpoint par aguardar que o elemento QAX esteja em tela antes de clicar, assim não dará erro devido tela de splash que o app possui

Get started

    Wait Until Page Contains    ${START}   5    
    Click Text                  ${START}
    
Navigate to
    [arguments]   ${item_text} 

    ${hamburger}    Set Variable    xpath=//android.widget.ImageButton[@content-desc="Open navigation drawer"] 

    Wait Until Element Is Visible    ${hamburger}    5
    Click Element                    ${hamburger}

    ${menu_item}    Set Variable    xpath=//*[@resource-id="com.qaxperience.yodapp:id/navView"]//*[@text="${item_text}"]

    Wait Until Element Is Visible    ${menu_item}    5
    Click Element                    ${menu_item}

Go to item
    [Arguments]    ${item}    ${checkpoint}

    Wait Until Page Contains        	${item}    5
    Click Text                          ${item}
    Wait Until Page Contains            ${checkpoint}

Close session

    Close Application