codeunit 50100 ShowToday
{
trigger OnRun()
var day : Date;
begin 
    day := Today();
    Message('Today is my %1',day);
end;

} 