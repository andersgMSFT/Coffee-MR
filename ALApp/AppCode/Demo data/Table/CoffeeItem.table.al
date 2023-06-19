tableextension 71070 CoffeeItem extends Item
{
    fields
    {
        field(51003; IsAvialableForFieldWorker; Boolean)
        {
            Caption = 'Is Avialable For Field Worker';
            DataClassification = CustomerContent;
        }
        field(51005; LongDescription; Text[500])
        {
            Caption = 'long Description';
            DataClassification = CustomerContent;
        }
    }
}