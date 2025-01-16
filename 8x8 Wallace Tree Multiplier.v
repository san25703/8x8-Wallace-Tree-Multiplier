module Wallace_8X8( 
output[15:0] Z, input[7:0] X, input[7:0] Y 
    ); 
    reg[7:0] PP[7:0];  
    integer i, j;  
         
    // Partial products matrix 
        always @(X, Y) begin 
            for(i = 0;i < 8;i = i+1)   
                for(j = 0;j < 8;j = j+1)  
                    PP[i][j] = Y[i] & X[j]; 
        end 
 
    assign Z[0] = PP[0][0]; 
     
//  1 COLUMN 
    wire CH1; 
    HA HA1(PP[0][1],PP[1][0],Z[1],CH1); 
     
//  2 COLUMN 
    wire SF1,CF1,CH4; 
    FA FA1(PP[0][2],PP[1][1],PP[2][0],SF1,CF1); 
     
    HA HA4(SF1,CH1,Z[2],CH4); 
     
//  3 COLUMN 
    wire SC1,CC1F,CC1S;  
    CMP C1(PP[0][3],PP[1][2],PP[2][1],PP[3][0],0,SC1,CC1F,CC1S); 
     
    HA HA5(SC1,CF1,SH5,CH5); 
     
//  4 COLUMN 
    wire SC2,CC2F,CC2S,SF4,CF4; 
    CMP C2(PP[0][4],PP[1][3],PP[2][2],PP[3][1],CC1F,SC2,CC2F,CC2S); 
     
    FA FA4(SC2,CC1S,PP[4][0],SF4,CF4); 
 
//  5 COLUMN   
    wire SC3,CC3F,CC3S,SH2,CH2,SF5,CF5; 
    CMP C3(PP[0][5],PP[1][4],PP[2][3],PP[3][2],CC2F,SC3,CC3F,CC3S); 
    HA HA2(PP[4][1],PP[5][0],SH2,CH2); 
     
    FA F5(SC3,CC2S,SH2,SF5,CF5); 
 
//  6     
    wire SC4,CC4F,CC4S,SF3,CF3; 
    CMP C4(PP[0][6],PP[1][5],PP[2][4],PP[3][3],CC3F,SC4,CC4F,CC4S); 
    FA F3(PP[4][2],PP[5][1],PP[6][0],SF3,CF3); 
     
    CMP C13(SC4,CC3S,SF3,CH2,0,SC13,CC13F,CC13S); 
     
//  7 
    wire SC5,CC5F,CC5S,SC7,CC7F,CC7S,SC14,CC14F,CC14S; 
    CMP C5(PP[0][7],PP[1][6],PP[2][5],PP[3][4],CC4F,SC5,CC5F,CC5S); 
    CMP C7(PP[4][3],PP[5][2],PP[6][1],PP[7][0],0,SC7,CC7F,CC7S); 
     
    CMP C14(SC5,CC4S,SC7,CF3,CC13F,SC14,CC14F,CC14S); 
     
//  8 
    wire SC6,CC6F,CC6S,SC8,CC8F,CC8S,SC15,CC15F,CC15S; 
    CMP C6(0,PP[1][7],PP[2][6],PP[3][5],CC5F,SC6,CC6F,CC6S); 
    CMP C8(PP[4][4],PP[5][3],PP[6][2],PP[7][1],CC7F,SC8,CC8F,CC8S); 
     
    CMP C15(SC6,CC5S,SC8,CC7S,CC14F,SC15,CC15F,CC15S); 
//  9 
    wire SF2,CF2,SC9,CC9F,CC9S,SC16,CC16F,CC16S; 
    FA FA2(PP[2][7],PP[3][6],CC6F,SF2,CF2); 
    CMP C9 (PP[4][5],PP[5][4],PP[6][3],PP[7][2],CC8F,SC9,CC9F,CC9S); 
     
    CMP C16(SF2,CC6S,SC9,CC8S,CC15F,SC16,CC16F,CC16S); 
 
//  10 
    wire SC10,CC10F,CC10S,SC17,CC17F,CC17S; 
    CMP C10(PP[4][6],PP[5][5],PP[6][4],PP[7][3],CC9F,SC10,CC10F,CC10S); 
     
    CMP C17(SC10,CF2,CC9S,PP[3][7],CC16F,SC17,CC17F,CC17S); 
     
//  11 
    wire SC11,CC11F,CC11S,SF6,CF6; 
    CMP C11(PP[4][7],PP[5][6],PP[6][5],PP[7][4],CC10F,SC11,CC11F,CC11S); 
     
    FA F6(SC11,CC10S,CC17F,SF6,CF6); 
 
//  12 
    wire SC12,CC12F,CC12S,SH6,CH6; 
    CMP C12(0,PP[5][7],PP[6][6],PP[7][5],CC11F,SC12,CC12F,CC12S); 
     
    HA H6(SC12,CC11S,SH6,CH6); 
 
//  13 
    wire SF7,CF7,SH7,CH7; 
    FA FA7(PP[6][7],PP[7][6],CC12F,SF7,CF7); 
     
    HA H7(SF7,CC12S,SH7,CH7); 
     
//  14 
    wire SH8,CH8; 
    HA H8(PP[7][7],CF7,SH8,CH8); 
    wire c; 
// CSA STAGE 
   
    SquareRootCSA 
CSA({0,SH8,SH7,SH6,SF6,SC17,SC16,SC15,SC14,SC13,SF5,SF4,SH5},{CH8,CH7,CH6,CF6
 ,CC17S,CC16S,CC15S,CC14S,CC13S,CF5,CF4,CH5,CH4},{c,Z[15:3]}); 
          
endmodule