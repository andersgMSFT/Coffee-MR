# [Preview] Business Central samples - Coffee MR

The **Coffee MR** sample showcases an application of mixed reality (MR) within Power Apps, using Business Central data.

This scenario is designed for field workers at a coffee machine installation company, aiming to simplify the measurement process and offer a visual preview of the final product placement using mixed reality.

The sample contains a Business Central extension, a Power App and a Power Automate flow. The extension augments the Business Central data model with additional fields and APIs, while the Power App and Power Automate flow utilize the new capabilities to provide a mixed reality experience for the user.

 The extension adds the appropriate APIs and extends the items table with the following fields:

  - *IsAvialableForFieldWorker*: Indicates if the item should appear in the app.
  - *DetailedDescription*: Optional fields offering comprehensive details about the coffee machines.
  - *3DModel*: A blob containing a 3dModel of the item.

Additionally, the BC extension includes a sample data page named **Coffee MR Sample Data**, with a function to generate sample coffee machine models.

There is a simple 3d model included in this repo under [Sample data](https://github.com/andersgMSFT/Coffee-MR/tree/main/Sample%20Data). You can upload this to an item through the item page in BC to try it out in the Power App.

Because this is meant as a demo to showcase the platform's mixed reality capabilities there are a few known limitations in the App that you should be aware of if you want to use this as a starting point for your own app:

- The sample data generator has been tested and optimized for US versions of the platform. Adaptations may be required for different regional settings.
- The generated Invoice uses the first customer from the customer API to simplify the demo flow.
- The labels in the app are currently hardcoded to English. You can see patterns for supporting multiple languages in our [Power Apps Best Practices](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/powerplatform/power-apps-best-practices#set-up-multi-language-support-with-business-central)


## Try the sample yourself

Follow the steps in the [Try our sample apps](https://github.com/microsoft/AL-Go/blob/PPPreview/Scenarios/TryPowerPlatformSamples.md) guide to try the sample with your own tenant.

## Per Tenant Extension Project

This repository is based on the AL-Go for GitHub PTE template, which is available [here](https://github.com/microsoft/AL-Go-PTE).

## Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us the rights to use your contribution. For details, visit https://cla.opensource.microsoft.com.

When you submit a pull request, a CLA bot will automatically determine whether you need to provide a CLA and decorate the PR appropriately (e.g., status check, comment). Simply follow the instructions provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

## Trademarks

This project may contain trademarks or logos for projects, products, or services. Authorized use of Microsoft trademarks or logos is subject to and must follow.
[Microsoft's Trademark & Brand Guidelines](https://www.microsoft.com/en-us/legal/intellectualproperty/trademarks/usage/general).
Use of Microsoft trademarks or logos in modified versions of this project must not cause confusion or imply Microsoft sponsorship.
Any use of third-party trademarks or logos are subject to those third-party's policies.