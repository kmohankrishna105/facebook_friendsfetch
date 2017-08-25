*** Settings ***
Library  ../Libraries/write_excel.py
Library  Selenium2Library
Library  Dialogs
Library  ExcelLibrary
Library  string
#Library  write_excel
Library  Collections

*** Variable ***
${url} =  https://www.facebook.com/
${BROWSER} =  chrome
${sheet} =  Friends
${path} =  D:/Friends_list.xls
${row} =  3
${col} =  7
${row1} =  4
#${col}=${0}
${col1} =  8


*** Test Cases ***
First Testcase
  [Tags]  excel
  #write to excel  ${path}  ${sheet}  3  3  30
  do something
  log  ${row}
  #${col}=  evaluate  {col}-1
  ${y} =  set variable  ${col}
  log  ${y}
  :FOR  ${y}  in range  1  4
  \  write to excel  ${path}  ${sheet}   ${row}  1  7000
  \  write to exists  ${path}  ${sheet}  ${row}  2  7010
  log  ${row}
  ${col}  evaluate  ${col}-1
  log  ${col}

second
  ${new_list}  create list
  append to list  ${new_list}  8
  append to list  ${new_list}  10
  append to list  ${new_list}  9
  log  ${new_list}
  #log  @{new_list}
  log  ${new_list[1]}
  ${num} =  get length   ${new_list}
  log  ${num}

  :FOR  ${i}  in range  1  ${num}
  \  write to exists  ${path}  ${sheet}  ${i}  2  ${new_list}
  \  log  ${new_list[2]}
  execute javascript  windows.scrollTo(900,900)
*** Keywords ***
