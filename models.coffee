defineModels = (mongoose, fn) ->
    Schema = mongoose.Schema
    ObjectId = Schema.ObjectId
    Section = new Schema(
        name:  { type: String, required: true, trim: true }
        title: { type: String, required: true, trim: true }
        order:  { type: Number, required: true }
        content:  { type: String, required: true, trim: true }
        contentType:  { type: String, enum:['text-content', 'copyright', 'dedication', 'forward'], default:'text-content' }
        chapter_id: {type:ObjectId, required:true}
        book_id: {type:ObjectId, required:true}
    )
    Chapter = new Schema(
        name: { type: String, required: true, trim: true }
        title: { type: String, required: true, trim: true }
        summary: { type: String}
        book_id: {type:ObjectId, required:true}
    )
    Book = new Schema(
        title: { type: String, required: true, trim: true } 
        subtitle: { type: String,  trim: true } 
        cover:{
            imageurl: { type: String}  
            height: { type: Number} 
            width: { type: Number}
                
        }
        toc:{
            heading: { type: String} 
            subheading: { type: String} 
            content: { type: String} 
        }
        author: { type: String, required: true, trim: true } 
        status: { type: String, enum:['in-progress', 'under-review', 'publish-ready', 'distribution-ready'] }
        version: { type: String, required: true, trim: true }
        metadata: {
            totalpages:  { type: Number}
            assetLocation: {type:String}
        }
    )
    SectionTemplate = new Schema(
        name:  { type: String, default: 'Section Name', required: true, trim: true }
        title: { type: String, default: 'Untitled Section', required: true, trim: true }
        order:  { type: Number, default: 0,  required: true }
        content:  { type: String,default:'Lorem ipsum dolor rutur amet. Integer id dui sed odio imperd feugiat et nec ipsum. Ut rutrum massa non ligula facilisis in ullamcorper purus dapibus.', required: true, trim: true }
        contentType:  { type: String, enum:['text-content', 'copyright', 'dedication', 'forward'], default:'text-content'}

    )
    ChapterTemplate = new Schema(
        name: { type: String, default:'Chapter Name', required: true, trim: true }
        title: { type: String, default: 'Untitled Chapter', required: true, trim: true }
        summary: { type: String}
        sections: [SectionTemplate]

    )
    BookTemplate = new Schema(
        name: {type:String, required: true}
        owner: {type:String, required:true}
        isDefault: {type:Boolean, default:true, required:true}
        title: { type: String, default: 'Untitled Book', required: true, trim: true } 
        subtitle: { type: String, default: 'Book Subtitle',  trim: true } 
        cover:{
            imageurl: { type: String}  
            height: { type: Number} 
            width: { type: Number}
        }
        toc:{
            heading: { type: String} 
            subheading: { type: String} 
            content: { type: String} 
        }
        chapters: [ChapterTemplate]
    )
    mongoose.model 'Section', Section
    mongoose.model 'Chapter', Chapter
    mongoose.model 'Book', Book
    mongoose.model 'SectionTemplate', SectionTemplate
    mongoose.model 'ChapterTemplate', ChapterTemplate
    mongoose.model 'BookTemplate', BookTemplate
    fn()

exports.defineModels = defineModels
