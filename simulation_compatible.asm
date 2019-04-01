
;<toll_gate>

jmp start

;data


;code
start: nop
                LXI D,0307H
ST:		LDAX D
                


		CPI 01H
		CZ CAR
		CPI 02H
		CZ JEEP
		CPI 03H
		CZ BUFF_CAR
		CPI 04H
		CZ BUFF_JEEP
		DCR E
		JNZ ST
		LDA 0100H
		MOV C,A
		LDA 0101H
		ADD C
		STA 0102H
		
		HLT

CAR:   		LXI H,0001H
		DCR M
		LXI H,0000H
		INR M	
		LXI H,0100H
		MOV A,M 
		ADI 02H
		MOV M,A
		MVI A,0FFH
		RET

JEEP:  		LXI H,0003H
		DCR M
		LXI H,0002H
		INR M
		LXI H,0101H
		MOV A,M
		ADI 05H
		MOV M,A
		MVI A,0FFH
		RET
	
BUFF_CAR:	LXI H,0001H
         	INR M
         	LDA 0003H
         	MOV C,A
         	ADD M
         	CPI 05H
         	JC L1
         	LDA 0200H
         	ADD M
         	STA 0200H
         	LDA 0201H 
         	ADD C
         	STA 0201H
         	LXI H,0001H
         	MVI M,00H
         	LXI H,0003H
                MVI M,00H
     L1: 	MVI A,0FFH
		RET
	
BUFF_JEEP:	LXI H,0003H
           	INR M	
           	LDA 0001H
           	MOV C,A
           	ADD M
           	CPI 05H
           	JC L3
           	LDA 0201H
           	ADD M
           	STA 0201H
           	LDA 0200H 
           	ADD C
           	STA 0200H
           	LXI H,0001H
           	MVI M,00H
           	LXI H,0003H
           	MVI M,00H
     L3:   	MVI A,0FFH
		RET


