Received: from mail.benning.es ([217.5.235.50] helo=mailer.benning.de)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kxdzf-0007ih-8I
	for linux-mtd@lists.infradead.org; Wed, 05 Nov 2008 08:44:06 +0000
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: Problems with JFFS2 FS during parallel write operations
Date: Wed, 5 Nov 2008 09:43:57 +0100
Message-ID: <0F0EC10F42A3384392AE60EF2A660B40427D93@tbbsrv56>
From: "Ostendorf, Rainer" <Rainer.Ostendorf@BENNING.de>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi list,

i am currently working on a Atmel AT91RM9200 based embedded system. As =
persistent memory there is a 32MByte Spansion S29GL256P NOR flash device =
connected to the parallel bus. That flash memory is used for loading =
first the u-boot bootloader and then the combined kernel- and =
ramdisk-image out of a JFFS2 filesystem on the flash. The linux kernel =
running on the board is a linux 2.6.23-rc3 adapted to my hardware.

There is a silicon bug in the processor, that leads to address line A24 =
not being driven by the bus interface. As a workaround for this, i =
connected A25 instead of A24 to the flash and address the flash with =
16MB offset.=20

During normal operation the system runs perfectly stable, but when i =
start two processes running parallel, writing huge amounts of data to =
the flash device, i get error messages from the JFFS2 filesystem:

...
argh. node added in wrong place
argh. node added in wrong place
...

This message repeats for about 15-20 times while copying parallel 2 =
files of about 6MByte to the flash via Ethernet (SCP). When i then =
reboot the system, the u-boot bootloader generates the following errors =
while scanning the JFFS2 filesystem for the image file:

### JFFS2 loading '/images/boot.img' to 0x21000000
Scanning JFFS2 FS: | Unknown node type: e002 len 4164 offset 0x7d1bc
.| Unknown node type: e002 len 4164 offset 0xf4dd5c
\ Unknown node type: e002 len 4164 offset 0x100a120
/ Unknown node type: e002 len 4164 offset 0x10a27e0
| Unknown node type: e002 len 4164 offset 0x11563c0
- Unknown node type: e002 len 4164 offset 0x11f4bec
/ Unknown node type: e002 len 4164 offset 0x12aa0cc
| Unknown node type: e002 len 4164 offset 0x1349aa4
/ Unknown node type: e002 len 4164 offset 0x14bd484
| Unknown node type: e002 len 4164 offset 0x155163c
- Unknown node type: e002 len 4164 offset 0x15f1b5c
| Unknown node type: e002 len 4164 offset 0x166c750
\ Unknown node type: e002 len 4164 offset 0x173d7c0
- Unknown node type: e002 len 4164 offset 0x1cefb58
/ Unknown node type: e002 len 4164 offset 0x1d902fc
\ Unknown node type: e002 len 4164 offset 0x1e35aec
| Unknown node type: e002 len 4164 offset 0x1f76b54
 done.
### JFFS2 load complete: 6410357 bytes loaded to 0x21000000

The U-Boot bootloader detects that the checksum of the uploaded image is =
wrong and the system does not boot any more from flash memory/JFFS2. =
After booting from ethernet, the kernel gives the following error =
messages when trying to mount the root filesystem:

Linux version 2.6.23-rc3 (armdev@arm-workstation) (gcc version 4.1.1) #3 =
Mon Nov 3 15:07:56 CET 2008
CPU: ARM920T [41129200] revision 0 (ARMv4T), cr=3Dc0003177

Memory policy: ECC disabled, Data cache writeback
Clocks: CPU 180 MHz, master 60 MHz, main 20.000 MHz
CPU0: D VIVT write-back cache
CPU0: I cache: 16384 bytes, associativity 64, 32 byte lines, 8 sets
CPU0: D cache: 16384 bytes, associativity 64, 32 byte lines, 8 sets
Built 1 zonelists in Zone order.  Total pages: 8128
Kernel command line: console=3D/dev/ttyS0,115200n8 =
mtdparts=3Dphysmap-flash.0:128k(u-boot),128k(env),-(User)

[...]

physmap platform flash device: 02000000 at 11000000
physmap-flash.0: Found 1 x16 devices at 0x0 in 16-bit bank
 Amd/Fujitsu Extended Query Table at 0x0040
physmap-flash.0: CFI does not contain boot bank location. Assuming top.
number of CFI chips: 1
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
3 cmdlinepart partitions found on MTD device physmap-flash.0
Creating 3 MTD partitions on "physmap-flash.0":
0x00000000-0x00020000 : "u-boot"
0x00020000-0x00040000 : "env"
0x00040000-0x02000000 : "User"

[...]

