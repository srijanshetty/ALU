module test;
    reg clk;
    reg [7:0] A,B;
    wire [15:0] Output;
    reg en;

    initial
    begin
        #1 A=8'h10;
        #1 B=8'b11111110;
        #1 clk=0;
        #1 en=1;
        // #1 Output=8'b11000000;
        // #3 1>>Output
        #20 $finish;
    end

    booth_multiplier BOOTH(.en(en),.clk(clk), .A(A), .B(B), .Output(Output));
    // division DIVIDE(.en(0), .A(A), .Output(Output));

    initial
    begin
        $monitor("clk=%d \t time=%t \t A=%d \t B=%d \t Output=%x\t%d",clk, $time,A,B, Output, Output);
    end

    always
    begin
        #1 clk=!clk;
    end
endmodule
