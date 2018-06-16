page 50101 BookList
{
  PageType = List;
  SourceTable = Book;
  CardPageId = BookCard;
  Editable = false;

  layout
  {
    area(content)
    {
      repeater(General)
      {
        field("No.";"No.")
        {
          ApplicationArea = All;
        }
        field(Title;Title)
        {
          ApplicationArea = All;
        }
        field(Author;Author)
        {
          ApplicationArea = All;
        }
      }
    }
  }
  actions
  {
    area(Reporting)
    {
      action(Print)
      {
        ApplicationArea = All;

        trigger OnAction()var myRep: Report BooksReport;
        begin
          myRep.Run();
        end;
      }
      action(Export)
      {
        ApplicationArea = All;

        trigger OnAction()begin
          Xmlport.run(50100, false, false);
        end;
      }
      action(textdemo)
      {
        ApplicationArea = All;

        trigger OnAction()begin
          Codeunit.Run(50103);
        end;
      }
    }
  }
}


