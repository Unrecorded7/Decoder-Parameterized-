`timescale 1ns/100ps
module tb;
parameter a = 4;
 reg [a-1:0]in;
 wire  [(2**a)-1:0]op_s;
 wire [(2**a)-1:0]op_l;
 reg en;
 reg [(2**a)-1:0]Expected;

 Decoder_l#(.a(a))
         DUT_l (.in(in),
        .en(en),
        .op(op_l));

 Decoder_s#(.a(a))
         DUT_s(.in(in),
        .en(en),
        .op(op_s));

    integer i=0;
    integer error=0;
    
    initial begin
        $dumpfile("decoder.vcd");
        $dumpvars(0,tb);
            in=0;
            en=0;
            Expected=0;

        for (i =0 ;i<2**a ;i=i+1 ) begin
            in=i;
            en=0;
            Expected=0;
            #1;
            if(op_l!==Expected)begin
                $display("FAIL:en=%b in=%b Expected=%b op=%b(Loops)",en,in,Expected,op_l);
                error=error+1;
            end

            if(op_s!==Expected)begin
                $display("FAIL:en=%b in=%b Expected=%b op=%b(Shift)",en,in,Expected,op_s);
                error=error+1;
            end
        en=1;
        Expected=1'b1<<i;
        #1;
            if(op_l!==Expected)begin
                $display("FAIL:en=%b in=%b Expected=%b op=%b(Loops)",en,in,Expected,op_l);
                error=error+1;
            end

            if(op_s!==Expected)begin
                $display("FAIL:en=%b in=%b Expected=%b op=%b(Shift)",en,in,Expected,op_s);
                error=error+1;
            end
        
        if(op_l!==op_s) begin 
            $display("FAIL :decoder_l=%b not EQUAL to decoder_s=%b",op_l,op_s);
            error=error+1;
        end

        end

        $display("------------------");
        if (error == 0)
            $display("ALL TESTS PASSED!");
        else
            $display("TESTS FAILED: %0d errors", error);

        $finish;
    end

endmodule