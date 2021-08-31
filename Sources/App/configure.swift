import Vapor

// configures your application
public func configure(_ app: Application) throws {
  let archiveURL = URL(fileURLWithPath: "\(app.directory.publicDirectory)SpiderSense.doccarchive")
  app.middleware.use(VaporDocCMiddleware(
    archivePath: archiveURL,
    redirectRoot: "documentation/"
  ))
}
