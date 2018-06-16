codeunit 50123 ShowAndRecallNotification
{

  var
  NotificationId : TextConst ENU='1cb4f724-76dc-443f-8816-bcdb0490b2e8';

  [EventSubscriber(ObjectType::Page, Page::"Item Card", 'OnAfterGetCurrRecordEvent', '', false, false)]
  local procedure ShowNotificationOnGetCurrRecordItemCard(var Rec : Record Item);
  var
    TheNotification : Notification;
  begin
    TheNotification.ID := NotificationId;

    if Rec."Base Unit of Measure" = '' then begin
      TheNotification.Message := 'Please specify a Base Unit of Measure';
      TheNotification.Send;
    end else
      TheNotification.Recall;
  end;

}

