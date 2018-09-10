unit Unit_DM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB,System.IniFiles,Vcl.Forms,
  frxClass, frxDBSet, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, Vcl.ImgList, Vcl.Controls, cxGraphics;

type
  TDataModule1 = class(TDataModule)
    ADOCon_ALi: TADOConnection;
    ADOQuery_L: TADOQuery;
    ADOQuery_L2: TADOQuery;
    cxImageList_main: TcxImageList;
    IdHTTP_main: TIdHTTP;
    frxReport_dayin: TfrxReport;
    frxDBDataset_dayin: TfrxDBDataset;
    ADOQuery_dayin: TADOQuery;
    cxImageList32: TcxImageList;
    procedure DataModuleCreate(Sender: TObject);
  private
    procedure InitDatabase;
    function UnEncryptString(Source, Key: string): string;

  public
    procedure openSql(ASql:string);
    procedure openSql2(ASql:string);
    function PassWord_Code(astr,leixing:string):string;
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function TDataModule1.PassWord_Code(astr,leixing:string):string;
var
  PassWord:array[0..65] of string;
  Code:array[0..65] of string;
  i : integer;
begin
  PassWord[0]:='awl';
  PassWord[1]:='wer';
  PassWord[2]:='efz';
  PassWord[3]:='ryk';
  PassWord[4]:='jko';
  PassWord[5]:='rip';
  PassWord[6]:='wyl';
  PassWord[7]:='lzk';
  PassWord[8]:='lyb';
  PassWord[9]:='ewe';
  PassWord[10]:='sev';
  PassWord[11]:='1r5';
  PassWord[12]:='0wy';
  PassWord[13]:='ah9';
  PassWord[14]:='bj1';
  PassWord[15]:='7xi';
  PassWord[16]:='lp8';
  PassWord[17]:='wl0';
  PassWord[18]:='pty';
  PassWord[19]:='25q';
  PassWord[20]:='9vh';
  PassWord[21]:='riy';
  PassWord[22]:='www';
  PassWord[23]:='aba';
  PassWord[24]:='bab';
  PassWord[25]:='iio';
  PassWord[26]:='ccy';
  PassWord[27]:='21d';
  PassWord[28]:='q7d';
  PassWord[29]:='0qo';
  PassWord[30]:='fyh';
  PassWord[31]:='asd';
  PassWord[32]:='iyt';
  PassWord[33]:='cnx';
  PassWord[34]:='zlh';
  PassWord[35]:='2u7';
  PassWord[36]:='19s';
  PassWord[37]:='1ss';
  PassWord[38]:='u20';
  PassWord[39]:='579';
  PassWord[40]:='5e1';
  PassWord[41]:='4wt';
  PassWord[42]:='927';
  PassWord[43]:='mx5';
  PassWord[44]:='qs2';
  PassWord[45]:='qs0';
  PassWord[46]:='qs5';
  PassWord[47]:='df5';
  PassWord[48]:='45g';
  PassWord[49]:='f50';
  PassWord[50]:='f59';
  PassWord[51]:='q51';
  PassWord[52]:='e11';
  PassWord[53]:='4w8';
  PassWord[54]:='es2';
  PassWord[55]:='c11';
  PassWord[56]:='w50';
  PassWord[57]:='saw';
  PassWord[58]:='yq0';
  PassWord[59]:='44a';
  PassWord[60]:='04w';
  PassWord[61]:='66v';
  PassWord[62]:='99e';
  PassWord[63]:='cna';
  PassWord[64]:='d14';
  PassWord[65]:='d15';

  Code[0]:='0';
  Code[1]:='1';
  Code[2]:='2';
  Code[3]:='3';
  Code[4]:='4';
  Code[5]:='5';
  Code[6]:='6';
  Code[7]:='7';
  Code[8]:='8';
  Code[9]:='9';
  Code[10]:='a';
  Code[11]:='b';
  Code[12]:='c';
  Code[13]:='d';
  Code[14]:='e';
  Code[15]:='f';
  Code[16]:='g';
  Code[17]:='h';
  Code[18]:='i';
  Code[19]:='j';
  Code[20]:='k';
  Code[21]:='l';
  Code[22]:='m';
  Code[23]:='n';
  Code[24]:='o';
  Code[25]:='p';
  Code[26]:='q';
  Code[27]:='r';
  Code[28]:='s';
  Code[29]:='t';
  Code[30]:='u';
  Code[31]:='v';
  Code[32]:='w';
  Code[33]:='x';
  Code[34]:='y';
  Code[35]:='z';
  Code[36]:='.';
  Code[37]:='/';
  Code[38]:='\';
  Code[39]:=',';
  Code[40]:=' ';
  Code[41]:='~';
  Code[42]:='`';
  Code[43]:='!';
  Code[44]:='@';
  Code[45]:='#';
  Code[46]:='$';
  Code[47]:='%';
  Code[48]:='^';
  Code[49]:='&';
  Code[50]:='*';
  Code[51]:='(';
  Code[52]:=')';
  Code[53]:='_';
  Code[54]:='-';
  Code[55]:='=';
  Code[56]:='+';
  Code[57]:='|';
  Code[58]:='?';
  Code[59]:='{';
  Code[60]:='}';
  Code[61]:='[';
  Code[62]:=']';
  Code[63]:='>';
  Code[64]:='<';
  Code[65]:=':';

  if leixing='' then
  begin
    for I := 0 to 65 do
    begin
      if (PassWord[i]=astr) then
      begin
        Break;
      end;
    end;
    Result :=Code[i];
  end
  else
  begin
    for I := 0 to 65 do
    begin
      if (Code[i]=astr) then
      begin
        Break;
      end;
    end;
    Result :=PassWord[i];
  end;
