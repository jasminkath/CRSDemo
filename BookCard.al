page 50100 BookCard
{
    PageType = Card;
    SourceTable = Book;
    
    layout
    {
        area(content)
        {
            group(General)
            {
                caption = 'General';
                field("No."; "No.")
                {
                    ApplicationArea = All;
                }
                field(Title;Title)
                {
                    ApplicationArea = All;
                }                
            }
            group(Details)
            {
                caption = 'Details';    
                field(Author;Author)
                {
                    ApplicationArea = All;
                }
                field(Hardcover;Hardcover)
                {
                    ApplicationArea = All;
                }
                field("Page count";"Page count")
                {
                    ApplicationArea = All;
                }
            }
        }
    }    
}