Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13EKIJ-0000ev-00
	for mtd-list@infradead.org; Tue, 18 Jul 2000 00:27:27 +0100
Received: from caja.ldhs.cetuc.puc-rio.br ([139.82.28.1])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13EKIH-0000ep-00
	for mtd@infradead.org; Tue, 18 Jul 2000 00:27:25 +0100
From: "Miguel Freitas" <miguel@cetuc.puc-rio.br>
To: phiggins@transzap.com, mtd@infradead.org
Date: Mon, 17 Jul 2000 20:26:30 GMT-3
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Subject: M-Sys Reed Solomon
Reply-to: miguel@cetuc.puc-rio.br
Message-ID: <AF0690B1E@mamao.cetuc.puc-rio.br>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


    Hi Patrick,

    I'm trying to understand the M-Systems Reed Solomon 
implementation used in DiskOnChip, maybe we could exchange 
some ideas... how is it going the code?

    I read your email when you went for vacation, more than a month 
ago. I have some comments on it, probably old ones for you, but 
let's try...
    1) How do you know that these 4 x ten bit word encoded in that 6 
interleaved bytes are actually the syndrom? It doesn't make sense 
for me... First, a syndrom should be zero for a correct block and 
second, they always transmit the ECC "parity" and never the 
syndrom itself. The syndrom is computed from the whole codeword 
(data+parity)...(apologize me if I'm stating the obvious).
    2) Where did you get the information to convert the 6 interleaved 
bytes into 4 x ten bit word? The parallel 8 bit parity at the second 
byte is easy to see, but the 40 bits could be arranged in a different 
manner under 5 bytes. The M-Sys driver has a routine to do that 
conversion, but in another sequence (and without the parallel parity).
    3) I guess you should have already figured out what is the 
primitive polynomial they use. Just in case, it's the classical 
x^10+x^3+1. This became clear with a little reverse engineering...

    I also tryed to match the hardware ECC data initializing the shift 
register encoder with symbols different than zero without success. 
Have you had more lucky in the last month?


Regards,

Miguel Freitas



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
