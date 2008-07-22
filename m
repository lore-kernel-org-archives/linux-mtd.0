Received: from rv-out-0708.google.com ([209.85.198.243])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KLGgt-0006wB-QI
	for linux-mtd@lists.infradead.org; Tue, 22 Jul 2008 12:10:05 +0000
Received: by rv-out-0708.google.com with SMTP id b17so2450865rvf.42
	for <linux-mtd@lists.infradead.org>;
	Tue, 22 Jul 2008 05:10:02 -0700 (PDT)
Message-ID: <22fa0c0d0807220510w23c4ea53nffd8057161bfef97@mail.gmail.com>
Date: Tue, 22 Jul 2008 17:40:02 +0530
From: "chinthu k" <tochinthu@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Issue on mounting rootfs getting 'Magic bitmask 0x1985 not found at
	0x00860040: 0x0f0f instead' prints
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am using pxa320 evaluation board(karo staterkit-4 ) with kernel
2.6.20(arm-based). I am using jffs2 as my rootfs. .
The flash is samsung nand flash 128MB (K9F1G08U0A).
Whenever I boot my board from nand flash  I am getting a lot of nosy
prints which l have pasted below(Except for the very first time for
which the board
boots with out any prints ).
Even with these prints my board successfully boots and rootfs is
mounted successfully.
I am making my image on my host machine by using the mkfs.jffs2 as below

mkfs.jffs2 -d./rootfs -e 0x20000 -o$IMAGEDIR/rootfs.image

and I am writing the image from u-boot by using the "nand write.jffs2"
 after erasing the partition .
For the very first time after the flashing of the rootfs  linux boots
without any of the prints .
>From the second time onwards I am getting the  "Magic Bit mask 0x1985
not found" prints.

I also tired padding the image to full size of the rootfs partition by
using the pad option (previously case It was less than the
total rootfs partiton size ).

mkfs.jffs2 -p0x00c00000 -d./rootfs -e 0x20000 -o$IMAGEDIR/rootfs.image

It also is giving me the same result as of the prevous image.

Please give me some solution to this issue ASAP

Log file is pasted below
-----------------------------------------------------------------------------------------------------------------------------


Uncompressing Linux...........................................................................................
done, booting the kernel.
Linux version 2.6.20-karo-320 (chinthu@slhb) (gcc version 3.4.3) #47
PREEMPT Thu Jul 3 15:28:48 IST 2008
CPU: XScale-Core3 [69056826] revision 6 (ARMv5TE), cr=0400397f
Machine: KARO electronics PXA320 processor module on Starterkit 4
Memory policy: ECC disabled, Data cache writeback
Run Mode clock: 403.00MHz (*31)
Turbo Mode clock: 806.00MHz (*2, active)
SDRAM clock: 130.00MHz
Static Memory clock: 104.00MHz
Internal SRAM clock: 104.00MHz
High speed bus clock: 208.00MHz
CPU0: D VIVT undefined 5 cache
CPU0: I cache: 32768 bytes, associativity 4, 32 byte lines, 256 sets
CPU0: D cache: 32768 bytes, associativity 4, 32 byte lines, 256 sets
Built 1 zonelists.  Total pages: 16256
Kernel command line: init=/linuxrc
mtdparts=triton320-nand:128k(sbootl),256k(u-boot),128k(env),2m(linux_kernel),12m(rootfs),83456k(userfs),32m(wince);
root=/dev/mtdblock1 rootfstype=jffs2 panic=5 console=ttyS0,38400 ro
PID hash table entries: 256 (order: 8, 1024 bytes)
start_kernel(): bug: interrupts were enabled early
Console: colour dummy device 80x30
Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
Memory: 64MB = 64MB total
Memory: 61944KB available (2544K code, 259K data, 116K init)
Mount-cache hash table entries: 512
CPU: Testing write buffer coherency: ok
NET: Registered protocol family 16
karo_mod_detect: Found Triton-320 Rev 1.1
Module type is: 0x83
karo_set_features: Setting up HW features for Triton-320 (0x83)
karo_check_board_features: M24Cxx not responding
karo_board_detect: Found KARO Starterkit 4
Board type is: 0x22
karo_set_features: Setting up HW features for KARO Starterkit 4 (0x22)

