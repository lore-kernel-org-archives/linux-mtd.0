Received: from wsgw2.atc.army.mil ([134.194.13.56])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BaxeX-0004qm-4C
	for linux-mtd@lists.infradead.org; Thu, 17 Jun 2004 10:14:07 -0400
Received: from atcml01.atc.army.mil ([134.194.25.206])
	by wsgw2.atc.army.mil (SMSSMTP 4.0.0.59) with SMTP id
	M2004061710073225353
	for <linux-mtd@lists.infradead.org>; Thu, 17 Jun 2004 10:07:32 -0400
Message-ID: <EFF9A3506F74924AB5CC77BDC66E79351812BA@atcml01.atc.army.mil>
From: "Carlos, John J USAATC" <john.carlos@atc.army.mil>
To: linux-mtd@lists.infradead.org
Date: Thu, 17 Jun 2004 10:15:50 -0400
MIME-Version: 1.0
Content-Type: text/plain
Subject: FW: DOC Mil Plus 32 any work being done?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Yes my problem was with not being able to foat the device.  I thought that
that nand_format -j only would work with devices registered using the nand
subsystem.  That is when I started to read throught doc2001plus.c and look
at the difference between the functions that work on that chip and the
functions for the other DOC chips.  I have been reading what I could find on
MilPlus and the driver code.  I have somewhat of a small understanding of
the chip now.  I was hoping to get it functioning under the nand subsystem
so I could use it and maybe push back what I have done so others can use.

I have been changing diskonchip.c so as to find the MilPlus chip.  I have
done a bit of cut and paste and am to the point where the my kernel does the
following "see below" There is a lot of usless info I printk out to track
what is happening.  

They frawn upon any chat software here at work so I will try tonight at home
to see if I can chat with you and try to get on the right track to solve
this problem.

Thanks you!
John


# ./load.sh
Using /lib/modules/2.4.21-rmk1-omap1/kernel/drivers/mtd/inftl.o
INFTL: inftlcore.c $Revision: 1.14 $, inftlmount.c $Revision: 1.12 $
TP1
TP2
TP3
TP4
TP5
TP6
TP7 max mtd dev=0x10
in inftl_add_mtd
 in mtd_blkdevs-24.c adding a device name=inftl major=5e
in inftl_add_mtd
 in mtd_blkdevs-24.c adding a device name=inftl major=5e
in inftl_add_mtd
 in mtd_blkdevs-24.c adding a device name=inftl major=5e
in inftl_add_mtd
 in mtd_blkdevs-24.c adding a device name=inftl major=5e
