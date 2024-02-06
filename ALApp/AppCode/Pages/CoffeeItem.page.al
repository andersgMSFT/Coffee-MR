pageextension 70033 CoffeeItem extends "Item Card"
{
    layout
    {
        addlast(Item)
        {
            field(ShowInCoffeeMRApp; Rec.ShowInCoffeeMRApp)
            {
                ApplicationArea = All;
                Editable = true;
            }
            field(ItemHeight; Rec.ItemHeight)
            {
                ApplicationArea = All;
                Editable = true;
            }
            field(ItemWidth; Rec.ItemWidth)
            {
                ApplicationArea = All;
                Editable = true;
            }
            field(ItemDepth; Rec.ItemDepth)
            {
                ApplicationArea = All;
                Editable = true;
            }
            field(UploadModel3d; uploadModelLabel)
            {
                ApplicationArea = All;
                Caption = '3D model';
                Editable = false;
                ToolTip = '3D model that can be rendering inside CoffeeMR see more information about the 3Dmodel under learn more here: https://learn.microsoft.com/en-us/dynamics365/mixed-reality/guides/3d-content-guidelines/optimize-models';

                trigger OnDrillDown()
                var
                    model3DStream: InStream;
                    model3DOutStream: OutStream;
                    fromFile: Text;
                begin
                    if UploadIntoStream('Upload 3D model', '', '', fromFile, model3DStream)
                    then begin
                        Clear(Rec.Model3D);
                        Rec.Model3D.CreateOutStream(model3DOutStream);
                        CopyStream(model3DOutStream, model3DStream);
                        Rec.Modify(true);

                        // Recalculate the label and don't save
                        CurrPage.Update(false);

                        Message('Model uploaded successfully');
                    end
                    else
                        Message('Upload canceled');
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Rec.SetAutoCalcFields(Model3D);

        uploadModelLabel := 'Upload';
        if Rec.Model3D.HasValue then
            uploadModelLabel := 'Overwrite';
    end;

    var
        uploadModelLabel: Text;
}