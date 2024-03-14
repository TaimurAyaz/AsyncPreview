//
//  AsyncPreview.swift
//  Circuit
//
//  Created by Alt on 2024-03-09.
//

import Foundation
import SwiftUI

struct AsyncPreview<V: View, M>: View {
    
    var view: (M) -> V
    var model: () async throws -> M?
    
    @State internal var internalModel: M?
    @State internal var error: Error?
    
    var body: some View {
        internalBody
        .task {
            do {
                self.internalModel = try await model()
            } catch {
                self.error = error
                print(error)
            }
        }
    }
    
    @ViewBuilder
    internal var internalBody: some View {
        if let internalModel {
            view(internalModel)
        }
        else if let error { 
            Label(error.localizedDescription, systemImage: "exclamationmark.triangle.fill")
        }
        else {
            // Note: We need an actual view to trigger the `task` in `body`
            ProgressView().progressViewStyle(.circular)
        }
    }
}
