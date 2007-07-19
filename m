Received: from real.realitydiluted.com ([66.43.201.61])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IBNeG-000654-3s
	for linux-mtd@lists.infradead.org; Thu, 19 Jul 2007 00:29:59 -0400
Received: from atlas.inter.net ([10.0.0.3])
	by real.realitydiluted.com with esmtp (Exim 4.67)
	(envelope-from <sjhill@realitydiluted.com>) id 1IBNgM-00065E-IH
	for linux-mtd@lists.infradead.org; Wed, 18 Jul 2007 23:32:07 -0500
Message-ID: <469EE8BA.6020506@realitydiluted.com>
Date: Wed, 18 Jul 2007 23:29:46 -0500
From: "Steven J. Hill" <sjhill@realitydiluted.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH] Add NAND manufacturer AMD.
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig74C1C9D8B7E1CE9F98B0663A"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig74C1C9D8B7E1CE9F98B0663A
Content-Type: multipart/mixed; boundary="------------020802000609050001070908"

This is a multi-part message in MIME format.
--------------020802000609050001070908
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

This patch adds the manufacturer ID for AMD flash.

Signed-off-by: Steven J. Hill <sjhill1@rockwellcollins.com>

--------------020802000609050001070908
Content-Type: text/x-patch;
 name="nand-amd-manuf-id.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline;
 filename="nand-amd-manuf-id.patch"

diff -ur linux-2.6.22/drivers/mtd/nand/nand_ids.c linux-2.6.22-patched/dr=
ivers/mtd/nand/nand_ids.c
--- linux-2.6.22/drivers/mtd/nand/nand_ids.c	2007-07-14 22:39:06.65012387=
4 -0500
+++ linux-2.6.22-patched/drivers/mtd/nand/nand_ids.c	2007-07-14 22:38:13.=
869987000 -0500
@@ -141,6 +141,7 @@
 	{NAND_MFR_STMICRO, "ST Micro"},
 	{NAND_MFR_HYNIX, "Hynix"},
 	{NAND_MFR_MICRON, "Micron"},
+	{NAND_MFR_AMD, "AMD"},
 	{0x0, "Unknown"}
 };
=20
diff -ur linux-2.6.22/include/linux/mtd/nand.h linux-2.6.22-patched/inclu=
de/linux/mtd/nand.h
--- linux-2.6.22/include/linux/mtd/nand.h	2007-07-14 22:39:16.514896979 -=
0500
+++ linux-2.6.22-patched/include/linux/mtd/nand.h	2007-07-14 22:37:54.168=
442000 -0500
@@ -432,6 +432,7 @@
 #define NAND_MFR_STMICRO	0x20
 #define NAND_MFR_HYNIX		0xad
 #define NAND_MFR_MICRON		0x2c
+#define NAND_MFR_AMD		0x01
=20
 /**
  * struct nand_flash_dev - NAND Flash Device ID Structure

--------------020802000609050001070908--

--------------enig74C1C9D8B7E1CE9F98B0663A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFGnujAgyK5H2Ic36cRAhPeAKCiCStfVqhRlV6rYtCz6XbynlW0hgCfX09v
lamwU+f7v+SsxY7n98sIM+Q=
=HiZP
-----END PGP SIGNATURE-----

--------------enig74C1C9D8B7E1CE9F98B0663A--
