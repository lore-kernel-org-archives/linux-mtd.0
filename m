Received: from mailsend02.psi.ch ([129.129.191.54])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JWUX5-0005Yt-3D
	for linux-mtd@lists.infradead.org; Tue, 04 Mar 2008 10:38:03 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: MTD and jffs2 mount problem on Linux-2.6.23 rc2
Date: Tue, 4 Mar 2008 11:34:08 +0100
Message-ID: <1B4F8000449511488D1A640DD6DECA3501EC25DC@MAILBOX0A.psi.ch>
From: "Dach Miroslaw" <miroslaw.dach@psi.ch>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear All,

I am just a beginner in MTD tools. I have downloaded from the web =
mtd-tools version 1.0.0.
I have crosscompiled the mtd-tools for ppc405. All went fine.

I have build the kernel 2.6.23 rc2 with mtd and jffs2 enabled:

CONFIG_MTD=3Dy
CONFIG_MTD_PARTITIONS=3Dy
CONFIG_MTD_CMDLINE_PARTS=3Dy
=20
CONFIG_MTD_CHAR=3Dy
CONFIG_MTD_BLKDEVS=3Dy
CONFIG_MTD_BLOCK=3Dy

CONFIG_MTD_CFI=3Dy
CONFIG_MTD_GEN_PROBE=3Dy

CONFIG_MTD_MAP_BANK_WIDTH_1=3Dy
CONFIG_MTD_MAP_BANK_WIDTH_2=3Dy
CONFIG_MTD_MAP_BANK_WIDTH_4=3Dy

CONFIG_MTD_CFI_I1=3Dy
CONFIG_MTD_CFI_I2=3Dy

CONFIG_MTD_CFI_INTELEXT=3Dy

CONFIG_MTD_CFI_UTIL=3Dy
CONFIG_MTD_RAM=3Dy
CONFIG_MTD_ROM=3Dy

CONFIG_MTD_PHYSMAP=3Dy
CONFIG_MTD_PHYSMAP_START=3D0xFF000000
CONFIG_MTD_PHYSMAP_LEN=3D0x800000
CONFIG_MTD_PHYSMAP_BANKWIDTH=3D2
CONFIG_MTD_PLATRAM=3Dy

CONFIG_BLK_DEV=3Dy
CONFIG_BLK_DEV_LOOP=3Dy

CONFIG_JFFS2_FS=3Dy
CONFIG_JFFS2_FS_DEBUG=3D0
CONFIG_JFFS2_FS_WRITEBUFFER=3Dy
# CONFIG_JFFS2_SUMMARY is not set
# CONFIG_JFFS2_FS_XATTR is not set
# CONFIG_JFFS2_COMPRESSION_OPTIONS is not set
CONFIG_JFFS2_ZLIB=3Dy
CONFIG_JFFS2_RTIME=3Dy

I have created on my target board the jffs2 image which is foreseen to =
be place on /dev/mtd3:

./mkfs.jffs2 --pad=3D0xA0000 --eraseblock=3D0x20000 --root=3DTEST-DIR =
--output=3Dimage2.jffs2
flash_erase /dev/mtd3
dd if=3D./image2.jffs2 of=3D/dev/mtd3 bs=3D2 count=3D327680

Up to this point all went fine.

The problem emerged when I have tried to mount the jffs2 partition:
mkdir /mnt
mount -t jffs2 /dev/mtdblock3  /mnt

