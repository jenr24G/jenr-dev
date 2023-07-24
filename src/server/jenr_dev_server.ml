(* main server entry point *)
let () =
  Dream.run
  @@ Dream.logger
  @@ Dream.router [

    Dream.get "/"
      (fun _request ->
        Templates.home
        |> Dream.html);

    Dream.get "/hello"
      (fun _request ->
        Templates.hello
        |> Dream.html);

    Dream.get "/static/**"
        (Dream.static "./static")

  ] 