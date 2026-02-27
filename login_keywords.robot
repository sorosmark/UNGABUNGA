*** Settings ***
library    Selenium2Library

*** Variables ***
${URL}            https://www.saucedemo.com/
${USERNAME}       standard_user
${PASSWORD}       secret_sauce

*** Keywords ***
Login with standard user
    Open Browser    ${URL}    chrome
    Input Text      id:user-name    ${USERNAME}
    Input Text      id:password     ${PASSWORD}
    Click Button    id:login-button
    Sleep           2s