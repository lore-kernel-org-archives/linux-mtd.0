Received: from wbm3.pair.net ([209.68.3.66])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LgxAv-0004M6-Qz
	for linux-mtd@lists.infradead.org; Tue, 10 Mar 2009 08:19:00 +0000
Message-ID: <30517.121.246.210.150.1236673114.squirrel@webmail3.pair.com>
Date: Tue, 10 Mar 2009 04:18:34 -0400 (EDT)
Subject: creating mtd partitions
From: keerti@mrt-communication.com
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear ALL,

I am using linux kernel 2.6.25,i want to create my mtd partitions,so i had
made entry in the physmap.c as

struct mtd_partition  physmap_flash_partitions={
{name:"kernel",size:0x1f0000,offset:0},
{name:"Config",size:0x10000,offset:MTDPART_OFS_APPEND},
{name:"Initrd",size:0x1e0000,offset:MTDPART_OFS_APPEND},
{name:"Redboot",size:0x100000,offset:MTDPART_OFS_APPEND,mask_flags:MTD_WRITABLE}
};


but when i am compiling the kernel,
it is giving me warning physmap_flash_partitions defined but no used.

Here is my boot log



+Ethernet eth0: MAC address 00:00:01:02:03:04
IP: 192.168.21.249/255.255.254.0, Gateway: 192.168.20.254
Default server: 0.0.0.0

RedBoot(tm) bootstrap and debug environment [ROM]
Non-certified release, version v2_0 - built 16:58:18, Jul 24 2007

Platform: PC (I386)
Copyright (C) 2000, 2001, 2002, Red Hat, Inc.

RAM: 0x00000000-0x000f0000, 0x00073370-0x000a0000 available
R3210    00:0013 04-09-2007


<press Ctrl+C to enter prompt mode>


               RedBoot>
mem_size: 2000000
initrd 1e00000 len 1e0000
Linux version 2.6.25 (root@localhost.localdomain) (gcc version 3.2.2
20030222 (Red Hat Linux 3.2.2-5)) #11 Mon Mar 9 16:26:59 IST 2009
BIOS-provided physical RAM map:
 BIOS-e801: 0000000000000000 - 000000000009f000 (usable)
 BIOS-e801: 0000000000100000 - 0000000002000000 (usable)
32MB LOWMEM available.
Zone PFN ranges:
  DMA             0 ->     4096
  Normal       4096 ->     8192
Movable zone start PFN for each node
early_node_map[1] active PFN ranges
    0:        0 ->     8192
DMI not present or invalid.
Allocating PCI resources starting at 10000000 (gap: 02000000:fe000000)
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 8128
Kernel command line: console=ttyS0,38400
Initializing CPU#0
PID hash table entries: 128 (order: 7, 512 bytes)
Console: colour dummy device 80x25
console [ttyS0] enabled
Dentry cache hash table entries: 4096 (order: 2, 16384 bytes)
Inode-cache hash table entries: 2048 (order: 1, 8192 bytes)
Memory: 28224k/32768k available (2384k kernel code, 4152k reserved, 1085k
data, 160k init, 0k highmem)
virtual kernel memory layout:
    fixmap  : 0xffffa000 - 0xfffff000   (  20 kB)
    vmalloc : 0xc2800000 - 0xffff8000   ( 983 MB)
    lowmem  : 0xc0000000 - 0xc2000000   (  32 MB)
      .init : 0xc0466000 - 0xc048e000   ( 160 kB)
      .data : 0xc03540a6 - 0xc0463738   (1085 kB)
      .text : 0xc0100000 - 0xc03540a6   (2384 kB)
Checking if this processor honours the WP bit even in supervisor mode...Ok.
SLUB: Genslabs=12, HWalign=32, Order=0-1, MinObjects=4, CPUs=1, Nodes=1
Mount-cache hash table entries: 512
Compat vDSO mapped to ffffe000.
CPU: 486
Checking 'hlt' instruction... OK.
Freeing SMP alternatives: 0k freed
net_namespace: 540 bytes
NET: Registered protocol family 16
PCI: Using configuration type 1
Setting up standard PCI resources
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
PCI: Probing PCI hardware
NET: Registered protocol family 8
NET: Registered protocol family 20
NET: Registered protocol family 2
IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
TCP established hash table entries: 1024 (order: 1, 8192 bytes)
TCP bind hash table entries: 1024 (order: 0, 4096 bytes)
TCP: Hash tables configured (established 1024 bind 1024)
TCP reno registered
rdc321x: watchdog init success
microcode: CPU0 not a capable Intel processor
IA-32 Microcode Update Driver: v1.14a <tigran@aivazian.fsnet.co.uk>
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
NTFS driver 2.1.29 [Flags: R/W DEBUG].
JFFS2 version 2.2. © 2001-2006 Red Hat, Inc.
io scheduler noop registered
io scheduler anticipatory registered
io scheduler deadline registered
io scheduler cfq registered (default)
Serial: 8250/16550 driver $Revision: 1.90 $ 1 ports, IRQ sharing disabled
serial8250: ttyS0 at I/O 0x3f8 (irq = 4) is a 16550A
brd: module loaded
<6>r6040: RDC R6040 NAPI net driver,version 0.16 (10Nov2007)

<6>r6040: RDC R6040 NAPI net driver,version 0.16 (10Nov2007)

physmap platform flash device: 00400000 at ffc00000
physmap-flash.0: Found 1 x16 devices at 0x0 in 16-bit bank
 Amd/Fujitsu Extended Query Table at 0x0040
number of CFI chips: 1
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
cmdlinepart partition parsing not available
RedBoot partition parsing not available
PCI: Enabling device 0000:00:0a.1 (0000 -> 0002)
ehci_hcd 0000:00:0a.1: EHCI Host Controller
ehci_hcd 0000:00:0a.1: new USB bus registered, assigned bus number 1
ehci_hcd 0000:00:0a.1: irq 14, io mem 0xc1000000
ehci_hcd 0000:00:0a.1: USB 2.0 started, EHCI 1.00, driver 10 Dec 2004
usb usb1: configuration #1 chosen from 1 choice
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 2 ports detected
TCP cubic registered
NET: Registered protocol family 1
NET: Registered protocol family 17
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
NET: Registered protocol family 33
Using IPI Shortcut mode
kAFS: Red Hat AFS client v0.1 registering.
Unable to load NLS charset iso8859-1
List of all partitions:
0100      32000 ram0 (driver?)
0101      32000 ram1 (driver?)
0102      32000 ram2 (driver?)
0103      32000 ram3 (driver?)
0104      32000 ram4 (driver?)
0105      32000 ram5 (driver?)
0106      32000 ram6 (driver?)
0107      32000 ram7 (driver?)
0108      32000 ram8 (driver?)
0109      32000 ram9 (driver?)
010a      32000 ram10 (driver?)
010b      32000 ram11 (driver?)
010c      32000 ram12 (driver?)
010d      32000 ram13 (driver?)
010e      32000 ram14 (driver?)
010f      32000 ram15 (driver?)
No filesystem could mount root, tried:  cramfs msdos vfat ntfs
Kernel panic - not syncing: VFS: Unable to mount root fs on
unknown-block(1,0)


Please can any one help me how to create mtd partitions.

With Regrads,
Keerti
