//
//  SectionGeneralSettingsView.swift
//  GeneralAboutPageModule
//
//  Created by @algoreadme on 31/07/25.
//

import SwiftUI

struct SectionGeneralSettingsView: View {
    @State private(set) var isShowTechnology: Bool = false
    @State private(set) var isOpenDeveloper: Bool = false
    
    init(isShowTechnology: Bool, isOpenDeveloper: Bool) {
        self.isShowTechnology = isShowTechnology
        self.isOpenDeveloper = isOpenDeveloper
    }
    
    var body: some View { render() }
    
    private func render() -> some View {
        Section(header: Text("General Settings")) {
            Toggle(isOn: $isShowTechnology) {
                Text("Technology stack")
            }
            
            Toggle(isOn: $isOpenDeveloper) {
                Text("Developer info")
            }
        }
    }
}
