//
//  GeneralAboutView.swift
//  GeneralAboutPageModule
//
//  Created by @algoreadme on 30/07/25.
//

import SwiftUI

public struct GeneralAboutView: View {
    @ObservedObject private(set) var viewModel: GeneralAboutViewModel
    @State private(set) var isShowTechnology: Bool = false
    @State private(set) var isOpenDeveloper: Bool = false
    
    public init(
        viewModel: GeneralAboutViewModel,
        isShowTechnology: Bool = false,
        isOpenDeveloper: Bool = false
    ) {
        self.viewModel = viewModel
        self.isShowTechnology = isShowTechnology
        self.isOpenDeveloper = isOpenDeveloper
    }
    
    public var body: some View { render() }
    
    private func renderHeader() -> some View {
        VStack(alignment: .center, spacing: 5) {
            if viewModel.isProductImageNotEmpty() {
                viewModel.aboutAppsModels.productImage?
                    .resizable()
                    .scaledToFit()
                    .padding(.top)
                    .frame(width: 100, height: 100, alignment: .center)
                    .shadow(color: Color("ColorBlackTransparentLight"), radius: 8, x: 0, y: 4)
            }
            
            Text(viewModel.aboutAppsModels.productName.uppercased())
                .font(.system(.title, design: .serif))
                .fontWeight(.bold)
                .foregroundColor(Color.black)
        }
        .padding()
    }
    
    private func renderItemSection(
        title: String,
        value: String
    ) -> some View {
        HStack {
            Text(title).foregroundColor(Color.gray)
            Spacer()
            Text(value)
        }
    }
    
    private func renderSectionGeneralSettings() -> some View {
        Section(header: Text("General Settings")) {
            Toggle(isOn: $isShowTechnology) {
                Text("Technology stack")
            }
            
            Toggle(isOn: $isOpenDeveloper) {
                Text("Developer info")
            }
        }
    }
    
    private func renderSectionProduct() -> some View {
        Section(header: Text("Application")) {
            renderItemSection(title: "Product", value: viewModel.aboutAppsModels.productName)
            if isShowTechnology {
                renderItemSection(
                    title: "Compatibility",
                    value: viewModel.aboutAppsModels.compatibility
                )
                renderItemSection(
                    title: "Technology",
                    value: viewModel.aboutAppsModels.technology
                )
            }
            renderItemSection(title: "Version", value: viewModel.aboutAppsModels.version)
        }
    }
    
    private func renderSectionDeveloper() -> some View {
        Section(header: Text("Developer")) {
            renderItemSection(title: "Name", value: viewModel.aboutDeveloperModel.name)
            renderItemSection(title: "Github", value: viewModel.aboutDeveloperModel.github)
        }
    }
    
    private func renderForm() -> some View {
        Form {
            renderSectionGeneralSettings()
            renderSectionProduct()
            if isOpenDeveloper {
                renderSectionDeveloper()
            }
        }
    }
    
    private func render() -> some View {
        VStack(alignment: .center, spacing: 0) {
            renderHeader()
            renderForm()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralAboutView(
            viewModel:
                GeneralAboutViewModel(
                    aboutAppsModels: .init(
                        productImage: nil,
                        productName: "ShowCaseLevelin",
                        compatibility: "iOS 14",
                        technology: "Swift 6, Combine, SwiftUI, Modular",
                        version: "1.0.0"
                    ),
                    aboutDeveloperModel: .init(
                        name: "Dhika Aditya",
                        github: "https.github.com/DhikaAditya",
                        linkedIn: "https://www.linkedin.com/in/dhika-aditya/"),
                    baseUrl: ""
                )
        )
    }
}
