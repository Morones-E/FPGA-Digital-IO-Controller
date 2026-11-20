//IO digital state machine, db test
//Diego Morones ==========
//14/11/2026==============
//tb v0.2

`timescale 1ns/1ps

module debouncer_tb;

//señales de entrada
	logic clk;
	logic reset;
	logic button_in0, button_in1, button_in2;

//señales de salida
	logic button_out0,button_out1,button_out2;
	
//conexion de señales db
debouncer #(.MAX_COUNT(5)) 
	dut (
	.button_in0(button_in0),
	.button_in1(button_in1),
	.button_in2(button_in2),
	.reset(reset),
	.button_out0(button_out0),
	.button_out1(button_out1),
	.button_out2(button_out2),
	.clk(clk)
    );

//inicializar reloj
initial begin
	clk = 1'b0;
	forever #5 clk = ~clk; //10ns 
end

//pruebas tb INITIAL
initial begin

	//inicializar variables
	button_in0 = 1'b1;
	button_in1 = 1'b1;
	button_in2 = 1'b1;
	reset = 1'b1;
	@(negedge clk);
	
	//prueba 1.0
	@(posedge clk);
	@(negedge clk);
	reset = 1'b0;
	button_in0 = 1'b0;
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	#1;
	if (button_out0 == 1'b0)
		$display("1.0 PASS: boton capturado correctamente");
		else $fatal("error en el boton 1.0");
		
	//prueba 1.1
	@(negedge clk);
	#1;
	button_in0 = 1'b1;
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	#1;
	if (button_out0 == 1'b1)
		$display("1.1 PASS: boton regresa a su estado original");
		else $fatal("error en el boton 1.1");
	#1;
	
	//prueba 2.0 rebote al soltar
	@(negedge clk);
	button_in0 = 1'b0;
	#1;
	button_in0 = 1'b1;
	#1;
	button_in0 = 1'b0;
	#1;
	button_in0 = 1'b1;
	#1;
	@(posedge clk);
	button_in0 = 1'b1;
	#1;
	button_in0 = 1'b0;
	#1;
	button_in0 = 1'b1;
	#1;
	button_in0 = 1'b0;
	#1;
	button_in0 = 1'b1;
	@(negedge clk);
	button_in0 = 1'b0;
	#1;
	button_in0 = 1'b1;
	#1;
	button_in0 = 1'b0;
	#1;
	button_in0 = 1'b1;
	#1;
	button_in0 = 1'b0;
	@(posedge clk);
	button_in0 = 1'b1;
	#1;
	button_in0 = 1'b0;
	#1;
	button_in0 = 1'b1;
	#1;
	button_in0 = 1'b0;
	#1;
	button_in0 = 1'b1;
	@(negedge clk);
	button_in0 = 1'b0;
	#1;
	button_in0 = 1'b1;
	#1;
	button_in0 = 1'b0;
	#1;
	button_in0 = 1'b1;
	#1;
	@(posedge clk);
	button_in0 = 1'b1;
	#1;
	button_in0 = 1'b0;
	#1;
	button_in0 = 1'b1;
	#1;
	button_in0 = 1'b0;
	#1;
	button_in0 = 1'b1;
	@(negedge clk);
	button_in0 = 1'b0;
	#1;
	button_in0 = 1'b1;
	#1;
	button_in0 = 1'b0;
	#1;
	button_in0 = 1'b1;
	#1;
	button_in0 = 1'b0;
	@(posedge clk);
	button_in0 = 1'b1;
	#1;
	button_in0 = 1'b0;
	#1;
	button_in0 = 1'b1;
	#1;
	button_in0 = 1'b0;
	#1;
	button_in0 = 1'b1;
	@(negedge clk);
	button_in0 = 1'b0;
	#1;
	button_in0 = 1'b1;
	#1;
	button_in0 = 1'b0;
	#1;
	button_in0 = 1'b1;
	#1;
	@(posedge clk);
	button_in0 = 1'b1;
	#1;
	button_in0 = 1'b0;
	#1;
	button_in0 = 1'b1;
	#1;
	button_in0 = 1'b0;
	#1;
	button_in0 = 1'b1;
	@(negedge clk);
	if (button_out0 === 1'b1)
		$display("2.0 PASS: sin valor actualizado %d",button_out0);
		else
			$fatal("valor actualizado, rebote confirmado %d",button_out0);
	
	//Prueba 2:1 rebote al soltar
	#1;
	button_in0 = 1'b0;
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(negedge clk);
	button_in0 = 1'b0;
	#1;
	button_in0 = 1'b1;
	#1;
	button_in0 = 1'b0;
	#1;
	button_in0 = 1'b1;
	#1;
	button_in0 = 1'b0;
	@(posedge clk);
	button_in0 = 1'b1;
	#1;
	button_in0 = 1'b0;
	#1;
	button_in0 = 1'b1;
	#1;
	button_in0 = 1'b0;
	#1;
	button_in0 = 1'b1;
	@(negedge clk);
	button_in0 = 1'b0;
	#1;
	button_in0 = 1'b1;
	#1;
	button_in0 = 1'b0;
	#1;
	button_in0 = 1'b1;
	#1;
	button_in0 = 1'b0;
	@(posedge clk);
	button_in0 = 1'b1;
	#1;
	button_in0 = 1'b0;
	#1;
	button_in0 = 1'b1;
	#1;
	button_in0 = 1'b0;
	#1;
	button_in0 = 1'b1;
	@(negedge clk);
	button_in0 = 1'b0;
	#1;
	button_in0 = 1'b1;
	#1;
	button_in0 = 1'b0;
	#1;
	button_in0 = 1'b1;
	#1;
	button_in0 = 1'b0;
	@(posedge clk);
	button_in0 = 1'b1;
	#1;
	button_in0 = 1'b0;
	#1;
	button_in0 = 1'b1;
	#1;
	button_in0 = 1'b0;
	#1;
	button_in0 = 1'b1;
	@(negedge clk);
	button_in0 = 1'b0;
	#1;
	button_in0 = 1'b1;
	#1;
	button_in0 = 1'b0;
	#1;
	button_in0 = 1'b1;
	#1;
	button_in0 = 1'b0;
	@(posedge clk);
	button_in0 = 1'b1;
	#1;
	button_in0 = 1'b0;
	#1;
	button_in0 = 1'b1;
	#1;
	button_in0 = 1'b0;
	#1;
	button_in0 = 1'b1;
	@(negedge clk);
	button_in0 = 1'b0;
	#1;
	button_in0 = 1'b1;
	#1;
	button_in0 = 1'b0;
	#1;
	button_in0 = 1'b1;
	#1;
	button_in0 = 1'b0;
	@(posedge clk);
	button_in0 = 1'b1;
	#1;
	button_in0 = 1'b0;
	#1;
	button_in0 = 1'b1;
	#1;
	button_in0 = 1'b0;
	#1;
	button_in0 = 1'b1;
	@(negedge clk);
	if (button_out0 === 1'b0)
		$display("2.1 PASS: sin valor actualizado %d",button_out0);
		else
			$fatal("valor actualizado, rebote confirmado");
	
	//prueba 3.0 actualizar los 3 al mismo tiempo
	@(posedge clk);
	#1;
	button_in0 = 1'b1;
	button_in1 = 1'b0;
	button_in2 = 1'b0;
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	#1;
	if (button_out0 === 1'b1 && button_out1 === 1'b0 && button_out2 === 1'b0)
		$display("3.0 PASS: 3 valores actualizados 0 = %d, 1 = %d, 2 = %d",button_out0,button_out1,button_out2);
		else
			$fatal("3.0 FAIL: valor no actualizado 0 = %d, 1 = %d, 2 = %d",button_out0,button_out1,button_out2);
	
	//prueba 4.0 Estabilidad incompleta
	//prueba con btn1
	@(negedge clk);
	button_in1 = 1'b1;
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	#1;
	if (button_out1 === 1'b0)
		$display("4.0 PASS: Valor no actualizado btn1 = %d",button_out1);
		else
			$fatal("valor actualizado, revisar logica btn1 = %d",button_out1);
			
	//Pruebas de reset
	//Prueba 5.0 Reset durante conteo
	@(negedge clk);
	reset = 1'b0;
	button_in0 = 1'b0;
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(negedge clk);
	#3;
	reset = 1'b1;
	@(posedge clk);
	#1;
	reset = 1'b0;
	if (button_out0 === 1'b1 && button_out1 === 1'b1 && button_out2 === 1'b1)
		$display("5.0 PASS: Reset funcionando 0 = %d, 1 = %d, 2 = %d",button_out0,button_out1,button_out2);
		else
			$fatal("5.0 FAIL: reset fallando 0 = %d, 1 = %d, 2 = %d",button_out0,button_out1,button_out2);
			
	//Prueba 5.1 Reset durante entrada estable
	@(negedge clk);
	button_in0 = 1'b0;
	@(posedge clk);
	#1;
	button_in1 = 1'b0;
	#3;
	button_in2 = 1'b0;
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	#1;
	$display("Valores pre reset 0 = %d, 1 = %d, 2 = %d",button_out0,button_out1,button_out2);
	#1;
	reset = 1'b1;
	@(posedge clk);
	#1;
	if (button_out0 === 1'b1 && button_out1 === 1'b1 && button_out2 === 1'b1)
		$display("5.1 PASS: Reset funcionando 0 = %d, 1 = %d, 2 = %d",button_out0,button_out1,button_out2);
		else
			$fatal("5.1 FAIL: reset fallando 0 = %d, 1 = %d, 2 = %d",button_out0,button_out1,button_out2);
			
	$finish;
end
endmodule
