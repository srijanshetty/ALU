module booth_multiplier (
   input clk, // Clock
   input [7:0] A,B,
   output [13:0] Output
   );

    reg [13:0] temp;
    reg prev=B[0];
    reg this=B[1];
    reg count= 
    always @(posedge clk)
    begin
        temp=(temp<<1);            

        if(count==1)
            temp={8'd0,A};

        else if(prev==0 & this==1)
        begin
            Output=Output+A;
        end
        else 
        begin
        
        end
    end
endmodule
