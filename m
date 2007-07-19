Received: from real.realitydiluted.com ([66.43.201.61])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IBNfZ-00065r-Ag
	for linux-mtd@lists.infradead.org; Thu, 19 Jul 2007 00:31:19 -0400
Received: from atlas.inter.net ([10.0.0.3])
	by real.realitydiluted.com with esmtp (Exim 4.67)
	(envelope-from <sjhill@realitydiluted.com>) id 1IBNhg-00065N-Nd
	for linux-mtd@lists.infradead.org; Wed, 18 Jul 2007 23:33:30 -0500
Message-ID: <469EE912.6080307@realitydiluted.com>
Date: Wed, 18 Jul 2007 23:31:14 -0500
From: "Steven J. Hill" <sjhill@realitydiluted.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH] Add NAND chip lock/unlock support
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig334941A70B0A7FC2EB4E6183"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig334941A70B0A7FC2EB4E6183
Content-Type: multipart/mixed; boundary="------------020705020708080104070205"

This is a multi-part message in MIME format.
--------------020705020708080104070205
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

This patch allows the user to define platform-specific NAND lock and
unlock functions.

Signed-off-by: Steven J. Hill <sjhill1@rockwellcollins.com>

--------------020705020708080104070205
Content-Type: text/x-patch;
 name="nand-chip-lock-unlock.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline;
 filename="nand-chip-lock-unlock.patch"

diff -ur linux-2.6.22/drivers/mtd/nand/nand_base.c linux-2.6.22-patched/d=
rivers/mtd/nand/nand_base.c
--- linux-2.6.22/drivers/mtd/nand/nand_base.c	2007-07-08 18:32:17.0000000=
00 -0500
+++ linux-2.6.22-patched/drivers/mtd/nand/nand_base.c	2007-07-14 22:44:27=
=2E339339341 -0500
@@ -2574,13 +2574,21 @@
 	mtd->read_oob =3D nand_read_oob;
 	mtd->write_oob =3D nand_write_oob;
 	mtd->sync =3D nand_sync;
-	mtd->lock =3D NULL;
-	mtd->unlock =3D NULL;
 	mtd->suspend =3D nand_suspend;
 	mtd->resume =3D nand_resume;
 	mtd->block_isbad =3D nand_block_isbad;
 	mtd->block_markbad =3D nand_block_markbad;
=20
+	/* check if lock/unlock functions are supported *
+	if (!chip->lock)
+		mtd->lock =3D NULL;
+	else
+		mtd->lock =3D chip->lock;
+	if (!chip->unlock)
+		mtd->unlock =3D NULL;
+	else
+		mtd->unlock =3D chip->unlock;
+
 	/* propagate ecc.layout to mtd_info */
 	mtd->ecclayout =3D chip->ecc.layout;
=20
diff -ur linux-2.6.22/include/linux/mtd/nand.h linux-2.6.22-patched/inclu=
de/linux/mtd/nand.h
--- linux-2.6.22/include/linux/mtd/nand.h	2007-07-14 22:39:16.514896979 -=
0500
+++ linux-2.6.22-patched/include/linux/mtd/nand.h	2007-07-14 22:41:26.745=
129936 -0500
@@ -313,6 +313,8 @@
  * @read_buf:		[REPLACEABLE] read data from the chip into the buffer
  * @verify_buf:		[REPLACEABLE] verify buffer contents against the chip d=
ata
  * @select_chip:	[REPLACEABLE] select chip nr
+ * @lock:		[REPLACEABLE] lock a chip or sector
+ * @unlock:		[REPLACEABLE] unlock a chip or sector
  * @block_bad:		[REPLACEABLE] check, if the block is bad
  * @block_markbad:	[REPLACEABLE] mark the block bad
  * @cmd_ctrl:		[BOARDSPECIFIC] hardwarespecific funtion for controlling
@@ -372,6 +374,8 @@
 	void		(*read_buf)(struct mtd_info *mtd, uint8_t *buf, int len);
 	int		(*verify_buf)(struct mtd_info *mtd, const uint8_t *buf, int len);
 	void		(*select_chip)(struct mtd_info *mtd, int chip);
+	int		(*lock)(struct mtd_info *mtd, loff_t ofs, size_t len);
+	int		(*unlock)(struct mtd_info *mtd, loff_t ofs, size_t len);
 	int		(*block_bad)(struct mtd_info *mtd, loff_t ofs, int getchip);
 	int		(*block_markbad)(struct mtd_info *mtd, loff_t ofs);
 	void		(*cmd_ctrl)(struct mtd_info *mtd, int dat,

--------------020705020708080104070205--

--------------enig334941A70B0A7FC2EB4E6183
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFGnukSgyK5H2Ic36cRAuA9AJwKtKND56s3XwX+NrSydHgAGRLwqACgq4gP
CtwwgJRJFkMK263IqiBMdh4=
=/Fvj
-----END PGP SIGNATURE-----

--------------enig334941A70B0A7FC2EB4E6183--
