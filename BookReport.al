report 50100 BooksReport
{
    DefaultLayout = Word;
    WordLayout = 'BookReport.docx';
    Caption = 'My Bookshelf';
    
    dataset
    {
        dataitem(DataItemName; Book)
        {
            column(No_; "No.")
            {
                IncludeCaption = true;
            }
            column(Title;Title)
            {
                IncludeCaption = true;
            }
            column(Author;Author)
            {
                IncludeCaption = true;
            }
            column(Page_count;"Page count")
            {
                IncludeCaption = true;
            }
        }
    }
    }