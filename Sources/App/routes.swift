import Vapor

func routes(_ app: Application) throws {
    
    // http://127.0.0.1:8080
    app.get { req in
        return "It works!"
    }

    // http://127.0.0.1:8080/hello
    app.get("hello") { req -> String in
        return "Hello! World"
    }
    
    // http://127.0.0.1:8080/movies/genre/yourgenre
    app.get("movies", "genre", ":name") { req -> String in
        guard let name = req.parameters.get("name") else {
            throw Abort(.badRequest)
        }
        
        return "The genre was \(name)"
    }
    
    // http://127.0.0.1:8080/year/youryear/genre/yourgenre
    app.get("movies", "year", ":year", "genre", ":genre") { req -> String in
        guard let genre = req.parameters.get("genre"), let year = req.parameters.get("year") else {
            throw Abort(.badRequest)
        }
        
        return "The genre was \(genre) and the year was \(year)"
    }
    
    // http://127.0.0.1:8080/foo/anything/baaz - Anything Route
    app.get("foo", "*", "baaz") { req -> String in
        return "Anything Route"
    }
    
    // http://127.0.0.1:8080/god/anything - Catch All Routes
    app.get("god", "**") { req -> String in
        return "All Case route"
    }
    
    // http://127.0.0.1:8080/search?keyword=toys&page=12
    app.get("search") { req -> String in
        
        
        return "All Case route"
    }
}
