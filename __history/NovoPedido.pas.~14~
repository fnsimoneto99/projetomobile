unit NovoPedido;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ListBox,
  FMX.Edit, FMX.Layouts, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Objects,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, FMX.ListView;

type
  TFrmNovoPedido = class(TForm)
    LConteudo: TLayout;
    imgBack: TImage;
    LObjetos: TLayout;
    LTopo: TLayout;
    imgBackTopo: TImage;
    Button2: TButton;
    Label1: TLabel;
    LAreaGrid: TLayout;
    barra: TVertScrollBox;
    LRodapeForm: TLayout;
    imgBackRodape: TImage;
    btnSalvar: TButton;
    ovCB_Mesas: TComboBox;
    ovCB_Pratos: TComboBox;
    ovE_Quantidade: TEdit;
    ovE_ValorPrato: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ovG_ListaItens: TListView;
    btnRemove: TImage;
    Label6: TLabel;
    ovL_ValorTotal: TLabel;
    ovB_Adicionar: TImage;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    Label7: TLabel;
    ovE_ValorUnitario: TEdit;
    procedure Button2Click(Sender: TObject);
    procedure ovCB_PratosChange(Sender: TObject);
    procedure ovB_AdicionarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure ovE_QuantidadeChange(Sender: TObject);
  private
    { Private declarations }
    procedure carregarPratos;
    procedure carregarMesas;
    procedure CarregarValorPrato;
    procedure ListarPedidos;
    procedure ApagarItens;
  public
    { Public declarations }
  end;

var
  FrmNovoPedido: TFrmNovoPedido;
  valorTotal : real;
implementation

{$R *.fmx}
{$R *.NmXhdpiPh.fmx ANDROID}

uses Modulo;

procedure TFrmNovoPedido.ovB_AdicionarClick(Sender: TObject);
var
   vTotalItem : Double;
begin
   if ovE_Quantidade.Text <> '' then
   begin
      vTotalItem := StrToFloat(ovE_Quantidade.Text) * strtoFloat(ovE_ValorPrato.Text);

      dm.con.Connected := true;

      dm.oQ_ItensExec.Close;
      dm.oQ_ItensExec.SQL.Clear;
      dm.oQ_ItensExec.SQL.Add('insert into detalhes_pedidos (prato, valor, quantidade, valor_total, mesa, funcionario) values (:prato, :valor, :quantidade, :valor_total, :mesa, :funcionario)');
      dm.oQ_ItensExec.ParamByName('prato').AsString       := ovCB_Pratos.Selected.Text;
      dm.oQ_ItensExec.ParamByName('valor').AsString       := ovE_ValorPrato.Text;
      dm.oQ_ItensExec.ParamByName('quantidade').AsString  := ovE_Quantidade.Text;
      dm.oQ_ItensExec.ParamByName('valor_total').Value    := vTotalItem;
      dm.oQ_ItensExec.ParamByName('mesa').AsString        := ovCB_Mesas.Selected.Text;
      dm.oQ_ItensExec.ParamByName('funcionario').AsString := nomeFuncionario;

      dm.oQ_ItensExec.Execute;
      valorTotal := valorTotal + vTotalItem;
      ovL_ValorTotal.Text := FormatFloat('R$' + '###,##0.00', valorTotal);

      ovCB_Mesas.Enabled := False;
      ovE_Quantidade.Text := '';

      ListarPedidos;
   end
   else
   begin
      showMessage('Insira uma quantidade');
   end;
end;

procedure TFrmNovoPedido.btnRemoveClick(Sender: TObject);
var
   vValorItem: real;
begin
   dm.con.Connected := True;

   idItemPedido := dm.oQ_ItensExec.FieldByName('id').Value;
   vValorItem   := dm.oQ_ItensExec.FieldByName('valor_total').Value;

   dm.oQ_ItensExec.Close;
   dm.oQ_ItensExec.SQL.Clear;
   dm.oQ_ItensExec.SQL.Add('delete from detalhes_pedidos where id = :id');
   dm.oQ_ItensExec.ParamByName('id').AsString := idItemPedido;

   dm.oQ_ItensExec.Execute;
   ListarPedidos;

   valorTotal := valorTotal - vValorItem;
   ovL_ValorTotal.Text := FormatFloat('R$' + '###,##0.00', valorTotal);
