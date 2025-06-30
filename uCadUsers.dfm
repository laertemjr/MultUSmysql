object frmCadUsers: TfrmCadUsers
  Left = 0
  Top = 0
  Caption = 'Modelo de Sistema Comercial Multiusu'#225'rio - Cadastro de Usu'#225'rios'
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
    Height = 296
    DataSource = dsUsers
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'USER_ID'
        Title.Alignment = taCenter
        Title.Caption = 'User ID'
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
        FieldName = 'USER_NAME'
        Title.Alignment = taCenter
        Title.Caption = 'Nome do usu'#225'rio *'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USER_PASSWORD'
        Title.Alignment = taCenter
        Title.Caption = 'Senha *'
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
    DataField = 'USER_ID'
    DataSource = dsUsers
    ReadOnly = True
    TabOrder = 0
    EditLabel.Width = 42
    EditLabel.Height = 15
    EditLabel.Caption = 'User ID'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -12
    EditLabel.Font.Name = 'Segoe UI'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
  end
  object dbLedt_user: TDBLabeledEdit
    Left = 71
    Top = 40
    Width = 252
    Height = 23
    DataField = 'USER_NAME'
    DataSource = dsUsers
    TabOrder = 1
    OnExit = dbLedt_userExit
    OnKeyPress = dbLedt_userKeyPress
    EditLabel.Width = 102
    EditLabel.Height = 15
    EditLabel.Caption = 'Nome do usu'#225'rio *'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -12
    EditLabel.Font.Name = 'Segoe UI'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
  end
  object dbLedt_senha: TDBLabeledEdit
    Left = 329
    Top = 40
    Width = 200
    Height = 23
    DataField = 'USER_PASSWORD'
    DataSource = dsUsers
    TabOrder = 2
    EditLabel.Width = 42
    EditLabel.Height = 15
    EditLabel.Caption = 'Senha *'
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
    DataSource = dsUsers
    TabOrder = 3
    TabStop = True
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
  object dsUsers: TDataSource
    AutoEdit = False
    DataSet = TbUsers
    Left = 536
    Top = 168
  end
  object TbUsers: TFDQuery
    AfterInsert = TbUsersAfterInsert
    Connection = dm.FDConnection1
    Left = 456
    Top = 168
  end
end
