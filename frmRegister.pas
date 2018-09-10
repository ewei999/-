unit frmRegister;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTextEdit, cxHyperLinkEdit, StdCtrls, cxControls, cxContainer,
  cxEdit, cxImage, ExtCtrls,inifiles;

type
  TForm_Register = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Bevel1: TBevel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    function isrightuser:Boolean;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Register: TForm_Register;

implementation

uses Encode, Unit_public;

{$R *.dfm}

procedure TForm_Register.Button1Click(Sender: TObject);
var
  s:string;
  i:Integer;
  bstring:string;
  astring:string;
begin
   s:=Trim( GetVolumeID ) ;

   for i:=1 to Length(s) do
   begin
     bstring:=bstring + IntToStr( ord(s[i]));
   end;
   astring:='6'+bstring;
  if trim(Edit2.text)=CreateRegCode(trim(astring))then
  begin
    G_IniSetingFile.WriteString('Register','sn',CreateRegCode(trim(astring)));

    ModalResult:=mrok;
    ShowMessage('注册成功！');
  end
  else
    ShowMessage('您输入的注册码无效');
end;

procedure TForm_Register.Button2Click(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TForm_Register.FormShow(Sender: TObject);
begin
//  isrightuser;

end;



function TForm_Register.isrightuser: Boolean;
var
  L_LocalKey: string;
  L_RegisterCode: string;
  s:string;
  i:Integer;
  bstring:string;
  astring:string;
begin
  s:=Trim(GetVolumeID ) ;
   L_RegisterCode:= CharCodeToNumCode(s,6);

   for i:=1 to Length(s) do
   begin
     bstring:=bstring + IntToStr( ord(s[i]));
   end;
   astring:='6'+bstring;
    //if G_SoftwareInfo.Edition = ceEvaluation then Exit;

  Result := false;
  G_IniSetingFile := TIniFile.create(ExtractFilePath(Application.ExeName) + 'config.ini');
  G_LocalKey := Trim(G_IniSetingFile.ReadString('Register', 'sn', ''));
  G_RegisterCode := CharCodeToNumCode (Trim(GetVolumeID), 6);

  if G_LocalKey <> CreateRegCode(astring) then
  begin
    Form_Register := TForm_Register.Create(nil);
    Form_Register.Edit1.Text := L_RegisterCode;
    Form_Register.ShowModal;

    if Form_Register.ModalResult <> mrOk then
      Application.Terminate;
  end;
end;


end.
