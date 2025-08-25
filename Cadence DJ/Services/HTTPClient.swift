//
//  HTTPClient.swift
//  Cadence DJ
//
//  Created by Daniel Luo on 8/24/25.
//

import Foundation

/// Client that handles HTTP transport.
protocol HTTPClient {
    func get(
        _ url: URL,
        headers: [String: String],
        body: Data?
    ) async throws -> Data

    func post(
        _ url: URL,
        headers: [String: String],
        body: Data?
    ) async throws -> Data
}

enum HTTPError: Error {
    case invalidResponse
    case statusCode(Int)
    case urlSession(URLError)
    case unknown(Error)
}

struct HTTPClientImpl: HTTPClient {
    private enum HTTPMethod: String {
        // add more as needed...
        case get = "GET"
        case post = "POST"
    }

    func get(
        _ url: URL,
        headers: [String: String] = [:],
        body: Data? = nil
    ) async throws -> Data {
        try await request(httpMethod: .get, url: url, headers: headers, body: body)
    }

    func post(
        _ url: URL,
        headers: [String: String] = [:],
        body: Data? = nil
    ) async throws -> Data {
        try await request(httpMethod: .post, url: url, headers: headers, body: body)
    }

    private func request(
        httpMethod: HTTPMethod,
        url: URL,
        headers: [String: String] = [:],
        body: Data? = nil
    ) async throws -> Data {
        do {
            var request = URLRequest(url: url)
            request.httpMethod = httpMethod.rawValue
            request.httpBody = body

            headers.forEach { key, value in
                request.setValue(value, forHTTPHeaderField: key)
            }

            let (data, response) = try await URLSession.shared.data(for: request)

            guard let httpResponse = response as? HTTPURLResponse else {
                throw HTTPError.invalidResponse
            }

            guard (200..<300).contains(httpResponse.statusCode) else {
                throw HTTPError.statusCode(httpResponse.statusCode)
            }

            return data
        } catch let error as URLError {
            throw HTTPError.urlSession(error)
        } catch {
            throw HTTPError.unknown(error)
        }
    }
}

