//
//  GeneralAboutViewModel.swift
//  GeneralAboutPageModule
//
//  Created by @algoreadme on 30/07/25.
//

import Foundation
import Combine
import SwiftUICore
import AlgoreadMePackageData

@MainActor public class GeneralAboutViewModel: ObservableObject {
    @Published private(set) var aboutAppsModels: AboutAppsModels
    @Published private(set) var aboutDeveloperModel: AboutDeveloperModel
    @Published private(set) var aboutPackageData: AboutDataModule
    
    
    public init(
        aboutAppsModels: AboutAppsModels,
        aboutDeveloperModel: AboutDeveloperModel,
        aboutPackageData: AboutDataModule = AboutDataModule.shared,
        baseUrl: String
    ) {
        print("[*] baseUrl-about", baseUrl)
        self.aboutAppsModels = aboutAppsModels
        self.aboutDeveloperModel = aboutDeveloperModel
        self.aboutPackageData = aboutPackageData
        aboutPackageData.register(
            baseUrl: baseUrl
        )
        Task { @MainActor in
            await getPostAbout()
        }
    }
    
    
    @MainActor public func getPostAbout() async {
        do {
            let response = try await aboutPackageData.aboutRepository?.postAbout()
            print("[*] test response: \(response)")
        } catch {
            
        }
        
    }
    
    public func isProductImageNotEmpty() -> Bool {
        return aboutAppsModels.productImage != nil
    }
}

public struct AboutAppsModels {
    public var productImage: Image?
    public var productName: String
    public var compatibility: String
    public var technology: String
    public var version: String
    
    public init(
        productImage: Image?,
        productName: String,
        compatibility: String,
        technology: String,
        version: String
    ) {
        self.productImage = productImage
        self.productName = productName
        self.compatibility = compatibility
        self.technology = technology
        self.version = version
    }
    
    static func empty() -> AboutAppsModels {
        return .init(
            productImage: Image(""),
            productName: "",
            compatibility: "",
            technology: "",
            version: ""
        )
    }
}

public struct AboutDeveloperModel {
    public var name: String
    public var github: String
    public var linkedIn: String
    
    public init(
        name: String,
        github: String,
        linkedIn: String
    ) {
        self.name = name
        self.github = github
        self.linkedIn = linkedIn
    }
    
    static func empty() -> AboutDeveloperModel {
        return .init(
            name: "",
            github: "",
            linkedIn: ""
        )
    }
}
