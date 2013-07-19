chapterstore = 
    chapters: {}
    populate: (bookid, sectionstore)->
        sectionstore.populate(bookid, 1)
        sectionstore.populate(bookid, 2)
        sectionstore.populate(bookid, 3)
        @chapters[1] =
            id:1
            parentid: bookid
            name: "Book" + bookid + " Chapter 1" 
            title: "Chapter 1 for Book 1"  
            summary: "<i> This is sample summary for chapter 1"
            sections: sectionstore.findByChapterId 1         
        @chapters[2] =
            id:2
            parentid: bookid
            name: "Book" + bookid + " Chapter 2" 
            title: "Chapter 2 for Book" 
            summary: "<i> This is sample summary for chapter 2"
            sections: sectionstore.findByChapterId 2           
        @chapters[3] =
            id:3
            parentid: bookid
            name: "Book" + bookid + " Chapter 3" 
            title: "Chapter 3 for Book"
            summary: "<i> This is sample summary for chapter 3" 
            sections: sectionstore.findByChapterId 3          
        @lastId = 3
    find: (id) ->
        @chapters[id]

    findAll: ->
        @chapters

    findByBookId: (bookid) ->
        for chapter in @chapters
            return chapter if chapter.parentid == bookid
    create: (model) ->
        @lastId++
        model.set "id", @lastId
        @chapters[@lastId] = model
        model

    update: (model) ->
        @chapters[model.id] = model
        model

    destroy: (id) ->
        delete @chapters[id]

exports.chapterstore = chapterstore

