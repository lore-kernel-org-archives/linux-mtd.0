Received: from mail.haslerrail.com ([212.103.73.117])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NovfV-00013B-BT
	for linux-mtd@lists.infradead.org; Tue, 09 Mar 2010 09:24:06 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: difference between JFFS2 for NAND and NOR
Date: Tue, 9 Mar 2010 10:24:27 +0100
Message-ID: <2888BF8AC9A0304E907A7CB9D0CA06DC019E9EE0@hrsrv03.haslerrail.net>
From: "Hoefle Marco" <Marco.Hoefle@haslerrail.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Good day,
We have an imx35 board from Phytec which ships with a 32MByte NOR flash
and a 1GByte NAND flash (Samsung K9WAG08U1A)
Our root filesystem generated with=20
mkfs.jffs2 -r ROOTFS_DIR -o jffs.img -e 128 -l -n
works well on the NOR flash.

When we put it into the NAND it boots fine the first time. However,
after a reboot we get

Jffs_scan_inode(): CRC failed on node .... Failures

=20
Each time a reboot causes more of those failures.
According to the NAND datasheet a block has 64 Pages (128K + 4k) Byte

1 Page =3D (2K + 64) Bytes
1 Block =3D (2K + 64)B x 64 Pages =3D (128K + 4K) Bytes
1 Device =3D (2K + 64)B x 64 Pages x8192 Blocks =3D 8,448 Mbits

Am I generating the jffs2 image wrong for this NAND type?

Normally we do not write on the rootfs, /var/log,  /var/lock /var/run
are mapped to another partition (ext3 on the same flash).

Any hints a very appreciated,

Marco
=20
