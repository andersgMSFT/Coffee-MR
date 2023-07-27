page 70032 CoffeeItems
{
    PageType = API;
    Caption = 'Coffee Items';
    EntityName = 'coffeeItem';
    EntitySetName = 'coffeeItems';

    APIPublisher = 'microsoft';
    APIGroup = 'powerApps';
    APIVersion = 'beta';

    SourceTable = "Item";
    DelayedInsert = true;
    ODataKeyFields = SystemId;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'System ID';
                }
                field(number; Rec."No.")
                {
                    Caption = 'Number';
                }
                field(displayName; Rec.Description)
                {
                    Caption = 'DisplayName';
                }
                field("unitPrice"; Rec."Unit Price")
                {
                    Caption = 'Unit price';
                }
                field(baseUnitOfMeasureCode; Rec."Base Unit of Measure")
                {
                    Caption = 'Base Unit Of Measure Code';
                }
                field(inventory; Rec.Inventory)
                {
                    Caption = 'Inventory';
                }
                field(itemCategoryName; ItemCatagoryName)
                {
                    Editable = false;
                    Caption = 'Item Category Name';
                }
                field("itemCategoryCode"; Rec."Item Category Code")
                {
                    Caption = 'Item Category Code';
                }
                field(itemImageText; Rec.Picture)
                {
                    Caption = 'Picture reference';
                }
                field(longDescription; Rec.LongDescription)
                {
                    Caption = 'Long description';
                }
                field(isAvailableForFieldWorkers; rec.IsAvialableForFieldWorker)
                {
                    Caption = 'Is available for field workers';
                }
                field(picture; NameValueBufferBlob."Value BLOB")
                {
                    Caption = 'Picture';
                }
            }
        }
    }

    var
        ItemCatagoryName: Text[100];
        NameValueBufferBlob: Record "Name/Value Buffer" temporary; // This can be any table with a field of type Blob
        ConfigMediaBuffer: Record "Config. Media Buffer" temporary; // This can be any table with a field of type Media

    trigger OnAfterGetRecord()
    var
        TenantMedia: Record "Tenant Media";
        OutStr: OutStream;
        InStr: InStream;
        MediaId: Guid;
        RecordR: RecordRef;
        FieldR: FieldRef;
        ItemCategory: Record "Item Category";
    begin
        NameValueBufferBlob.DeleteAll();
        NameValueBufferBlob.Init();
        NameValueBufferBlob."Value BLOB".CreateOutStream(OutStr);

        // **BEGIN**
        // If the picture is of type Media, use this code:
        // Rec.Picture.Image.ExportStream(OutStr);

        // If the picture is of type MediaSet, use this code:
        if Rec.Picture.Count > 0 then begin
            // There are more than 1 pictures for this item. We take the first one.
            MediaId := Rec.Picture.Item(1);

            TenantMedia.SetAutoCalcFields(Content);
            if not TenantMedia.Get(MediaID) then
                exit;

            TenantMedia.Content.CreateInStream(InStr);
            CopyStream(OutStr, InStr);
        end;
        NameValueBufferBlob.Insert();

        ItemCatagoryName := '';
        if Rec."Item Category Code" <> '' then begin
            if ItemCategory.Get(Rec."Item Category Code")
            then
                ItemCatagoryName := ItemCategory.Description
        end;
    end;
}