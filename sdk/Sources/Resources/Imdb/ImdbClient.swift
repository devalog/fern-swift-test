import Foundation

public final class ImdbClient: Sendable {
    private let httpClient: HTTPClient

    public init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Add a movie to the database
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func createMovie(request: CreateMovieRequest, requestOptions: RequestOptions? = nil) async throws -> MovieId {
        return try await httpClient.performRequest(
            method: .post,
            path: "/movies/create-movie",
            body: request,
            requestOptions: requestOptions,
            responseType: MovieId.self
        )
    }

    /// Retrieve a movie from the database based on the ID
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func getMovie(id: String, requestOptions: RequestOptions? = nil) async throws -> Movie {
        return try await httpClient.performRequest(
            method: .get,
            path: "/movies/\(id)",
            requestOptions: requestOptions,
            responseType: Movie.self
        )
    }
}