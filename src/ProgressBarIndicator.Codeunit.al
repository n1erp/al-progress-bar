codeunit 81000 ProgressBarIndicator
{
    /// <summary>
    /// Generates a progress bar representation as text.
    /// </summary>
    /// <param name="currVal">The current value of the progress.</param>
    /// <param name="totalVal"> The total value that represents 100% progress.</param>
    /// <returns>A text representation of the progress bar.</returns>
    procedure GenerateProgressBar(currVal: Integer; totalVal: Integer): Text
    var
        PercentageText: TextBuilder;
        CurrentPercentage: Integer;
        Counter: Integer;
        IncompleteChar: Label '░'; // U+2591 Unicode Character
        CompleteChar: Label '█'; // U+2588 Unicode Character
        LengthProgressBar: Integer;
    begin
        if totalVal <= 0 then
            totalVal := 1; // Prevent division by zero.

        if currVal < 0 then
            currVal := 0; // Ensure non-negative current value.

        LengthProgressBar := 30;
        PercentageText.Append('[');
        CurrentPercentage := (currVal * 100) div totalVal;
        for Counter := 1 to LengthProgressBar do begin
            if Counter <= CurrentPercentage * LengthProgressBar div 100 then
                PercentageText.Append(CompleteChar)
            else
                PercentageText.Append(IncompleteChar);
        end;
        PercentageText.Append(']');
        PercentageText.Append(StrSubstNo(' Loading %1%', CurrentPercentage));
        exit(PercentageText.ToText());
    end;
}