*** Settings ***
Library    SeleniumLibrary 
   
Default Tags    Regresyon Testing

Test Setup    Test initialize
    
Test Teardown    Test Close 

  
*** Variables ***
${LOGIN-URL}       http://localhost:8383/DemoLogin/index.html
&{LOGINDATA}    username=admin    password=123456   


*** Keywords ***
Correct Login Keywords
    Input Text            id=kullaniciAdi  &{LOGINDATA}[username]
    Input Password        id=parola        &{LOGINDATA}[password]
    Click Button          id=btnGirisYap

Test Initialize
    Open Browser          about:blank    chrome
    Maximize Browser Window
    Set Browser Implicit Wait    3
    
Test Close
    Close All Browsers 
    
Go to Login Page
    Go To    ${LOGIN-URL}

*** Test Cases ***
CorrectLoginTest
    [Documentation]    Başarılı Oturum Açma Senaryosu
    Go to Login Page
    Correct Login Keywords
    Log    ${TEST NAME} başarıyla tamamlandı...
    Log    Test %{os} üzerinde çalıştırıldı...  
    




  