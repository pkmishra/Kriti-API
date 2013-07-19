sectionstore = 
    sections: {}
    populate: (bookid, chapterid)->
        @sections[1] =
            id:1
            parentid: chapterid
            name: "Book" + bookid + " Chapter" + chapterid + " Section" + 1
            title: "Title for Book" +  "Book" + bookid + " Chapter" + chapterid + " Section" + 1
            order: 1
            type: "text-content"
            content: "<b>This is content for section" +  "sections1.name" + "</b>"
        @sections[2] =
            id:2
            parentid: chapterid
            name: "Book" + bookid + " Chapter" + chapterid + " Section" + 2
            title: "Title for Book" +  "Book" + bookid + " Chapter" + chapterid + " Section" + 2
            order: 2
            type: "text-content"
            content: "<b>This is content for section" +  "sections2.name" + "</b>"
        @sections[3] =
            id:3
            parentid: chapterid
            name: "Book" + bookid + " Chapter" + chapterid + " Section" + 3
            title: "Title for Book" +  "Book" + bookid + " Chapter" + chapterid + " Section" + 3
            order: 3
            type: "text-content"
            content: "<b>This is content for section" +  "sections3.name" + "</b>" 
        @lastId = 3
    find: (id) ->
        @sections[id]

    findAll: ->
        @sections

    findByChapterId: (chapterid)->
        for section in @sections
            return section if section.parentid == chapterid

    create: (model) ->
        @lastId++
        model.set "id", @lastId
        @sections[@lastId] = model
        model

    update: (model) ->
        @sections[model.id] = model
        model

    destroy: (id) ->
        delete @sections[id]

exports.sectionstore = sectionstore
