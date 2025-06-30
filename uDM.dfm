object dm: Tdm
  Height = 480
  Width = 640
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=MySQL')
    Left = 368
    Top = 16
  end
  object TbUsers: TFDQuery
    Connection = FDConnection1
    Left = 496
    Top = 16
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 64
    Top = 16
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    Left = 216
    Top = 16
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 64
    Top = 96
  end
end
