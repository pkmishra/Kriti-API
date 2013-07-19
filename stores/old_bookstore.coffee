bookstore =
    books: {}
    populate: ->
        @books[1] =
          id: 1
          name: "CHATEAU DE SAINT COSME"
          year: "2009"
          author: "Mr. X"
          description: "The aromas of fruit and spice give one a hint of the light drinkability of this lovely wine, which makes an excellent complement to fish dishes."
          chapters:[{
              id: 1
              name: "First Chapter of Book1"
              description: "First Chapter Book1 Description"
              sections: [{
                  id: 1
                  name: "Book1 First Chapter Section1"
                  description: "Book1 Chapter1 Section1 Description"
                  pages: [{
                              id:1
                              name: "Book1 Chapter1 Section1 Page1"
                              description: "Book1 Chapter1 Section1 Page1 Description"
                          },{
                              id:2
                              name: "Book1 Chapter1 Section1 Page2"
                              description: "Book1 Chapter1 Section1 Page2 Description"
                          },{
                              id:3
                              name: "Book1 Chapter1 Section1 Page3"
                              description: "Book1 Chapter1 Section1 Page3 Description"
                          }
                  ]

              },{
                  id: 2
                  name: "Book1 First Chapter Section2"
                  description: "Book1 Chapter1 Section1 Description"
                  pages: [{
                              id:1
                              name: "Book1 Chapter1 Section2 Page1"
                              description: "Book1 Chapter1 Section1 Page1 Description"
                          },{
                              id:2
                              name: "Book1 Chapter1 Section2 Page2"
                              description: "Book1 Chapter1 Section1 Page2 Description"
                          },{
                              id:3
                              name: "Book1 Chapter1 Section2 Page3"
                              description: "Book1 Chapter1 Section1 Page3 Description"
                          }
                  ]

              }]
          },{ 
               id: 2
               name: "Chapter2 of Book1"
               description: "Chapter2 Book1 Description"
               sections: [{
                  id: 1
                  name: "Book1 Chapter2 Section1"
                  description: "Book1 Chapter1 Section1 Description"
                  pages: [{
                              id:1
                              name: "Book1 Chapter2 Section1 Page1"
                              description: "Book1 Chapter1 Section1 Page1 Description"
                          },{
                              id:2
                              name: "Book1 Chapter2 Section1 Page2"
                              description: "Book1 Chapter1 Section1 Page2 Description"
                          },{
                              id:3
                              name: "Book1 Chapter2 Section1 Page3"
                              description: "Book1 Chapter1 Section1 Page3 Description"
                  }]

               },
               {
                  id: 2
                  name: "Book1 Chapter2 Section2"
                  description: "Book1 Chapter1 Section1 Description"
                  pages: [{
                                  id:1
                                  name: "Book1 Chapter2 Section2 Page1"
                                  description: "Book1 Chapter1 Section1 Page1 Description"
                              },{
                                  id:2
                                  name: "Book1 Chapter2 Section2 Page2"
                                  description: "Book1 Chapter1 Section1 Page2 Description"
                              },{
                                  id:3
                                  name: "Book1 Chapter2 Section2 Page3"
                                  description: "Book1 Chapter1 Section1 Page3 Description"
                              }
                  ]

               }]
          }]
         @books[2] =
          id: 2
          name: "CHATEAU DE SAINT BOOK2"
          year: "2010"
          author: "Mr. y"
          description: "The aromas of fruit and spice give one a hint of the light drinkability of this lovely wine, which makes an excellent complement to fish dishes."
          chapters:[{
              id: 1
              name: "First Chapter of Book2"
              description: "First Chapter Book1 Description"
              sections: [{
                  id: 1
                  name: "Book2 First Chapter Section1"
                  description: "Book1 Chapter1 Section1 Description"
                  pages: [{
                              id:1
                              name: "Book2 Chapter1 Section1 Page1"
                              description: "Book1 Chapter1 Section1 Page1 Description"
                          },{
                              id:2
                              name: "Book2 Chapter1 Section1 Page2"
                              description: "Book1 Chapter1 Section1 Page2 Description"
                          },{
                              id:3
                              name: "Book2 Chapter1 Section1 Page3"
                              description: "Book1 Chapter1 Section1 Page3 Description"
                          }
                  ]

              },{
                  id: 2
                  name: "Book2 First Chapter Section2"
                  description: "Book2 Chapter1 Section1 Description"
                  pages: [{
                              id:1
                              name: "Book2 Chapter1 Section2 Page1"
                              description: "Book2 Chapter1 Section1 Page1 Description"
                          },{
                              id:2
                              name: "Book2 Chapter1 Section2 Page2"
                              description: "Book2 Chapter1 Section1 Page2 Description"
                          },{
                              id:3
                              name: "Book2 Chapter1 Section2 Page3"
                              description: "Book2 Chapter1 Section1 Page3 Description"
                          }
                  ]

              }]
          },{ 
               id: 2
               name: "Chapter2 of Book2"
               description: "Chapter2 Book2 Description"
               sections: [{
                  id: 1
                  name: "Book2 Chapter2 Section1"
                  description: "Book2 Chapter2 Section1 Description"
                  pages: [{
                              id:1
                              name: "Book2 Chapter2 Section1 Page1"
                              description: "Book2 Chapter2 Section1 Page1 Description"
                          },{
                              id:2
                              name: "Book2 Chapter2 Section1 Page2"
                              description: "Book2 Chapter2 Section1 Page2 Description"
                          },{
                              id:3
                              name: "Book2 Chapter2 Section1 Page3"
                              description: "Book2 Chapter2 Section1 Page3 Description"
                  }]

               },
               {
                  id: 2
                  name: "Book2 Chapter2 Section2"
                  description: "Book2 Chapter2 Section1 Description"
                  pages: [{
                                  id:1
                                  name: "Book2 Chapter2 Section2 Page1"
                                  description: "Book2 Chapter2 Section1 Page1 Description"
                              },{
                                  id:2
                                  name: "Book2 Chapter2 Section2 Page2"
                                  description: "Book2 Chapter2 Section1 Page2 Description"
                              },{
                                  id:3
                                  name: "Book2 Chapter2 Section2 Page3"
                                  description: "Book2 Chapter2 Section1 Page3 Description"
                              }
                  ]

               }]
          }]

        @lastId = 2

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
    
    findAllChapters: (bookid) ->
        @books[bookid].chapters
    
    findChapter: (bookid, chapterid) ->
       id = parseInt chapterid,10
       return if isNaN id
       result = (@findAllChapters bookid).filter (chapter) ->
                   chapter.id == id
       result[0] if result.length > 0
    updateChapter: (data) ->
        tempid = 1

    findAllSections: (bookid, chapterid) ->
        (@findChapter bookid, chapterid).sections
    
    findSection: (bookid, chapterid, sectionid) ->
        id = parseInt sectionid
        return if isNaN id
        result = (@findAllSections bookid, chapterid).filter (section) ->
                      section.id == id
        result[0] if result.length > 0
    findAllPages: (bookid, chapterid, sectionid) ->
        (@findSection bookid, chapterid, sectionid).pages
    
    findPage: (bookid, chapterid, sectionid, pageid) ->
        id = parseInt pageid
        return if isNaN id
        result = (@findAllPages bookid, chapterid, sectionid).filter (page) ->
                      page.id == id
        result[0] if result.length > 0
   
exports.bookstore = bookstore
