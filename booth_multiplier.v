module booth_multiplier (
	input clk, // Clock
	input en, //Enable Signal
	input [7:0] A,B,
	output [15:0] Output
);

//required variables
reg [15:0] posA, negA;
reg [7:0] tempB;
wire [7:0] compA;
reg prev;
wire c_out1, c_out2;
wire [15:0] posOutput, negOutput;
reg [15:0] temp_Output;

//Assigning the internal Output to the wire
assign Output=temp_Output;

always @(posedge clk)
begin
    if(en==1)
	 begin
      if(tempB[0]==1 & prev==0)
        temp_Output=posOutput;
      else if(tempB[0]==0 & prev==1)
        temp_Output=negOutput;
      prev=tempB[0];
      posA=(posA<<1); //Right shift of posA
      negA=(negA<<1); //Right shift of negA
      tempB=(tempB>>1); //Left shift of B
    end
	else
    begin
      posA={8'd0,A};
      negA={8'b11111111,compA};
      tempB=B;
      prev=1'b0;
      temp_Output=16'd0;
    end
end

//taking the negative of A
twos_compliment COMPLIMENT1(.A(A), .Output(compA));

ripple_cla16 CLA1(.c_in(0), .A(temp_Output), .B(negA), .Output(posOutput), .c_out(c_out1));
ripple_cla16 CLA2(.c_in(0), .A(temp_Output), .B(posA), .Output(negOutput), .c_out(c_out2));
endmodule