end;

procedure TDataModule1.openSql(ASql: string);
begin
  ADOQuery_L.Active := False;
  ADOQuery_L.SQL.Text := ASql;
  ADOQuery_L.Active := true;
end;

procedure TDataModule1.openSql2(ASql: string);
begin
  ADOQuery_L2.Active := False;
  ADOQuery_L2.SQL.Text := ASql;
  ADOQuery_L2.Active := true;
end;


function TDataModule1.UnEncryptString(Source, Key: string): string;
var
  KeyLen: integer;
  KeyPos: integer;
  Offset: integer;
  Dest: string;
  SrcPos: integer;
  SrcAsc: integer;
  TmpSrcAsc: integer;
begin
  KeyLen := Length(Key);
  if KeyLen = 0 then
    Key := 'lyb';
  KeyPos := 0;
  Offset := strtoint('$' + copy(Source, 1, 2));
  SrcPos := 3;
  repeat
    SrcAsc := strtoint('$' + copy(Source, SrcPos, 2));
    if KeyPos < KeyLen then
      KeyPos := KeyPos + 1
    else
      KeyPos := 1;
    TmpSrcAsc := SrcAsc xor Ord(Key[KeyPos]);
    if TmpSrcAsc <= Offset then
      TmpSrcAsc := 255 + TmpSrcAsc - Offset
    else
      TmpSrcAsc := TmpSrcAsc - Offset;
    Dest := Dest + chr(TmpSrcAsc);
    Offset := SrcAsc;
    SrcPos := SrcPos + 2;
  until SrcPos >= Length(Source);
  result := Dest;
end;


procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
  InitDatabase;
end;

procedure TDataModule1.InitDatabase;
var
  L_IniFile:TIniFile;
  str_temp :string;
  host,sjk,username,password : string;
begin
  ADOCon_ALi.Connected := False;
  L_IniFile := TIniFile.Create(ExtractFilePath(application.ExeName)+'config.ini');
  try
    str_temp :=L_IniFile.ReadString('connection', 'host', '');
    host := str_temp;
    str_temp := L_IniFile.ReadString('connection','sjk','');
    sjk := str_temp;
    str_temp :=L_IniFile.ReadString('connection', 'username', '');

    username := str_temp;
    str_temp :=L_IniFile.ReadString('connection', 'password', '');
    str_temp := UnEncryptString(str_temp,'');
    password := str_temp;

   ADOCon_ALi.ConnectionString:='Provider=SQLOLEDB.1;'+
                  'Persist Security Info=True;  '+
                  'Data Source='+QuotedStr(host)+
                  ';Initial Catalog='+QuotedStr(sjk)+
                  ';User ID='+QuotedStr(username)+
                  ';Password='+QuotedStr(password);
  finally
    L_IniFile.free;
  end;
end;


end.
