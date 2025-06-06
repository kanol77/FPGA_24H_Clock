module decoderBCD (
    input wire [3:0] BCD,  // 4-bit BCD input
    output reg [6:0] seg   // 7-segment output (0 to 6)
);

    always @(*) begin
        case (BCD)
            4'b0000: seg = 7'b0000001; // Display 0
            4'b0001: seg = 7'b1001111; // Display 1
            4'b0010: seg = 7'b0010010; // Display 2
            4'b0011: seg = 7'b0000110; // Display 3
            4'b0100: seg = 7'b1001100; // Display 4
            4'b0101: seg = 7'b0100100; // Display 5
            4'b0110: seg = 7'b0100000; // Display 6
            4'b0111: seg = 7'b0001111; // Display 7
            4'b1000: seg = 7'b0000000; // Display 8
            4'b1001: seg = 7'b0000100; // Display 9
            default: seg = 7'b1111111; // Invalid input (all segments off)
        endcase
    end

endmodule