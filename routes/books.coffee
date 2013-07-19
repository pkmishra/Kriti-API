module.exports = (app) ->
    Book = app.Book
    Chapter = app.Chapter
    Section = app.Section
    BookTemplate = app.BookTemplate

    app.get '/books', (req, res) ->
        Book.find (err, data) ->
            # if res.contentType = 'text/plain' to be used, use
            # JSON.stringify data else directly send back json
             res.send data

    app.post '/books', (req, res) ->
      if req.params.fromTemplate is "1"
        templateId = req.params.templateId
        BookTemplate.findById templateId, (err, template) ->
            res.send '{success:false}' unless template or err
            book = new Book {
                title: template.title
                subtitle: template.subtitle
                author: template.owner
                status: 'in-progress'
                version: '0.1'
                cover: template.cover
                toc: template.toc
            }
            book.save()
            for chapter in template.chapters
              newChapter = new Chapter {
                  title : chapter.title
                  name : chapter.name
                  summary : chapter.summary
                  book_id : book._id
              }
              newChapter.save()
              for section in chapter.sections
                  newSection = new Section {
                      name: section.name
                      title: section.title
                      order: section.order
                      content: section.content
                      contentType: section.contentType
                      chapter_id: newChapter._id
                      book_id: book._id
                  }
                  newSection.save()
            res.send book
      else 
        book = new Book JSON.parse req.body
        book.save (err, data)->
           console.log 'created' unless err
        res.send(book)

    app.del '/books/:bookid', (req, res, next) ->
        Book.findById req.params.bookid, (err, book) ->
            res.send next '{success:false}' if !book || err
            book.remove ->
                res.send 'success:true'
    app.put 'books/:bookid', (req, res, next) ->
        Book.findById req.params.bookid, (err, book) ->
            res.send next '{success:false}' if !book || err
            updatedBook = JSON.parse req.body
            book.title = updatedBook.title
            book.subtitle = updatedBook.subtitle
            book.author = updatedBook.author
            book.status = updatedBook.status
            book.version = updatedBook.version
            book.save (err, data) ->
              res.send next '{success:false}' if !book || err
              res.send book unless err

    app.get '/books/:bookid', (req, res) ->
        Book.findById req.params.bookid, (err, book) ->
            res.send book

    app.get '/books/:bookid/chapters', (req, res) ->
        Chapter.find {book_id : req.params.bookid}, (err, chapters) ->
            res.send chapters
    app.post '/books/:bookid/chapters', (req, res) ->
        if req.params.fromTemplate is "1"
          templateId = req.params.templateId
          BookTemplate.findById templateId, (err, template) ->
            res.send '{success:false}' unless template or err
            chapter = template.chapters[0]
            newChapter = new Chapter {
                  title : chapter.title
                  name : chapter.name
                  summary : chapter.summary
                  book_id : req.params.bookid
            }
            newChapter.save()
            for section in chapter.sections
                newSection = new Section {
                      name: section.name
                      title: section.title
                      order: section.order
                      content: section.content
                      contentType: section.contentType
                      chapter_id: newChapter._id
                      book_id: req.params.bookid
                }
                newSection.save()
            res.send newChapter
        else 
          chapter = new Chapter JSON.parse req.body
          chapter.save (err, data)->
            console.log 'created' unless err
            res.send(chapter)
            
    app.get '/books/:bookid/chapters/:chapterid', (req, res) ->
        Chapter.findById req.params.chapterid , (err, chapter) ->
                res.send chapter
    app.put '/books/:bookid/chapters/:chapterid', (req, res, next) ->
        Chapter.findById req.params.chapterid , (err, chapter) ->
            res.send next '{success:false}' if !chapter || err
            updatedChapter = JSON.parse req.body
            chapter.title = updatedChapter.title
            chapter.name = updatedChapter.name
            chapter.summary = updatedChapter.summary
            chapter.book_id = updatedChapter.book_id
            chapter.save (err, data)->
              res.send next '{success:false}' if err
              res.send chapter

    app.del '/books/:bookid/chapters/:chapterid', (req, res) ->
        Chapter.findById req.params.chapterid, (err, chapter) ->
            res.send next '{success:false}' if !chapter || err
            book.remove ->
              res.send '{success:true}'


    app.get '/books/:bookid/chapters/:chapterid/sections', (req, res) ->
        Section.find {book_id: req.params.bookid, chapter_id: req.params.chapterid},  (err, sections) ->
            res.send sections

    app.post '/books/:bookid/chapters/:chapterid/sections', (req, res) ->
        if req.params.fromTemplate is "1"
          templateId = req.params.templateId
          BookTemplate.findById templateId, (err, template) ->
            res.send '{success:false}' unless template or err
            section = template.chapters[0].sections[0]
            newSection = new Section {
                  name: section.name
                  title: section.title
                  order: section.order
                  content: section.content
                  contentType: section.contentType
                  chapter_id:req.params.chapterid 
                  book_id: req.params.bookid
            }
            newSection.save()
            res.send newSection
        else 
          section = new Section JSON.parse req.body
          section.save (err, data)->
            console.log 'created' unless err
            res.send section

    app.get '/books/:bookid/chapters/:chapterid/sections/:sectionid', (req, res) ->
        Section.findById req.params.sectionid, (err, section) ->
            res.send section

    app.del '/books/:bookid/chapters/:chapterid/sections/:sectionid', (req, res) ->
        Section.findById req.params.sectionid, (err, section) ->
            res.send next '{success:false}' if !section || err
            section.remove ->
              res.send '{success:true}'


    app.put '/books/:bookid/chapters/:chapterid/sections/:sectionid', (req, res, next) ->
        Section.findById req.params.sectionid, (err, section) ->
            updatedSection = JSON.parse req.body
            section.name = updatedSection.name
            section.title = updatedSection.title
            section.order = updatedSection.order
            section.content = updatedSection.content
            section.contentType = updatedSection.contentType
            section.book_id = updatedSection.book_id
            section.chapter_id = updatedSection.chapter_id
            section.save (err, data)->
              res.send next '{success:false}' if !section || err
              res.send section unless err


   

   
