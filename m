Received: from web412.biz.mail.mud.yahoo.com ([68.142.201.43])
	by pentafluge.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IkOVA-0004m4-T6
	for linux-mtd@lists.infradead.org; Tue, 23 Oct 2007 19:29:22 +0100
Date: Tue, 23 Oct 2007 11:28:11 -0700 (PDT)
From: z l <zql@glomationinc.com>
Subject: Re: MTD driver for MLC NAND chips
To: Sudeep K N <sudeepholla.maillist@gmail.com>
In-Reply-To: <366f00c80710221737l3d2b6ec5qd51160253f7c73d6@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="0-1146920539-1193164091=:61584"
Content-Transfer-Encoding: 8bit
Message-ID: <572935.61584.qm@web412.biz.mail.mud.yahoo.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--0-1146920539-1193164091=:61584
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Id: 
Content-Disposition: inline


--- Sudeep K N <sudeepholla.maillist@gmail.com> wrote:

> No special changes are required for MLC chip.
> It works fines as it is.
> Just make sure that the chip is getting detected
> as large page nand chip as the BI is at different
> offset in spare area compared to small page chip.
> 

I posted some additional information but some how did
not got through.  I'm posting it here again.

The MTD driver would work without any problem, at
least what I can see, when the MTD driver is compiled
with debug turned on.  The level of debug output
doesn't matter as long as the debug is turned on.  As
soon as I turn off the MTD debug, the kernel would
crash.

attached is the log message.

zl

--0-1146920539-1193164091=:61584
Content-Type: text/plain; name="9302-K9LAG08-bug.txt"
Content-Description: 2428480976-9302-K9LAG08-bug.txt
Content-Disposition: inline; filename="9302-K9LAG08-bug.txt"

Uncompressing Linux.............................................................
................................... done, booting the kernel.
Linux version 2.6.22.1 (root@GESBC) (gcc version 4.1.2 20061115 (prerelease) (De
bian 4.1.1-21)) #7 Tue Oct 23 00:54:56 UTC 2007
CPU: ARM920T [41129200] revision 0 (ARMv4T), cr=c0007177
Machine: Cirrus Logic EDB9302 Evaluation Board
Memory policy: ECC disabled, Data cache writeback
CPU0: D VIVT write-back cache
CPU0: I cache: 16384 bytes, associativity 64, 32 byte lines, 8 sets
CPU0: D cache: 16384 bytes, associativity 64, 32 byte lines, 8 sets
Built 1 zonelists.  Total pages: 16144
Kernel command line: console=ttyAM0 root=/dev/ram
PID hash table entries: 256 (order: 8, 1024 bytes)
Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
Memory: 8MB 8MB 8MB 8MB 8MB 8MB 8MB 8MB = 64MB total
Memory: 58744KB available (2740K code, 214K data, 108K init)
Mount-cache hash table entries: 512
CPU: Testing write buffer coherency: ok
NET: Registered protocol family 16
ep93xx: PLL1 running at 400 MHz, PLL2 at 192 MHz
ep93xx: FCLK 200 MHz, HCLK 100 MHz, PCLK 50 MHz
SCSI subsystem initialized
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
NET: Registered protocol family 2
IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
TCP established hash table entries: 2048 (order: 3, 40960 bytes)
TCP bind hash table entries: 2048 (order: 3, 40960 bytes)
TCP: Hash tables configured (established 2048 bind 2048)
TCP reno registered
checking if image is initramfs...it isn't (no cpio magic); looks like an initrd
Freeing initrd memory: 3072K
NetWinder Floating Point Emulator V0.97 (extended precision)
JFFS2 version 2.2. (NAND) AC 2001-2006 Red Hat, Inc.
io scheduler noop registered
io scheduler deadline registered (default)
ep93xx_wdt: EP93XX watchdog, driver version 0.3
Serial: AMBA driver $Revision: 1.41 $
apb:uart1: ttyAM0 at MMIO 0x808c0000 (irq = 52) is a AMBA
apb:uart2: ttyAM1 at MMIO 0x808d0000 (irq = 54) is a AMBA
apb:uart3: ttyAM2 at MMIO 0x808e0000 (irq = 55) is a AMBA
RAMDISK driver initialized: 16 RAM disks of 12288K size 1024 blocksize
loop: module loaded
nbd: registered device at major 43
ep93xx-eth version 0.1 loading
eth0: ep93xx on-chip ethernet, IRQ 39, 00:00:00:00:00:00.
drivers/net/usb/rtl8150.c: rtl8150 based usb-ethernet driver v0.6.2 (2004/08/27)
usbcore: registered new interface driver rtl8150
physmap platform flash device: 01000000 at 60000000
physmap-flash.0: Found 1 x16 devices at 0x0 in 16-bit bank
 Intel/Sharp Extended Query Table at 0x0031