KARO DS2430 serial number: 99:db:60:03:00:00; CRC=72
karo_read_config: DS2430 application register has not been programmed!
karo_read_config: No DS2430 configuration data found; using default
module configuration
Generic PHY: Registered new driver
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
NET: Registered protocol family 2
IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
TCP established hash table entries: 2048 (order: 1, 8192 bytes)
TCP bind hash table entries: 1024 (order: 0, 4096 bytes)
TCP: Hash tables configured (established 2048 bind 1024)
TCP reno registered
PXA CPU frequency change support initialized
NetWinder Floating Point Emulator V0.97 (double precision)
JFFS2 version 2.2. (NAND) (SUMMARY)  (C) 2001-2006 Red Hat, Inc.
io scheduler noop registered
io scheduler anticipatory registered (default)
io scheduler deadline registered
io scheduler cfq registered
PXA27x: LCD clk: 208.00MHz PCDDIV: 0
PXA27x: Requested pixel clock: 27.78MHz, actual pixel clock: 26.00MHz (PCD:3)
PXA27x: LCD clk: 208.00MHz PCDDIV: 0
PXA27x: Requested pixel clock: 27.78MHz, actual pixel clock: 26.00MHz (PCD:3)
Console: switching to colour frame buffer device 80x30
pxa2xx-uart.0: ttyS0 at MMIO 0x40100000 (irq = 22) is a FFUART
pxa2xx-uart.1: ttyS1 at MMIO 0x40200000 (irq = 21) is a BTUART
pxa2xx-uart.2: ttyS2 at MMIO 0x40700000 (irq = 20) is a STUART
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
Davicom DM9161E: Registered new driver
Davicom DM9131: Registered new driver
dm9000 Ethernet Driver
eth%d: Invalid ethernet MAC address.  Please set using ifconfig
eth0: dm9000 at 10000300,10008300 16bit bus IRQ 93 MAC: ff:ff:ff:ff:ff:ff
NAND device: Manufacturer ID: 0xec, Chip ID: 0xf1 (Samsung NAND 128MiB
3,3V 8-bit)
Scanning device for bad blocks
Bad eraseblock 210 at 0x01a40000
PXA32x NAND driver IRQ 45; DMA 8
mtd: no mtd-id
7 cmdlinepart partitions found on MTD device triton320-nand
nand_pxa32x_probe: Using command line partition definition
Creating 4 MTD partitions on "triton320-nand":
0x00080000-0x00280000 : "linux_kernel"
0x00280000-0x00e80000 : "rootfs"
0x00e80000-0x06000000 : "userfs"
0x06000000-0x08000000 : "wince"
usbmon: debugfs is not available
pxa27x-ohci pxa27x-ohci: PXA27x OHCI
pxa27x-ohci pxa27x-ohci: new USB bus registered, assigned bus number 1
pxa27x-ohci pxa27x-ohci: irq 3, io mem 0x4c000000
usb usb1: configuration #1 chosen from 1 choice
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 3 ports detected
sa1100-rtc sa1100-rtc: rtc core: registered sa1100-rtc as rtc0
SA1100/PXA2xx Real Time Clock driver
 : Enabling slave mode
i2c_adapter i2c-0: Enabling slave mode
 : ds1339 oscillator failure; RTC time must be set!
