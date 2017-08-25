*** Settings ***
Library  Selenium2Library
Library  Dialogs
Library  ExcelLibrary
Library  ../Libraries/write_excel.py
Library  Collections
Library  String

*** Variable ***
${url} =  https://www.facebook.com/
${BROWSER} =  chrome
${c} =  1
${path} =  D:/Friends_list.xls
${list_name} =  hai
${sheet} =  Friends
*** Test Cases ***
Facebook loging and search for friends
  [Tags]  E2E flow  regression
  [Documentation]  login and search for a name
  facebook login
  Search for a name
  view all the friends matching search
  list out the names matching the search
  #List the friends and export to excel sheet

*** Keywords ***
Facebook login
  open browser  ${url}  ${BROWSER}
  input text  css=#email  kmohankrishna20@gmail.com
  input password  xpath=//*[@id="pass"]  37809709q1
  click button  Log In
  sleep  3s

Search for a name
  wait until page contains  Home
  ${user_string}  get value from user  Search srting please:
  input text  xpath=//input[@class='_1frb']  ${user_string}
  sleep  3s
  click element  xpath=//button[@aria-label="Search"]
  wait until page contains  See All

view all the friends matching search
  sleep  10s
  @{locators} =  get webelements  xpath=//div[@class='_2yer _401d _2xje _2nuh']
  click element  id=xt_uniq_2
  :FOR  ${locator}  in  @{locators}
  \  log  len(${locators})
  \  log  ${locator}.text
  sleep  6s

list out the names matching the search
  ${list_name}  create list
  @{name}  get webelements  xpath=//div[@class='_52eh _5bcu']
  ${sag}  get text  xpath=//div[@class='_52eh _5bcu']
  log  ${sag}
  ${i}  set variable  0

#List the friends and export to excel sheet
  :FOR  ${individual_name}  in   @{name}
  \  ${names}  get text  ${individual_name}
  \  log  ${names}
  \  append to list  ${list_name}  ${names}
  \  write to exists  ${path}  ${sheet}  ${i}  2  ${list_name[${i}]}
  \  ${i}  evaluate  ${i}+1

  ${num} =  get length   ${list_name}}
  log  ${list_name}
  log  ${num}
