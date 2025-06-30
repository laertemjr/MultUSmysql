object frmCadCli: TfrmCadCli
  Left = 0
  Top = 0
  Caption = 'Modelo de Sistema Comercial Multiusu'#225'rio - Cadastro de Clientes'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnActivate = FormActivate
  OnClose = FormClose
  TextHeight = 15
  object DBGrid1: TDBGrid
    Left = 0
    Top = 120
    Width = 624
    Height = 302
    DataSource = dsClientes
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CLIENTE_ID'
        Title.Alignment = taCenter
        Title.Caption = 'Cliente ID'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLIENTE_NOMECOMPLETO'
        Title.Alignment = taCenter
        Title.Caption = 'Nome completo *'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 240
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLIENTE_EMAIL'
        Title.Alignment = taCenter
        Title.Caption = 'E-Mail'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLIENTE_CELULAR'
        Title.Alignment = taCenter
        Title.Caption = 'Celular'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 100
        Visible = True
      end>
  end
  object dbLedt_ID: TDBLabeledEdit
    Left = 8
    Top = 40
    Width = 57
    Height = 23
    TabStop = False
    DataField = 'Cliente_ID'
    DataSource = dsClientes
    ReadOnly = True
    TabOrder = 0
    EditLabel.Width = 55
    EditLabel.Height = 15
    EditLabel.Caption = 'Cliente ID'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -12
    EditLabel.Font.Name = 'Segoe UI'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
  end
  object dbLedt_nome: TDBLabeledEdit
    Left = 71
    Top = 40
    Width = 250
    Height = 23
    DataField = 'Cliente_NomeCompleto'
    DataSource = dsClientes
    TabOrder = 1
    OnExit = dbLedt_nomeExit
    OnKeyPress = dbLedt_nomeKeyPress
    EditLabel.Width = 98
    EditLabel.Height = 15
    EditLabel.Caption = 'Nome completo *'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -12
    EditLabel.Font.Name = 'Segoe UI'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
  end
  object dbLedt_email: TDBLabeledEdit
    Left = 327
    Top = 40
    Width = 190
    Height = 23
    DataField = 'Cliente_Email'
    DataSource = dsClientes
    TabOrder = 2
    OnKeyPress = dbLedt_emailKeyPress
    EditLabel.Width = 35
    EditLabel.Height = 15
    EditLabel.Caption = 'e-Mail'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -12
    EditLabel.Font.Name = 'Segoe UI'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
  end
  object dbLedt_celular: TDBLabeledEdit
    Left = 523
    Top = 40
    Width = 93
    Height = 23
    DataField = 'Cliente_Celular'
    DataSource = dsClientes
    TabOrder = 3
    EditLabel.Width = 38
    EditLabel.Height = 15
    EditLabel.Caption = 'Celular'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -12
    EditLabel.Font.Name = 'Segoe UI'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 77
    Width = 240
    Height = 25
    DataSource = dsClientes
    TabOrder = 4
    TabStop = True
    OnClick = DBNavigator1Click
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 422
    Width = 624
    Height = 19
    BiDiMode = bdRightToLeft
    Panels = <
      item
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Text = '   Vers'#227'o '
        Width = 310
      end
      item
        Alignment = taRightJustify
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Text = 
          'Copyright '#169' 2025 Mancuso Software (laertemjr@outlook.com.br)    ' +
          ' '
        Width = 330
      end>
    ParentBiDiMode = False
  end
  object dsClientes: TDataSource
    AutoEdit = False
    DataSet = TbClientes
    Left = 544
    Top = 336
  end
  object TbClientes: TFDQuery
    AfterInsert = TbClientesAfterInsert
    Connection = dm.FDConnection1
    Left = 464
    Top = 336
  end
end
