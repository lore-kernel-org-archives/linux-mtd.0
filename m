Received: from p02c11o142.mxlogic.net ([208.65.144.75])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PJ4GE-0004t0-4M
	for linux-mtd@lists.infradead.org; Thu, 18 Nov 2010 13:10:47 +0000
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: mtdparts question
Date: Thu, 18 Nov 2010 07:11:49 -0600
Message-ID: <9AC3F0E75060224C8BBC5BA2DDC8853A1E133300@EXV1.corp.adtran.com>
From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Attempting to configure mtdparts from the command line.  The parts are
set statically in the kernel, however, the COMMENT prior to the config
declares that the this is what will happen IF there is no definition on
the command line.

Bootup info shows:

<snip>
Kernel command line: mtdparts=3DNAND 128MiB 3,3V
8-bit:256k(hidden),-(root) ip=3D192.168.1.10 root=3D/dev/ram
console=3DttyS0,115200n8r <snip> Scanning for NAND chip NAND device:
Manufacturer ID: 0x20, Chip ID: 0xf1 (ST Micro NAND 128MiB 3,3V 8-bit)
Scanning device for bad blocks Bad eraseblock 1012 at 0x000007e80000
Setting up NAND partitions Creating 2 MTD partitions on "NAND 128MiB
3,3V 8-bit":
0x000000000000-0x000000400000 : "Kernel partition"
0x000000400000-0x000008000000 : "Root partition"
<snip>
physmap platform flash device: 01000000 at 1f000000
physmap-flash.0: Found 1 x16 devices at 0x0 in 16-bit bank  Amd/Fujitsu
Extended Query Table at 0x0040
physmap-flash.0: CFI does not contain boot bank location. Assuming top.
number of CFI chips: 1
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
cmdlinepart partition parsing not available RedBoot partition parsing
not available Using physmap partition information Creating 1 MTD
partitions on "physmap-flash.0":
0x000000440000-0x000000a40000 : "filesystem"
<snip>

The system has two flash chips, one a NOR and the other a NAND.

Q1:  Can we configure mtdparts from the command line if the definition
is already in arch/mips/<mysys>/platform.c.
Q2:  Is the definition `mtdparts=3DNAND 128MiB 3,3V
8-bit:256k(hidden),-(root)` correct to do this for the NAND?
Q3:  Can we define partitions for BOTH of these flash on the command
line? (my answer=3D NO -- am I correct?)

If this has been asked prior, I could not locate it.  Sorry for the
repeat if it has been asked previously.

Thanks,
Andy
