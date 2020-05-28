unit Modulo;

interface

uses
  System.SysUtils, System.Classes, Data.DB, DBAccess, Uni;

type
  Tdm = class(TDataModule)
    UniConnection1: TUniConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
