//==============================================
//==========Hecho por: Diego Morones============
//==============v0.41 10/11/2026=================
//==============================================

module IO (
	input logic btn0, btn1, btn2, btn3, clk,
	output logic led1, led2, led3, led4
	);
	
	//BTN0: seleccionar siguiente modo
	//BTN1: seleccionar modo anterior
	//BTN2: Pausar/reanudar
	//BTN3: Reset del sistema

	//señales intermedias
	logic [3:0] master_led;
	logic [1:0] modo, sleds;
	logic leds3;
	logic [25:0] divider;
	
	//asignacion combinacional
	assign led1 = ~master_led [0];
	assign led2 = ~master_led [1];
	assign led3 = ~master_led [2];
	assign led4 = ~master_led [3];
	
	
	//modo 0: LEDs apagos
	//modo 1: izquierda derecha
	//modo 2: derecha izquierda
	//modo 3: patron alternado
	
	always_ff @(posedge clk) begin
	//reset listo
		if (btn3 == 1'b0) begin
		master_led <= 4'b0;
		modo <= 2'b00;
		sleds <= 2'b00;
		leds3 <= 1'b0;
		divider <= 26'd0;
		end
	
		else begin
			divider <= divider + 1;
			if (btn2 == 1'b0) begin
			master_led <= master_led;
			modo <= modo;
			sleds <= sleds;
			leds3 <= leds3;
			divider <= divider;
			end
			
			else if (btn0 == 1'b0 && divider == 26'd49999999) begin
			modo <= modo + 1;
			divider <= 26'd0;
			end
			
			else if (btn1 == 1'b0 && divider == 26'd49999999) begin
			modo <= modo - 1;
			divider <= 26'd0;
			end
			
			case (modo)
					2'b00: begin
					master_led <= 4'd0;
					end
					
					2'b01: if(divider == 26'd49999999) begin
					sleds <= sleds + 1;
					divider <= 26'd0;
						case (sleds)
						2'b00: master_led <= 4'b0001;
						2'b01: master_led <= 4'b0010;
						2'b10: master_led <= 4'b0100;
						2'b11: master_led <= 4'b1000;
						endcase
					end
					
					2'b10: if(divider == 26'd49999999) begin 
					sleds <= sleds + 1;
					divider <= 26'd0;
						case (sleds)
						2'b00: master_led <= 4'b1000;
						2'b01: master_led <= 4'b0100;
						2'b10: master_led <= 4'b0010;
						2'b11: master_led <= 4'b0001;
						endcase
					end
					
					2'b11: if(divider == 26'd49999999) begin 
					leds3 <= leds3 + 1;
					divider <= 26'd0;
						case (leds3)
						1'b0: master_led <= 4'b1010;
						1'b1: master_led <= 4'b0101;
						endcase
					end
					
			endcase
		end
	end
endmodule
	