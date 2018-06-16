codeunit 50120 CompanyInfoAssistedSetup
{

  [EventSubscriber(ObjectType::Table, 1808, 'OnRegisterAssistedSetup', '', false, false)]
  local procedure AggregatedAssistedSetup_OnRegisterAssistedSetup(var TempAggregatedAssistedSetup : Record 1808 TEMPORARY);
  var
    CompanyInformation : Record 79;
  begin
    TempAggregatedAssistedSetup.AddExtensionAssistedSetup(PAGE::CompanyInfoWizard,
                                                          'Setup Company Information',
                                                          TRUE,
                                                          CompanyInformation.RECORDID(),
                                                          GetCompanyInformationSetupStatus(TempAggregatedAssistedSetup),
                                                          '');
  end;

  [EventSubscriber(ObjectType::Table, 1808, 'OnUpdateAssistedSetupStatus', '', false, false)]
  local procedure AggregatedAssistedSetup_OnUpdateAssistedSetupStatus(var TempAggregatedAssistedSetup : Record 1808 TEMPORARY);
  begin
    TempAggregatedAssistedSetup.SetStatus(TempAggregatedAssistedSetup,PAGE::CompanyInfoWizard,GetCompanyInformationSetupStatus(TempAggregatedAssistedSetup));
  end;

  local procedure GetCompanyInformationSetupStatus(AggregatedAssistedSetup : Record "Aggregated Assisted Setup") : Integer;
  var
    CompanyInformation : Record "Company Information";
  begin
    WITH AggregatedAssistedSetup DO BEGIN
      IF CompanyInformation.GET() THEN
        IF (CompanyInformation.Name = '') OR (CompanyInformation."E-Mail" = '') THEN
          Status := Status::"Not Completed"
        ELSE
          Status := Status::Completed
      ELSE
        Status := Status::"Not Completed";
      EXIT(Status);
    END;
  end;
}

