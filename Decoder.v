module Decoder_l #(//Common sense , made using loops and case //
    parameter a=4
) (
    input [a-1:0] in,
    input en,
    output reg [(2**a)-1:0]op
);
integer i;
    always @(*) begin
     op=0;
      if(en) begin
        
         for (i=0;i<(2**a);i=i+1) begin
            case(in)
            i:op[i]=1;
            default: op[i]=1'b0;
        endcase
        end       
      end
    end
endmodule

module Decoder_s #(//best implementation of Decoder//
    parameter a=4
) (
    input [a-1:0] in,
    input en,
    output reg [(2**a)-1:0]op
);
integer i;
    always @(*) begin
     op=0;
      if(en) begin
        op=({{((2**a)-1){1'b0}},1'b1}<<in);    
      end
    end
endmodule