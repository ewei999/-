unit Unit_caigou_shenqing_new;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, Data.DB, cxDBData, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  cxMemo, cxMaskEdit, cxDropDownEdit, cxCalendar, cxTextEdit, cxLabel,
  Data.Win.ADODB, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxGroupBox,
  cxDBLookupComboBox, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, dxGDIPlusClasses, Vcl.ExtCtrls,
  cxNavigator, Vcl.ComCtrls, dxCore, cxDateUtils, cxCurrencyEdit, dxSkinBlack,
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
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxBlobEdit;

type
  TForm_caigou_shenqing_new = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    Image2: TImage;
    cxLabel10: TcxLabel;
    cxButton4: TcxButton;
    ActionManager1: TActionManager;
    Action_close: TAction;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    cxGrid1DBTableView1Column4: TcxGridDBColumn;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxDateEdit1: TcxDateEdit;
    cxLabel3: TcxLabel;
    cxMemo1: TcxMemo;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxGrid1DBTableView1Column5: TcxGridDBColumn;
    cxGrid1DBTableView1Column6: TcxGridDBColumn;
    cxGrid1DBTableView1Column7: TcxGridDBColumn;
    cxLabel_bianhao: TcxLabel;
    cxButton6: TcxButton;
    act_excel: TAction;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    procedure FormShow(Sender: TObject);
    procedure Action_closeExecute(Sender: TObject);
    procedure act_excelExecute(Sender: TObject);

  private

  public
    baocun:boolean;
    zt : string;
  end;

var
  Form_caigou_shenqing_new: TForm_caigou_shenqing_new;

implementation

{$R *.dfm}

uses unit_dm, Unit_public;


procedure TForm_caigou_shenqing_new.Action_closeExecute(Sender: TObject);
begin
  close;
end;

procedure TForm_caigou_shenqing_new.act_excelExecute(Sender: TObject);
begin
  DaochuExcel(cxGrid1);
end;

procedure TForm_caigou_shenqing_new.FormShow(Sender: TObject);
begin
  if cxLabel_bianhao.Caption<>'' then
  begin
    DataModule1.openSql('select *,'+
    ' 分院=(select top 1 name from 分院表 where abbr=a.分店代码)'+
    ' from (select * from 提货申请主表 where 申请编号='+QuotedStr(cxLabel_bianhao.Caption)+')a');

    cxDateEdit1.Date := DataModule1.ADOQuery_L.FieldByName('申请日期').asdatetime;
    cxLabel5.Caption := DataModule1.ADOQuery_L.FieldByName('申请人').asstring;
    cxMemo1.Lines.text := DataModule1.ADOQuery_L.FieldByName('申请说明').asstring;
    cxLabel7.Caption:= DataModule1.ADOQuery_L.FieldByName('分院').asstring;

    ADOQuery1.Active := false;
    ADOQuery1.SQL.text := 'select  * from 提货申请明细表 where 申请编号 = '+ QuotedStr(cxLabel_bianhao.Caption);
    ADOQuery1.Active := true;
  end;
end;


end.
