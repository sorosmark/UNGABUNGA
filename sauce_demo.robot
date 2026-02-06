*** Settings ***
Library           Selenium2Library

*** Variables ***
${URL}            https://www.saucedemo.com/
*** Test Cases ***
Open Sauce Demo firefox
    Open Browser    ${URL}    firefox
    Sleep    3s
    Close Browser

Open Sauce Demo chrome
    Open Browser    ${URL}    chrome
    Sleep    3s
    Close Browser