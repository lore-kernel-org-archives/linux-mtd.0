Received: from tur.go2.pl ([193.17.41.50])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TeCNW-0006tK-2q
 for linux-mtd@lists.infradead.org; Thu, 29 Nov 2012 22:14:43 +0000
Received: from moh3-ve1.go2.pl (moh3-ve1.go2.pl [193.17.41.30])
 by tur.go2.pl (Postfix) with ESMTP id 56F196983D7
 for <linux-mtd@lists.infradead.org>; Thu, 29 Nov 2012 23:13:08 +0100 (CET)
Received: from moh3-ve1.go2.pl (unknown [10.0.0.117])
 by moh3-ve1.go2.pl (Postfix) with ESMTP id DFE93A6A017
 for <linux-mtd@lists.infradead.org>; Thu, 29 Nov 2012 23:12:30 +0100 (CET)
Received: from unknown (unknown [10.0.0.142])
 by moh3-ve1.go2.pl (Postfix) with SMTP
 for <linux-mtd@lists.infradead.org>; Thu, 29 Nov 2012 23:12:29 +0100 (CET)
Date: Thu, 29 Nov 2012 23:12:31 +0100
From: Dawid Prus - praca <dawid.prus@o2.pl>
Message-ID: <4716786.20121129231231@o2.pl>
To: linux-mtd@lists.infradead.org
Subject: Problem with NAND on MIPS32 board (mtd 20050122)
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

I'm trying to use a MIPS32-24KE (from Vitesse 7429) with NAND flash SAMSUNG=
 K9F1G08U0B / Micron 29F2G08AAD,
and I have problem with reading it. Software I'm using is KAMIKAZE 8.09.2 (=
mtd 20050122)

Problem is when i try to read also the ID or any data from chip.
When I read ID for SAMSUNG I getting:
NAND device: Manufacturer ID: 0xFF, Chip ID: 0xEC (next readed byte is 0xF1=
) - 0xFF in mfc field makes
that my NAND is not recognized
Same situation with Micron (first byte 0xFF)

I changed nand_base.c and put one extra read command before reading first I=
D byte:

chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1);
read_byte(mtd);  // added command
*maf_id =3D chip->read_byte(mtd);

NAND is now recognized and I have log (dmesg) like this:
.....
RedBoot partition parsing not available
Using physmap partition information                                        =
    =20
Creating 4 MTD partitions on "physmap-flash.0":                            =
    =20
0x00000000-0x00040000 : "redboot"                                          =
    =20
0x00040000-0x00080000 : "config"                                           =
    =20
0x007c0000-0x008c0000 : "linux"                                            =
    =20
0x008c0000-0x00bc0000 : "rootfs"                                           =
    =20
mtd: partition "rootfs" set to be root filesystem                          =
    =20
block2mtd: version $Revision: 1.30 $                                       =
    =20
NAND device: ec,f1,80,15,40 // this is my exta function                    =
                 =20
NAND device: Manufacturer ID: 0xec, Chip ID: 0xf1 (Samsung NAND 128MiB 3,3V=
 8-b)
Scanning device for bad blocks                                             =
    =20
Creating 1 MTD partitions on "gen_nand":                                   =
    =20
0x00000000-0x08000000 : "rootfs_data"                                      =
    =20
TCP cubic registered                                                       =
    =20
NET: Registered protocol family 17                                         =
    =20
VFS: Mounted root (squashfs filesystem) readonly.                          =
    =20
Freeing unused kernel memory: 108k freed
......


After this, when NAND is recognized I have still problem with reading
(first byte is FF and other are shifted to right)
You can see it when I do nandtest (from mtd-utils)

root@OpenWrt:/# nandtest /dev/mtd4                                         =
    =20
ECC corrections: 0                                                         =
    =20
ECC failures   : 0                                                         =
    =20
Bad blocks     : 0                                                         =
    =20
BBT blocks     : 0                                                         =
    =20
00000000: reading...
ECC failed at 00000000                                                     =
    =20
00000000: checking...                                                      =
    =20
compare failed. seed 1797617246                                            =
    =20
Byte 0x0 is ff should be 0a                                                =
    =20
Byte 0x1 is 0a should be 6e                                                =
    =20
Byte 0x2 is 6e should be 7e                                                =
    =20
Byte 0x3 is 7e should be 8e                                                =
    =20
Byte 0x4 is 8e should be aa                                                =
    =20
Byte 0x5 is aa should be 23                                                =
    =20
Byte 0x6 is 23 should be 91=20

From=20myself I can add that NAND i permanently selected - CS pin goes to G=
ND (through 10k)

Please help me to find some solution to fix this issue.
Sorry about my english

Best Regards
Dawid