end;

procedure TFrmNovoPedido.btnSalvarClick(Sender: TObject);
var
   ultimoId: string;
begin
   if ovG_ListaItens.Items.Count > 0 then
   begin
      dm.con.Connected := true;

      dm.queryPedidosExec.Close;
      dm.queryPedidosExec.SQL.Clear;
      dm.queryPedidosExec.SQL.Add('insert into pedidos (id_venda, valor, mesa, funcionario, data) values (:id_venda, :valor, :mesa, :funcionario, curDate())');

      dm.queryPedidosExec.ParamByName('id_venda').AsString := '0';
      dm.queryPedidosExec.ParamByName('valor').Value := valorTotal;
      dm.queryPedidosExec.ParamByName('mesa').AsString := ovCB_Mesas.Selected.Text;
      dm.queryPedidosExec.ParamByName('funcionario').AsString := nomeFuncionario;

      dm.queryPedidosExec.Execute;
      showMessage('Pedido Concluido com Sucesso!');

      dm.queryPedidoscON.Close;
      dm.queryPedidoscON.SQL.Clear;
      dm.queryPedidoscON.SQL.Add('select * from pedidos order by id desc') ;
      dm.queryPedidoscON.Open;

      ultimoId := dm.queryPedidoscON['id'];

      dm.queryPedidosExec.Close;
      dm.queryPedidosExec.SQL.Clear;
      dm.queryPedidosExec.SQL.Add('update detalhes_pedidos set id_pedido = :id where id_pedido = 0 and funcionario = :funcionario');
      dm.queryPedidosExec.ParamByName('id').Value :=  ultimoId;
      dm.queryPedidosExec.ParamByName('funcionario').Value :=  nomeFuncionario;

      dm.queryPedidosExec.Execute;

      dm.oQ_MovimentacaoExec.Close;
      dm.oQ_MovimentacaoExec.SQL.Clear;
      dm.oQ_MovimentacaoExec.SQL.Add('INSERT INTO movimentacoes (tipo, movimento, valor, funcionario, data, id_movimento) values (:tipo, :movimento, :valor, :funcionario, curDate(), :id_movimento)');
      dm.oQ_MovimentacaoExec.ParamByName('tipo').Value :=  'Entrada';
      dm.oQ_MovimentacaoExec.ParamByName('movimento').Value :=  'Pedido';
      dm.oQ_MovimentacaoExec.ParamByName('valor').Value :=  valortotal;
      dm.oQ_MovimentacaoExec.ParamByName('funcionario').Value :=  nomeFuncionario;
      dm.oQ_MovimentacaoExec.ParamByName('id_movimento').Value :=  ultimoId;
      dm.oQ_MovimentacaoExec.Execute;


      valortotal := 0;
      ovL_ValorTotal.Text := '0';
      ListarPedidos;
      ovCB_Mesas.Enabled := true;

   end
   else
   begin
      showMessage('Não é possível fechar um pedido sem itens!');
   end;
end;

procedure TFrmNovoPedido.Button2Click(Sender: TObject);
begin
   Close;
end;

procedure TFrmNovoPedido.carregarMesas;
begin
   dm.con.Connected   := true;
   dm.oQ_Mesas.Active := true;

   if not( dm.oQ_Mesas.IsEmpty ) then
   begin
      ovCB_Mesas.Clear;
      while not dm.oQ_Mesas.EOF do
      begin
         ovCB_Mesas.Items.Add(dm.oQ_Mesas.FieldByName('mesa').asString);
         dm.oQ_Mesas.Next;
      end;
   end;
   dm.con.Connected := false;
   dm.oQ_Mesas.Active := false;
