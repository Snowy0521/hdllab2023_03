/**
This FIR_Filter Testbench is used to simulate Waveform of outputs of FIR in ModelSim
**/
`timescale 1ms/1us
module FIR_Filter_TB;

    reg         CLK_Filter;   //The clock signal of Filter 
    reg  [7:0]  input_data; 
    wire [19:0] output_data;
    reg         rst_n;        //An asychronous positive edge reset signal

    //Instantiate FIR Filter Module 
    FIR_Filter DUT (
        .CLK_Filter(CLK_Filter),
        .input_data(input_data),
        .output_data(output_data),
        .rst_n(rst_n)
    );

    initial begin
        CLK_Filter = 0;
        input_data = 0;

        // Reset the filter
        #5 rst_n = 0;
        #5 rst_n = 1;

        // Testbench stimulus
        #10 input_data = 1;     // Test input data
        
        //#10 input_data = 255; // Test input data
        #100 $stop;             // End simulation after some time
    end

    always begin
        #1 CLK_Filter = ~CLK_Filter; // Toggle clock every 1 time units
    end

endmodule
