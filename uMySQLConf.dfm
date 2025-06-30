object frmMySQLConf: TfrmMySQLConf
  Left = 0
  Top = 0
  Caption = 'Configura'#231#227'o do Servidor MySQL Server'
  ClientHeight = 284
  ClientWidth = 387
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  TextHeight = 15
  object Label5: TLabel
    Left = 8
    Top = 19
    Width = 63
    Height = 15
    Caption = 'Username :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 8
    Top = 59
    Width = 58
    Height = 15
    Caption = 'Password :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 8
    Top = 163
    Width = 161
    Height = 15
    Caption = 'Selecione o Banco de Dados :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnSalvar: TButton
    Left = 8
    Top = 232
    Width = 75
    Height = 25
    Caption = '&Salvar'
    TabOrder = 4
    OnClick = btnSalvarClick
  end
  object btnCancelar: TButton
    Left = 97
    Top = 232
    Width = 75
    Height = 25
    Caption = '&Cancelar'
    TabOrder = 5
    OnClick = btnCancelarClick
  end
  object edtUser: TEdit
    Left = 80
    Top = 16
    Width = 92
    Height = 23
    Hint = 'Default: SYSDBA'
    Alignment = taCenter
    MaxLength = 4
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object edtPassw: TEdit
    Left = 80
    Top = 56
    Width = 92
    Height = 23
    Hint = 'Default: masterkey'
    Alignment = taCenter
    ParentShowHint = False
    PasswordChar = '*'
    ShowHint = True
    TabOrder = 1
  end
  object btnDefault: TButton
    Left = 185
    Top = 232
    Width = 75
    Height = 25
    Caption = '&Default'
    TabOrder = 6
    OnClick = btnDefaultClick
  end
  object cbbBD: TComboBox
    Left = 8
    Top = 184
    Width = 161
    Height = 23
    Style = csDropDownList
    TabOrder = 3
  end
  object btnConectar: TButton
    Left = 8
    Top = 96
    Width = 75
    Height = 25
    Caption = '&Conectar'
    TabOrder = 2
    OnClick = btnConectarClick
  end
  object OpenDialog1: TOpenDialog
    Left = 200
    Top = 96
  end
end
