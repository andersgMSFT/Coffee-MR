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
                Caption = 'This is a sample page to simplify the generation and management of demo data for the Coffee MR sample. To use the mixed reality model rendering, you have to upload a 3D model to the using the Business Central Item page.';
            }
            field(SampleAppDocumentation; CoffeeSampleDocFieldLabel)
            {
                ApplicationArea = All;
                ShowCaption = false;

                trigger OnDrillDown()
                begin
                    Hyperlink('https://github.com/microsoft/bcsamples-CoffeeMR/?tab=readme-ov-file#preview-business-central-samples---coffee-mr');
                end;
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
    var
        CoffeeSampleDocFieldLabel: Label 'Coffee MR Sample Documentation';
}