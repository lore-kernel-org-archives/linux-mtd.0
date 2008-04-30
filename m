Received: from relay1.ispmail.de ([217.72.132.10])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jr7WM-0001RV-2h
	for linux-mtd@lists.infradead.org; Wed, 30 Apr 2008 08:18:34 +0000
MIME-Version: 1.0
Subject: Problems mounting jffs2 image on nor flash > Erase at 0x.... failed
	immediately: -EROFS. Is the sector locked?
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-class: urn:content-classes:message
Date: Wed, 30 Apr 2008 10:05:23 +0200
Message-ID: <1423A303F72A2F4FB7801E51406342EA10ECCD@delec-server-01.DELEC.local>
From: "Markus Wagner" <Markus.Wagner@delec.de>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hello,

i have some problems to mount my jffs2 image on my NOR-Flash.
I ported UBoot and Linux to my new board.
So far UBoot works well but Linux has some problems to mount the flash.

I can read from my flash with the dd command.
But when I mount the flash with 'mount -t jffs2 /dev/mtdblock4 /mnt/' I =
get the error: 'Erase at 0x...... failed immediately: -EROFS. Is the =
sector locked?'

Some Infos:
Its an Intel P33 Strataflash.

Setup of my partitions in the boardfile:
static struct mtd_partition at91_nor_partitions[] =3D {
	{
		.name		=3D "Bootstrap",
		.offset		=3D 0x0,
		.size		=3D 0x8000,				=09
	},
	{
		.name		=3D "U-Boot Env.",
		.offset		=3D 0x8000,
		.size		=3D 0x8000,
	},
	{
		.name		=3D "U-Boot",
		.offset		=3D 0x10000,
		.size		=3D 0x30000,
	},
	{
		.name		=3D "Kernel",
		.offset		=3D 0x40000,
		.size		=3D 0x200000,
	},
	{
		.name		=3D "Filesystem",
		.offset		=3D 0x240000,
		.size		=3D 0x1DC0000,
		.mask_flags =3D 0,
	},
};

Partitions under Linux:
# cat /proc/mtd=20
dev:    size   erasesize  name
mtd0: 00008000 00008000 "Bootstrap"
mtd1: 00008000 00008000 "U-Boot Env."
mtd2: 00030000 00020000 "U-Boot"
mtd3: 00200000 00020000 "Kernel"
mtd4: 01dc0000 00020000 "Filesystem"

mtd_debug output:
# mtd_debug info /dev/mtd4
mtd.type =3D MTD_NORFLASH
mtd.flags =3D MTD_CAP_NORFLASH
mtd.size =3D 31195136 (29M)
mtd.erasesize =3D 131072 (128K)
mtd.writesize =3D 1=20
mtd.oobsize =3D 0=20
regions =3D 0

Kernel Bootoutput:
....
physmap platform flash device: 02000000 at 10000000
Number of erase regions: 2
Primary Vendor Command Set: 0001 (Intel/Sharp Extended)
Primary Algorithm Table at 010A
Alternative Vendor Command Set: 0000 (None)
No Alternate Algorithm Table
Vcc Minimum:  2.3 V
Vcc Maximum:  3.6 V
Vpp Minimum:  8.5 V
Vpp Maximum:  9.5 V
Typical byte/word write timeout: 256 =C2=B5s
Maximum byte/word write timeout: 512 =C2=B5s
Typical full buffer write timeout: 512 =C2=B5s
Maximum full buffer write timeout: 1024 =C2=B5s
Typical block erase timeout: 1024 ms
Maximum block erase timeout: 4096 ms
Chip erase not supported
Device size: 0x2000000 bytes (32 MiB)
Flash Device Interface description: 0x0001
  - x16-only asynchronous interface
Max. bytes in buffer write: 0x40
Number of Erase Block Regions: 2
  Erase Region #0: BlockSize 0x8000 bytes, 4 blocks
  Erase Region #1: BlockSize 0x20000 bytes, 255 blocks
physmap-flash.0: Found 1 x16 devices at 0x0 in 16-bit bank
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
Using buffer write method
  Extended Query version 1.5
  Feature/Command Support:      01E6
     - Chip Erase:              unsupported
     - Suspend Erase:           supported
     - Suspend Program:         supported
     - Legacy Lock/Unlock:      unsupported
     - Queued Erase:            unsupported
     - Instant block lock:      supported
     - Protection Bits:         supported
     - Page-mode read:          supported
     - Synchronous read:        supported
     - Simultaneous operations: unsupported
     - Extended Flash Array:    unsupported
  Supported functions after Suspend: 01
     - Program after Erase Suspend: supported
  Block Status Register Mask: 0003
     - Lock Bit Active:      yes
     - Lock-Down Bit Active: yes
     - EFA Lock Bit:         no
     - EFA Lock-Down Bit:    no
  Vcc Logic Supply Optimum Program/Erase Voltage: 3.0 V
  Vpp Programming Supply Optimum Program/Erase Voltage: 9.0 V
cfi_cmdset_0001: Erase suspend on write enabled
RedBoot partition parsing not available
Using physmap partition information
Creating 5 MTD partitions on "physmap-flash.0":
0x00000000-0x00008000 : "Bootstrap"
mtd: Giving out device 0 to Bootstrap
0x00008000-0x00010000 : "U-Boot Env."
mtd: Giving out device 1 to U-Boot Env.
0x00010000-0x00040000 : "U-Boot"
mtd: partition "U-Boot" doesn't start on an erase block boundary -- =
force read-only
mtd: Giving out device 2 to U-Boot
0x00040000-0x00240000 : "Kernel"
mtd: Giving out device 3 to Kernel
0x00240000-0x02000000 : "Filesystem"
mtd: Giving out device 4 to Filesystem
.....


It seems to me that the kernel doesn't know that the flash is protected =
after power up.

How can I get it to work?
Where should I look at?

Thanks for your help.
Markus
