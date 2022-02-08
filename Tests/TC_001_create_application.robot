*** Settings ***
Library  RequestsLibrary
Library  Collections


*** Variables ***
${baseURL}=   http://172.30.40.183

*** Test Cases ***
TC_001_create_application
    create session   test   ${baseURL}
    ${body}=    Create Dictionary   identityNumber=2467219016  customNumber=1019021542  dateOfBirthYear=1982  manufactureYear=2019  token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYmYiOjE2NDM2NTc5MDYsImV4cCI6MTY0MzY1ODIwNiwiaWF0IjoxNjQzNjU3OTA2LCJpc3MiOiJodHRwczovL2xvY2FsaG9zdDo0NDMzOCJ9.3vFC8qvGo6inmq5SSu9sB_oZiU552hYrr4yWSK1QVcQ  captchaCode=1771
   # Log To Console  ${body}
    ${header}=  Create Dictionary   Content-Type=application/json
    ${response}=  Post Request   test  /motor/V1/Applications  ${body}  headers=${header}
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}

    ${status_code}=   Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    000