*** Settings ***
Library           Selenium2Library

*** Variables ***
${URL}            https://www.saucedemo.com/
${USERNAME}       standard_user
${PASSWORD}       secret_sauce
*** Test Cases ***
Login to Sauce Demo
    Open Browser    ${URL}    chrome
    Input Text      id:user-name    ${USERNAME}
    Input Text      id:password     ${PASSWORD}
    Click Button    id:login-button
    Sleep           2s
    Page Should Contain Element    id:shopping_cart_container
    Close Browser

Login with wrong password
    Open Browser    ${URL}    chrome
    Input Text      id:user-name    ${USERNAME}
    Input Text      id:password     wrong_password
    Click Button    id:login-button
    Page Should Contain Element    css:.error-message-container.error
    Sleep           2s
    Close Browser

login with wrong username
    Open Browser    ${URL}    chrome
    Input Text      id:user-name    wrong_user
    Input Text      id:password     ${PASSWORD}
    Click Button    id:login-button
    Page Should Contain Element    css:.error-message-container.error
    Sleep           2s
    Close Browser

login without username
    Open Browser    ${URL}    chrome
    Input Text      id:password     ${PASSWORD}
    Click Button    id:login-button
    Page Should Contain Element    css:.error-message-container.error
    Sleep           2s
    Close Browser

login without password
    Open Browser    ${URL}    chrome
    Input Text      id:user-name    ${USERNAME}
    Click Button    id:login-button
    Page Should Contain Element    css:.error-message-container.error
    Sleep           2s
    Close Browser