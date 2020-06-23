program Lanchonete;

uses
  System.StartUpCopy,
  FMX.Forms,
  Login in 'Login.pas' {FrmLogin},
  Menu in 'Menu.pas' {FrmMenu},
  Modulo in 'Modulo.pas' {dm: TDataModule},
  Pedidos in 'Pedidos.pas' {frmPedidos},
  NovoPedido in 'NovoPedido.pas' {FrmNovoPedido};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(TFrmMenu, FrmMenu);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmPedidos, frmPedidos);
  Application.CreateForm(TFrmNovoPedido, FrmNovoPedido);
  Application.Run;
end.
