xmlport 50100 ExportBook
{
    Format = Xml;
    FileName = 'mybookshelf.xml';
    Direction = export;
    UseRequestPage = false;
    schema
    {
        textelement(Books)
        {
            tableelement(Book; Book)
            {
                fieldattribute(Number;Book."No."){}
                fieldelement(Title;Book.Title){}
                fieldelement(Author;Book.Author){}
                fieldelement(PageCount;Book."Page count"){}
                fieldelement(Hardcover;Book.Hardcover){}
            }
        }
    }
    

}