//
//  TitleView.swift
//  Currency App
//
//  Created by Francesco Micheli on 15/09/2023.
//

import SwiftUI

struct TitleView: View {
    var body: some View{
        HStack {
            Text("Dubai Converter")
                .font(.title)
                .bold()
            Image(systemName: "dollarsign.circle.fill")
                .font(.title)
                .bold()
            Image(systemName: "eurosign.circle.fill")
                .font(.title)
                .bold()
        }
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
