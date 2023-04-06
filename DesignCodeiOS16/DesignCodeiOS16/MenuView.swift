//
//  MenuView.swift
//  DesignCodeiOS16
//
//  Created by Steve Hong on 2023/04/05.
//

import SwiftUI

struct MenuView: View {
    @AppStorage("selectedMenu") var selectedMenu: Menu = .compass
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        List(navigationItems) { item in
            Button {
                selectedMenu = item.menu
                dismiss()
            } label: {
                Label(item.title, systemImage: item.icon)
                    .foregroundColor(.primary)
                .padding(8)
            }
        }
        .listStyle(.plain)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
