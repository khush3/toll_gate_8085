
;<Toll_gate>

jmp start

;data


;code
start: nop
	


ST:		CPI 01H
		CZ CAR
		CPI 02H
		CZ JEEP
		CPI 03H
		CZ BUFF_CAR
		CPI 04H
		CZ BUFF_JEEP
		CPI 00H
		JZ LOOP
		JMP ST
LOOP:           LDA 7100H
		MOV C,A
		LDA 7101H
		ADD C
		STA 7102H
		HLT

CAR:   		LXI H,7001H
		DCR M
		LXI H,7000H
		INR M	
		LXI H,7100H
		MOV A,M 
		ADI 02H
		MOV M,A
		MVI A,0FFH
		RET

JEEP:  		LXI H,7003H
		DCR M
		LXI H,7002H
		INR M
		LXI H,7101H
		MOV A,M
		ADI 05H
		MOV M,A
		MVI A,0FFH
		RET
	
BUFF_CAR:	LXI H,7001H
         	INR M
         	LDA 7003H
         	MOV C,A
         	ADD M
         	CPI 05H
         	JC L1
         	LDA 7200H
         	ADD M
         	STA 7200H
         	LDA 7201H 
         	ADD C
         	STA 7201H
         	LXI H,7001H
         	MVI M,00H
         	LXI H,7003H
                MVI M,00H
     L1: 	MVI A,0FFH
		RET
	
BUFF_JEEP:	LXI H,7003H
           	INR M	
           	LDA 7001H
           	MOV C,A
           	ADD M
           	CPI 05H
           	JC L3
           	LDA 7201H
           	ADD M
           	STA 7201H
           	LDA 7200H 
           	ADD C
           	STA 7200H
           	LXI H,7001H
           	MVI M,00H
           	LXI H,7003H
           	MVI M,00H
     L3:   	MVI A,0FFH
		RET





 
