Received: from aa012-1msr.fastwebnet.it ([62.101.93.132])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PmqT7-0004H7-Es
	for linux-mtd@lists.infradead.org; Tue, 08 Feb 2011 16:31:10 +0000
From: Fabio Giovagnini <fabio.giovagnini@aurion-tech.com>
To: linux-mtd@lists.infradead.org
Subject: Prolem with CFI probe and make.jffs2 erase size
Date: Tue, 8 Feb 2011 17:31:02 +0100
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201102081731.02548.fabio.giovagnini@aurion-tech.com>
Cc: Guillaume LECERF <glecerf@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi guys.
when I boot my kernel I read:
(DEBUG_CFI enabled as suggestied by Guillaume)

=2E...
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
=2E...

when I create my jffs2 FS for my sh2a 7203 uP I execute
mkfs.jffs2 --big-endian --eraseblock=3D65536 --pad=3D2097152 --root=3D$(ROO=
T_FS) --
output=3D$(IMAGE_DIR)/sh7203-filesystem.bin

Now: the flash tells me it has 2 erase regions: one with 0x00001000 size, a=
nd=20
another with 0x00010000 size.
With of them I need to specify in my --eraseblock option?

I tried to specify 0x1000 but the make.jffs2 commadn told me that it is too=
=20
small size (I'm using ubuntu 10.4 and the mdt-utils coming with it)

Thanks a lot in advance

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
