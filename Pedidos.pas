unit Pedidos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components,
  Data.Bind.DBScope, FMX.ListView, FMX.DateTimeCtrls, FMX.Controls.Presentation,
  FMX.StdCtrls;

type
  TfrmPedidos = class(TForm)
    LConteudo: TLayout;
    imgBack: TImage;
    Layout1: TLayout;
    LTopo: TLayout;
    imgBackTopo: TImage;
    btnBuscar: TButton;
    data: TDateEdit;
    btnVoltar: TButton;
    LAreaGrid: TLayout;
    lista: TListView;
    LRodapeForm: TLayout;
    imgBackRodape: TImage;
    btnInserir: TButton;
    btnDeletar: TButton;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    procedure FormActivate(Sender: TObject);
    procedure dataChange(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
  private
    { Private declarations }
    procedure listar;
  public
    { Public declarations }
  end;

var
  frmPedidos: TfrmPedidos;

implementation

{$R *.fmx}

uses Modulo, NovoPedido;

{ TfrmPedidos }
procedure TfrmPedidos.btnBuscarClick(Sender: TObject);
begin
   listar;
end;

procedure TfrmPedidos.btnDeletarClick(Sender: TObject);
begin
   dm.con.Connected := true;
   dm.queryPedidosExec.Active := true;

   idPedido := dm.queryPedidosCon.FieldByName('id').Value;

   dm.queryPedidosExec.Close;
   dm.queryPedidosExec.SQL.Clear;
   dm.queryPedidosExec.SQL.Add('delete from pedidos where id = :id');
   dm.queryPedidosExec.ParamByName('id').AsString := idPedido;

   dm.queryPedidosExec.Execute;
end;

procedure TfrmPedidos.btnInserirClick(Sender: TObject);
begin
   FrmNovoPedido := FrmNovoPedido.Create(self);
   FrmNovoPedido.Show();
end;

procedure TfrmPedidos.btnVoltarClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmPedidos.dataChange(Sender: TObject);
begin
   listar;
end;

procedure TFrmPedidos.FormActivate(Sender: TObject);
begin
   data.Date := Date;
   listar;
end;

procedure TFrmPedidos.listar;
var
   item : TListViewItem;
begin
  dm.con.Connected := true;
  dm.queryPedidosCon.Active := true;

  dm.queryPedidosCon.Close;
  dm.queryPedidosCon.SQL.Clear;
  dm.queryPedidosCon.SQL.Add('select * from pedidos where data = :data');
  dm.queryPedidosCon.ParamByName('data').AsString := FormatDateTime('yyyy/mm/dd', data.Date);

  dm.queryPedidosCon.Open;
  lista.Items.Clear;
  lista.BeginUpdate;

   while not dm.queryPedidosCon.Eof do
   begin
     item := lista.Items.Add;
     item.Detail := FormatFloat('R$ ###,##0.00', dm.queryPedidosCon.FieldByName('valor').Value) + ' - ' + dm.queryPedidosCon.FieldByName('funcionario').AsString;
     item.Text := 'Mesa ' + dm.queryPedidosCon.FieldByName('mesa').AsString;
     dm.queryPedidosCon.Next;
   end;
   lista.EndUpdate;
end;

end.
