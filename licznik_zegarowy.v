module licznik_zegarowy (
    input wire inc_min,
    input wire inc_godz,
    input wire inc_min_auto,
    input wire start,
    input wire clk,

    output reg [3:0] min_jed = 0,
    output reg [3:0] min_dzie = 0,
    output reg [3:0] godz_jed = 0,
    output reg [3:0] godz_dzie = 0
);

always @(posedge clk) begin
    if (start) begin
        if (inc_min_auto) begin
            if (min_jed < 9) begin
                min_jed <= min_jed + 1;
            end else begin
                min_jed <= 0;

                if (min_dzie < 5) begin
                    min_dzie <= min_dzie + 1;
                end else begin
                    min_dzie <= 0;

                    if (godz_jed < 9) begin
                        godz_jed <= godz_jed + 1;
                    end else begin
                        godz_jed <= 0;

                        if (godz_dzie < 2) begin
                            godz_dzie <= godz_dzie + 1;
                        end else begin
                            godz_dzie <= 0;
                        end
                    end
                end
            end
        end
    end else begin
        if (inc_godz) begin
            if (godz_jed < 9) begin
                godz_jed <= godz_jed + 1;
            end else begin
                godz_jed <= 0;

                if (godz_dzie < 2) begin
                    godz_dzie <= godz_dzie + 1;
                end else begin
                    godz_dzie <= 0;
                end
            end
        end

        if (inc_min) begin
            if (min_jed < 9) begin
                min_jed <= min_jed + 1;
            end else begin
                min_jed <= 0;

                if (min_dzie < 5) begin
                    min_dzie <= min_dzie + 1;
                end else begin
                    min_dzie <= 0;
                end
            end
        end
    end

    if (godz_jed == 4 && godz_dzie == 2) begin
        godz_jed <= 0;
        godz_dzie <= 0;
    end
end

endmodule