syslogd starting
klogd starting
mounting flash file system...jffs2_scan_inode_node(): CRC failed on node =
at 0x0003d1bc: Read 0x218d1014, calculated 0x4418ef99
jffs2_scan_eraseblock(): Node at 0x0009286c {0x1985, 0xe002, 0x00001040) =
has invalid CRC 0x00914828 (calculated 0x0bb3cf3a)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00092870: =
0x1040 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00092874: =
0x4828 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0009287c: =
0x0004 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00092880: =
0x81a4 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00092888: =
0xd075 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0009288c: =
0xdf2b instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00092890: =
0xdf2b instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00092894: =
0xdf2b instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00092898: =
0x8000 instead
Further such events for this erase block will not be printed
Old JFFS2 bitmask found at 0x00092bb4
You cannot use older JFFS2 filesystems with newer kernels
jffs2_scan_inode_node(): CRC failed on node at 0x00f0dd5c: Read =
0xa1003010, calculated 0xc503cba7
jffs2_scan_inode_node(): CRC failed on node at 0x00fca120: Read =
0x40484a39, calculated 0x6589f6f0
jffs2_scan_inode_node(): CRC failed on node at 0x010627e0: Read =
0x0082951c, calculated 0xdeb63380
jffs2_scan_inode_node(): CRC failed on node at 0x011163c0: Read =
0x31850c5d, calculated 0xf9ff6bb4
jffs2_scan_inode_node(): CRC failed on node at 0x011b4bec: Read =
0x2e2a8811, calculated 0xa736b9ce
jffs2_scan_inode_node(): CRC failed on node at 0x0126a0cc: Read =
0x15c8c20c, calculated 0x70566992
jffs2_scan_inode_node(): CRC failed on node at 0x01309aa4: Read =
0x40914000, calculated 0xfb3b404a
jffs2_scan_eraseblock(): Node at 0x013a6fdc {0x1985, 0xe002, 0x00000044) =
has invalid CRC 0x04111040 (calculated 0x98f7fb1d)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x013a6fe0: =
0x0044 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x013a6fe4: =
0x1040 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x013a6fec: =
0x0801 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x013a6ff0: =
0x81a4 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x013a6ff8: =
0xd075 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x013a6ffc: =
0xdee6 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x013a7000: =
0xdee6 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x013a7004: =
0xdee6 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x013a7010: =
0x1000 instead
Further such events for this erase block will not be printed
jffs2_scan_inode_node(): CRC failed on node at 0x0147d484: Read =
0x4a5a0490, calculated 0xdb37c1be
jffs2_scan_inode_node(): CRC failed on node at 0x0151163c: Read =
0x90010230, calculated 0x243c5ff2
jffs2_scan_inode_node(): CRC failed on node at 0x015b1b5c: Read =
0x0b340e00, calculated 0x52cba956
jffs2_scan_inode_node(): CRC failed on node at 0x0162c750: Read =
0x20028308, calculated 0xb06ff75e
jffs2_scan_inode_node(): CRC failed on node at 0x016fd7c0: Read =
0x23084020, calculated 0x93ff7ffd
jffs2_scan_inode_node(): CRC failed on node at 0x01cafb58: Read =
0x000354b0, calculated 0xd537d003
jffs2_scan_inode_node(): CRC failed on node at 0x01d502fc: Read =
0x0a100622, calculated 0x844de98d
jffs2_scan_inode_node(): CRC failed on node at 0x01df5aec: Read =
0xc1007800, calculated 0x21619a2e
jffs2_scan_eraseblock(): Node at 0x01e95594 {0x1985, 0xe002, 0x00000040) =
has invalid CRC 0x84100825 (calculated 0x17956c4a)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x01e95598: =
0x0040 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x01e9559c: =
0x0825 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x01e955a4: =
0x00c6 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x01e955a8: =
0x81a4 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x01e955b0: =
0xd075 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x01e955b4: =
0xdf42 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x01e955b8: =
0xdf42 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x01e955bc: =
0xdf42 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x01e955c0: =
0x8000 instead
Further such events for this erase block will not be printed
jffs2_scan_inode_node(): CRC failed on node at 0x01f36b54: Read =
0x14282080, calculated 0x62aa15fe
ok
[...]


Before beeing mounted as JFFS2 FS the first time, the flash was =
completly erased (using the ICs embedded erase algorithm). I also tried =
to erase it with the flash_eraseall command with option "-j" set and saw =
no difference. Do i need to prepare the memory in any other way then =
just erasing it, before mounting it as JFFS2?

What i did until now was to check the timings of the flash IC - they =
seem to be ok. I also tested to copy and erase a big file with random =
content in the flash-filesystem serveral times and checked its MD5-sum =
after each cycle - it was always ok. The problem only occured during =
access to the JFFS2 filesystem during parallel access.

As i don't know exactly where to look next: has anyone has seen such a =
behavior before? Is it possible that this a kernel bug (perhaps race =
condition?), or more likely a hardware problem?

Many thanks in advance for any hint!

regards,
Rainer


Benning Elektrotechnik und Elektronik GmbH & Co. KG Bocholt
Handelsregister Coesfeld HRA-Nr. 4661
Pers=F6nlich haftende Gesellschaft: Benning GmbH
Handelsregister Coesfeld HRB-Nr. 7772
Gesch=E4ftsf=FChrer: Th. Benning
