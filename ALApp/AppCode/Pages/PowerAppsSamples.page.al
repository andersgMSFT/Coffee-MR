page 52000 PowerAppsSamplePage
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Power Apps Directions';

    layout
    {
        area(Content)
        {
            group(GroupName2)
            {
                Caption = 'PowerApp Items';

                part(PowerAppItems; PowerItemListPart)
                {
                    Caption = 'Items';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(GenerateTestData)
            {
                ApplicationArea = All;
                Promoted = true;
                Caption = 'Generate PowerApp Data';
                trigger OnAction()
                var
                    myCodeUnit: Codeunit PowerAppsDemoDataGenerator;
                begin
                    myCodeUnit.GenerateDemoDataForPowerApps();
                end;
            }
        }
    }
}