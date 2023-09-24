page 81000 "Dialog Test"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "customer";

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;
                Caption = 'someAction';
                Image = Capacity;
                trigger OnAction()
                var
                    ProgressBarIndicator: Codeunit ProgressBarIndicator;
                    RecordCustomer: Record Customer;
                    RecordCounter: Integer;
                    RecordTotalCounter: Integer;
                    Window: dialog;
                    WindowMssg: Label '############################################1';
                begin
                    Clear(RecordCounter); // Reset counter
                    RecordCustomer.reset();

                    Window.Open(WindowMssg);
                    RecordTotalCounter := RecordCustomer.Count;
                    if RecordCustomer.FindSet() then begin
                        repeat begin
                            RecordCounter += 1;

                            // Add your custom processing logic here....

                            Window.Update(1, ProgressBarIndicator.GenerateProgressBar(RecordCounter, RecordTotalCounter)); // Update the progress bar.

                            Sleep(100); // Slow down the process with 0.5 seconds just for demo purposes.
                        end until RecordCustomer.Next() = 0;
                    end;
                    Window.Close();
                end;
            }
        }
    }
}