module test;
    reg clk;
    reg [7:0] A,B;
    wire [15:0] Output;

    initial
    begin
        #1 A=8'd10;
        #1 B=8'd14;
        #1 clk=0;
        #20 $finish;
    end

    booth_multiplier BOOTH(.clk(clk), .A(A), .B(B), .Output(Output));

    initial
    begin
        $monitor("clk=%d \t time=%t \t A=%d \t B=%d \t Output=%d",clk, $time,A,B, Output);
    end

    always
    begin
        #1 clk=!clk;
    end
endmodule