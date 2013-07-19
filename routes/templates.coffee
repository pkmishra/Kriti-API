module.exports = (app) ->
    BookTemplate = app.BookTemplate
    ChapterTemplate = app.ChapterTemplate
    SectionTemplate = app.SectionTemplate
    app.get '/templates/book?default&username', (req, res) ->
        BookTemplate.findOne {isDefault: (if req.params.default is "1" then true else false), owner: req.params.username},  (err, template) ->
            res.send template if !err

    app.post '/templates/book?:default&username=admin', (req, res) ->
        chapter = new ChapterTemplate 
        chapter.sections.push new SectionTemplate
        template = new BookTemplate {
            name: "Default Template"
            isDefault:(if req.params.default is "1" then true else false), 
            owner:req.params.username
        }
        template.chapters.push chapter
        template.save (err, data) ->
           console.log err if err
           res.send template
