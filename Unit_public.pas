unit Unit_public;

interface
  uses inifiles,system.Classes,Unit_DM,Data.Win.ADODB,cxGrid,Vcl.Dialogs,cxGridExportLink;

  function DownLoadFile(sURL, sFName: string): boolean;
  function XiTong_date() :TDateTime;//ϵͳʱ��
  procedure DaochuExcel(agrid : TcxGrid);


type
   Tuser = record
     userID :string;         //��Ա���
     UserName : string;      //�û���
     UserPassword:string;    //����
     UserGW : string;         //��λ
   end;

var
  G_user : Tuser;
  G_IniSetingFile: TIniFile; //�����ļ�
  G_LocalKey, G_RegisterCode: string;


implementation

procedure DaochuExcel(agrid: TcxGrid);
var
  savedialog1 : TSaveDialog;
begin
  try
    savedialog1 :=TSaveDialog.Create(nil);
    SaveDialog1.DefaultExt := 'xls';
    SaveDialog1.Filter :='(Excel����ʽxls)|*.xls';
    SaveDialog1.Title := '��ѡ��Ҫ������ļ���';
    if SaveDialog1.Execute then
      ExportGridToExcel(SaveDialog1.FileName,agrid,True,True);
  finally
    savedialog1.Free;
  end;
end;

function XiTong_date() :TDateTime;
var
  L_query_date : TADOQuery;
begin
   L_query_date := TADOQuery.Create(nil);
   try
     L_query_date.Connection := DataModule1.ADOCon_ALi;
     L_query_date.SQL.Text := 'select getdate() as ϵͳʱ��';
     L_query_date.Open;
     result := L_query_date.FieldByName('ϵͳʱ��').AsDateTime;
   finally
     L_query_date.Free;
   end;
end;

function DownLoadFile(sURL, sFName: string): boolean;
var //�����ļ�
  tStream: TMemoryStream;
begin
  tStream := TMemoryStream.Create;
  try //��ֹ����Ԥ�ϴ�����
    try
      DataModule1.IdHTTP_main.Get(sURL, tStream); //���浽�ڴ���
      tStream.SaveToFile(sFName); //����Ϊ�ļ�

      Result := True;
    finally //��ʹ��������Ԥ�ϵĴ���Ҳ�����ͷ���Դ
      tStream.Free;
    end;
  except //��ķ�������ִ�еĴ���
    Result := False;
    tStream.Free;
  end;
end;

end.