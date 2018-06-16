codeunit 50103 DotNetBookshelfWrappers
{
    trigger OnRun()
    begin
       //MyTextDemo(); 
       //MyListDemo();
       DebugSomething();

    end;
    
local procedure MyTextDemo()
var
    mytext:text;
    mytextbuilder:TextBuilder;
begin
    mytextbuilder.AppendLine('We can append a line to the text');
    mytextbuilder.Append('...or we can  append characters');
    mytextbuilder.AppendLine(' to the current line');
    mytextbuilder.AppendLine('some text');
    mytextbuilder.Replace('some text','replaced by some other text');
    mytext := mytextbuilder.ToText();
    mytext := mytext.ToUpper();
    message(mytext);

end;

local procedure MyListDemo()
var
    myList:List of [Text];
    my_label: Label 'Jane is the element number %1 on the list';
begin
    myList.Add('John');
    mylist.Add('Jane');
    myList.Add('Jasminka');

    if myList.Contains('John') then 
      message('John is on the list');
    message(my_label,myList.IndexOf('Jane'));
end;

local procedure DebugSomething()
var
    myInt: Integer;
    sillyvar : Integer;
begin
    for myint := 1 to 100 do 
       sillyvar := myInt;

end;

}