end;

procedure TFrmNovoPedido.carregarPratos;
begin
   dm.con.Connected := true;
   dm.oQ_Pratos.Active := true;

   if not( dm.oQ_Pratos.IsEmpty )then
   begin
      ovCB_Pratos.Clear;
      while not dm.oQ_Pratos.EOF do
      begin
        ovCB_Pratos.Items.Add(dm.oQ_Pratos.FieldByName('nome').AsString);
        dm.oQ_Pratos.next;
      end;
   end;

   dm.con.Connected    := False;
   dm.oQ_Pratos.Active := False;
end;

procedure TFrmNovoPedido.CarregarValorPrato;
var
   vValor : Double;
begin
   dm.con.Connected := true;
   dm.oQ_Pratos2.Active := true;

   dm.oQ_Pratos2.Close;
   dm.oQ_Pratos2.SQL.Clear;
   dm.oQ_Pratos2.SQL.Add('select * from pratos where nome = :nome');
   dm.oQ_Pratos2.ParamByName('nome').AsString := ovCB_Pratos.Selected.Text;
   dm.oQ_Pratos2.Open;

   if not dm.oQ_Pratos2.IsEMpty then
   begin
      vValor              := dm.oQ_Pratos2['valor'];
      ovE_ValorPrato.Text := FormatFloat('###,##0.00', vValor);
   end;
end;

procedure TFrmNovoPedido.ovCB_PratosChange(Sender: TObject);
begin
   CarregarValorPrato;
end;

procedure TFrmNovoPedido.ovE_QuantidadeChange(Sender: TObject);
begin
   ovE_ValorUnitario.Text := FormatFloat('R$ ###,##0.00', StrToFloat(ovE_Quantidade.Text) * StrToFloat(ovE_ValorPrato.Text));
end;

procedure TFrmNovoPedido.ApagarItens;
begin
   dm.con.Connected := true;

   dm.oQ_ItensExec.Close;
   dm.oQ_ItensExec.SQL.Clear;
   dm.oQ_ItensExec.SQL.Add('delete from detalhes_pedidos where id_pedido = :id and funcionario = :funcionario');
   dm.oQ_ItensExec.ParamByName('id').AsString := '0';
   dm.oQ_ItensExec.ParamByName('funcionario').AsString := nomeFuncionario;

   dm.oQ_ItensExec.Execute;
end;

procedure TFrmNovoPedido.FormShow(Sender: TObject);
begin
   carregarMesas;
   carregarPratos;
   ovCB_Mesas.ItemIndex  := 0;
   ovCB_Pratos.ItemIndex := 0;
   valorTotal := 0;
   ApagarItens;
end;

procedure TFrmNovoPedido.ListarPedidos;
var
   item : TListViewItem;
begin
   dm.con.Connected := true;
   dm.oQ_ItensPedido.Active := true;

   dm.oQ_ItensPedido.Close;
   dm.oQ_ItensPedido.SQL.Clear;
   dm.oQ_ItensPedido.SQL.Add('select id, id_pedido, prato, valor, valor_total from detalhes_pedidos where id_pedido = :id_pedido and funcionario = :funcionario');
   dm.oQ_ItensPedido.ParamByName('id_pedido').AsString := '0';
   dm.oQ_ItensPedido.ParamByName('funcionario').AsString := nomeFuncionario;

   dm.oQ_ItensPedido.Open;
   dm.oQ_ItensPedido.First;

   ovG_ListaItens.Items.Clear;
   ovG_ListaItens.BeginUpdate;

   while not dm.oQ_ItensPedido.EoF do
   begin
      item := ovG_ListaItens.Items.Add;
      item.Detail := FormatFloat('R$ ###,##0.00', dm.oQ_ItensPedido.FieldByName('valor_total').Value);
      item.Text :=  dm.oQ_ItensPedido.FieldByName('prato').AsString;
      dm.oQ_ItensPedido.Next;
   end;

   ovG_ListaItens.EndUpdate;
end;

end.
