Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 137esI-0000sI-00
	for mtd-list@infradead.org; Thu, 29 Jun 2000 15:01:02 +0100
Received: from gateway.pel.dk ([195.249.83.130])
	by infradead.org with smtp (Exim 3.03 #1)
	id 137esG-0000sA-00
	for mtd@infradead.org; Thu, 29 Jun 2000 15:01:01 +0100
Message-ID: <395B574E.CD20E7C2@pel.dk>
Date: Thu, 29 Jun 2000 16:03:58 +0200
From: akc <akc@pel.dk>
MIME-Version: 1.0
To: mtd@infradead.org, akc@pel.dk
Subject: Problem accessing physical memory...
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Howdy:


I'am trying to use slram on a RPXlite PowerPC board, but as soon as
slram tries to memcpy to
physical memory, the kernel makes an exception(see below for output)

I've told the RPXLite board it only has 4Mb ram, (It didn't work by
telling the kernel only), and tries to
access from 0x800000 and up.

I'am using kernel 2.4.0-test1-ac18 from bitkeeper.

I've tried mtdram and it works, but I am going to make a flash driver
and need access to physical memory.

I've made a small test module, which only tries to write something in
physical mem, by using:

    ioremap :                                                      fails
like slram
    mmap (from user space);                         didn't get any
messages just didn't work.
    just type casting a physical addr.             didn't work.
    using phys_to_virt(0x800000)                didn't work.

I haven't used remap_page_range yet, because I haven't found enough
documentation, eg. how _do_ I use it?


HELP
;-)

Thanks in advance
    Arnold..



PS: The DAR  should show at which (virtual) address it went wrong, but
it isn't the same, (well sometime it is)
I have
tried using writeb() instead of memcpy, and followed the call down in
the kernel. The address stays right until an asm.
instruction which writes the byte, so ?????



-----------------------------------------------------------

Some debug form slram:

In physmem_write
        priv->start=0xc1004000
        priv->start+to=0xc1004000
        to=0
        len=248
        len=248,buf=0x30000000,tmp=0xc1004000

Machine check in kernel mode.
Caused by (from SRR1=9032): Unknown values in msr
NIP: C1002254 XER: A000857F LR: C1002254 REGS: c033bd60 TRAP: 0200
MSR: 00009032 EE: 1 PR: 0 FP: 0 ME: 1 IR/DR: 11
TASK = c033a000[13] 'sh' Last syscall: 4
last math 00000000 last altivec 00000000
GPR00: C1002254 C033BE10 C033A000 0000002A 00001032 C014D7A4 C01F7320
00000000 GPR08: 00000027 C0150000 FA202830 C033BD60 55553F39 1014C154
214C0694 BCDA4025 GPR16: 1004FC3D 820459D8 00000000 84300612 00009032
0033BE80 00000000 C0003528 GPR24: C0003264 FFF147FC C033BE38 000000F8
000000F8 00000000 30000000 C1004000 vector: 200 at pc = c1002254, lr =
c1002254, msr = 9032, sp = c033be10 [c033bd]current = c033a000, pid =
13, comm = sh

mon> r
R00 = c1002254   R01 = c033be10   R02 = c033a000   R03 = 0000002a
R04 = 00001032   R05 = c014d7a4   R06 = c01f7320   R07 = 00000000
R08 = 00000027   R09 = c0150000   R10 = fa202830   R11 = c033bd60
R12 = 55553f39   R13 = 1014c154   R14 = 214c0694   R15 = bcda4025
R16 = 1004fc3d   R17 = 820459d8   R18 = 00000000   R19 = 84300612
R20 = 00009032   R21 = 0033be80   R22 = 00000000   R23 = c0003528
R24 = c0003264   R25 = fff147fc   R26 = c033be38   R27 = 000000f8
R28 = 000000f8   R29 = 00000000   R30 = 30000000   R31 = c1004000
pc  = c1002254   msr = 00009032   lr  = c1002254   cr  = 35553f39
ctr = c0101854   xer = a000857f   trap =  200
dar = 0x00000000

mon> S
msr = 1032, pvr = 500000
sprg0-3 = 9032 33be80 0 33a250
srr0 = c00b7120, srr1 = 1032
sr0-15 =NIP: C007E7D0 XER: A000857F LR: C007E7C8 REGS: c033bb80 TRAP:
1000
MSR: 00001032 EE: 0 PR: 0 FP: 0 ME: 1 IR/DR: 11
TASK = c033a000[13] 'sh' Last syscall: 4
last math 00000000 last altivec 00000000
GPR00: C007E7C8 C033BC30 C033A000 00000008 C0171244 00000008 C01F7320
C0171244 GPR08: 00000008 00000000 FA202830 0000003D 00000001 1014C154
214C0694 BCDA4025 GPR16: 1004FC3D 820459D8 00000000 84300612 00001032
0033BD50 00000000 C0003528 GPR24: C0003744 FFF147FC C033BE38 C033A000
C033BC30 C0120000 00000000 00000010 vector: 1000 at pc = c007e7d0, lr =
c007e7c8, msr = 1032, sp = c033bc30 [c033b]current = c033a000, pid = 13,
comm = sh
mon>



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
