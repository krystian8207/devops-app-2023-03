# https://docs.posit.co/connect/2021.10.0/admin/getting-started/
rsconnect::addServer("http://3.69.105.222:3939/__api__", "dev")
rsconnect::connectApiUser(
  server = "dev",
  account = "krystian",
  apiKey = Sys.getenv("CONNECT_API_KEY")
)
rsconnect::deployApp(
  appName = "cool_app",
  appId = 3,
  appFiles = c("app.R", "NAMESPACE", "DESCRIPTION", "R")
)
