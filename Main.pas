unit Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls, System.ImageList, FMX.ImgList;

type
  TForm1 = class(TForm)
    PanelMarket: TGridPanelLayout;
    ImageList1: TImageList;
    procedure ImagesMarket(const rowCount, colCount : integer);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.ImagesMarket(const rowCount, colCount : integer);
var
  i : integer;
  aImage: TGlyph;
begin
  PanelMarket.RowCollection.BeginUpdate;
  PanelMarket.ColumnCollection.BeginUpdate;

  for i := 0 to -1 + PanelMarket.ControlsCount do
    PanelMarket.Controls[0].Free;

  PanelMarket.RowCollection.Clear;
  PanelMarket.ColumnCollection.Clear;

  for i := 1 to rowCount do
    with PanelMarket.RowCollection.Add do
    begin
      SizeStyle := TGridPanelLayout.TSizeStyle(1);
      Value := 100 / rowCount;
    end;

  for i := 1 to colCount do
    with PanelMarket.ColumnCollection.Add do
    begin
      SizeStyle := TGridPanelLayout.TSizeStyle(1);
      Value := 100 / colCount;
    end;

  for i := 0 to -1 + rowCount * colCount do
  begin
    aImage := TGlyph.Create(self);
    aImage.Parent := PanelMarket;
    aImage.Visible := true;
    aImage.Images := ImageList1;
    aImage.ImageIndex := Random(5);
    aImage.Align := TAlignLayout(9);
  end;

  PanelMarket.RowCollection.EndUpdate;
  PanelMarket.ColumnCollection.EndUpdate;
end;



procedure TForm1.FormCreate(Sender: TObject);
begin
ImagesMarket(4,2);
end;

end.
