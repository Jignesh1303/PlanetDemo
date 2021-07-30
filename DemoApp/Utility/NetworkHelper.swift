//
//  NetworkHelper.swift
//  Created by Jignesh Patel on 28/07/21.
//
import Foundation
let session = URLSession.shared

enum NetworkManager {
    static func get(success: @escaping (PlanetResponse) -> Void, failure: @escaping (_ error: PlanetError) -> Void) {
        let url = "https://swapi.dev/api/planets/"
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = session.dataTask(with: request) { data, _, error in
            if let err = error {
                let dError = PlanetError(errorCode: "", title: err.localizedDescription, message: "")
                if dError.title == "", dError.message == "" {
                    DispatchQueue.main.async {
                        failure(PlanetError.somethingWentWrongError)
                    }
                } else {
                    DispatchQueue.main.async {
                        failure(dError)
                    }
                }
            } else if let data = data, let parsedData = PlanetResponse.model(data){
                DispatchQueue.main.async {
                    success(parsedData)
                }
            } else {
                DispatchQueue.main.async {
                    failure(PlanetError.somethingWentWrongError)
                }
            }
        }
        task.resume()
    }
}
