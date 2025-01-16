module CMP(A,B,C,D,Cin,S,Coutf,Couts); 
    input A, B, C, D, Cin; 
    output S, Coutf, Couts; 
    wire ST; 
    FA FA1(A,B,Cin,ST,Coutf); 
    FA FA2(C,D,ST,S,Couts); 
endmodule