-------------------------------------------------------------------------=
--------------------------------
[ 7459.517787] jffs2_scan_eraseblock(): Node at 0x00000000 {0x1985, =
0x2003, 0x0000000c) has invalid CRC 0xf060dc98 (calculated 0xf9d690b3)
[ 7459.665215] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found =
at 0x00000008: 0xf060 instead
[ 7459.772681] jffs2_scan_eraseblock(): Node at 0x0000000c {0x1985, =
0xe001, 0x00000035) has invalid CRC 0xc44d1944 (calculated 0x92fedd67)
[ 7459.919977] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found =
at 0x00000014: 0xc44d instead
[ 7460.027434] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found =
at 0x00000028: 0x0d0a instead
[ 7460.134905] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found =
at 0x0000002c: 0xe7db instead
[ 7460.242298] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found =
at 0x00000030: 0x326c instead
[ 7460.349685] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found =
at 0x00000034: 0x4750 instead
[ 7460.457079] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found =
at 0x00000038: 0x2e74 instead
[ 7460.564482] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found =
at 0x0000003c: 0x706c instead
[ 7460.671504] Further such events for this erase block will not be =
printed
[ 7460.834424] jffs2_scan_eraseblock(): Node at 0x00020000 {0x1985, =
0x2003, 0x0000000c) has invalid CRC 0xf060dc98 (calculated 0xf9d690b3)
[ 7460.981732] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found =
at 0x00020008: 0xf060 instead
[ 7461.089463] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found =
at 0x0002000c: 0xffff instead
[ 7461.196950] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found =
at 0x00020010: 0xffff instead
[ 7461.304436] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found =
at 0x00020014: 0xffff instead
[ 7461.411890] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found =
at 0x00020018: 0xffff instead
[ 7461.519301] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found =
at 0x0002001c: 0xffff instead
[ 7461.626689] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found =
at 0x00020020: 0xffff instead
[ 7461.734079] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found =
at 0x00020024: 0xffff instead
[ 7461.841467] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found =
at 0x00020028: 0xffff instead
[ 7461.948428] Further such events for this erase block will not be =
printed
:
:
:
[ 7464.664307] jffs2_scan_eraseblock(): Node at 0x00080000 {0x1985, =
0x2003, 0x0000000c) has invalid CRC 0xf060dc98 (calculated 0xf9d690b3)
[ 7464.811667] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found =
at 0x00080008: 0xf060 instead
[ 7464.919083] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found =
at 0x0008000c: 0xffff instead
[ 7465.026794] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found =
at 0x00080010: 0xffff instead
[ 7465.134190] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found =
at 0x00080014: 0xffff instead
[ 7465.241665] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found =
at 0x00080018: 0xffff instead
[ 7465.349060] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found =
at 0x0008001c: 0xffff instead
[ 7465.456461] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found =
at 0x00080020: 0xffff instead
[ 7465.563917] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found =
at 0x00080024: 0xffff instead
[ 7465.671325] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found =
at 0x00080028: 0xffff instead
[ 7465.778305] Further such events for this erase block will not be =
printed
[ 7465.941101] Cowardly refusing to erase blocks on filesystem with no =
valid JFFS2 nodes
[ 7466.035471] empty_blocks 0, bad_blocks 0, c->nr_blocks 5
mount: mounting /dev/mtdblock3 on /mnt failed


I do not know if there is any mismatch between the mtd and jffs2 in the =
linux kernel 2.6.23 and MTD 1.0.0 ?

My image2.jffs2 looks like:

00000000  19 85 20 03 00 00 00 0c  f0 60 dc 98 19 85 e0 01  |.. =
......`......|
00000010  00 00 00 35 c4 4d 19 44  00 00 00 01 00 00 00 00  =
|...5.M.D........|
00000020  00 00 00 02 00 00 00 04  0d 0a 00 00 e7 db b4 ae  =
|................|
00000030  32 6c 8c dc 47 50 4d 4d  2e 74 65 6d 70 6c 61 74  =
|2l..GPMM.templat|
00000040  65 ff ff ff 19 85 e0 02  00 00 00 6e 7f 54 eb e8  =
|e..........n.T..|
00000050  00 00 00 02 00 00 00 01  00 00 a1 ff 00 00 00 00  =
|................|
00000060  00 00 00 2a 00 00 00 04  00 00 00 04 00 00 00 04  =
|...*............|
00000070  00 00 00 00 00 00 00 2a  00 00 00 2a 00 00 00 00  =
|.......*...*....|
00000080  58 42 cb c7 7b 3f 69 70  2e 2e 2f 2e 2e 2f 2e 2e  =
|XB..{?ip../../..|
*
00020000  19 85 20 03 00 00 00 0c  f0 60 dc 98 ff ff ff ff  |.. =
......`......|
00020010  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  =
|................|
*
00040000  19 85 20 03 00 00 00 0c  f0 60 dc 98 ff ff ff ff  |.. =
......`......|
00040010  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  =
|................|
*
00060000  19 85 20 03 00 00 00 0c  f0 60 dc 98 ff ff ff ff  |.. =
......`......|
00060010  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  =
|................|
*
00080000  19 85 20 03 00 00 00 0c  f0 60 dc 98 ff ff ff ff  |.. =
......`......|
00080010  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  =
|................|


Best Regards

Miroslaw Dach
