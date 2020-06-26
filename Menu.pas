unit Menu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.StdCtrls, FMX.Controls.Presentation;

type
  TFrmMenu = class(TForm)
    LConteudo: TLayout;
    imgBack: TImage;
    LAreaMenu: TLayout;
    GridMenu: TGridPanelLayout;
    ImgPedidos: TImage;
    imgMovimentacoes: TImage;
    imgProdutos: TImage;
    imgReservas: TImage;
    LTopo: TLayout;
    imgBackTopo: TImage;
    btnFechar: TButton;
    imgLogoUsuario: TImage;
    LTextos: TLayout;
    Label1: TLabel;
    Label2: TLabel;
    lblNome: TLabel;
    lblFuncao: TLabel;
    LRodapeMenu: TLayout;
    LTotal: TLayout;
    Label7: TLabel;
    lblReservas: TLabel;
    LEntradaseSaidas: TLayout;
    retEstoque: TRectangle;
    lblEstoque: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure ImgPedidosClick(Sender: TObject);
<<<<<<< HEAD
    procedure imgMovimentacoesClick(Sender: TObject);
    procedure imgReservasClick(Sender: TObject);
=======
>>>>>>> 2af0f27d5d6e89c5c5be26fd3bdd87504dff7c1e
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMenu: TFrmMenu;

implementation

{$R *.fmx}

<<<<<<< HEAD
uses Modulo, Pedidos, Movimentacoes, NovoPedido, Reservas;
=======
uses Modulo, Pedidos;
>>>>>>> 2af0f27d5d6e89c5c5be26fd3bdd87504dff7c1e
{$R *.LgXhdpiTb.fmx ANDROID}
{$R *.NmXhdpiPh.fmx ANDROID}

procedure TFrmMenu.FormActivate(Sender: TObject);
begin
   lblNome.Text := nomeFuncionario;
   lblFuncao.Text := cargoFuncionario;
end;

<<<<<<< HEAD
procedure TFrmMenu.imgMovimentacoesClick(Sender: TObject);
begin
   FrmMov := TFrmMov.Create(self);
   FrmMov.Show();
end;

=======
>>>>>>> 2af0f27d5d6e89c5c5be26fd3bdd87504dff7c1e
procedure TFrmMenu.ImgPedidosClick(Sender: TObject);
begin
   FrmPedidos := TFrmPedidos.Create(self);
   FrmPedidos.Show();
end;

<<<<<<< HEAD
procedure TFrmMenu.imgReservasClick(Sender: TObject);
begin
   FrmReservas := TFrmReservas.Create(self);
   FrmReservas.Show();
end;

=======
>>>>>>> 2af0f27d5d6e89c5c5be26fd3bdd87504dff7c1e
end.
