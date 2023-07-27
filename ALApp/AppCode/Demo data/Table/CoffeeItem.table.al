tableextension 70030 CoffeeItem extends Item
{
    fields
    {
        field(70030; IsAvialableForFieldWorker; Boolean)
        {
            Caption = 'Is Avialable For Field Worker';
            DataClassification = CustomerContent;
        }
        field(70031; LongDescription; Text[500])
        {
            Caption = 'long Description';
            DataClassification = CustomerContent;
        }
    }
}