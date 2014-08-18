module.exports = (grunt) ->
    grunt.initConfig
        jade:
            compile:
                options:
                    data:
                        debug: false
                    pretty: true
                files:
                    "index.html": ["index.jade"]

    grunt.loadNpmTasks('grunt-contrib-jade')
    grunt.registerTask('default', ['jade'])
