unit uMySQLConf;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, System.IniFiles;

type
  TfrmMySQLConf = class(TForm)
    btnSalvar: TButton;
    btnCancelar: TButton;
    OpenDialog1: TOpenDialog;
    edtUser: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    edtPassw: TEdit;
    btnDefault: TButton;
    cbbBD: TComboBox;
    btnConectar: TButton;
    Label1: TLabel;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnDefaultClick(Sender: TObject);
    procedure btnConectarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    iniconf : TIniFile;
    bpodeSalvar:Boolean;
    procedure leituraINI();
  public
    { Public declarations }

  end;

var
  frmMySQLConf: TfrmMySQLConf;

implementation

uses
   uGlobal, uDM;

{$R *.dfm}


procedure TfrmMySQLConf.FormShow(Sender: TObject);
begin
   bAbortar := False;
   bpodeSalvar  := False;

   edtUser.Clear;
   edtPassw.Clear;
   cbbBD.Clear;

   if FileExists(ExtractFilePath(Application.ExeName) + 'config.ini') then leituraINI()
   else btnConectar.SetFocus;
end;

procedure TfrmMySQLConf.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   if bpodeSalvar then
   begin
      CanClose := True;
      dm.FDConnection1.Connected := False;
      Exit;
   end;

   if MsgPergunta('Fechar o formulário ? As alterações que não estiverem salvas serão descartadas.', False) then
   begin
      CanClose := True;
      bAbortar := True;
      dm.FDConnection1.Connected := False;
   end
   else CanClose := False;
end;

procedure TfrmMySQLConf.leituraINI;
begin
   cbbBD.Clear;
   iniconf := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'config.ini');
   edtUser.Text       := iniconf.ReadString('MYSQL', 'User_Name', '');
   edtPassw.Text      := iniconf.ReadString('MYSQL', 'Password', '');
   cbbBD.Items.Add(iniconf.ReadString('MySQL', 'Database', ''));
   cbbBD.ItemIndex := 0;
   iniconf.Free;
end;

procedure TfrmMySQLConf.btnSalvarClick(Sender: TObject);
begin
   if MsgPergunta('Salvar as alterações ?') then
   begin
      iniconf := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'config.ini');
      iniconf.WriteString('MYSQL', 'User_Name', edtUser.Text);
      iniconf.WriteString('MYSQL', 'Password', edtPassw.Text);
      iniconf.WriteString('MYSQL', 'Database', cbbBD.Text);
      iniconf.Free;
      bpodeSalvar := True;
      Self.Close;
   end
   else Exit;
end;

procedure TfrmMySQLConf.btnCancelarClick(Sender: TObject);
begin
   if MsgPergunta('Descartar as alterações ?', False) then leituraINI()
   else Exit;
end;

procedure TfrmMySQLConf.btnConectarClick(Sender: TObject);
var ConnData:string;
begin
   dm.FDConnection1.Params.Clear;
   dm.FDConnection1.Params.Add('DriverID=MySQL');
   dm.FDConnection1.Params.Add('Server=localhost');
   dm.FDConnection1.Params.Add('User_Name=' + edtUser.Text);
   dm.FDConnection1.Params.Add('Password=' + edtPassw.Text);

   try
      dm.FDConnection1.Connected := True;
      ShowMessage('Selecione o banco de dados.');
      dm.FDQuery1.SQL.Text := 'SHOW DATABASES';
      {dm.FDQuery1.SQL.Text := 'SELECT * FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME NOT IN (' + QuotedStr('mysql') + ', ' +
                          QuotedStr('information_schema') + ', ' + QuotedStr('performance_schema') + ', ' + QuotedStr('sys')+ ')';}
      dm.FDQuery1.Open;
      dm.FDQuery1.First;
      cbbBD.Items.Clear;
      while not dm.FDQuery1.EOF do
      begin
         cbbBD.Items.Add(dm.FDQuery1.FieldByName('Database').AsString); // 'Database' ou 'name'
         dm.FDQuery1.Next;
      end;
      dm.FDQuery1.Close;
   except
      ShowMessage('Não foi possível conectar o banco de dados.');
   end;
end;

procedure TfrmMySQLConf.btnDefaultClick(Sender: TObject);
begin
   edtUser.Text       := 'root';
   edtPassw.Text      := EmptyStr;
end;

end.
