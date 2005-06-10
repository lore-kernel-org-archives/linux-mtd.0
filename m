Received: from rproxy.gmail.com ([64.233.170.202])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Dgiti-0006mp-Hs
	for linux-mtd@lists.infradead.org; Fri, 10 Jun 2005 08:46:07 -0400
Received: by rproxy.gmail.com with SMTP id c16so175782rne
	for <linux-mtd@lists.infradead.org>;
	Fri, 10 Jun 2005 05:46:04 -0700 (PDT)
Message-ID: <5585a0780506100546654b6c60@mail.gmail.com>
Date: Fri, 10 Jun 2005 18:16:04 +0530
From: Ramesh Chaurasiya <rameshc@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: mounting jffs2 on NAND Flash ... Magic bitmask error
Reply-To: Ramesh Chaurasiya <rameshc@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I am trying to get NAND Flash work on PXA 255 Board.

It worked perfectly fine with the kernel 2.6.11.3 and=20
mtd-snapshot19-03-2005, means there are no hardware issues.
But for some reasons I have to get it with kernel 2.4.19-rmk7-pxa2

I used a patch shared-zliblinux-2.4.19-pre10-shared-zlib.bz2=20
and mtd-snapshot25-07-2002
It mounts jffs2 successfully, I can copy files on to the flash partition
But if I umount and mount it again, it mounts with the following error:

---------------------------------------------------------------------------=
--------
mtdblock_open
ok
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0011099c:
0xa2f2 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001109a0:
0x6434 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001109a4:
0x36d8 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001109a8:
0x8966 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001109ac:
0x9117 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001109b0:
0x9e7a instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001109b4:
0x531c instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001109b8:
0x536c instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001109bc:
0x41a3 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001109c0:
0x8143 instead
Further such events for this erase block will not be printed
jffs2_scan_inode_node(): Data CRC failed on node at 0x001120f0: Read
0xf4eae54e, calculated 0xa3dc1245
jffs2_scan_inode_node(): CRC failed on node at 0x001121f0: Read
0x00000000, calculated 0xb32256db
jffs2_scan_dirent_node(): Name CRC failed on node at 0x001130ec: Read
0xc3e14ab0, calculated 0xbd4377ab
Name for which CRC failed is (now) '...."...=EF=BF=BF', ino #6
jffs2_scan_dirent_node(): Node CRC failed on node at 0x001131ec: Read
0x5c2d6006, calculated 0xd679b892
JFFS2: Erase block at 0x00b00000 is not formatted. It will be erased
Unknown INCOMPAT nodetype FFFF at 001121C4
---------------------------------------------------------------------------=
--------

And then if I see the contents in that nand partition ...
I found that few files that were copied earlier are missing!

I know that support for kernel 2.4 has been dropped but if anyone got
NAND flash working on 2.4 or if just point out to fix up the above
errors it'll be great help for me.

Or if anyone can give me some hint from where/which patch/snapshot to
apply to get it working on kernel 2.4.19


Thanks,
Ramesh