Using buffer write method
cfi_cmdset_0001: Erase suspend on write enabled
Searching for RedBoot partition table in physmap-flash.0 at offset 0xfe0000
5 RedBoot partitions found on MTD device physmap-flash.0
Creating 5 MTD partitions on "physmap-flash.0":
0x00000000-0x00040000 : "RedBoot"
0x00040000-0x00200000 : "ramdisk"
0x00200000-0x00360000 : "zImage"
0x00fc0000-0x00fc1000 : "RedBoot config"
mtd: partition "RedBoot config" doesn't end on an erase block -- force read-only
0x00fe0000-0x01000000 : "FIS directory"
Searching for NAND flash...
NAND device: Manufacturer ID: 0xec, Chip ID: 0xd5 (Samsung NAND 2GiB 3,3V 8-bit)
Scanning device for bad blocks
kernel BUG at drivers/mtd/nand/nand_base.c:174!
Unable to handle kernel NULL pointer dereference at virtual address 00000000
pgd = c0004000
[00000000] *pgd=00000000
Internal error: Oops: 805 [#1]
Modules linked in:
CPU: 0    Not tainted  (2.6.22.1 #7)
PC is at __bug+0x20/0x2c
LR is at 0xc02d5554
pc : [<c0027cc4>]    lr : [<c02d5554>]    psr: 60000013
sp : c03c5e04  ip : c02d5554  fp : c03c5e10
r10: c128e970  r9 : 00000000  r8 : 00040000
r7 : c128ea28  r6 : 00000000  r5 : 04028800  r4 : 00040000
r3 : 00000000  r2 : 00000001  r1 : 00000001  r0 : 00000033
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  Segment kernel
Control: c000717f  Table: 00004000  DAC: 00000017
Process swapper (pid: 1, stack limit = 0xc03c4258)
Stack: (0xc03c5e04 to 0xc03c6000)
5e00:          c03c5e20 c03c5e14 c0173110 c0027cb4 c03c5e68 c03c5e24 c0175424
5e20: c01730e0 00000040 00000000 c03c5e8c 00000040 00000040 c12ff080 0000007f
5e40: 00040000 00000000 c128e970 00000002 c128ea28 00000000 c02e0c7c c03c5ed4
5e60: c03c5e6c c0175f58 c017526c c03c5e78 c12ff080 0000402a 00000001 00000000
5e80: 00040000 00000000 00000002 00000000 c03c5ebc 00000000 00000040 00000040
5ea0: 00000000 00000000 c12ff080 c128ea28 c128e970 00000000 c02fd9dc c03c4000
5ec0: 00000000 00000000 c03c5f24 c03c5ed8 c0176d40 c0175d9c c0173144 c02e0c7c
5ee0: 00000000 00000000 c007df54 c007dedc c03c5efc c003dd68 c0306bc0 c128ea28
5f00: c128e970 00000000 c02fd9dc c03c4000 00000000 00000000 c03c5f34 c03c5f28
5f20: c01771d4 c0176cb8 c03c5f50 c03c5f38 c01734fc c0177120 c128e970 00000001
5f40: c8056000 c03c5f68 c03c5f54 c0174944 c0173124 00000001 c128ea28 c03c5f8c
5f60: c03c5f6c c00196ec c01748f4 00000000 c0020404 00000000 c001f160 00000000
5f80: c03c5ff4 c03c5f90 c0008904 c00195d4 00000000 00000000 00000000 00000000
5fa0: 00000000 c03c5fb0 c0023f24 c0039e2c 00000000 00000000 c000884c c004029c
5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
5fe0: 00000000 00000000 00000000 c03c5ff8 c004029c c000885c c03c5ff8 c03c5ff8
Backtrace:
[<c0027ca4>] (__bug+0x0/0x2c) from [<c0173110>] (nand_select_chip+0x40/0x44)
[<c01730d0>] (nand_select_chip+0x0/0x44) from [<c0175424>] (nand_read_oob+0x1c8/
0x314)
[<c017525c>] (nand_read_oob+0x0/0x314) from [<c0175f58>] (create_bbt+0x1cc/0x2c0
)
[<c0175d8c>] (create_bbt+0x0/0x2c0) from [<c0176d40>] (nand_scan_bbt+0x98/0x468)
[<c0176ca8>] (nand_scan_bbt+0x0/0x468) from [<c01771d4>] (nand_default_bbt+0xc4/
0xe4)
[<c0177110>] (nand_default_bbt+0x0/0xe4) from [<c01734fc>] (nand_scan_tail+0x3e8
/0x48c)
[<c0173114>] (nand_scan_tail+0x0/0x48c) from [<c0174944>] (nand_scan+0x60/0x6c)
 r6:c8056000 r5:00000001 r4:c128e970
[<c01748e4>] (nand_scan+0x0/0x6c) from [<c00196ec>] (gesbc_nand_init+0x128/0x254
)
 r5:c128ea28 r4:00000001
[<c00195c4>] (gesbc_nand_init+0x0/0x254) from [<c0008904>] (kernel_init+0xb8/0x2
80)
 r7:00000000 r6:c001f160 r5:00000000 r4:c0020404
[<c000884c>] (kernel_init+0x0/0x280) from [<c004029c>] (do_exit+0x0/0x7dc)
Code: e1a01000 e59f000c eb00581f e3a03000 (e5833000)
Kernel panic - not syncing: Attempted to kill init!

--0-1146920539-1193164091=:61584--
