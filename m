Received: from mail-yw0-f186.google.com ([209.85.211.186])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MQjIb-0007FK-7S
	for linux-mtd@lists.infradead.org; Tue, 14 Jul 2009 14:48:12 +0000
Received: by ywh16 with SMTP id 16so538530ywh.28
	for <linux-mtd@lists.infradead.org>;
	Tue, 14 Jul 2009 07:48:03 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 14 Jul 2009 07:48:03 -0700
Message-ID: <8c6c6f450907140748w41dd39e0m33fbe81e234dcff4@mail.gmail.com>
Subject: jffs2 top-boot errors
From: Ganesh Ragavan <ganeshragavan@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I am trying to boot up linux on a Macronix MX29LV128DT flash in a
powerpc architecture.  This is a top boot flash of size 16 MB in size.
 There are 255 sectors with 64KB in size and 8 sectors with 8 KB in
size.

The u-boot and kernel boots up completely, but I see lot of the
following jffs2 errors while booting and also while doing firmware
upgrades.  I verified the checksum of the jffs2 partition in u-boot
before the kernel boots and they seem to be fine.  Is there any
partition info I need to pass to jffs2 or mtd ?  Mtd seems to probe
the chip and report the values correctly.  Mtd probe values are also
below.  Linux version is 2.6.18.

It would be great if someone could suggest a fix for this.

JFFS2 Errors:

(these errors are not consistent, different kind of jffs2 errors are
got every time)

JFFS2 notice: (837) jffs2_get_inode_nodes: Node header CRC failed at
0x1535f8. {fb8f,ebeb,ae3c0eed,ffffffff}
JFFS2 notice: (877) read_unknown: unknown RWCOMPAT_DELETE nodetype
0X2000 at 0x42fc34
Node totlen on flash (0x00000000) !=3D totlen from node ref (0x000003c8)
MTD do_write_oneword(): software timeout
MTD do_write_oneword(): software timeout

Installing package...JFFS2 notice: (818) read_dnode: node CRC failed
on dnode at 0x15a734: read 0x35bb281a, calculated

0xc76866b5
JFFS2 warning: (818) jffs2_do_read_inode_internal: no data nodes found
for ino #315
Returned error for crccheck of ino #315. Expect badness...
JFFS2 notice: (818) jffs2_get_inode_nodes: Node header CRC failed at
0x3420b8. {0000,ffff,6f6f3ea6,fffffbff}
JFFS2 error: (853) jffs2_do_read_inode_internal: CRC failed for
read_inode of inode 312 at physical location 0x155e68
Returned error for crccheck of ino #312. Expect badness...
JFFS2 notice: (853) read_unknown: unknown RWCOMPAT_DELETE nodetype
0X2000 at 0x1a8958
Node totlen on flash (0x00000000) !=3D totlen from node ref (0x00000038)
JFFS2 notice: (853) read_unknown: unknown RWCOMPAT_DELETE nodetype
0X2000 at 0x1a8b2c
Node totlen on flash (0x00000000) !=3D totlen from node ref (0x00000038)
JFFS2 notice: (853) read_unknown: unknown RWCOMPAT_DELETE nodetype 0X2000 a=
t 0x


CFI Probed values:

Number of erase regions: 2
Primary Vendor Command Set: 0002 (AMD/Fujitsu Standard)
Primary Algorithm Table at 0040
Alternative Vendor Command Set: 0000 (None)
No Alternate Algorithm Table
Vcc Minimum:  3.0 V
Vcc Maximum:  3.6 V
No Vpp line
Typical byte/word write timeout: 16 =C2=B5s
Maximum byte/word write timeout: 512 =C2=B5s
Full buffer write not supported
Typical block erase timeout: 1024 ms
Maximum block erase timeout: 16384 ms
Chip erase not supported
Device size: 0x1000000 bytes (16 MiB)
Flash Device Interface description: 0x0002
  - supports x8 and x16 via BYTE# with asynchronous interface
Max. bytes in buffer write: 0x1
Number of Erase Block Regions: 2
  Erase Region #0: BlockSize 0x2000 bytes, 8 blocks
  Erase Region #1: BlockSize 0x10000 bytes, 255 blocks
ff000000.flash: Found 1 x16 devices at 0x0 in 16-bit bank
 Amd/Fujitsu Extended Query Table at 0x0040
drivers/mtd/chips/cfi_cmdset_0002.c, 347

drivers/mtd/chips/cfi_cmdset_0002.c, 352
drivers/mtd/chips/cfi_cmdset_0002.c, 91
  Silicon revision: 0
  Address sensitive unlock: Required
  Erase Suspend: Read/write
  Block protection: 4 sectors per group
  Temporary block unprotect: Supported
  Block protect/unprotect scheme: 4
  Number of simultaneous operations: 0
  Burst mode: Not supported
  Page mode: Not supported
  Vpp Supply Minimum Program/Erase Voltage: 10.5 V
  Vpp Supply Maximum Program/Erase Voltage: 11.5 V
  Top/Bottom Boot Block: Top boot
drivers/mtd/chips/cfi_cmdset_0002.c, 359

ff000000.flash: Swapping erase regions for broken CFI table.
number of CFI chips: 1
0: offset=3D0x0,size=3D0x10000,blocks=3D255
1: offset=3D0xff0000,size=3D0x2000,blocks=3D8
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
RedBoot partition parsing not available
