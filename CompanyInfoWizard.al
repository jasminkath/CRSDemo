page 50120 CompanyInfoWizard {
    PageType = NavigatePage;
    SourceTable = "Company Information";
    Caption= 'Company Information';

    layout
    {
        area(content)
        {
            group(StandardBanner)
            {
                Editable=false;
                Visible=TopBannerVisible AND (CurrentStep < 3);
                field(MediaResourcesStandard;MediaResourcesStandard."Media Reference")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
            }
            group(FinishedBanner)
            {
                Editable=false;
                Visible=TopBannerVisible AND (CurrentStep = 3);
                field(MediaResourcesDone;MediaResourcesDone."Media Reference")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
            }

            group(Step1)
            {
                Visible = CurrentStep = 1;
                group(CompanyName)
                {
                    Caption = 'Company Name';
                    InstructionalText = 'Provide the name of your company';
                    field(Name;Name)
                    {
                        ApplicationArea = All;
                    }
                }
            }
            group(Step2)
            {
                Visible = CurrentStep = 2;
                group(EmailAddress)
                {
                    Caption ='Email Address';
                    field("E-Mail";"E-Mail")
                    {
                        ApplicationArea = All;
                    }
                }
            }
            group(Step3)
            {
                Visible=CurrentStep = 3;
                group(AllDone)
                {
                    CaptionML = ENU='All done';
                    InstructionalTextML = ENU='Thank you! All information is now ready.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(ActionBack)
            {
                ApplicationArea = All;
                CaptionML = ENU='Back';
                Enabled = ActionBackAllowed;
                Image = PreviousRecord;
                InFooterBar = true;

                trigger OnAction()
                begin
                    TakeStep(-1);
                end;
            }
            action(ActionNext)
            {
                ApplicationArea = All;
                CaptionML = ENU='Next';
                Enabled = ActionNextAllowed;
                Image = NextRecord;
                InFooterBar = true;

                trigger OnAction()
                begin
                    TakeStep(1);
                end;
            }
            action(ActionFinish)
            {
                ApplicationArea = All;
                Caption = 'Finish';
                Enabled = ActionFinishAllowed;
                Image = Approve;
                InFooterBar = true;

                trigger OnAction()
                begin
                    CurrPage.Close();
                end;
            }
        }
    }

    trigger OnInit()
    begin
        LoadTopBanners();
    end;

    trigger OnOpenPage()
    begin
        CurrentStep := 1;
        SetControls();
    end;

    var
        CurrentStep : Integer;
        ActionBackAllowed : Boolean;
        ActionNextAllowed : Boolean;
        ActionFinishAllowed : Boolean;
        MediaRepositoryStandard : Record "Media Repository";
        MediaRepositoryDone : Record "Media Repository";
        MediaResourcesStandard : Record "Media Resources";
        MediaResourcesDone : Record "Media Resources";
        TopBannerVisible : Boolean;
        

    local procedure SetControls()
    begin
        ActionBackAllowed := CurrentStep > 1;
        ActionNextAllowed := CurrentStep < 3;
        ActionFinishAllowed := CurrentStep = 3;
    end;

    local procedure TakeStep(Step : Integer)
    begin
        CurrentStep += Step;
        SetControls;
    end;

    local procedure LoadTopBanners()
    begin
        if MediaRepositoryStandard.GET('AssistedSetup-NoText-400px.png',Format(CurrentClientType)) and
            MediaRepositoryDone.GET('AssistedSetupDone-NoText-400px.png',Format(CurrentClientType))
        then
        if MediaResourcesStandard.GET(MediaRepositoryStandard."Media Resources Ref") and
            MediaResourcesDone.GET(MediaRepositoryDone."Media Resources Ref")
        then
            TopBannerVisible := MediaResourcesDone."Media Reference".HASVALUE;
    end;
}