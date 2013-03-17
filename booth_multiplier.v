module booth_multiplier (
   input clk, // Clock
   input [7:0] A,B,
   output reg [15:0] Output
   );

initial
begin
  #1 count=0;
end

always
begin
  #1 $monitor("count=%d\tposA=%d\tnegA=%d\ttempB=%b\tOutput=%d",count,posA,negA,tempB,Output);
end

//required variables
reg [15:0] posA, negA;
reg [7:0] tempB;
wire [7:0] compA;
reg prev;
reg count;

//taking the negative of A
twos_compliment COMPLIMENT1(.A(A), .Output(compA));

always @(posedge clk)
begin
    if(count==0)
    begin
      posA={8'd0,A};
      negA={8'b11111111,compA};
      tempB=B;
      prev=1'b0;
      count=1'b1;
      Output=16'd0;
    end
    else
    begin
      if(tempB[0]==1 & prev==0)
        Output=Output+negA;
      else if(tempB[0]==0 & prev==1)
        Output=Output+posA;
      prev=tempB[0];
      posA=(posA<<1); //Right shift of posA
      negA=(negA<<1); //Right shift of negA
      tempB=(tempB>>1); //Left shift of B
    end
end

endmodule
