tableextension 71070 CoffeeItem extends Item
{
    fields
    {
        field(71073; IsAvialableForFieldWorker; Boolean)
        {
            Caption = 'Is Avialable For Field Worker';
            DataClassification = CustomerContent;
        }
        field(71075; LongDescription; Text[500])
        {
            Caption = 'long Description';
            DataClassification = CustomerContent;
        }
    }
}