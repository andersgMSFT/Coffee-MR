pageextension 70033 CoffeeItem extends "Item Card"
{
    layout
    {
        addlast(Item)
        {
            field(IsAvialableForFieldWorker; Rec.IsAvialableForFieldWorker)
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

            field(uploadModel3d; uploadModelLabel)
            {
                ApplicationArea = All;
                ShowCaption = false;
                Editable = false;
                ToolTip = 'Learn more about 3D models here: https://learn.microsoft.com/en-us/dynamics365/mixed-reality/guides/3d-content-guidelines/optimize-models';

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
                        uploadModelLabel := 'Overwrite 3D model';
                        Message('Model uploaded successfully');
                    end
                    else
                        Message('Upload canceled');
                end;
            }

            field(learnAbout3DModel; learnAbout3DModel)
            {
                ApplicationArea = All;
                ShowCaption = false;
                Editable = false;

                trigger OnDrillDown()
                begin
                    Hyperlink('https://learn.microsoft.com/en-us/dynamics365/mixed-reality/guides/3d-content-guidelines/optimize-models');
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        learnAbout3DModel := 'Learn more about 3D model';

        Rec.SetAutoCalcFields(Model3D);

        uploadModelLabel := 'Upload 3D model';
        if Rec.Model3D.HasValue then
            uploadModelLabel := 'Overwrite 3D model';
    end;

    var
        uploadModelLabel: Text;
        learnAbout3DModel: Text;
}