Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12BZp0-0004b7-00
	for mtd-list@infradead.org; Fri, 21 Jan 2000 08:53:34 +0000
Message-ID: <002401bf63ed$e12ec180$5800a8c0@pita>
From: "jyllyj" <jyllyj@263.net>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <mtd@infradead.org>
References: <001601bf610b$7301de20$5800a8c0@pita>  <004101bf6084$deebad00$5800a8c0@pita> <E12AF35-000707-00@devel2.axiom.internal>  <E12AWHJ-0008NB-00@devel2.axiom.internal>
Subject: Re: about doc2000 bootstrap without M-system's firmware 
Date: Fri, 21 Jan 2000 16:58:55 +0800
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


> jyllyj@263.net said:
> > I can see SPL at firmware with offset 0x400,but where is the IPL? at
> > offset 0 looks like DOC2000 hardware initialization.is not so?
>
> Maybe I meant SPL not IPL - I can't remember what M-Systems call it.
>
> But that code initialises the hardware, then reads the 48K firmware off
the
> flash, and jumps to it if its checksum is right.
>
I find IPL at D000:0 with your jump's setuping
it is :
1272:0103 9C                    PUSHF
1272:0104 60                    DB      60
1272:0105 1E                    PUSH    DS
1272:0106 06                    PUSH    ES
1272:0107 0E                    PUSH    CS
1272:0108 1F                    POP     DS
1272:0109 BB0410            MOV     BX,1004
1272:010C C647FE85          MOV     BYTE PTR [BX-02],85
1272:0110 C647FE85      MOV     BYTE PTR [BX-02],85
1272:0114 BE0018        MOV     SI,1800
1272:0117 B1FF              MOV     CL,FF
1272:0119 E80E00        CALL    012A
1272:011C B90020        MOV     CX,2000
1272:011F E80800        CALL    012A
1272:0122 FC            CLD
1272:0123 8EC1          MOV     ES,CX
1272:0125 33FF          XOR     DI,DI
1272:0127 E9D607        JMP     0900
1272:012A C6071B        MOV     BYTE PTR [BX],1B
1272:012D FF47FC        INC     WORD PTR [BX-04]
1272:0130 884F09        MOV     [BX+09],CL
1272:0133 880C          MOV     [SI],CL
1272:0135 FF47FC        INC     WORD PTR [BX-04]
1272:0138 F60780        TEST    BYTE PTR [BX],80
1272:013B 74FB          JZ      0138
1272:013D 8517          TEST    DX,[BX]
1272:013F C3            RET


1272:0900 32E4          XOR     AH,AH
1272:0902 F6C10F        TEST    CL,0F
1272:0905 751F          JNZ     0926
1272:0907 C6071D        MOV     BYTE PTR [BX],1D
1272:090A FF47FC        INC     WORD PTR [BX-04]
1272:090D 8BD7          MOV     DX,DI
1272:090F 885709        MOV     [BX+09],DL
1272:0912 8814          MOV     [SI],DL
1272:0914 887709        MOV     [BX+09],DH
1272:0917 8834          MOV     [SI],DH
1272:0919 33D2          XOR     DX,DX
1272:091B 885709        MOV     [BX+09],DL
1272:091E 8814          MOV     [SI],DL
1272:0920 C60719        MOV     BYTE PTR [BX],19
1272:0923 E80FF8        CALL    0135
1272:0926 844709        TEST    AL,[BX+09]
1272:0929 AC            LODSB
1272:092A 02E0          ADD     AH,AL
1272:092C AA            STOSB
1272:092D 4E            DEC     SI
1272:092E E2D2          LOOP    0902
1272:0930 80FC55        CMP     AH,55
1272:0933 7505          JNZ     093A
1272:0935 9A00000020    CALL    2000:0000
1272:093A 07            POP     ES
1272:093B 1F            POP     DS
1272:093C 61            DB      61
1272:093D 9D            POPF
1272:093E CB            RETF
1272:093F 5C            POP     SP

it load SPL (offset 0x400h sizeof 8k in doc121.exb) to 2000:0 and jmp there
to execute.
 then the SPL load other TTFS etc.
i can fill the SPL with my bootloader like grub.but i don't know where can
the kernel put.
how can i READ/WRITE doc2000 with a absoluteness address.

in linux environment i insmod mtd,nftl,and doc2000.
i can mkfs and mount it.but can't format it with nftl-format.
error messages is "ioctl(MEMGETINFO): Invalid argument"

The error be appeared too when  use doc_loadbios to write doc firmware.
why?







To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
