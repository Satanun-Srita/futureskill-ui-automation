*** Settings ***
Library     SeleniumLibrary
Resource    ../keywords/CommonKeywords.robot
Resource    ../keywords/RegisterPageKeywords.robot
Variables   ../resources/config/config.yaml
Variables   ../resources/testdata/testdata.yaml

Suite Setup       Open Browser    ${baseUrl}    Chrome
Suite Teardown    Close Browser

*** Test Cases ***
User Should Be Able To Register From Home Page Successfully
    [Documentation]    ทดสอบการสมัครสมาชิก Future Skill เริ่มต้นจากหน้าแรกสุด (11 Steps)

    # Step 2: กดปุ่ม “สมัครสมาชิก” บนหน้าแรกสุดของเว็บไซต์
    Click Register Button On Home Page

    # Step 3 - 8: กรอกข้อมูลสมัครสมาชิกในแต่ละช่อง (อีเมล, ชื่อ, นามสกุล, เบอร์โทรศัพท์, รหัสผ่าน, ยืนยันรหัสผ่าน)
    Fill Registration Form
    ...    ${User_Register_Data.email}
    ...    ${User_Register_Data.firstName}
    ...    ${User_Register_Data.lastName}
    ...    ${User_Register_Data.phone}
    ...    ${User_Register_Data.password}

    # Step 9: กดปุ่ม "ติ๊กถูก" ยอมรับข้อกำหนดการใช้งานของ Futureskill
    Accept FutureSkill Terms And Conditions

    # Step 10: กดปุ่ม “สมัครสมาชิก” เพื่อส่งฟอร์มข้อมูล
    Submit Registration Form

    # Step 11: ตรวจสอบข้อความหน้า OTP คำว่า "ระบบได้ส่งรหัส OTP ไปยังเบอร์โทรศัพท์" 
    Verify OTP Message Is Displayed    ระบบได้ส่งรหัส OTP ไปยังเบอร์โทรศัพท์