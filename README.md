# Vapor + DocC test

This is a test repo with the objective of showing the following PoC:

- Programmatically building a DocC archive
- Deploying the archive to a (local) webserver
- Serving it as a webapp (locally)

## How to try it

```sh
./build-docs-and-serve.sh /path/to/some/Workspace.xcworkspace MainSchemeName
```

For example:

```sh
./build-docs-and-serve.sh ../ios-libs-monorepo/SpiderSense/SpiderSense.xcworkspace SpiderSense
```

This will:

- Build the documentation of the given scheme
- Move it to the "Public" directory of this webserver
- Run the webserver

If you visit http://127.0.0.1/ you will be automatically redirected to the root of the DocC archive.