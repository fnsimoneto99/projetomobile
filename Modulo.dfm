object dm: Tdm
  OldCreateOrder = False
  Height = 541
  Width = 755
  object con: TUniConnection
    ProviderName = 'MySQL'
    Port = 3306
    Database = 'lanchonete'
    Username = 'fnsimoneto'
    Server = '127.0.0.1'
    Connected = True
    LoginPrompt = False
    Left = 24
    Top = 40
    EncryptedPassword = 'B9FF9AFF93FF96FF8FFF9AFFC6FFC7FFCCFFC9FF'
  end
  object MySQLUniProvider1: TMySQLUniProvider
    Left = 632
    Top = 40
  end
  object queryLogin: TUniQuery
    Connection = con
    SQL.Strings = (
      'select * from funcionarios')
    Left = 80
    Top = 40
  end
  object queryPedidosCon: TUniQuery
    Connection = con
    SQL.Strings = (
      'select * from pedidos')
    Left = 160
    Top = 40
    object queryPedidosConid: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object queryPedidosConid_venda: TIntegerField
      FieldName = 'id_venda'
      Required = True
    end
    object queryPedidosConvalor: TFloatField
      FieldName = 'valor'
      Required = True
    end
    object queryPedidosConmesa: TStringField
      FieldName = 'mesa'
      Required = True
      Size = 10
    end
    object queryPedidosConfuncionario: TStringField
      FieldName = 'funcionario'
      Required = True
      Size = 25
    end
    object queryPedidosCondata: TDateField
      FieldName = 'data'
      Required = True
    end
  end
  object queryPedidosExec: TUniQuery
    Connection = con
    SQL.Strings = (
      'select * from pedidos')
    Left = 248
    Top = 40
  end
end
