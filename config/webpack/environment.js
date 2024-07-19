// config/webpack/environment.js
const { environment } = require('@rails/webpacker')

// Verifique se a resolução de node_modules está configurada (deveria ser por padrão)
console.log(environment.resolvedModules);

module.exports = environment
