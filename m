Received: from jsc-ems-vws02.jsc.nasa.gov ([139.169.16.51])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19ZWyI-00028n-LF
	for <linux-mtd@lists.infradead.org>; Mon, 07 Jul 2003 15:28:02 +0100
Message-ID: <5A9E3D5804EA1F4582C9A99A50404F82010017E5@jsc-mail06.jsc.nasa.gov>
From: "PIPLANI, PERRY J. (JSC-EV3) (NASA)" <perry.j.piplani@nasa.gov>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Mon, 7 Jul 2003 09:28:02 -0500 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: Single driver (doc2000) doesn't work on a millenium
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Greetings,

I'm working with a custom designed PPC603 minicontroller pc-104 board based
on the Motorolla Yellowknife reference platform, called a Universal
MiniController. (Custom designed in house at the Johnson Space Center to
meet flight requirements). On it I've got an 8mb DiskOnChip millenium at
address 0xFFE00000. Right now I'm just getting started with the DiskOnChips
and am trying to get mtd and nftl support. I'm using a CVS snapshot dated
6/17/03, however I had the same results using the mtd drivers that are in
the kernel distribution. 

Everything works as expected if I use the doc2001.c driver. I get the
following kernel output.

NFTL driver: nftlcore.c $Revision: 1.94 $, nftlmount.c $Revision: 1.34 $

Using configured DiskOnChip probe address 0xffe00000

DiskOnChip Millennium found at address 0xFFE00000

Flash chip found: Manufacturer ID: 98, Chip ID: E6 (Toshiba:NAND 8MiB 3,3V)

_DoC_WaitReady called for out-of-line wait

_DoC_WaitReady timed out.

_DoC_WaitReady called for out-of-line wait

_DoC_WaitReady timed out.

_DoC_WaitReady called for out-of-line wait

1 flash chips found. Total DiskOnChip size: 8 MiB

mtd: Giving out device 0 to DiskOnChip Millennium

NFTL: add_mtd for DiskOnChip Millennium

Partition check:

 nftla: unknown partition table

>From here I can make and use an ext2 file system on /dev/nftla and have no
troubles at all.



However, using the doc2000 driver however, I get the following:

NFTL driver: nftlcore.c $Revision: 1.94 $, nftlmount.c $Revision: 1.34 $
Using configured DiskOnChip probe address 0xffe00000
DiskOnChip Millennium found at address 0xFFE00000
Flash chip found: Manufacturer ID: 98, Chip ID: E6 (Toshiba:NAND 8MiB 3,3V)
_DoC_WaitReady called for out-of-line wait
_DoC_WaitReady called for out-of-line wait
_DoC_WaitReady called for out-of-line wait
_DoC_WaitReady called for out-of-line wait
_DoC_WaitReady called for out-of-line wait
Flash chip at floor 1, chip 0 is different:
Unknown flash chip found: C0 C0
Please report to dwmw2@infradead.org
_DoC_WaitReady called for out-of-line wait
_DoC_WaitReady called for out-of-line wait
_DoC_WaitReady called for out-of-line wait
_DoC_WaitReady called for out-of-line wait
_DoC_WaitReady called for out-of-line wait
Flash chip at floor 2, chip 0 is different:
Unknown flash chip found: C0 C0
Please report to dwmw2@infradead.org
_DoC_WaitReady called for out-of-line wait
_DoC_WaitReady called for out-of-line wait
_DoC_WaitReady called for out-of-line wait
_DoC_WaitReady called for out-of-line wait
_DoC_WaitReady called for out-of-line wait
Flash chip at floor 3, chip 0 is different:
Unknown flash chip found: C0 C0
Please report to dwmw2@infradead.org
1 flash chips found. Total DiskOnChip size: 8 MiB
mtd: Giving out device 0 to DiskOnChip Millennium
NFTL: add_mtd for DiskOnChip Millennium
_DoC_WaitReady called for out-of-line wait
_DoC_WaitReady called for out-of-line wait
_DoC_WaitReady called for out-of-line wait
_DoC_WaitReady called for out-of-line wait
_DoC_WaitReady called for out-of-line wait
_DoC_WaitReady called for out-of-line wait
_DoC_WaitReady called for out-of-line wait
_DoC_WaitReady called for out-of-line wait
_DoC_WaitReady called for out-of-line wait
_DoC_WaitReady called for out-of-line wait
    ...ad infinitum...

