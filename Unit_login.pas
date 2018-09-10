unit Unit_login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  Vcl.Menus, Data.DB, Data.Win.ADODB, Vcl.StdCtrls, cxButtons, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxLabel,frmRegister,System.IniFiles,Winapi.WinInet,Unit_main,Winapi.ShellAPI;

type
  TForm_login = class(TForm)
    cxLabel1: TcxLabel;
    cxLookupComboBox1: TcxLookupComboBox;
    cxTextEdit1: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    ADOQuery_list: TADOQuery;
    ds_list: TDataSource;
    procedure cxButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxLookupComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure cxLookupComboBox1PropertiesCloseUp(Sender: TObject);
    procedure cxTextEdit1KeyPress(Sender: TObject; var Key: Char);
  private
    procedure GenxinRuanJian;
  public
    { Public declarations }
  end;

var
  Form_login: TForm_login;

implementation
  uses Unit_DM,Unit_public;
{$R *.dfm}

procedure TForm_login.cxButton1Click(Sender: TObject);
var
  L_IniFile:TIniFile;
begin
  if Trim(cxLookupComboBox1.Text)='' then
  begin
    Application.MessageBox('��ѡ���û���', '��ʾ', MB_OK);
    exit;
  end;

  if Trim(cxTextEdit1.Text)='' then
  begin
    Application.MessageBox('����������', '��ʾ', MB_OK);
    exit;
  end;

  DataModule1.openSql('SELECT ����,����,Ա�����,��λ FROM [Ա����] '+
   ' where ���� ='+QuotedStr(cxLookupComboBox1.Text)+' and �Ƿ�����=0 and ��������=1 and ����=''������'' ');
  if DataModule1.ADOQuery_L.RecordCount > 0  then
  begin
    if DataModule1.ADOQuery_L.FieldByName('����').asstring <> Trim(cxTextEdit1.Text) then
    begin
      Application.MessageBox('���벻��ȷ��', '����', MB_OK);
      exit;
    end
    else
    begin
      G_user.UserGW := DataModule1.ADOQuery_L.FieldByName('��λ').asstring;

      //��������
      GenxinRuanJian;

      try
        L_IniFile := TIniFile.Create(ExtractFilePath(application.ExeName)+'config.ini');
        L_IniFile.WriteString('user','user_name',cxLookupComboBox1.Text);
      finally
         L_inifile.Free;
      end;

      G_user.userID := DataModule1.ADOQuery_L.FieldByName('Ա�����').AsString;
      G_user.UserName := DataModule1.ADOQuery_L.FieldByName('����').AsString;
      G_user.UserPassword := DataModule1.ADOQuery_L.FieldByName('����').AsString;

      Form_main := TForm_main.Create(nil);
      try
        Form_main.dxRibbonStatusBar1.Panels[0].text := '��¼��:' +g_user.UserName;
        Form_main.dxRibbonStatusBar1.Panels[1].text  := '��λ:'+ g_user.UserGW;

        Form_main.ShowModal;
      finally
        FreeAndNil(form_main);
      end;
    end;
  end
  else
  begin
    Application.MessageBox('�û��������ڣ�', '����', MB_OK);
    exit;
  end;
end;


procedure TForm_login.GenxinRuanJian;
var
  L_IniFile,NewFile:TIniFile;
  version_config,sChkURL,update_version,str_temp:string;
  i:Integer;
  gwbool:boolean;
begin
  L_IniFile := TIniFile.Create(ExtractFilePath(application.ExeName)+'\Config.ini');
  try
    version_config :=  L_inifile.ReadString('version', 'version', '');
    if version_config<>'' then
    begin
      sChkURL :=  L_inifile.ReadString('version', 'INF', '');
      //��ȡ�汾�������ϵ��ļ�·����
      str_temp:='';
      for I := 0 to Length(sChkURL) - 1 do
      begin
        if (i mod 3=0)or(i=0) then
        begin
          str_temp:=str_temp+DataModule1.PassWord_Code(Copy(sChkURL,i+1,3),'');
        end;
      end;
      sChkURL:=str_temp;
      if sChkURL<>'' then
      begin
        i:=INTERNET_CONNECTION_MODEM+INTERNET_CONNECTION_LAN+INTERNET_CONNECTION_PROXY;
        if internetGetConnectedState(@i,0)  then   //�Ƿ�����״̬
        begin
          try    //��ȡ�������ϵİ汾�ļ�
            if not DownLoadFile(sChkURL,  'update.txt') then    //�������ϵİ汾�ļ�����򲻴���
            begin
              Exit;
            end;
            NewFile := TIniFile.Create(ExtractFilePath(application.ExeName)+ 'update.txt');
            try
              update_version :=  NewFile.ReadString('version', 'version', '');
              str_temp :=  NewFile.ReadString('version', 'gw', '');
            finally
              NewFile.Free;
            end;

            gwbool:=false;
            if str_temp='' then
              gwbool:=true;
            if AnsiPos(G_user.UserGW,str_temp)>0 then
              gwbool:=true;

            if (strtoint(update_version) > strtoint(version_config)) and (gwbool) then //�ԱȰ汾��ȷ���Ƿ���Ҫ����
            begin
              if FileExists(ExtractFilePath(Application.ExeName) +'Pro_update.exe') then
              begin
                ShellExecute(Handle,'OPEN',PChar(ExtractFilePath(application.ExeName)+'\Pro_update.exe'),
                      PChar(update_version), nil,SW_SHOWNORMAL);

                ExitProcess(0);
              end;
            end;
          except

          end;
        end;
      end;
    end;
  finally
    L_IniFile.free;
  end;
end;

procedure TForm_login.cxButton2Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm_login.cxLookupComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    cxTextEdit1.SetFocus;
end;

procedure TForm_login.cxLookupComboBox1PropertiesCloseUp(Sender: TObject);
begin
  cxTextEdit1.SetFocus;
end;

procedure TForm_login.cxTextEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    cxButton1.Click;
end;

procedure TForm_login.FormShow(Sender: TObject);
var
  nStyle: Integer;
  L_inifile :TIniFile;
  L_string : string;
begin
  nStyle := GetWindowLong(Self.Handle, GWL_STYLE);   //�ú�������й�ָ�����ڵ���Ϣ
  nStyle := nStyle or WS_SYSMENU or WS_MINIMIZEBOX  or WS_MAXIMIZEBOX;
  SetWindowLong(Self.Handle, GWL_STYLE, nStyle);      //�ú����ı�ָ�����ڵ����ԣ�
  Form_Register.isrightuser;  //��֤ע����

  try
    DataModule1.ADOCon_ALi.Connected :=True;
  except
    ShowMessage('�������ݿ�ʧ��');
    Exit;
  end;

  ADOQuery_list.Close;
  ADOQuery_list.SQL.Text:='select ���� from Ա���� '+
    ' where �Ƿ�����=0 and ��������=1 and ����=''������'' ';
  ADOQuery_list.Open;
  L_inifile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'config.ini');
  try
    L_string := L_inifile.ReadString('user','user_name','');
    cxLookupComboBox1.text := L_string;
    if cxLookupComboBox1.Text<>'' then
      cxTextEdit1.SetFocus;
  finally
    L_inifile.free;
  end;
end;

end.