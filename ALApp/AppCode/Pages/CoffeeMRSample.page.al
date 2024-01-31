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
                Caption = 'To use the mixed reality model rendering, you have to upload a 3D model to the using the Business Central Item page.';
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
            actionref(PromotedOpenSampleDocs; OpenSampleDocs)
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

            action(OpenSampleDocs)
            {
                ApplicationArea = All;
                Caption = 'Open CoffeeMR docs';

                trigger OnAction()
                begin
                    Hyperlink('https://github.com/microsoft/bcsamples-CoffeeMR/?tab=readme-ov-file#preview-business-central-samples---coffee-mr');
                end;
            }
        }
    }
}