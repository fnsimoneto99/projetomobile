unit Login;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit;

type
  TFrmLogin = class(TForm)
    LConteudo: TLayout;
    imgBack: TImage;
    LComponentes: TLayout;
    LTopo: TLayout;
    imgTopo: TImage;
    LLogo: TLayout;
    imgUsuario: TImage;
    LUsuario: TLayout;
    Image2: TImage;
    LSeparadorEdits: TLayout;
    LSenha: TLayout;
    imgSenha: TImage;
    LSeparadorBotao: TLayout;
    btnLogin: TImage;
    LBotao: TLayout;
    Label1: TLabel;
    imgIconeUsuario: TImage;
    imgIconeSenha: TImage;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    procedure btnLoginClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.fmx}

uses Menu, Modulo;

procedure TFrmLogin.btnLoginClick(Sender: TObject);
begin

if (edtUsuario.Text <> '') and (edtSenha.Text <> '') then
begin
  dm.con.Connected := true;
  dm.queryLogin.Active := true;

  dm.queryLogin.Close;
  dm.queryLogin.SQL.Clear;
  dm.queryLogin.SQL.Add('select * from funcionarios where usuario = :usuario and senha = :senha');
  dm.queryLogin.ParamByName('usuario').AsString := edtUsuario.Text;
  dm.queryLogin.ParamByName('senha').AsString := edtSenha.Text;
  dm.queryLogin.Open;

  if not dm.queryLogin.IsEmpty then
  begin

  //RECUPERAR DADOS DO USUÁRIO LOGADO
  nomeFuncionario := dm.queryLogin['nome'];
  cargoFuncionario := dm.queryLogin['cargo'];

  FrmMenu := TFrmMenu.Create(self);
  FrmMenu.Show();

  end
  else
  begin
  showMessage('Dados Incorretos');
  end;


end
else
begin
showMessage('Preencha os Campos');


end;

end;

end.
