// app/javascript/packs/application.js

// Importar bibliotecas necessárias
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

// Importar Bootstrap e estilos
console.log("Tentando importar Bootstrap e estilos");
import "bootstrap"
import "../stylesheets/application.scss"

// Inicializar bibliotecas
Rails.start()
Turbolinks.start()
ActiveStorage.start()

// Adicionar log para verificação
console.log("JavaScript está carregado e funcionando");
