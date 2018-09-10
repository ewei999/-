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
    Application.MessageBox('请选择用户名', '提示', MB_OK);
    exit;
  end;

  if Trim(cxTextEdit1.Text)='' then
  begin
    Application.MessageBox('请输入密码', '提示', MB_OK);
    exit;
  end;

  DataModule1.openSql('SELECT 姓名,密码,员工编号,岗位 FROM [员工表] '+
   ' where 姓名 ='+QuotedStr(cxLookupComboBox1.Text)+' and 是否作废=0 and 操作软件=1 and 部门=''中央库存'' ');
  if DataModule1.ADOQuery_L.RecordCount > 0  then
  begin
    if DataModule1.ADOQuery_L.FieldByName('密码').asstring <> Trim(cxTextEdit1.Text) then
    begin
      Application.MessageBox('密码不正确！', '错误', MB_OK);
      exit;
    end
    else
    begin
      G_user.UserGW := DataModule1.ADOQuery_L.FieldByName('岗位').asstring;

      //升级软件
      GenxinRuanJian;

      try
        L_IniFile := TIniFile.Create(ExtractFilePath(application.ExeName)+'config.ini');
        L_IniFile.WriteString('user','user_name',cxLookupComboBox1.Text);
      finally
         L_inifile.Free;
      end;

      G_user.userID := DataModule1.ADOQuery_L.FieldByName('员工编号').AsString;
      G_user.UserName := DataModule1.ADOQuery_L.FieldByName('姓名').AsString;
      G_user.UserPassword := DataModule1.ADOQuery_L.FieldByName('密码').AsString;

      Form_main := TForm_main.Create(nil);
      try
        Form_main.dxRibbonStatusBar1.Panels[0].text := '登录人:' +g_user.UserName;
        Form_main.dxRibbonStatusBar1.Panels[1].text  := '岗位:'+ g_user.UserGW;

        Form_main.ShowModal;
      finally
        FreeAndNil(form_main);
      end;
    end;
  end
  else
  begin
    Application.MessageBox('用户名不存在！', '错误', MB_OK);
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
      //获取版本服务器上的文件路径：
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
        if internetGetConnectedState(@i,0)  then   //是否联网状态
        begin
          try    //获取服务器上的版本文件
            if not DownLoadFile(sChkURL,  'update.txt') then    //服务器上的版本文件错误或不存在
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

            if (strtoint(update_version) > strtoint(version_config)) and (gwbool) then //对比版本号确定是否需要升级
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
  nStyle := GetWindowLong(Self.Handle, GWL_STYLE);   //该函数获得有关指定窗口的信息
  nStyle := nStyle or WS_SYSMENU or WS_MINIMIZEBOX  or WS_MAXIMIZEBOX;
  SetWindowLong(Self.Handle, GWL_STYLE, nStyle);      //该函数改变指定窗口的属性．
  Form_Register.isrightuser;  //验证注册码

  try
    DataModule1.ADOCon_ALi.Connected :=True;
  except
    ShowMessage('连接数据库失败');
    Exit;
  end;

  ADOQuery_list.Close;
  ADOQuery_list.SQL.Text:='select 姓名 from 员工表 '+
    ' where 是否作废=0 and 操作软件=1 and 部门=''中央库存'' ';
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
