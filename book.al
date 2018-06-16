table 50100 Book
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1;"No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
        }
       field(2; Title; Text[50])
       {
           caption = 'Title';           
           DataClassification = ToBeClassified;
       }
       field(3; Author; Text[50])
       {
           caption = 'Author';           
           DataClassification = ToBeClassified;
       }
       field(4; Hardcover; Boolean)
       {
           caption = 'Hardcover';           
           DataClassification = ToBeClassified;
       }
       field(5; "Page count"; Integer)
       {
           caption = 'Page Count';
           DataClassification = ToBeClassified;
       }
    }
    
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    
}