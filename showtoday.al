codeunit 50100 ShowToday
{
trigger OnRun()
var day : Date;
begin 
    day := Today();    
    Message('Today is %1',day);
end;

} 