ds13xx 0-0068: rtc core: registered ds1339 as rtc1
I2C: i2c-0: PXA I2C adapter, slave address 1
TCP cubic registered
NET: Registered protocol family 1
NET: Registered protocol family 17
XScale iWMMXt coprocessor detected.
ds13xx 0-0068: RTC Oscillator failure; RTC time must be set!
ds13xx 0-0068: setting the system clock to 2000-01-01 00:00:11 (946684811)
Empty flash at 0x008434b4 ends at 0x00843800
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00860040:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00860044:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00860048:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0086004c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00860050:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00860054:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00860058:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0086005c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00860060:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00860064:
0x0f0f instead
Further such events for this erase block will not be printed
Empty flash at 0x00860080 ends at 0x008600c0
Empty flash at 0x00860100 ends at 0x00860140
Empty flash at 0x00860180 ends at 0x008601c0
Empty flash at 0x00860200 ends at 0x00860240
Empty flash at 0x00860280 ends at 0x008602c0
Empty flash at 0x00860300 ends at 0x00860340
Empty flash at 0x00860380 ends at 0x008603c0
Empty flash at 0x00860400 ends at 0x00860440
Empty flash at 0x00860480 ends at 0x008604c0
Empty flash at 0x00860500 ends at 0x00860540
Empty flash at 0x00860580 ends at 0x008605c0
Empty flash at 0x00860600 ends at 0x00860640
Empty flash at 0x00860680 ends at 0x008606c0
Empty flash at 0x00860700 ends at 0x00860740
Empty flash at 0x00860780 ends at 0x008607c0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00880040:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00880044:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00880048:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0088004c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00880050:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00880054:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00880058:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0088005c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00880060:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00880064:
0x0f0f instead
Further such events for this erase block will not be printed
Empty flash at 0x00880080 ends at 0x008800c0
Empty flash at 0x00880100 ends at 0x00880140
Empty flash at 0x00880180 ends at 0x008801c0
Empty flash at 0x00880200 ends at 0x00880240
Empty flash at 0x00880280 ends at 0x008802c0
Empty flash at 0x00880300 ends at 0x00880340
Empty flash at 0x00880380 ends at 0x008803c0
Empty flash at 0x00880400 ends at 0x00880440
Empty flash at 0x00880480 ends at 0x008804c0
Empty flash at 0x00880500 ends at 0x00880540
Empty flash at 0x00880580 ends at 0x008805c0
Empty flash at 0x00880600 ends at 0x00880640
Empty flash at 0x00880680 ends at 0x008806c0
Empty flash at 0x00880700 ends at 0x00880740
Empty flash at 0x00880780 ends at 0x008807c0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x008a0040:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x008a0044:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x008a0048:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x008a004c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x008a0050:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x008a0054:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x008a0058:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x008a005c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x008a0060:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x008a0064:
0x0f0f instead
Further such events for this erase block will not be printed
Empty flash at 0x008a0080 ends at 0x008a00c0
Empty flash at 0x008a0100 ends at 0x008a0140
Empty flash at 0x008a0180 ends at 0x008a01c0
Empty flash at 0x008a0200 ends at 0x008a0240
Empty flash at 0x008a0280 ends at 0x008a02c0
Empty flash at 0x008a0300 ends at 0x008a0340
Empty flash at 0x008a0380 ends at 0x008a03c0
Empty flash at 0x008a0400 ends at 0x008a0440
Empty flash at 0x008a0480 ends at 0x008a04c0
Empty flash at 0x008a0500 ends at 0x008a0540
Empty flash at 0x008a0580 ends at 0x008a05c0
Empty flash at 0x008a0600 ends at 0x008a0640
Empty flash at 0x008a0680 ends at 0x008a06c0
Empty flash at 0x008a0700 ends at 0x008a0740
Empty flash at 0x008a0780 ends at 0x008a07c0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x008c0040:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x008c0044:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x008c0048:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x008c004c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x008c0050:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x008c0054:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x008c0058:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x008c005c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x008c0060:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x008c0064:
0x0f0f instead
Further such events for this erase block will not be printed
Empty flash at 0x008c0080 ends at 0x008c00c0
Empty flash at 0x008c0100 ends at 0x008c0140
Empty flash at 0x008c0180 ends at 0x008c01c0
Empty flash at 0x008c0200 ends at 0x008c0240
Empty flash at 0x008c0280 ends at 0x008c02c0
Empty flash at 0x008c0300 ends at 0x008c0340
Empty flash at 0x008c0380 ends at 0x008c03c0
Empty flash at 0x008c0400 ends at 0x008c0440
Empty flash at 0x008c0480 ends at 0x008c04c0
Empty flash at 0x008c0500 ends at 0x008c0540
Empty flash at 0x008c0580 ends at 0x008c05c0
Empty flash at 0x008c0600 ends at 0x008c0640
Empty flash at 0x008c0680 ends at 0x008c06c0
Empty flash at 0x008c0700 ends at 0x008c0740
Empty flash at 0x008c0780 ends at 0x008c07c0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x008e0040:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x008e0044:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x008e0048:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x008e004c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x008e0050:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x008e0054:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x008e0058:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x008e005c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x008e0060:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x008e0064:
0x0f0f instead
Further such events for this erase block will not be printed
Empty flash at 0x008e0080 ends at 0x008e00c0
Empty flash at 0x008e0100 ends at 0x008e0140
Empty flash at 0x008e0180 ends at 0x008e01c0
Empty flash at 0x008e0200 ends at 0x008e0240
Empty flash at 0x008e0280 ends at 0x008e02c0
Empty flash at 0x008e0300 ends at 0x008e0340
Empty flash at 0x008e0380 ends at 0x008e03c0
Empty flash at 0x008e0400 ends at 0x008e0440
Empty flash at 0x008e0480 ends at 0x008e04c0
Empty flash at 0x008e0500 ends at 0x008e0540
Empty flash at 0x008e0580 ends at 0x008e05c0
Empty flash at 0x008e0600 ends at 0x008e0640
Empty flash at 0x008e0680 ends at 0x008e06c0
Empty flash at 0x008e0700 ends at 0x008e0740
Empty flash at 0x008e0780 ends at 0x008e07c0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00900040:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00900044:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00900048:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0090004c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00900050:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00900054:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00900058:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0090005c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00900060:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00900064:
0x0f0f instead
Further such events for this erase block will not be printed
Empty flash at 0x00900080 ends at 0x009000c0
Empty flash at 0x00900100 ends at 0x00900140
Empty flash at 0x00900180 ends at 0x009001c0
Empty flash at 0x00900200 ends at 0x00900240
Empty flash at 0x00900280 ends at 0x009002c0
Empty flash at 0x00900300 ends at 0x00900340
Empty flash at 0x00900380 ends at 0x009003c0
Empty flash at 0x00900400 ends at 0x00900440
Empty flash at 0x00900480 ends at 0x009004c0
Empty flash at 0x00900500 ends at 0x00900540
Empty flash at 0x00900580 ends at 0x009005c0
Empty flash at 0x00900600 ends at 0x00900640
Empty flash at 0x00900680 ends at 0x009006c0
Empty flash at 0x00900700 ends at 0x00900740
Empty flash at 0x00900780 ends at 0x009007c0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00920040:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00920044:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00920048:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0092004c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00920050:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00920054:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00920058:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0092005c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00920060:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00920064:
0x0f0f instead
Further such events for this erase block will not be printed
Empty flash at 0x00920080 ends at 0x009200c0
Empty flash at 0x00920100 ends at 0x00920140
Empty flash at 0x00920180 ends at 0x009201c0
Empty flash at 0x00920200 ends at 0x00920240
Empty flash at 0x00920280 ends at 0x009202c0
Empty flash at 0x00920300 ends at 0x00920340
Empty flash at 0x00920380 ends at 0x009203c0
Empty flash at 0x00920400 ends at 0x00920440
Empty flash at 0x00920480 ends at 0x009204c0
Empty flash at 0x00920500 ends at 0x00920540
Empty flash at 0x00920580 ends at 0x009205c0
Empty flash at 0x00920600 ends at 0x00920640
Empty flash at 0x00920680 ends at 0x009206c0
Empty flash at 0x00920700 ends at 0x00920740
Empty flash at 0x00920780 ends at 0x009207c0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00940040:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00940044:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00940048:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0094004c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00940050:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00940054:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00940058:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0094005c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00940060:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00940064:
0x0f0f instead
Further such events for this erase block will not be printed
Empty flash at 0x00940080 ends at 0x009400c0
Empty flash at 0x00940100 ends at 0x00940140
Empty flash at 0x00940180 ends at 0x009401c0
Empty flash at 0x00940200 ends at 0x00940240
Empty flash at 0x00940280 ends at 0x009402c0
Empty flash at 0x00940300 ends at 0x00940340
Empty flash at 0x00940380 ends at 0x009403c0
Empty flash at 0x00940400 ends at 0x00940440
Empty flash at 0x00940480 ends at 0x009404c0
Empty flash at 0x00940500 ends at 0x00940540
Empty flash at 0x00940580 ends at 0x009405c0
Empty flash at 0x00940600 ends at 0x00940640
Empty flash at 0x00940680 ends at 0x009406c0
Empty flash at 0x00940700 ends at 0x00940740
Empty flash at 0x00940780 ends at 0x009407c0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00960040:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00960044:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00960048:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0096004c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00960050:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00960054:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00960058:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0096005c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00960060:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00960064:
0x0f0f instead
Further such events for this erase block will not be printed
Empty flash at 0x00960080 ends at 0x009600c0
Empty flash at 0x00960100 ends at 0x00960140
Empty flash at 0x00960180 ends at 0x009601c0
Empty flash at 0x00960200 ends at 0x00960240
Empty flash at 0x00960280 ends at 0x009602c0
Empty flash at 0x00960300 ends at 0x00960340
Empty flash at 0x00960380 ends at 0x009603c0
Empty flash at 0x00960400 ends at 0x00960440
Empty flash at 0x00960480 ends at 0x009604c0
Empty flash at 0x00960500 ends at 0x00960540
Empty flash at 0x00960580 ends at 0x009605c0
Empty flash at 0x00960600 ends at 0x00960640
Empty flash at 0x00960680 ends at 0x009606c0
Empty flash at 0x00960700 ends at 0x00960740
Empty flash at 0x00960780 ends at 0x009607c0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00980040:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00980044:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00980048:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0098004c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00980050:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00980054:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00980058:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0098005c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00980060:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00980064:
0x0f0f instead
Further such events for this erase block will not be printed
Empty flash at 0x00980080 ends at 0x009800c0
Empty flash at 0x00980100 ends at 0x00980140
Empty flash at 0x00980180 ends at 0x009801c0
Empty flash at 0x00980200 ends at 0x00980240
Empty flash at 0x00980280 ends at 0x009802c0
Empty flash at 0x00980300 ends at 0x00980340
Empty flash at 0x00980380 ends at 0x009803c0
Empty flash at 0x00980400 ends at 0x00980440
Empty flash at 0x00980480 ends at 0x009804c0
Empty flash at 0x00980500 ends at 0x00980540
Empty flash at 0x00980580 ends at 0x009805c0
Empty flash at 0x00980600 ends at 0x00980640
Empty flash at 0x00980680 ends at 0x009806c0
Empty flash at 0x00980700 ends at 0x00980740
Empty flash at 0x00980780 ends at 0x009807c0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x009a0040:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x009a0044:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x009a0048:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x009a004c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x009a0050:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x009a0054:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x009a0058:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x009a005c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x009a0060:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x009a0064:
0x0f0f instead
Further such events for this erase block will not be printed
Empty flash at 0x009a0080 ends at 0x009a00c0
Empty flash at 0x009a0100 ends at 0x009a0140
Empty flash at 0x009a0180 ends at 0x009a01c0
Empty flash at 0x009a0200 ends at 0x009a0240
Empty flash at 0x009a0280 ends at 0x009a02c0
Empty flash at 0x009a0300 ends at 0x009a0340
Empty flash at 0x009a0380 ends at 0x009a03c0
Empty flash at 0x009a0400 ends at 0x009a0440
Empty flash at 0x009a0480 ends at 0x009a04c0
Empty flash at 0x009a0500 ends at 0x009a0540
Empty flash at 0x009a0580 ends at 0x009a05c0
Empty flash at 0x009a0600 ends at 0x009a0640
Empty flash at 0x009a0680 ends at 0x009a06c0
Empty flash at 0x009a0700 ends at 0x009a0740
Empty flash at 0x009a0780 ends at 0x009a07c0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x009c0040:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x009c0044:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x009c0048:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x009c004c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x009c0050:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x009c0054:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x009c0058:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x009c005c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x009c0060:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x009c0064:
0x0f0f instead
Further such events for this erase block will not be printed
Empty flash at 0x009c0080 ends at 0x009c00c0
Empty flash at 0x009c0100 ends at 0x009c0140
Empty flash at 0x009c0180 ends at 0x009c01c0
Empty flash at 0x009c0200 ends at 0x009c0240
Empty flash at 0x009c0280 ends at 0x009c02c0
Empty flash at 0x009c0300 ends at 0x009c0340
Empty flash at 0x009c0380 ends at 0x009c03c0
Empty flash at 0x009c0400 ends at 0x009c0440
Empty flash at 0x009c0480 ends at 0x009c04c0
Empty flash at 0x009c0500 ends at 0x009c0540
Empty flash at 0x009c0580 ends at 0x009c05c0
Empty flash at 0x009c0600 ends at 0x009c0640
Empty flash at 0x009c0680 ends at 0x009c06c0
Empty flash at 0x009c0700 ends at 0x009c0740
Empty flash at 0x009c0780 ends at 0x009c07c0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x009e0040:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x009e0044:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x009e0048:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x009e004c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x009e0050:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x009e0054:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x009e0058:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x009e005c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x009e0060:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x009e0064:
0x0f0f instead
Further such events for this erase block will not be printed
Empty flash at 0x009e0080 ends at 0x009e00c0
Empty flash at 0x009e0100 ends at 0x009e0140
Empty flash at 0x009e0180 ends at 0x009e01c0
Empty flash at 0x009e0200 ends at 0x009e0240
Empty flash at 0x009e0280 ends at 0x009e02c0
Empty flash at 0x009e0300 ends at 0x009e0340
Empty flash at 0x009e0380 ends at 0x009e03c0
Empty flash at 0x009e0400 ends at 0x009e0440
Empty flash at 0x009e0480 ends at 0x009e04c0
Empty flash at 0x009e0500 ends at 0x009e0540
Empty flash at 0x009e0580 ends at 0x009e05c0
Empty flash at 0x009e0600 ends at 0x009e0640
Empty flash at 0x009e0680 ends at 0x009e06c0
Empty flash at 0x009e0700 ends at 0x009e0740
Empty flash at 0x009e0780 ends at 0x009e07c0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a00040:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a00044:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a00048:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a0004c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a00050:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a00054:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a00058:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a0005c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a00060:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a00064:
0x0f0f instead
Further such events for this erase block will not be printed
Empty flash at 0x00a00080 ends at 0x00a000c0
Empty flash at 0x00a00100 ends at 0x00a00140
Empty flash at 0x00a00180 ends at 0x00a001c0
Empty flash at 0x00a00200 ends at 0x00a00240
Empty flash at 0x00a00280 ends at 0x00a002c0
Empty flash at 0x00a00300 ends at 0x00a00340
Empty flash at 0x00a00380 ends at 0x00a003c0
Empty flash at 0x00a00400 ends at 0x00a00440
Empty flash at 0x00a00480 ends at 0x00a004c0
Empty flash at 0x00a00500 ends at 0x00a00540
Empty flash at 0x00a00580 ends at 0x00a005c0
Empty flash at 0x00a00600 ends at 0x00a00640
Empty flash at 0x00a00680 ends at 0x00a006c0
Empty flash at 0x00a00700 ends at 0x00a00740
Empty flash at 0x00a00780 ends at 0x00a007c0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a20040:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a20044:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a20048:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a2004c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a20050:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a20054:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a20058:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a2005c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a20060:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a20064:
0x0f0f instead
Further such events for this erase block will not be printed
Empty flash at 0x00a20080 ends at 0x00a200c0
Empty flash at 0x00a20100 ends at 0x00a20140
Empty flash at 0x00a20180 ends at 0x00a201c0
Empty flash at 0x00a20200 ends at 0x00a20240
Empty flash at 0x00a20280 ends at 0x00a202c0
Empty flash at 0x00a20300 ends at 0x00a20340
Empty flash at 0x00a20380 ends at 0x00a203c0
Empty flash at 0x00a20400 ends at 0x00a20440
Empty flash at 0x00a20480 ends at 0x00a204c0
Empty flash at 0x00a20500 ends at 0x00a20540
Empty flash at 0x00a20580 ends at 0x00a205c0
Empty flash at 0x00a20600 ends at 0x00a20640
Empty flash at 0x00a20680 ends at 0x00a206c0
Empty flash at 0x00a20700 ends at 0x00a20740
Empty flash at 0x00a20780 ends at 0x00a207c0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a40040:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a40044:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a40048:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a4004c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a40050:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a40054:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a40058:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a4005c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a40060:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a40064:
0x0f0f instead
Further such events for this erase block will not be printed
Empty flash at 0x00a40080 ends at 0x00a400c0
Empty flash at 0x00a40100 ends at 0x00a40140
Empty flash at 0x00a40180 ends at 0x00a401c0
Empty flash at 0x00a40200 ends at 0x00a40240
Empty flash at 0x00a40280 ends at 0x00a402c0
Empty flash at 0x00a40300 ends at 0x00a40340
Empty flash at 0x00a40380 ends at 0x00a403c0
Empty flash at 0x00a40400 ends at 0x00a40440
Empty flash at 0x00a40480 ends at 0x00a404c0
Empty flash at 0x00a40500 ends at 0x00a40540
Empty flash at 0x00a40580 ends at 0x00a405c0
Empty flash at 0x00a40600 ends at 0x00a40640
Empty flash at 0x00a40680 ends at 0x00a406c0
Empty flash at 0x00a40700 ends at 0x00a40740
Empty flash at 0x00a40780 ends at 0x00a407c0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a60040:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a60044:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a60048:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a6004c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a60050:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a60054:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a60058:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a6005c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a60060:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a60064:
0x0f0f instead
Further such events for this erase block will not be printed
Empty flash at 0x00a60080 ends at 0x00a600c0
Empty flash at 0x00a60100 ends at 0x00a60140
Empty flash at 0x00a60180 ends at 0x00a601c0
Empty flash at 0x00a60200 ends at 0x00a60240
Empty flash at 0x00a60280 ends at 0x00a602c0
Empty flash at 0x00a60300 ends at 0x00a60340
Empty flash at 0x00a60380 ends at 0x00a603c0
Empty flash at 0x00a60400 ends at 0x00a60440
Empty flash at 0x00a60480 ends at 0x00a604c0
Empty flash at 0x00a60500 ends at 0x00a60540
Empty flash at 0x00a60580 ends at 0x00a605c0
Empty flash at 0x00a60600 ends at 0x00a60640
Empty flash at 0x00a60680 ends at 0x00a606c0
Empty flash at 0x00a60700 ends at 0x00a60740
Empty flash at 0x00a60780 ends at 0x00a607c0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a80040:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a80044:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a80048:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a8004c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a80050:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a80054:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a80058:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a8005c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a80060:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a80064:
0x0f0f instead
Further such events for this erase block will not be printed
Empty flash at 0x00a80080 ends at 0x00a800c0
Empty flash at 0x00a80100 ends at 0x00a80140
Empty flash at 0x00a80180 ends at 0x00a801c0
Empty flash at 0x00a80200 ends at 0x00a80240
Empty flash at 0x00a80280 ends at 0x00a802c0
Empty flash at 0x00a80300 ends at 0x00a80340
Empty flash at 0x00a80380 ends at 0x00a803c0
Empty flash at 0x00a80400 ends at 0x00a80440
Empty flash at 0x00a80480 ends at 0x00a804c0
Empty flash at 0x00a80500 ends at 0x00a80540
Empty flash at 0x00a80580 ends at 0x00a805c0
Empty flash at 0x00a80600 ends at 0x00a80640
Empty flash at 0x00a80680 ends at 0x00a806c0
Empty flash at 0x00a80700 ends at 0x00a80740
Empty flash at 0x00a80780 ends at 0x00a807c0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00aa0040:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00aa0044:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00aa0048:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00aa004c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00aa0050:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00aa0054:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00aa0058:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00aa005c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00aa0060:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00aa0064:
0x0f0f instead
Further such events for this erase block will not be printed
Empty flash at 0x00aa0080 ends at 0x00aa00c0
Empty flash at 0x00aa0100 ends at 0x00aa0140
Empty flash at 0x00aa0180 ends at 0x00aa01c0
Empty flash at 0x00aa0200 ends at 0x00aa0240
Empty flash at 0x00aa0280 ends at 0x00aa02c0
Empty flash at 0x00aa0300 ends at 0x00aa0340
Empty flash at 0x00aa0380 ends at 0x00aa03c0
Empty flash at 0x00aa0400 ends at 0x00aa0440
Empty flash at 0x00aa0480 ends at 0x00aa04c0
Empty flash at 0x00aa0500 ends at 0x00aa0540
Empty flash at 0x00aa0580 ends at 0x00aa05c0
Empty flash at 0x00aa0600 ends at 0x00aa0640
Empty flash at 0x00aa0680 ends at 0x00aa06c0
Empty flash at 0x00aa0700 ends at 0x00aa0740
Empty flash at 0x00aa0780 ends at 0x00aa07c0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00ac0040:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00ac0044:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00ac0048:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00ac004c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00ac0050:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00ac0054:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00ac0058:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00ac005c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00ac0060:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00ac0064:
0x0f0f instead
Further such events for this erase block will not be printed
Empty flash at 0x00ac0080 ends at 0x00ac00c0
Empty flash at 0x00ac0100 ends at 0x00ac0140
Empty flash at 0x00ac0180 ends at 0x00ac01c0
Empty flash at 0x00ac0200 ends at 0x00ac0240
Empty flash at 0x00ac0280 ends at 0x00ac02c0
Empty flash at 0x00ac0300 ends at 0x00ac0340
Empty flash at 0x00ac0380 ends at 0x00ac03c0
Empty flash at 0x00ac0400 ends at 0x00ac0440
Empty flash at 0x00ac0480 ends at 0x00ac04c0
Empty flash at 0x00ac0500 ends at 0x00ac0540
Empty flash at 0x00ac0580 ends at 0x00ac05c0
Empty flash at 0x00ac0600 ends at 0x00ac0640
Empty flash at 0x00ac0680 ends at 0x00ac06c0
Empty flash at 0x00ac0700 ends at 0x00ac0740
Empty flash at 0x00ac0780 ends at 0x00ac07c0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00ae0040:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00ae0044:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00ae0048:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00ae004c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00ae0050:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00ae0054:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00ae0058:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00ae005c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00ae0060:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00ae0064:
0x0f0f instead
Further such events for this erase block will not be printed
Empty flash at 0x00ae0080 ends at 0x00ae00c0
Empty flash at 0x00ae0100 ends at 0x00ae0140
Empty flash at 0x00ae0180 ends at 0x00ae01c0
Empty flash at 0x00ae0200 ends at 0x00ae0240
Empty flash at 0x00ae0280 ends at 0x00ae02c0
Empty flash at 0x00ae0300 ends at 0x00ae0340
Empty flash at 0x00ae0380 ends at 0x00ae03c0
Empty flash at 0x00ae0400 ends at 0x00ae0440
Empty flash at 0x00ae0480 ends at 0x00ae04c0
Empty flash at 0x00ae0500 ends at 0x00ae0540
Empty flash at 0x00ae0580 ends at 0x00ae05c0
Empty flash at 0x00ae0600 ends at 0x00ae0640
Empty flash at 0x00ae0680 ends at 0x00ae06c0
Empty flash at 0x00ae0700 ends at 0x00ae0740
Empty flash at 0x00ae0780 ends at 0x00ae07c0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00b00040:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00b00044:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00b00048:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00b0004c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00b00050:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00b00054:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00b00058:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00b0005c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00b00060:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00b00064:
0x0f0f instead
Further such events for this erase block will not be printed
Empty flash at 0x00b00080 ends at 0x00b000c0
Empty flash at 0x00b00100 ends at 0x00b00140
Empty flash at 0x00b00180 ends at 0x00b001c0
Empty flash at 0x00b00200 ends at 0x00b00240
Empty flash at 0x00b00280 ends at 0x00b002c0
Empty flash at 0x00b00300 ends at 0x00b00340
Empty flash at 0x00b00380 ends at 0x00b003c0
Empty flash at 0x00b00400 ends at 0x00b00440
Empty flash at 0x00b00480 ends at 0x00b004c0
Empty flash at 0x00b00500 ends at 0x00b00540
Empty flash at 0x00b00580 ends at 0x00b005c0
Empty flash at 0x00b00600 ends at 0x00b00640
Empty flash at 0x00b00680 ends at 0x00b006c0
Empty flash at 0x00b00700 ends at 0x00b00740
Empty flash at 0x00b00780 ends at 0x00b007c0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00b20040:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00b20044:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00b20048:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00b2004c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00b20050:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00b20054:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00b20058:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00b2005c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00b20060:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00b20064:
0x0f0f instead
Further such events for this erase block will not be printed
Empty flash at 0x00b20080 ends at 0x00b200c0
Empty flash at 0x00b20100 ends at 0x00b20140
Empty flash at 0x00b20180 ends at 0x00b201c0
Empty flash at 0x00b20200 ends at 0x00b20240
Empty flash at 0x00b20280 ends at 0x00b202c0
Empty flash at 0x00b20300 ends at 0x00b20340
Empty flash at 0x00b20380 ends at 0x00b203c0
Empty flash at 0x00b20400 ends at 0x00b20440
Empty flash at 0x00b20480 ends at 0x00b204c0
Empty flash at 0x00b20500 ends at 0x00b20540
Empty flash at 0x00b20580 ends at 0x00b205c0
Empty flash at 0x00b20600 ends at 0x00b20640
Empty flash at 0x00b20680 ends at 0x00b206c0
Empty flash at 0x00b20700 ends at 0x00b20740
Empty flash at 0x00b20780 ends at 0x00b207c0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00b40040:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00b40044:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00b40048:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00b4004c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00b40050:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00b40054:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00b40058:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00b4005c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00b40060:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00b40064:
0x0f0f instead
Further such events for this erase block will not be printed
Empty flash at 0x00b40080 ends at 0x00b400c0
Empty flash at 0x00b40100 ends at 0x00b40140
Empty flash at 0x00b40180 ends at 0x00b401c0
Empty flash at 0x00b40200 ends at 0x00b40240
Empty flash at 0x00b40280 ends at 0x00b402c0
Empty flash at 0x00b40300 ends at 0x00b40340
Empty flash at 0x00b40380 ends at 0x00b403c0
Empty flash at 0x00b40400 ends at 0x00b40440
Empty flash at 0x00b40480 ends at 0x00b404c0
Empty flash at 0x00b40500 ends at 0x00b40540
Empty flash at 0x00b40580 ends at 0x00b405c0
Empty flash at 0x00b40600 ends at 0x00b40640
Empty flash at 0x00b40680 ends at 0x00b406c0
Empty flash at 0x00b40700 ends at 0x00b40740
Empty flash at 0x00b40780 ends at 0x00b407c0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00b60040:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00b60044:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00b60048:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00b6004c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00b60050:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00b60054:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00b60058:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00b6005c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00b60060:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00b60064:
0x0f0f instead
Further such events for this erase block will not be printed
Empty flash at 0x00b60080 ends at 0x00b600c0
Empty flash at 0x00b60100 ends at 0x00b60140
Empty flash at 0x00b60180 ends at 0x00b601c0
Empty flash at 0x00b60200 ends at 0x00b60240
Empty flash at 0x00b60280 ends at 0x00b602c0
Empty flash at 0x00b60300 ends at 0x00b60340
Empty flash at 0x00b60380 ends at 0x00b603c0
Empty flash at 0x00b60400 ends at 0x00b60440
Empty flash at 0x00b60480 ends at 0x00b604c0
Empty flash at 0x00b60500 ends at 0x00b60540
Empty flash at 0x00b60580 ends at 0x00b605c0
Empty flash at 0x00b60600 ends at 0x00b60640
Empty flash at 0x00b60680 ends at 0x00b606c0
Empty flash at 0x00b60700 ends at 0x00b60740
Empty flash at 0x00b60780 ends at 0x00b607c0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00b80040:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00b80044:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00b80048:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00b8004c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00b80050:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00b80054:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00b80058:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00b8005c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00b80060:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00b80064:
0x0f0f instead
Further such events for this erase block will not be printed
Empty flash at 0x00b80080 ends at 0x00b800c0
Empty flash at 0x00b80100 ends at 0x00b80140
Empty flash at 0x00b80180 ends at 0x00b801c0
Empty flash at 0x00b80200 ends at 0x00b80240
Empty flash at 0x00b80280 ends at 0x00b802c0
Empty flash at 0x00b80300 ends at 0x00b80340
Empty flash at 0x00b80380 ends at 0x00b803c0
Empty flash at 0x00b80400 ends at 0x00b80440
Empty flash at 0x00b80480 ends at 0x00b804c0
Empty flash at 0x00b80500 ends at 0x00b80540
Empty flash at 0x00b80580 ends at 0x00b805c0
Empty flash at 0x00b80600 ends at 0x00b80640
Empty flash at 0x00b80680 ends at 0x00b806c0
Empty flash at 0x00b80700 ends at 0x00b80740
Empty flash at 0x00b80780 ends at 0x00b807c0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00ba0040:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00ba0044:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00ba0048:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00ba004c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00ba0050:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00ba0054:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00ba0058:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00ba005c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00ba0060:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00ba0064:
0x0f0f instead
Further such events for this erase block will not be printed
Empty flash at 0x00ba0080 ends at 0x00ba00c0
Empty flash at 0x00ba0100 ends at 0x00ba0140
Empty flash at 0x00ba0180 ends at 0x00ba01c0
Empty flash at 0x00ba0200 ends at 0x00ba0240
Empty flash at 0x00ba0280 ends at 0x00ba02c0
Empty flash at 0x00ba0300 ends at 0x00ba0340
Empty flash at 0x00ba0380 ends at 0x00ba03c0
Empty flash at 0x00ba0400 ends at 0x00ba0440
Empty flash at 0x00ba0480 ends at 0x00ba04c0
Empty flash at 0x00ba0500 ends at 0x00ba0540
Empty flash at 0x00ba0580 ends at 0x00ba05c0
Empty flash at 0x00ba0600 ends at 0x00ba0640
Empty flash at 0x00ba0680 ends at 0x00ba06c0
Empty flash at 0x00ba0700 ends at 0x00ba0740
Empty flash at 0x00ba0780 ends at 0x00ba07c0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00bc0040:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00bc0044:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00bc0048:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00bc004c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00bc0050:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00bc0054:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00bc0058:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00bc005c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00bc0060:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00bc0064:
0x0f0f instead
Further such events for this erase block will not be printed
Empty flash at 0x00bc0080 ends at 0x00bc00c0
Empty flash at 0x00bc0100 ends at 0x00bc0140
Empty flash at 0x00bc0180 ends at 0x00bc01c0
Empty flash at 0x00bc0200 ends at 0x00bc0240
Empty flash at 0x00bc0280 ends at 0x00bc02c0
Empty flash at 0x00bc0300 ends at 0x00bc0340
Empty flash at 0x00bc0380 ends at 0x00bc03c0
Empty flash at 0x00bc0400 ends at 0x00bc0440
Empty flash at 0x00bc0480 ends at 0x00bc04c0
Empty flash at 0x00bc0500 ends at 0x00bc0540
Empty flash at 0x00bc0580 ends at 0x00bc05c0
Empty flash at 0x00bc0600 ends at 0x00bc0640
Empty flash at 0x00bc0680 ends at 0x00bc06c0
Empty flash at 0x00bc0700 ends at 0x00bc0740
Empty flash at 0x00bc0780 ends at 0x00bc07c0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00be0040:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00be0044:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00be0048:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00be004c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00be0050:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00be0054:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00be0058:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00be005c:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00be0060:
0x0f0f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00be0064:
0x0f0f instead
Further such events for this erase block will not be printed
Empty flash at 0x00be0080 ends at 0x00be00c0
Empty flash at 0x00be0100 ends at 0x00be0140
Empty flash at 0x00be0180 ends at 0x00be01c0
Empty flash at 0x00be0200 ends at 0x00be0240
Empty flash at 0x00be0280 ends at 0x00be02c0
Empty flash at 0x00be0300 ends at 0x00be0340
Empty flash at 0x00be0380 ends at 0x00be03c0
Empty flash at 0x00be0400 ends at 0x00be0440
Empty flash at 0x00be0480 ends at 0x00be04c0
Empty flash at 0x00be0500 ends at 0x00be0540
Empty flash at 0x00be0580 ends at 0x00be05c0
Empty flash at 0x00be0600 ends at 0x00be0640
Empty flash at 0x00be0680 ends at 0x00be06c0
Empty flash at 0x00be0700 ends at 0x00be0740
Empty flash at 0x00be0780 ends at 0x00be07c0
VFS: Mounted root (jffs2 filesystem) readonly.
Freeing init memory: 116K
Executing /sbin/init

