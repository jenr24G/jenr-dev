module type DreamRenderable = sig
  type static_props
  type request_props
  val render : static_props -> request_props -> string
  val http_method : string -> Dream.handler -> Dream.route
  val sub_uri : string
  val props_of_request : Dream.request -> request_props
end;;

module Make(Widget : DreamRenderable) = struct
  type static_props = Widget.static_props
  let route (path : string) (static_props : static_props) =
    Widget.http_method (path ^ Widget.sub_uri)
    (fun request ->
      let request_props = Widget.props_of_request request in
      Widget.render static_props request_props
    |> Dream.html)
end;;