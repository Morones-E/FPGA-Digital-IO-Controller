//==============================================================================
//Pin Fisico -> BTN -> btn_in -> btn_out -> button_in -> button_out -> btn_clean
//==============================================================================

module debouncer #(
    parameter integer MAX_COUNT = 500000

)(
    input  logic clk,
    input  logic reset,
    input  logic button_in0,button_in1,button_in2,
    output logic button_out0,button_out1,button_out2
);

//Contadores
logic [18:0] counter0;
logic [18:0] counter1;
logic [18:0] counter2;
	
always_ff @(posedge clk) begin

	//Reset
	if (reset) begin
		counter0 <= '0;
		counter1 <= '0;
		counter2 <= '0;
		button_out0 <= 1'b1;
		button_out1 <= 1'b1;
		button_out2 <= 1'b1;
	end

	else begin
		//Funcion debounce btn 0
		if (button_in0 != button_out0) begin
			if (counter0 == MAX_COUNT - 1) begin
				button_out0 <= button_in0;
				counter0 <= '0;
			end
			else begin
				counter0 <= counter0 + 1'b1;
			end
		end
		else begin
			counter0 <= '0;
		end
		
		//btn 1
		if (button_in1 != button_out1) begin
			if (counter1 == MAX_COUNT - 1) begin
				button_out1 <= button_in1;
				counter1 <= '0;
			end
			else begin
				counter1 <= counter1 + 1'b1;
			end
		end
		else begin
			counter1 <= '0;
		end
		
		//btn 2
		if (button_in2 != button_out2) begin
			if (counter2 == MAX_COUNT - 1) begin
				button_out2 <= button_in2;
				counter2 <= '0;
			end
			else begin
				counter2 <= counter2 + 1'b1;
			end
		end
		else begin
			counter2 <= '0;
		end
	end
end
endmodule
