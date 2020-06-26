object dm: Tdm
  OldCreateOrder = False
  Height = 541
  Width = 755
  object con: TUniConnection
    ProviderName = 'MySQL'
    Port = 3306
<<<<<<< HEAD
    Database = 'lanchonete'
    Username = 'fnsimoneto'
    Server = 'localhost'
=======
    Database = 'restaurante'
    Username = 'adrianols'
    Server = '127.0.0.1'
>>>>>>> 2af0f27d5d6e89c5c5be26fd3bdd87504dff7c1e
    Connected = True
    LoginPrompt = False
    Left = 24
    Top = 40
<<<<<<< HEAD
    EncryptedPassword = 'B9FF9AFF93FF96FF8FFF9AFFC6FFC7FFCCFFC9FF'
=======
    EncryptedPassword = 'CEFFC9FFC7FFC7FFCCFFC6FFC9FFCBFF'
>>>>>>> 2af0f27d5d6e89c5c5be26fd3bdd87504dff7c1e
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
<<<<<<< HEAD
    Left = 152
=======
    Left = 136
>>>>>>> 2af0f27d5d6e89c5c5be26fd3bdd87504dff7c1e
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
<<<<<<< HEAD
    Left = 248
=======
    Left = 224
>>>>>>> 2af0f27d5d6e89c5c5be26fd3bdd87504dff7c1e
    Top = 40
  end
  object oQ_Mesas: TUniQuery
    Connection = con
    SQL.Strings = (
      'select * from mesas')
    Left = 32
    Top = 136
  end
  object oQ_Pratos: TUniQuery
    Connection = con
    SQL.Strings = (
      'select * from pratos')
    Left = 96
    Top = 136
  end
  object oQ_ItensPedido: TUniQuery
    Connection = con
    SQL.Strings = (
      'select * from detalhes_pedidos')
    Left = 168
    Top = 136
    object oQ_ItensPedidoid: TIntegerField
      FieldName = 'id'
    end
    object oQ_ItensPedidoid_pedido: TIntegerField
      FieldName = 'id_pedido'
      Required = True
    end
    object oQ_ItensPedidoprato: TStringField
      FieldName = 'prato'
      Required = True
      Size = 30
    end
    object oQ_ItensPedidovalor: TFloatField
      FieldName = 'valor'
      Required = True
    end
    object oQ_ItensPedidovalor_total: TFloatField
      FieldName = 'valor_total'
      Required = True
    end
  end
  object oQ_ItensExec: TUniQuery
    Connection = con
    SQL.Strings = (
      'select * from detalhes_pedidos')
    Left = 248
    Top = 136
  end
  object oQ_Pratos2: TUniQuery
    Connection = con
    SQL.Strings = (
      'select * from pratos')
    Left = 32
    Top = 200
  end
<<<<<<< HEAD
  object queryMovExec: TUniQuery
    Connection = con
    SQL.Strings = (
      'select * from movimentacoes')
    Left = 408
    Top = 40
  end
  object queryMovCon: TUniQuery
    Connection = con
    SQL.Strings = (
      'select * from movimentacoes')
    Left = 332
    Top = 40
  end
  object queryReservasCon: TUniQuery
    Connection = con
    SQL.Strings = (
      'select * from reservas')
    Left = 488
    Top = 40
=======
  object oQ_MovimentacaoExec: TUniQuery
    Connection = con
    SQL.Strings = (
      'select * from movimentacoes')
    Left = 136
    Top = 200
>>>>>>> 2af0f27d5d6e89c5c5be26fd3bdd87504dff7c1e
  end
end
