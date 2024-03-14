//
//  AsyncPreview.swift
//  Circuit
//
//  Created by TaimurAyaz on 2024-03-09.
//

import Foundation
import SwiftUI

public struct AsyncPreview<V: View, M>: View {
    
    public var view: (M) -> V
    public var model: () async throws -> M?
    
    @State private var internalModel: M?
    @State private var error: Error?
    
    public var body: some View {
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
    
    public init(view: @escaping (M) -> V, model: @escaping () async throws -> M?) {
        self.view = view
        self.model = model
    }
    
    @ViewBuilder
    private var internalBody: some View {
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