TP8
Using /lib/modules/2.4.21-rmk1-omap1/kernel/drivers/mtd/nand/nand_ids.o
Using /lib/modules/2.4.21-rmk1-omap1/kernel/drivers/mtd/nand/nand_ecc.o
Using /lib/modules/2.4.21-rmk1-omap1/kernel/drivers/mtd/nand/nand.o
# insmod docecc
Using /lib/modules/2.4.21-rmk1-omap1/kernel/drivers/mtd/devices/docecc.o
# insmod diskonchip
Using /lib/modules/2.4.21-rmk1-omap1/kernel/drivers/mtd/nand/diskonchip.o
In init_nanddoc
in doc2001_wake addr=0xc203e000
In init_nanddoc chip ID=0x40
In DoC_ScanChips chip ID= 0x40
In DoC_ScanChips virt addr= 0xc203e000
in doc2001_enable_asic addr=0xc203e000
Leaving doc2001_enable_asic
read 0x84
In DoC_ScanChips again virt addr= 0xc203e000
in DoC_SCanChips TP1
Entering DoC_IdentChip virt addr=0xc203e000
In DoC_SelectFloor
In DoC_SelectChip
TP1
TP1.5
In DoC_Command
TP1.75
In DoC_WaitReady virtadr=0xc203e000
In DoC_Delay doc->virtadr=0xc203e000 cycles=4
..
..
..
..
Leaving DoC_Delay
In _DoC_WaitReady virtad=0xc203e000
_DoC_WaitReady timed out.
In DoC_Delay doc->virtadr=0xc203e000 cycles=2
..
..
Leaving DoC_Delay
Leaving DoC_WaitReady
TP2
In DoC_Command
In DoC_Address
TP3
In DoC_WaitReady virtadr=0xc203e000
In DoC_Delay doc->virtadr=0xc203e000 cycles=4
..
..
..
..
Leaving DoC_Delay
In _DoC_WaitReady virtad=0xc203e000
_DoC_WaitReady timed out.
In DoC_Delay doc->virtadr=0xc203e000 cycles=2
..
..
Leaving DoC_Delay
Leaving DoC_WaitReady
TP4
In DoC_IdentChip mfr=0x98 id=0x75
Flash chip found: Manufacturer ID: 98, Chip ID: 75 (Toshiba:NAND 32MiB 3,3V
8-bi
t)
erase size= 0x8000
Entering DoC_IdentChip virt addr=0xc203e000
In DoC_SelectFloor
In DoC_SelectChip
TP1
TP1.5
In DoC_Command
TP1.75
In DoC_WaitReady virtadr=0xc203e000
In DoC_Delay doc->virtadr=0xc203e000 cycles=4
..
..
..
..
Leaving DoC_Delay
In _DoC_WaitReady virtad=0xc203e000
In DoC_Delay doc->virtadr=0xc203e000 cycles=2
..
..
Leaving DoC_Delay
Leaving DoC_WaitReady
TP2
In DoC_Command
In DoC_Address
TP3
In DoC_WaitReady virtadr=0xc203e000
In DoC_Delay doc->virtadr=0xc203e000 cycles=4
..
..
..
..
Leaving DoC_Delay
In DoC_Delay doc->virtadr=0xc203e000 cycles=2
..
..
Leaving DoC_Delay
Leaving DoC_WaitReady
TP4
In DoC_IdentChip mfr=0xa0 id=0xa0
in Doc_ScanChips 1 flash chips found. Total DiskOnChip size: 32 MiB
back in niit_nanddoc
DiskOnChip Millennium Plus found at address 0xC000000
in add_mtd_device mtdcore.c TP1
in add_mtd_device mtdcore.c TP2
mtd: Giving out device 4 to DiskOnChip Millennium Plus
in inftl_add_mtd
INFTL: add_mtd for DiskOnChip Millennium Plus
INFTL: INFTL_mount(inftl=0xc1cc6600)
INFTL: find_boot_record(inftl=0xc1cc6600)
Unable to handle kernel NULL pointer dereference at virtual address 00000000
pgd = c1b3c000
[00000000] *pgd=11bac801, *pmd = 11bac801, *pte = 00000000, *ppte = 00000000
Internal error: Oops: 0
CPU: 0
pc : [<00000000>]    lr : [<c20284c8>]    Not tainted
sp : c1b41bb4  ip : c203ca70  fp : c1b41e18
r10: c1cc6640  r9 : c203cc00  r8 : c203ac70
r7 : c0152058  r6 : c202aca8  r5 : c1b41be4  r4 : c1b41be8
r3 : 00000200  r2 : 00000000  r1 : 00000000  r0 : c203ca70
Flags: Nzcv  IRQs on  FIQs on  Mode SVC_32  Segment user
Control: 3177  Table: 11B3C000  DAC: 00000015
Process insmod (pid: 37, stack limit = 0xc1b40374)
Stack: (0xc1b41bb4 to 0xc1b42000)
1ba0:                                              c1b41be4 c1b41be8
000000ca
1bc0: 00000000 c1caf2c0 c1c420a0 00000000 c1b41bdc 00000000 00000000
d875c286
1be0: c1cc6600 00000002 00000000 c1c420a0 c1c420a0 c0184c60 c1b41c1c
c1b41c08
1c00: c00c6304 c0043b54 c1c420a0 c1c420a0 c1cab220 0000c286 c1b41c48
c1b41c28
1c20: c0107074 c1c420a0 c1c420a0 c0184c00 c1b41c54 c1b41c40 c00c6304
c0043b54
1c40: c1c420a0 c1c420a0 c1b41c68 c1b41c58 c00c631c c00c6270 00000000
c1b41c80
1c60: c1b41c6c c00c64b8 c00c6318 c0184c60 c1c420a0 00000000 00008000
0000001b
1c80: c00c639c 00000000 60000000 00000000 00000000 c1b41d30 00000000
00000007
1ca0: 0000000c 00000000 ffffffff c015cc8e c1b41d9c c1b41cc0 c01216f8
c011fdcc
1cc0: c1b41cd8 00000000 c1b41d08 00000000 00000020 c015d06f 0000000c
00000000
1ce0: 33323130 37363534 42413938 46454443 4a494847 4e4d4c4b 5251504f
56555453
1d00: 5a595857 c00bb700 33323130 37363534 62613938 66656463 6a696867
6e6d6c6b
1d20: 7271706f 76757473 7a797877 c1b41d00 36363030 63316363 c0032e64
c0161160
1d40: c1b41d6c c1b41d50 c002f4c0 c1b41d84 c1b41d5c c00a946c c00a4590
c014fbf4
1d60: 0000213b 00002160 00000028 c203ac70 c203cc00 c203c9b0 c1b41da0
c1b41d88
1d80: c002a9d0 c00a92b8 00002160 00002160 c0149714 c1b41db4 c1b41da4
c002aa4c
1da0: c002a984 00002160 c1b41dd0 ffffdea0 60000013 60000013 00000028
c203ac70
1dc0: c203c9b0 c1b41de8 c1b41dd4 c002aecc c00278f8 c015cc98 c0149718
c1b41e08
1de0: c1b41dec c002ad70 c002ae28 c1cc6600 c1cc6600 c1cc6600 c202aca8
c0152058
1e00: c203ac70 c203cc00 c203c9b0 c1b41e70 c1b41e1c c2029488 c2028434
c1b41e40
1e20: c1b41e2c c002aecc c00278f8 c015cca1 c0149718 c1b41e60 c1b41e44
c002ad70
1e40: c002ae28 c202acdc c1cc6600 c203ca70 c202aca8 c0152058 c203ac70
c203cc00
1e60: c203c9b0 c1b41e94 c1b41e74 c20270e4 c2029470 c1b41ea0 c202acdc
c0152130
1e80: c203ca70 c0152058 c1b41eb0 c1b41e98 c00b49ec c2027070 c0152158
c015206c
1ea0: c203ca70 c1b41ed0 c1b41eb4 c00b03d4 c00b49bc c203ca70 c203c8f0
c203a8a0
1ec0: c203c890 c1b41f04 c1b41ed4 c203beb0 c00b0350 c1b40000 00000001
c203a000
1ee0: c203ccd8 c1b34000 00000060 ffffffea 00061ba0 c1b40000 c1b41fa4
c1b41f08
1f00: c002bd88 c203bbac c1b34000 c1b41f1c c1b35000 0000000a c1b3a7a0
00000060
1f20: c2038000 c203a060 00002d2c 00000000 00000000 00000000 00000000
00000000
1f40: 00000000 00000000 00000000 00000000 00000000 00000000 00000000
00000000
1f60: 00000000 00000000 00000000 00000000 00000000 00000000 00000000
00052ba8
1f80: 00052ba8 0004e918 00000080 c001d684 c1b40000 00002d2c 00000000
c1b41fa8
1fa0: c001d4e0 c002b6a0 00052ba8 c0023694 000529a8 00061ba0 00000000
00000030
1fc0: 00052ba8 00052ba8 0004e918 c203a000 000529a8 000529a8 00002d2c
bffffec8
1fe0: 400eac20 bfffdc6c 0001e954 400eac2c 60000010 000529a8 40128274
40128284
Backtrace:
Function entered at [<c2028424>] from [<c2029488>]
Function entered at [<c2029460>] from [<c20270e4>]
Function entered at [<c2027060>] from [<c00b49ec>]
 r7 = C0152058  r6 = C203CA70  r5 = C0152130  r4 = C202ACDC
