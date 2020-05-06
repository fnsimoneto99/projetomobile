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

uses Menu;

procedure TFrmLogin.btnLoginClick(Sender: TObject);
begin
FrmMenu := TFrmMenu.Create(self);
FrmMenu.Show;
end;

end.
