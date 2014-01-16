module.exports = (index) ->

  flatui = /(href|src)\=.+\/flat-ui\/(.+)\"/g
  index  = index.replace flatui, "$1=\"vendor/flat-ui/$2\""

  common = /(href|src)\=.+\/common-files\/(.+)\"/g
  index  = index.replace common, "$1=\"vendor/startup/$2\""

  return index