Function entered at [<c00b49ac>] from [<c00b03d4>]
 r6 = C203CA70  r5 = C015206C  r4 = C0152158
Function entered at [<c00b0340>] from [<c203beb0>]
 r7 = C203C890  r6 = C203A8A0  r5 = C203C8F0  r4 = C203CA70
Function entered at [<c203bb9c>] from [<c002bd88>]
Function entered at [<c002b690>] from [<c001d4e0>]
Code: bad PC value.
Segmentation fault
#

-----Original Message-----
From: David Woodhouse [mailto:dwmw2@infradead.org] 
Sent: Thursday, June 17, 2004 9:51 AM
To: Carlos, John J USAATC
Cc: linux-mtd@lists.infradead.org
Subject: Re: DOC Mil Plus 32 any work being done?


On Thu, 2004-06-17 at 09:33 -0400, Carlos, John J USAATC wrote:
> Hi,
> 
>   Is anyone actually working on getting support for the Millennium 
> Plus 32M chip.  I looked at the latest patch and unfortunately work on 
> that chip hasn't been added.

The Millennium Plus is a little more bizarre than the other DiskOnChip
devices which we support; it'll take a little more to massage it into the
generic NAND framework, although Thomas seems to think it won't be hard. 

Unfortunately, although I am able to give limited access to DiskOnChip 2000
and Millennium documentation, I can't do the same for the Millennium Plus.
So you have to sort of pick it up from the existing code in
drivers/doc2001plus.c. 

Can you join us on IRC? irc.freenode.net channel #mtd

>   I have been trying to hack up the code but don't have
> much knowledge in this area.  I am sure what I am doing is time ill 
> spent other then getting a small understanding of the problem.  I am 
> doing a lot of cut and paste to the diskonchip.c file.

I suspect there isn't enough shared code to make it worth adding Millennium
Plus support to diskonchip.c. You'd probably do better to create a new
driver in drivers/nand for the Millennium Plus. You can still base it on
diskonchip.c of course.

If all you need to do is make INFTL work though, I suspect the
devices/doc2001plus driver ought to be sufficient for now. Your problem
wasn't actually with the low-level hardware driver; it was with the INFTL
formatting wasn't it?


-- 
dwmw2
