Received: from mail2.racnet.net ([213.144.11.11])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DVlrM-0000gN-Pn
	for linux-mtd@lists.infradead.org; Wed, 11 May 2005 03:42:26 -0400
Message-ID: <4281B762.8070608@rac.de>
Date: Wed, 11 May 2005 09:42:26 +0200
From: Marcus Mikolaiczyk <m.mikolaiczyk@rac.de>
MIME-Version: 1.0
To: m.mikolaiczyk@rac.de
References: <428097CB.3010801@rac.de>
In-Reply-To: <428097CB.3010801@rac.de>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: partition doesn't end on an erase block -> eraseall - permission
 denied
Reply-To: m.mikolaiczyk@rac.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Greetings,

I'm not 100% sure but I think I found the problem. The nand drivers used
doesn't recognise the 2k pagesize. I've got a linux where the chip is
not supported an I change the necessary values to the apropriate ones in
nand_ids.c. The chip is recognised but the programs probably interprete
this as a 512k pagesize.

A small test Programm brought some more clarity in the whole situation.
At first we wrote some bytes with a ICD in the NAND.
A Linux Test application - I used a standard read command (see below)-
could read out the appropriate code but nanddump could not.

Testprogramm reading the first page:
Code (READ1_1 = 0x0 ; READ1_2 = 0x30):
...
 // Read first Page
 printf("Trying to read the first Page\n\n");
 nand_mem_write(CLE,READ1_1);
 nand_mem_write(ALE,0); //Collumn address bit 0-7
 nand_mem_write(ALE,0); //Collumn address bit 8-11
 nand_mem_write(ALE,0); //Row address bit 0-7
 nand_mem_write(ALE,0); //Row address bit 8-15
 nand_mem_write(ALE,0); //Row address bit 16
 nand_mem_write(CLE,READ1_2);
 for (i=0 ; i<264; i++) {
        Address=i*8;
        printf(" Addr %x:  %x %x %x %x %x %x %x %x
\n",Address,nand_mem_read(),n
and_mem_read(),nand_mem_read(),nand_mem_read(),nand_mem_read(),nand_mem_read(),n
and_mem_read(),nand_mem_read());

Output:
Standard Test - Reading NAND Flash device ID
Maker Code ec
Device Code da
Don't Care 80
Multi Plane Code 15
 Trying to read the first Page

 Addr 0:  2 2 2 2 0 0 0 0
 Addr 8:  1 ff ff ff 2 ff ff ff
 Addr 10:  4 ff ff ff 8 ff ff ff
 Addr 18:  10 ff ff ff 20 ff ff ff
 Addr 20:  40 ff ff ff 80 ff ff ff
 Addr 28:  ff ff ff ff ff ff ff ff
 Addr 30:  ff ff ff ff ff ff ff ff
 Addr 38:  ff ff ff ff ff ff ff ff
 Addr 40:  ff ff ff ff ff ff ff ff
 Addr 48:  ff ff ff ff ff ff ff ff
 Addr 50:  ff ff ff ff ff ff ff ff
 ....

The values 1,2,4,8,10,20,40,80 have been written by the in cirquit
debugger test programm.

nanddump - whatever this is I've got no clue
0x00000000: 0c ff ff ff ff ff ff ff ff ab ab ab ab ab ab ab
0x00000010: ab ab ab ab ab ab ab ab ab ff ff ff ff ff ff ff
0x00000020: ff ff ff ff ff ff ff ff ff 00 00 00 00 00 00 00
0x00000030: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x00000040: 00 00 00 00 00 00 00 00 00 41 41 41 41 41 41 41
0x00000050: 41 41 41 41 41 41 41 41 41 46 46 46 46 46 46 46
0x00000060: 46 46 46 46 46 46 46 46 46 41 41 41 41 41 41 41
0x00000070: 41 41 41 41 41 41 41 41 41 4a 4a 4a 4a 4a 4a 4a
0x00000080: 4a 4a 4a 4a 4a 4a 4a 4a 4a 00 00 00 00 00 00 00
0x00000090: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x000000a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x000000b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x000000c0: 00 00 00 00 00 00 00 00 00 01 01 01 01 01 01 01
....

So this thread is closed with this information.

Regards Marcus.
