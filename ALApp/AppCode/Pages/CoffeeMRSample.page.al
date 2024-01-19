page 70030 "Coffee MR Sample"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Coffee MR Sample';

    layout
    {
        area(Content)
        {
            label(Description)
            {
                Caption = 'This is a sample page to simplify the generation and management of demo data for the Coffee MR sample.';
            }
            label(AdditionalDescription)
            {
                Caption = 'Note: To use the 3D model, you have to upload a model to the desired item.';
            }

            part(PowerAppItems; CoffeeItemsListPart)
            {
                Caption = 'Coffee machines and extras';
            }
        }
    }

    actions
    {
        area(Promoted)
        {
            actionref(PromotedGenerateTestData; GenerateTestData)
            {
            }
        }
        area(Processing)
        {
            action(GenerateTestData)
            {
                ApplicationArea = All;
                Caption = 'Generate sample Data';
                trigger OnAction()
                var
                    myCodeUnit: Codeunit CoffeDemoDataGenerator;
                begin
                    myCodeUnit.GenerateDemoData();
                end;
            }
        }
    }
}