This continues forever and the kernel never completes booting. I've got a
JTAG port on the minicontroller from which I use and abatron BDI2000.
Halting the processor while stuck in the above loop and then using gdb over
the BDI2000 to get a backtrace I get the following:

#0  0xc0090114 in sc28l92_console_write (cons=0x1, 
    str=0xc016aba5 "_DoC_WaitReady called for out-of-line wait\n", count=43)
    at /home/perrypip/denx/dockern/linux-2.4.19-umc0.3/include/asm/io.h:282
#1  0xc00149f8 in __call_console_drivers (start=11185, end=11228) at
printk.c:311
#2  0xc0014a90 in _call_console_drivers (start=3222667264, end=36914,
msg_log_level=0) at printk.c:326
#3  0xc0014bb0 in call_console_drivers (start=11228, end=11228) at
printk.c:372
#4  0xc0014ef4 in release_console_sem () at printk.c:524
#5  0xc0014de8 in printk (fmt=0x0) at printk.c:464
#6  0xc00a02a0 in _DoC_WaitReady (doc=0x1) at doc2000.c:91
#7  0xc00a23c8 in doc_read_oob (mtd=0x1, ofs=98824, len=8,
retlen=0xc1ff5ea8, buf=0xc1ff5ea0 "\003")
    at doc2000.c:119
#8  0xc009e788 in NFTL_mount (s=0xc1fcb160) at nftlmount.c:570
#9  0xc009c950 in nftl_add_mtd (tr=0xc0127dc0, mtd=0xc1fcb060) at
nftlcore.c:64
#10 0xc009fb6c in blktrans_notify_add (mtd=0xc1fcb060) at
mtd_blkdevs-24.c:551
#11 0xc009b024 in add_mtd_device (mtd=0xc1fcb060) at mtdcore.c:67
#12 0xc00a0e60 in DoC2k_init (mtd=0xc1fcb060) at doc2000.c:592
#13 0xc013c4a0 in DoC_Probe (physadr=4292870144) at docprobe.c:294
#14 0xc013c518 in init_doc () at docprobe.c:317
#15 0xc012f5b0 in do_initcalls () at init/main.c:446
#16 0xc012f5fc in do_basic_setup () at init/main.c:530
#17 0xc0003934 in init (unused=0x1) at init/main.c:546
#18 0xc00083b8 in kernel_thread () at time.c:429

Here's is the pertinent information from my .config file when the above
problem occurs:

# Memory Technology Devices (MTD)
#
CONFIG_MTD=y
CONFIG_MTD_DEBUG=y
CONFIG_MTD_DEBUG_VERBOSE=3
# CONFIG_MTD_PARTITIONS is not set
# CONFIG_MTD_CONCAT is not set

#
# User Modules And Translation Layers
#
CONFIG_MTD_CHAR=y
# CONFIG_MTD_BLOCK is not set
# CONFIG_MTD_BLOCK_RO is not set
# CONFIG_FTL is not set
CONFIG_NFTL=y
CONFIG_NFTL_RW=y
# CONFIG_INFTL is not set

...

#
# Disk-On-Chip Device Drivers
#
CONFIG_MTD_DOC2000=y
# CONFIG_MTD_DOC2001 is not set
# CONFIG_MTD_DOC2001PLUS is not set
CONFIG_MTD_DOCPROBE=y
CONFIG_MTD_DOCPROBE_ADVANCED=y
CONFIG_MTD_DOCPROBE_ADDRESS=FFE00000
# CONFIG_MTD_DOCPROBE_HIGH is not set
# CONFIG_MTD_DOCPROBE_55AA is not set

#
# NAND Flash Device Drivers
#
# CONFIG_MTD_NAND is not set
CONFIG_MTD_NAND_IDS=y


So anyways your comment in docprobe.c says I should inform you when the
combined driver doesn't work so this is what I'm doing. Also, I have some
future work to do so I may be contacting you more. I have a pc-104 expansion
board coming that will have 4 64mb DiskOnChip 2000's, so I'll need to get
the doc2000 driver working for that. Our long term intention is really to
use the on board 8mb DiskOnChip millenium for booting a kernel with u-boot
(which we still have to port to our minicontroller...another issue entirely)
and the 256 mb DiskOnChip 2000 expansion board as a root filesystem. 

Thanks for your time.

Perry
