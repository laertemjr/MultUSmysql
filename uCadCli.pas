unit uCadCli;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids,

  FireDAC.Phys,

  FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.Win.ADODB;

type
  TGridFriend = class(TDBGrid);

  TfrmCadCli = class(TForm)
    DBGrid1: TDBGrid;
    dbLedt_nome: TDBLabeledEdit;
    dbLedt_email: TDBLabeledEdit;
    dbLedt_celular: TDBLabeledEdit;
    DBNavigator1: TDBNavigator;
    StatusBar1: TStatusBar;
    dbLedt_ID: TDBLabeledEdit;
    dsClientes: TDataSource;
    TbClientes: TFDQuery;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Tb_ClientesBeforePost(DataSet: TDataSet);
    procedure dbLedt_nomeExit(Sender: TObject);
    procedure dbLedt_nomeKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure dbLedt_emailKeyPress(Sender: TObject; var Key: Char);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure TbClientesAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCli: TfrmCadCli;
  bOrdemASC : Boolean;

implementation

uses
   uDM, uGlobal;

{$R *.dfm}
// Copyright © 2025 Mancuso Software (laertemjr@outlook.com.br)

procedure TfrmCadCli.FormActivate(Sender: TObject);
begin
   TbClientes.Close;
   TbClientes.SQL.Clear;
   TbClientes.SQL.Add('SELECT * FROM TB_CLIENTES');
   TbClientes.Open;
   TbClientes.Last;
   TbClientes.First;
   TbClientes.FieldByName('CLIENTE_CELULAR').EditMask := '!\(99\) 00000-0000;0;_';
   TbClientes.FieldByName('CLIENTE_ID').Alignment := taCenter;

   bOrdemASC := True;
   StatusBar1.Panels[0].Text := '   Versão ' + sVerInfo + ' (2025) Delphi 12.1';
end;

procedure TfrmCadCli.DBGrid1TitleClick(Column: TColumn);
var posicao:Integer;
begin
   posicao := TGridFriend(DBGrid1).LeftCol;
   bOrdemASC := not bOrdemASC;
   try
   if bOrdemASC then
      TFDTable(DBGrid1.DataSource.DataSet).IndexFieldNames := Column.FieldName + ':A'
   else
      TFDTable(DBGrid1.DataSource.DataSet).IndexFieldNames := Column.FieldName + ':D';
   except
   end;
   TGridFriend(DBGrid1).LeftCol := posicao;
   DBGrid1.SetFocus;
   TbClientes.First;
end;

procedure TfrmCadCli.dbLedt_nomeExit(Sender: TObject);
var s:string;
begin
   if dsClientes.State in [dsEdit, dsInsert] then
   begin
      s := Trim(dbLedt_nome.Text);
      dbLedt_nome.Field.AsString := s;
   end;
end;

procedure TfrmCadCli.dbLedt_nomeKeyPress(Sender: TObject; var Key: Char);
begin
   if (not(Key in ['A' .. 'Z', 'a' .. 'z', 'ê', 'ô', 'ã', 'õ', 'á',
                   'é', 'í', 'ó', 'ú', 'ç', 'ü', 'Ê', 'Ô', 'Ã', 'Õ', 'Á', 'É', 'Í', 'Ó', 'Ú', 'Ç', 'Ü', #8, #32, #39])) then
      Key := #0; // #8 backspace, #32 space, #39 aspas simples
end;

procedure TfrmCadCli.DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
begin
   case Button of
      nbFirst: ;
      nbPrior: ;
      nbNext: ;
      nbLast: ;
      nbInsert: ;
      nbDelete: ;
      nbEdit: ;
      nbPost: ;
      nbCancel: ;
      nbRefresh: ;
      nbApplyUpdates: ;
      nbCancelUpdates: ;
   end;
end;

procedure TfrmCadCli.dbLedt_emailKeyPress(Sender: TObject; var Key: Char);
begin
   if (not(Key in ['A' .. 'Z', 'a' .. 'z', '0' .. '9' , '_', '.', '-', '@', #8])) then
      Key := #0; // #8 backspace
end;

procedure TfrmCadCli.TbClientesAfterInsert(DataSet: TDataSet);
begin
   dbLedt_nome.SetFocus;
end;

procedure TfrmCadCli.Tb_ClientesBeforePost(DataSet: TDataSet);
begin
   if Trim(TbClientes.FieldByName('CLIENTE_NOMECOMPLETO').AsString) = EmptyStr then
   begin
      ShowMessage('Nome não pode estar sem preenchimento.');
      dbLedt_nome.SetFocus;
      Abort;
   end;
end;

procedure TfrmCadCli.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   TbClientes.Close;
end;

end.
