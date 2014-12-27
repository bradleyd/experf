Experf
======

HTTPerf clone in elixir

* followed along http://www.watchsumo.com/posts/introduction-to-elixir-v1-0-0-by-example-i


## Usage

To build, you escript.
```elixir
mix escript.build
```

Then you can call it like so
```bash
./experf --n=4 --url=http://www.example.com
```
```bash
19:04:24.162 [info]  3: success

19:04:24.162 [info]  2: success

19:04:24.162 [info]  4: success

19:04:24.162 [info]  1: success
```
