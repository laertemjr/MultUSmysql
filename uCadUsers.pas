unit uCadUsers;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls,


  FireDAC.Phys,
  Data.DB,
  Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Data.Win.ADODB;

type
  TfrmCadUsers = class(TForm)
    DBGrid1: TDBGrid;
    dbLedt_ID: TDBLabeledEdit;
    dbLedt_user: TDBLabeledEdit;
    dbLedt_senha: TDBLabeledEdit;
    DBNavigator1: TDBNavigator;
    StatusBar1: TStatusBar;
    dsUsers: TDataSource;
    TbUsers: TFDQuery;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FDTable1BeforePost(DataSet: TDataSet);
    procedure dbLedt_userExit(Sender: TObject);
    procedure dbLedt_userKeyPress(Sender: TObject; var Key: Char);
    procedure TbUsersAfterInsert(DataSet: TDataSet);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadUsers: TfrmCadUsers;

implementation

uses
   uDM, uGlobal;

{$R *.dfm}
// Copyright © 2025 Mancuso Software (laertemjr@outlook.com.br)

procedure TfrmCadUsers.FormActivate(Sender: TObject);
begin
   TbUsers.Close;
   TbUsers.SQL.Clear;
   TbUsers.SQL.Add('SELECT * FROM TB_USERS');
   TbUsers.Open;
   TbUsers.Last;
   TbUsers.First;
   TbUsers.FieldByName('USER_ID').Alignment := taCenter;
   StatusBar1.Panels[0].Text := '   Versão ' + sVerInfo + ' (2025) Delphi 12.1';
end;

procedure TfrmCadUsers.dbLedt_userExit(Sender: TObject);
var s:string;
begin
   if dsUsers.State in [dsEdit, dsInsert] then
   begin
      s := Trim(dbLedt_user.Text);
      dbLedt_user.Field.AsString := s;
   end;
end;

procedure TfrmCadUsers.dbLedt_userKeyPress(Sender: TObject; var Key: Char);
begin
   if (not(Key in ['A' .. 'Z', 'a' .. 'z', '0' .. '9', #8])) then
      Key := #0; // #8 backspace
end;

procedure TfrmCadUsers.TbUsersAfterInsert(DataSet: TDataSet);
begin
   dbLedt_user.SetFocus;
end;

procedure TfrmCadUsers.FDTable1BeforePost(DataSet: TDataSet);
begin
   if Trim(TbUsers.FieldByName('USER_NAME').AsString) = EmptyStr then
   begin
      ShowMessage('Nome não pode estar sem preenchimento.');
         dbLedt_user.SetFocus;
      Abort;
   end
   else if Trim(TbUsers.FieldByName('USER_PASSWORD').AsString) = EmptyStr then
   begin
      ShowMessage('Senha não pode estar sem preenchimento.');
         dbLedt_senha.SetFocus;
      Abort;
   end;
end;

procedure TfrmCadUsers.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   TbUsers.Close;
end;

end.
