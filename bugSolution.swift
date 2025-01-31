func fetchData() async throws -> Data {
    let (data, response) = try await URLSession.shared.data(from: url)
    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
        throw URLError(.badServerResponse)
    }
    return data
}

//Error handling
Task {
    do {
        let data = try await fetchData()
        //Process Data
    } catch {
        print("Error fetching data: \(error)")
        //More specific error handling can be added here based on the error type
    }
} 