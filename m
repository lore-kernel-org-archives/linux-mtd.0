Received: from wsgw1.atc.army.mil ([134.194.13.55])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BSZQr-00022i-2x
	for linux-mtd@lists.infradead.org; Tue, 25 May 2004 06:45:19 -0400
Received: from atc-smtp1.atc.army.mil ([134.194.25.160])
	by wsgw1.atc.army.mil (SAVSMTP 3.1.1.32) with SMTP id
	M2004052506551104464
	for <linux-mtd@lists.infradead.org>; Tue, 25 May 2004 06:55:11 -0400
Message-ID: <EFF9A3506F74924AB5CC77BDC66E79351812A1@atcml01.atc.army.mil>
From: "Carlos, John J USAATC" <john.carlos@atc.army.mil>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Tue, 25 May 2004 06:46:40 -0400
MIME-Version: 1.0
Content-Type: text/plain
Subject: DOC MD2811-D32  on Arm linux  seeking guidance???
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello All,

  I have a development board with an OMAP5910 processor.  I patched my
2.4.21 kernel with the mtd snapshot 20040405.tar.gz.  I had to change how
ReadDOC and WriteDOC worked.  Seems that inw and outw work to access my
chip, the addressing must not be shifted properly for an arm core on my
board.  I had to put the proper wakeup sequence in the drivers and probing
functions.  I had to have 3 reads from offset 0x1fff and four write to
address 0x1006,0x1076,0x1006,0x1076 values 0x1c,0xe3,0x1d,0xe2.  After that
the chip could be read and the id read ID=0x40.  I had formatted the DOC
using the manufacturers console program to fat.  I start things up and you
can see the messages I get from my system.

I also tried the nand subsystem instead of the M-sys subsystem.  For some
reason the nand subsystem isn't passing the correct base I/O to nand_scan?
My question is which subsystem is preferred or better.  Are both subsystems
working fully?  Am I leaving something out?  Have I not prepared the DOC
properly so it can be used/mounted, and if not how should I prep it for
use??

Thanks for the help!
John 


M-sys output:

Using /lib/modules/2.4.21-rmk1-omap1/kernel/fs/fat/fat.o
# insmod vfat
Using /lib/modules/2.4.21-rmk1-omap1/kernel/fs/vfat/vfat.o
# insmod docecc
Using /lib/modules/2.4.21-rmk1-omap1/kernel/drivers/mtd/devices/docecc.o
# insmod nand_ids
Using /lib/modules/2.4.21-rmk1-omap1/kernel/drivers/mtd/nand/nand_ids.o
# insmod nand_ecc
Using /lib/modules/2.4.21-rmk1-omap1/kernel/drivers/mtd/nand/nand_ecc.o
# insmod nand
Using /lib/modules/2.4.21-rmk1-omap1/kernel/drivers/mtd/nand/nand.o
# insmod doc2001plus
Using
/lib/modules/2.4.21-rmk1-omap1/kernel/drivers/mtd/devices/doc2001plus.o
# insmod docprobe
Using /lib/modules/2.4.21-rmk1-omap1/kernel/drivers/mtd/devices/docprobe.o
Using configured DiskOnChip probe address 0xc000000
TP1
emifs_config=0x      12
emifs_cs3_config=0x    3331
emifs_cs0_config=0x  2130b0
emifs_cs0_config=0x  215051
mode is ?? 0x   1
ID is ?? 0x  40
read ID directly =0xffff
read CS3 directly =0x3331
read byte=0x  40
read word=0x  40
read long=0x      40
window=0xc2044000 reg=0x    1046 potential=0xc2044000
In DOCPROBE Toggle= 82
In DOCPROBE Toggle= 86
In DOCPROBE ChipID= 40
ID is ?? 0x  40
In DOCPROBE before case switch ChipID= 40
here in case 0 section
In DOCPROBEeck again ChipID= 64
TP3
TP3
TP2
TP4
DiskOnChip Millennium Plus found at address 0xC000000
mrf=0x  98 dummy=0x40
Flash chip found: Manufacturer ID: 98, Chip ID: A5 (Toshiba:NAND 2GiB 1,8V
8-bit
)
mrf=0x  91 dummy=0x491
1 flash chips found. Total DiskOnChip size: 2048 MiB
Division by zero in kernel.
Function entered at [<c00227c4>] from [<c0122728>]
Function entered at [<c00b7390>] from [<c00b8138>]
Function entered at [<c00b8120>] from [<c00b623c>]
Function entered at [<c00b61cc>] from [<c00b4894>]
 r7 = C0154058  r6 = C1CBD600  r5 = C0154130  r4 = C01541F0
Function entered at [<c00b4854>] from [<c00b03b8>]
 r6 = C1CBD600  r5 = C015406C  r4 = C0154158
Function entered at [<c00b0340>] from [<c203f9a0>]
 r7 = C2040250  r6 = C203FE1C  r5 = C203FA08  r4 = C203FDE4
Function entered at [<c203f834>] from [<c20425dc>]
Function entered at [<c2042060>] from [<c2042668>]
Function entered at [<c204263c>] from [<c002bd88>]
 r5 = 00000000  r4 = C2042000
Function entered at [<c002b690>] from [<c001d4e0>]
INFTL: could not find valid boot record?
INFTL: could not mount device
Division by zero in kernel.
Function entered at [<c00227c4>] from [<c0122728>]
Function entered at [<c00b512c>] from [<c00b5c9c>]
Function entered at [<c00b5c84>] from [<c00b4dc8>]
Function entered at [<c00b4d58>] from [<c00b4894>]
 r7 = C0154058  r6 = C1CBD600  r5 = C0154130  r4 = C0154194
Function entered at [<c00b4854>] from [<c00b03b8>]
 r6 = C1CBD600  r5 = C015406C  r4 = C0154158
Function entered at [<c00b0340>] from [<c203f9a0>]
 r7 = C2040250  r6 = C203FE1C  r5 = C203FA08  r4 = C203FDE4
Function entered at [<c203f834>] from [<c20425dc>]
Function entered at [<c2042060>] from [<c2042668>]
Function entered at [<c204263c>] from [<c002bd88>]
 r5 = 00000000  r4 = C2042000
Function entered at [<c002b690>] from [<c001d4e0>]
Could not find valid boot record
NFTL: could not mount device
insmod: init_module: docprobe: Resource temporarily unavailable
#


Nand subsytem output:

# insmod diskonchip
Using /lib/modules/2.4.21-rmk1-omap1/kernel/drivers/mtd/nand/diskonchip.o
Chip _D= 0x  40
Chip _D= 0x  40
Chip _D= 0x  40
mymtd.name= <NULL> #chips=0x  10
Entering In nand_scan IO_base=0x       0
