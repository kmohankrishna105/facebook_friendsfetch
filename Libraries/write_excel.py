import xlwt
import xlrd
from xlrd import open_workbook
from xlutils.copy import copy


"""procedure
1.openwork book
2.Add sheet and make changes to row and col
3.save the file
"""
def write_to_excel(path,sheet_name,rownum,colnum,value):
    obj=xlwt.Workbook()
    sheetn=obj.add_sheet(sheet_name)
    sheetn.write(int(rownum),int(colnum),value)
    obj.save(path)
    print path
    #return path
#working
#write_to_excel("D:/Testing2233.xls","Vanijaammm",1,2,8900)


def do_something():
    print "Hi there"


#writes code to an existing excel
"""procedure
1.openwork book and copy an image for editing
2.move to sheet and make changes
3.save the file
"""
def write_to_exists(path,sheetname,rownum,colnum,value):
    obj1=open_workbook(path)
    objcpy=copy(obj1)
    objsh=objcpy.get_sheet(sheetname)
    objsh.write(int(rownum),int(colnum),value)
    objcpy.save(path)
#working
#write_to_exists("D:/Testing2233.xls","Vanijaammm",1,6,8900)


