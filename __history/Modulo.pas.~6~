unit Modulo;

interface

uses
  System.SysUtils, System.Classes, Data.DB, DBAccess, Uni, UniProvider,
  MySQLUniProvider, MemDS;

type
  Tdm = class(TDataModule)
    con: TUniConnection;
    MySQLUniProvider1: TMySQLUniProvider;
    queryLogin: TUniQuery;
    queryPedidosCon: TUniQuery;
    queryPedidosConid: TIntegerField;
    queryPedidosConid_venda: TIntegerField;
    queryPedidosConvalor: TFloatField;
    queryPedidosConmesa: TStringField;
    queryPedidosConfuncionario: TStringField;
    queryPedidosCondata: TDateField;
    queryPedidosExec: TUniQuery;
    oQ_Mesas: TUniQuery;
    oQ_Pratos: TUniQuery;
    oQ_ItensPedido: TUniQuery;
    oQ_ItensExec: TUniQuery;
    oQ_ItensPedidoid: TIntegerField;
    oQ_ItensPedidoid_pedido: TIntegerField;
    oQ_ItensPedidoprato: TStringField;
    oQ_ItensPedidovalor: TFloatField;
    oQ_ItensPedidovalor_total: TFloatField;
    oQ_Pratos2: TUniQuery;
    oQ_MovimentacaoExec: TUniQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

  nomeFuncionario  : string;
  cargoFuncionario : string;

  idPedido         : string;
  idItemPedido     : string;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
