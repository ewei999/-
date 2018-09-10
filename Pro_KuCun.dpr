program Pro_KuCun;

uses
  Vcl.Forms,
  Unit_login in 'Unit_login.pas' {Form_login},
  Unit_DM in 'Unit_DM.pas' {DataModule1: TDataModule},
  frmRegister in 'frmRegister.pas' {Form_Register},
  Encode in 'Encode.pas',
  Unit_public in 'Unit_public.pas',
  Unit_main in 'Unit_main.pas' {Form_main},
  Unit_caigou_shenqing_new in 'Unit_caigou_shenqing_new.pas' {Form_caigou_shenqing_new};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TForm_login, Form_login);
  Application.Run;
end.
