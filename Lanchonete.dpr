program Lanchonete;

uses
  System.StartUpCopy,
  FMX.Forms,
  Login in 'Login.pas' {FrmLogin},
  Menu in 'Menu.pas' {FrmMenu},
  Modulo in 'Modulo.pas' {dm: TDataModule},
  Pedidos in 'Pedidos.pas' {frmPedidos},
<<<<<<< HEAD
  NovoPedido in 'NovoPedido.pas' {FrmNovoPedido},
  Movimentacoes in 'Movimentacoes.pas' {frmMov},
  Reservas in 'Reservas.pas' {frmReservas};
=======
  NovoPedido in 'NovoPedido.pas' {FrmNovoPedido};
>>>>>>> 2af0f27d5d6e89c5c5be26fd3bdd87504dff7c1e

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(TFrmMenu, FrmMenu);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmPedidos, frmPedidos);
  Application.CreateForm(TFrmNovoPedido, FrmNovoPedido);
<<<<<<< HEAD
  Application.CreateForm(TfrmMov, frmMov);
  Application.CreateForm(TfrmReservas, frmReservas);
=======
>>>>>>> 2af0f27d5d6e89c5c5be26fd3bdd87504dff7c1e
  Application.Run;
end.
