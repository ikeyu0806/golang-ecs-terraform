package main

import (
  "net/http"
	"text/template"
)

type Page struct {
  Title string
  Message string
}

func handler(w http.ResponseWriter, r *http.Request) {
	page := Page{"Title", "Hello World."}
	tmpl, err := template.ParseFiles("index.html") // ParseFilesを使う
  if err != nil {
    panic(err)
  }
	err = tmpl.Execute(w, page)
  if err != nil {
    panic(err)
  }
}

func main() {
  http.HandleFunc("/", handler) // ハンドラを登録してウェブページを表示させる
  http.ListenAndServe(":80", nil)
}
