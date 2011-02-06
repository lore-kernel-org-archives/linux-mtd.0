Received: from aa011-1msr.fastwebnet.it ([62.101.93.131])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pm9XY-0002Yg-SX
	for linux-mtd@lists.infradead.org; Sun, 06 Feb 2011 18:40:54 +0000
From: Fabio Giovagnini <fabio.giovagnini@aurion-tech.com>
To: linux-mtd@lists.infradead.org
Subject: Re: Support for SST 39VF6402B has been officially added or I need to
	patch the kernel?
Date: Sun, 6 Feb 2011 19:40:47 +0100
References: <201101301935.38730.fabio.giovagnini@aurion-tech.com>
	<201102021709.04929.fabio.giovagnini@aurion-tech.com>
	<AANLkTim3mij_QtNBq3ETW4MyHxp9XE-pduiRZaabKT-5@mail.gmail.com>
In-Reply-To: <AANLkTim3mij_QtNBq3ETW4MyHxp9XE-pduiRZaabKT-5@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201102061940.47809.fabio.giovagnini@aurion-tech.com>
Cc: Guillaume LECERF <glecerf@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 02 February 2011 17:14:03 Guillaume LECERF wrote:
> 2011/2/2 Fabio Giovagnini <fabio.giovagnini@aurion-tech.com>:
> > But in my files I do not have nothing of these.
>=20
> Could you please provide me with a log with DEBUG_CFI enabled in
> drivers/mtd/chips/cfi_probe.c ?

That is what I get.
It seems to be good:
But with this info, how do I have to build the make.jffs2?
I use the following
mkfs.jffs2 --big-endian --eraseblock=3D65536 --pad=3D2097152 --root=3D$(ROO=
T_FS) --
output=3D$(IMAGE_DIR)/sh7203-filesystem.bin

=3D> bootm
*  kernel: default image load address =3D 0x0c800000
## Booting kernel from Legacy Image at 0c800000 ...
   Image Name:   Linux-2.6.37+
   Image Type:   SuperH Linux Kernel Image (gzip compressed)
   Data Size:    885019 Bytes =3D 864.3 KiB
   Load Address: 0c001000
   Entry Point:  0c002000
   Verifying Checksum ... OK
   kernel data at 0x0c800040, len =3D 0x000d811b (885019)
## No init Ramdisk
   ramdisk start =3D 0x00000000, ramdisk end =3D 0x00000000
   Uncompressing Kernel Image ... OK
   kernel loaded at 0x0c001000, end =3D 0x0c1865fc
Linux version 2.6.37+ (fgiovagnini@aurio01) (gcc version 4.4.1 (Sourcery G+=
+=20
Lite 4.4-206) ) #15 Sun Feb 6 19:33:13 CET 2011
Boot params:
=2E.. MOUNT_ROOT_RDONLY - 00000000
=2E.. RAMDISK_FLAGS     - 00000000
=2E.. ORIG_ROOT_DEV     - 00000000
=2E.. LOADER_TYPE       - 00000000
=2E.. INITRD_START      - 00000000
=2E.. INITRD_SIZE       - 00000000
debug: ignoring loglevel setting.
Booting machvec: MLCD
initrd disabled
Node 0: start_pfn =3D 0xc000, low =3D 0xd000
Zone PFN ranges:
  Normal   0x0000c000 -> 0x0000d000
Movable zone start PFN for each node
early_node_map[1] active PFN ranges
    0: 0x0000c000 -> 0x0000d000
On node 0 totalpages: 4096
free_area_init_node: node 0, pgdat 0c171524, node_mem_map 0c1a8000
  Normal zone: 32 pages used for memmap
  Normal zone: 0 pages reserved
  Normal zone: 4064 pages, LIFO batch:0
pcpu-alloc: s0 r0 d32768 u32768 alloc=3D1*32768
pcpu-alloc: [0] 0=20
Built 1 zonelists in Zone order, mobility grouping off.  Total pages: 4064
Kernel command line: console=3DttySC0,115200 earlyprintk=3Dserial ignore_lo=
glevel=20
rootfstype=3Djffs2 root=3D/dev/mtdblock2
PID hash table entries: 64 (order: -4, 256 bytes)
Dentry cache hash table entries: 2048 (order: 1, 8192 bytes)
Inode-cache hash table entries: 1024 (order: 0, 4096 bytes)
I-cache : n_ways=3D4 n_sets=3D128 way_incr=3D2048
I-cache : entry_mask=3D0x000007f0 alias_mask=3D0x00000000 n_aliases=3D0
D-cache : n_ways=3D4 n_sets=3D128 way_incr=3D2048
D-cache : entry_mask=3D0x000007f0 alias_mask=3D0x00000000 n_aliases=3D0
Memory: 14376k/16384k available (991k kernel code, 483k data, 84k init)
virtual kernel memory layout:
    fixmap  : 0x5fff7000 - 0x5ffff000   (  32 kB)
    vmalloc : 0x40000000 - 0x5fff5000   ( 511 MB)
    lowmem  : 0x0c000000 - 0x0d000000   (  16 MB) (cached)
            : 0x20000000 - 0x40000000   ( 512 MB) (uncached)
      .init : 0x0c172000 - 0x0c187000   (  84 kB)
      .data : 0x0c0f8e6c - 0x0c171c40   ( 483 kB)
      .text : 0x0c001000 - 0x0c0f8e6c   ( 991 kB)
