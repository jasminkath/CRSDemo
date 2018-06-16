pageextension 50120 CustomerListExt extends "Customer List"
{
    layout
    {
        addafter(Name)
        {
            field(ExampleField;"Name 2")
            {
                Caption='Example Field';
                ApplicationArea = ExampleAppArea;
                ToolTip = 'This is just added as an example';
                Importance = Promoted;
            }
        }
    }

    trigger OnOpenPage();
    var
        EnableExampleExt: Codeunit EnableExampleExtension;
    begin
        if EnableExampleExt.IsExampleAppAreaEnabled() then
            Message('Example App Area is working!');
    end;
}

codeunit 50124 EnableExampleExtension
{
    [EventSubscriber(ObjectType::Codeunit, codeunit::"Application Area Mgmt.", 'OnGetEssentialExperienceAppAreas', '', false, false)]
    procedure RegisterExampleExtension_OnGetSuiteExperienceAppAreas(var TempApplicationAreaSetup: Record "Application Area Setup");
    begin
        TempApplicationAreaSetup."Example App Area" := true;

        //Modify other app areas here
        // .. maybe you want to disable fixed assets, because your extension requires it.
    end;

    //validate app areas within the experience tier
    // no guarantee in orderexecution of events.  So what happens here, might not be the final state.local
    // another extension might switch off your extension.
    [EventSubscriber(ObjectType::Codeunit, codeunit::"Application Area Mgmt.", 'OnValidateApplicationAreas', '', false, false)]
    procedure VerifyAppAreas_OnValidateAppAreas(ExperienceTierSetup: Record "Experience Tier Setup";TempApplicationAreaSetup: Record "Application Area Setup");
    begin
        if ExperienceTierSetup.Essential then
            if not TempApplicationAreaSetup."Example App Area" then
                error('Example App Area should be part of "Essential" in order for the Example Extension to work.')
    end;

    procedure IsExampleAppAreaEnabled() : Boolean;
    var
        AppAreaSetup: record "Application Area Setup";
    begin
        AppAreaSetup.FindFirst();
        exit(AppAreaSetup."Example App Area");
    end;

    procedure EnableExampleAppArea();
    var
        AppAreaSetup: record "Application Area Setup";
    begin
        AppAreaSetup.FindFirst();
        AppAreaSetup."Example App Area" := true;
        AppAreaSetup.Modify();
    end;
}

tableextension 50120 AppSetupExt extends "Application Area Setup"
{
    fields
    {
        //Spaces in names are omitted!
        field(50100;"Example App Area";Boolean)
        {

        }
    }
}

codeunit 50125 InstallExampleExtension
{
    Subtype = Install;

    trigger OnInstallAppPerCompany();
    var
        EnableExampleExt: Codeunit EnableExampleExtension;
    begin
        if (EnableExampleExt.IsExampleAppAreaEnabled()) then exit;

        EnableExampleExt.EnableExampleAppArea();

        //
    end;
}