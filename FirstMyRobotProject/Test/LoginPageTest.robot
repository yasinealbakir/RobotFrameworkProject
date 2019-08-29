*** Settings ***
Library    SeleniumLibrary 
   
Default Tags    Regresyon Testing

*** Variables ***
${URL}       http://localhost:8383/DemoLogin/index.html
${USERNAME}    admin
${PASSWORD}    123456
@{CREDENTIALS}    admin    123456 
&{LOGINDATA}    username=admin    password=123456   

*** Keywords ***
LoginPageKeywords
    Input Text            id=kullaniciAdi  @{CREDENTIALS}[0]
    Input Password        id=parola        &{LOGINDATA}[password]
    Click Button          id=btnGirisYap

*** Test Cases ***

FirstTest
    [Tags]    Smoke Testing
    Log    I am inside first test.

CorrectLoginTest
    [Documentation]    Başarılı Oturum Açma Senaryosu
    Open Browser          ${URL}    chrome
    Set Browser Implicit Wait    5
    LoginPageKeywords
    Close Browser
    Log    ${TEST NAME} başarıyla tamamlandı...
    Log    Test %{os} üzerinde çalıştırıldı...    