NR_IRQS:512 nr_irqs:512 8
intc: Registered controller 'sh7203' with 127 IRQs
ODEBUG: 0 of 0 active objects replaced
 sh_cmt.0: used for clock events
 sh_cmt.0: used for periodic clock events
 sh_mtu2.0: used for clock events
Calibrating delay loop (skipped)... 200.04 BogoMIPS PRESET (lpj=3D100024)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 512
CPU: SH7203
kworker/u:0 used greatest stack depth: 7372 bytes left
kworker/u:0 used greatest stack depth: 7364 bytes left
kworker/u:0 used greatest stack depth: 7252 bytes left
pfc: sh7203_pfc handling gpio 0 -> 329
kworker/u:0 used greatest stack depth: 7128 bytes left
bio: create slab <bio-0> at 0
kworker/u:0 used greatest stack depth: 7076 bytes left
kworker/u:0 used greatest stack depth: 7068 bytes left
cpufreq: SuperH CPU frequency driver.
cpufreq: clock framework rate rounding not supported on CPU#0.
cmdlinepart partition parsing not available
kworker/u:0 used greatest stack depth: 7060 bytes left
JFFS2 version 2.2. =EF=BF=BD=C2=A9 2001-2006 Red Hat, Inc.
ROMFS MTD (C) 2007 Red Hat, Inc.
msgmni has been set to 28
io scheduler noop registered (default)
SuperH SCI(F) driver initialized
sh-sci.0: ttySC0 at MMIO 0xfffe8000 (irq =3D 192) is a scif
console [ttySC0] enabled
sh-sci.1: ttySC1 at MMIO 0xfffe8800 (irq =3D 196) is a scif
sh-sci.2: ttySC2 at MMIO 0xfffe9000 (irq =3D 200) is a scif
sh-sci.3: ttySC3 at MMIO 0xfffe9800 (irq =3D 204) is a scif
physmap platform flash device: 00400001 at 20400000
Number of erase regions: 2
Primary Vendor Command Set: 0002 (AMD/Fujitsu Standard)
No Primary Algorithm Table
Alternative Vendor Command Set: 0000 (None)
No Alternate Algorithm Table
Vcc Minimum:  2.7 V
Vcc Maximum:  3.6 V
No Vpp line
Typical byte/word write timeout: 8 =EF=BF=BD=C2=B5s
Maximum byte/word write timeout: 16 =EF=BF=BD=C2=B5s
=46ull buffer write not supported
Typical block erase timeout: 16 ms
Maximum block erase timeout: 32 ms
Typical chip erase timeout: 32 ms
Maximum chip erase timeout: 64 ms
Device size: 0x800000 bytes (8 MiB)
=46lash Device Interface description: 0x0001
  - x16-only asynchronous interface
Max. bytes in buffer write: 0x1
Number of Erase Block Regions: 2
  Erase Region #0: BlockSize 0x1000 bytes, 2048 blocks
  Erase Region #1: BlockSize 0x10000 bytes, 128 blocks
physmap-flash: Found 1 x16 devices at 0x0 in 16-bit bank. Manufacturer ID=20
0x0000bf Chip ID 0x00236c
NOR chip too large to fit in mapping. Attempting to cope...
number of CFI chips: 1
Reducing visibility of 8192KiB chip to 4096KiB
cmdlinepart partition parsing not available
RedBoot partition parsing not available
Using physmap partition information
Creating 3 MTD partitions on "physmap-flash":
0x000000000000-0x000000040000 : "Bootloader"
0x000000040000-0x000000200000 : "Kernel"
0x000000200000-0x000000400001 : "Flash_FS"
mtd: partition "Flash_FS" doesn't end on an erase block -- force read-only
sh-rtc sh-rtc: rtc core: registered sh as rtc0
cpuidle: using governor ladder
sh_cmt sh_cmt.0: kept as earlytimer
sh_cmt sh_cmt.1: used for clock events
sh_mtu2 sh_mtu2.0: kept as earlytimer
sh_mtu2 sh_mtu2.1: used for clock events
heartbeat: version 0.1.2 loaded
oprofile: using timer interrupt.
sh-rtc sh-rtc: setting system clock to 1970-01-01 00:00:00 UTC (0)
jffs2: Flash size not aligned to erasesize, reducing to 2048KiB
VFS: Mounted root (jffs2 filesystem) on device 31:2.
=46reeing unused kernel memory: 84k freed
Kernel panic - not syncing: No init found.  Try passing init=3D option to=20
kernel. See Linux Documentation/init.txt for guidance.
Stack: (0x0c813f30 to 0x0c814000)



Regards


=2D-=20
Ing. Fabio Giovagnini

Aurion s.r.l.
P.I e C.F.
00885711200
skype: aurion.giovagnini
Tel. +39.051.594.78.24
=46ax. +39.051.082.14.49
Cell. +39.335.83.50.919
www.aurion-tech.com
