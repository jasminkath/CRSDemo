codeunit 50122 DemoNotification
{

  var
    NotificationTxt : label 'Customer balance exceeds credit limit';
    NotificationDescTxt : Label 'Balance of customer is larger than the credit limit';

  [EventSubscriber(ObjectType::Page, Page::"Sales Order", 'OnOpenPageEvent', '', false, false)]
  local procedure CreditLimitNotificationOnOpenSalesOrder(var Rec : Record "Sales Header")
  var
    Customer : Record Customer;
    MyNotification : Notification;
    MyNotifications : Record "My Notifications";
  begin
    IF Rec."Sell-to Customer No." = '' THEN
      EXIT;

    Customer.GET(Rec."Sell-to Customer No.");
    IF Customer."Credit Limit (LCY)" = 0 THEN
      EXIT;

    IF NOT MyNotifications.IsEnabledForRecord(GetMyNotificationID,Customer) THEN
      EXIT;

    Customer.CalcFields("Balance (LCY)");
    IF Customer."Balance (LCY)" > Customer."Credit Limit (LCY)" THEN BEGIN
      MyNotification.Id := GetMyNotificationID();
      MyNotification.Message := 'The balance of this customer is larger than the credit limit';
      MyNotification.Scope := NotificationScope::LocalScope;
      MyNotification.SetData('CustNo',Customer."No.");
      MyNotification.AddAction('Open Customer Card',Codeunit::DemoNotification,'OpenCustomer');
      MyNotification.Send();
    END;
  end;

  procedure OpenCustomer(MyNotification : Notification)
  var
    Customer : Record 18;
  begin
    Customer.GET(MyNotification.GETDATA('CustNo'));
    PAGE.RUN(PAGE::"Customer Card",Customer);
  end;

  local procedure GetMyNotificationID() : Guid
  begin
    EXIT('fbaf8452-b094-41c3-9972-0d9abe1bafa6');
  end;

  [EventSubscriber(ObjectType::Page, Page::"My Notifications", 'OnInitializingNotificationWithDefaultState', '', false, false)]
  local procedure "MyNotifications.OnInitializingNotificationWithDefaultState"()
  var
    MyNotifications : Record "My Notifications";
  begin  
     MyNotifications.InsertDefaultWithTableNum(GetMyNotificationID(),
                                              NotificationTxt,
                                              NotificationDescTxt,
                                              Database::Customer);
  end;
}

