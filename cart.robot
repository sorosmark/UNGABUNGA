*** Settings ***
Library           Selenium2Library

*** Variables ***
${URL}            https://www.saucedemo.com/
${USERNAME}       standard_user
${PASSWORD}       secret_sauce        

*** Test Cases ***
Add multiple products
    Open Browser    ${URL}    firefox
    Input Text      id:user-name    ${USERNAME} 
    Input Text      id:password     ${PASSWORD}
    Click Button    id:login-button
    Click Button    id:add-to-cart-sauce-labs-backpack
    Click Button    id:add-to-cart-sauce-labs-bike-light
    Click Button    id:add-to-cart-sauce-labs-bolt-t-shirt
    Element Text Should Be    id:shopping_cart_container    3
    Click Button   id:remove-sauce-labs-backpack
    Element Text Should Be    id:shopping_cart_container    2
    Click Element     class:shopping_cart_link
    ${item_count}=    Get Element Count    class:cart_item
    Should Be Equal As Integers    ${item_count}    2
    Sleep    3s
    Close Browser