INIT: version 2.86 booting

Starting the hotplug events dispatcher: udevd.
Synthesizing the initial hotplug events...done.
Waiting for /dev to be fully populated...input: PXA27x Keypad as
/class/input/input0
done.
Initializing /var... Done.
Setting the system clock..
Loading modules...SA1100/PXA2xx Watchdog Timer: timer margin 60 sec
done.
Checking all file systems...
fsck 1.39 (29-May-2006)
tmpfs on /tmp type tmpfs (rw)
Starting hotplug subsystem:
   pci      [disabled]
   usb      [disabled]
   isapnp   [disabled]
   ide
   ide      [success]
   input    [disabled]
   scsi     [disabled]
done.
Loading PCMCIA bridge driver module: pxa2xx-cs.
Setting the system clock again..
Running ntpdate to synchronize clockError : Temporary failure in name resolution
.

INIT: Entering runlevel: 2

Starting internet superserver: inetd done.
Configuring network interfaces: eth0: link down
eth0: link up, 100Mbps, half-duplex, lpa 0x40A1
Failed to bring up eth0.
done.
Running ntpdate to synchronize clockError : Temporary failure in name resolution
.
Starting telnetd...
Setting sysfs variables...done.

GNU/Linux 2.6.20-karo-320 on triton1(armv5tel) ttyS0:

All your base are belong to us

triton1 login: root
Password:
------------------------------------------------------------------


Thanks in advance
Chinthu K Harshan
