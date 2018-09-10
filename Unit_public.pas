unit Unit_public;

interface
  uses inifiles,system.Classes,Unit_DM,Data.Win.ADODB,cxGrid,Vcl.Dialogs,cxGridExportLink;

  function DownLoadFile(sURL, sFName: string): boolean;
  function XiTong_date() :TDateTime;//系统时间
  procedure DaochuExcel(agrid : TcxGrid);


type
   Tuser = record
     userID :string;         //人员编号
     UserName : string;      //用户名
     UserPassword:string;    //密码
     UserGW : string;         //岗位
   end;

var
  G_user : Tuser;
  G_IniSetingFile: TIniFile; //配置文件
  G_LocalKey, G_RegisterCode: string;


implementation

procedure DaochuExcel(agrid: TcxGrid);
var
  savedialog1 : TSaveDialog;
begin
  try
    savedialog1 :=TSaveDialog.Create(nil);
    SaveDialog1.DefaultExt := 'xls';
    SaveDialog1.Filter :='(Excel表格式xls)|*.xls';
    SaveDialog1.Title := '请选择要输出的文件夹';
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
     L_query_date.SQL.Text := 'select getdate() as 系统时间';
     L_query_date.Open;
     result := L_query_date.FieldByName('系统时间').AsDateTime;
   finally
     L_query_date.Free;
   end;
end;

function DownLoadFile(sURL, sFName: string): boolean;
var //下载文件
  tStream: TMemoryStream;
begin
  tStream := TMemoryStream.Create;
  try //防止不可预料错误发生
    try
      DataModule1.IdHTTP_main.Get(sURL, tStream); //保存到内存流
      tStream.SaveToFile(sFName); //保存为文件

      Result := True;
    finally //即使发生不可预料的错误也可以释放资源
      tStream.Free;
    end;
  except //真的发生错误执行的代码
    Result := False;
    tStream.Free;
  end;
end;

end.
