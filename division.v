module division (
   input en, // Clock Enable
   input [7:0] A,
   output [7:0] Output
);

reg [7:0] temp_Output;

always @(en or A)
begin
    if(en==1)
    begin
        temp_Output=1>>A;
        temp_Output[7]=A[7];
    end
end
endmodule



