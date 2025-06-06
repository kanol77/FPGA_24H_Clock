module debounce_pulse (
    input wire clk,         // Zegar 50 MHz
    input wire slow_clk,    // Zegar wolny (np. 100 Hz)
    input wire button,      // Sygnał wejściowy (przycisk)
    output reg pulse_out    // Wyjście - impuls o długości 1 cyklu zegara
);

    reg [3:0] shiftregister = 4'b0000; 
    reg debounced_signal = 0;    // Stabilny sygnał po debounce
    reg last_state = 0;          // Poprzedni stan debounced_signal


    // Sekcja generacji impulsu: działa na szybkim zegarze (clk)
    always @(posedge clk)  if (slow_clk) shiftregister <= {shiftregister[2:0], button};

	 
	 always @(posedge clk) begin
		  if (shiftregister == 4'b1111) debounced_signal <= 1;
		  else if (shiftregister == 4'b0000) debounced_signal <= 0; 
		  last_state <= debounced_signal;

	  end
	  
	  always @(*) begin
			if (debounced_signal == 1 && last_state == 0) pulse_out <= 1;
			else pulse_out <= 0;
		  
		  end
       

endmodule
