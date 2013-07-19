bookstore = 
    books: {}
    populate: (chapterstore, sectionstore)->
        chapterstore.populate(1, sectionstore)
        chapterstore.populate(2, sectionstore)
        chapterstore.populate(3, sectionstore)
        @books[1] = 
            id: 1
            title: "Book Title 1" 
            subtitle: "Book Subtitle 1" 
            cover: 
                imageurl: "http://www.imagebank.com/image1"
                height: 25
                width: 20

            toc: 
                heading: "Table of Contents"
                subheading: "TOC"
                content: "<h2> This is TOC </h2>"

            author: "Author of Book 1" 
            status: "In Progress"
            version: "1.1.1"
            metadata: "more meta data"
            chapters: chapterstore.findByBookId 1
        @books[2] = 
            id: 2
            title: "Book Title" + 2
            subtitle: "Book Subtitle 2" 
            cover: 
                imageurl: "http://www.imagebank.com/image1"
                height: 25
                width: 20

            toc: 
                heading: "Table of Contents"
                subheading: "TOC"
                content: "<h2> This is TOC </h2>"

            author: "Author of Book" + 2
            status: "In Progress"
            version: "1.1.2" 
            metadata: "more meta data"
            chapters: chapterstore.findByBookId 2
        @books[3] = 
            id: 3
            title: "Book Title 3" 
            subtitle: "Book Subtitle 3" 
            cover: 
                imageurl: "http://www.imagebank.com/image1"
                height: 25
                width: 20

            toc:
                heading: "Table of Contents"
                subheading: "TOC"
                content: "<h2> This is TOC </h2>"

            author: "Author of Book 3"
            status: "In Progress"
            version: "1.1.3" 
            metadata: "more meta data"
            chapters: chapterstore.findByBookId 3
         @lastId = 3

        find: (id) ->
            @books[id]

        findAll: ->
            @books

        create: (model) ->
            @lastId++
            model.set "id", @lastId
            @books[@lastId] = model
            model

        update: (model) ->
            @books[model.id] = model
            model

        destroy: (id) ->
            delete @books[id]

exports.bookstore = bookstore
  
