//  PlanetError.swift
//
//  Created by Jignesh Patel on 28/07/21.

public struct PlanetError: Error {
    public static let somethingWentWrongMessage = "Something went wrong."
    public var errorCode: String
    public var title: String
    public var message: String

    public static let somethingWentWrongError = PlanetError(errorCode: "", title: somethingWentWrongMessage, message: "")

    public init(errorCode: String, title: String, message: String) {
        self.errorCode = errorCode
        self.title = title
        self.message = message
    }
}
