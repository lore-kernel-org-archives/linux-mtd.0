Received: from mail.free-electrons.com ([88.191.46.45])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JPgMK-0005Z3-Ha
	for linux-mtd@lists.infradead.org; Thu, 14 Feb 2008 15:50:54 +0000
Date: Thu, 14 Feb 2008 16:50:25 +0100
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: AKC@pel.dk, dwmw2@infradead.org, linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: fix minor typo in the MTD map driver for SHARP SL series
Message-ID: <20080214165025.765f0637@crazy>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nRoTQDp2iT62iqi4y5Nwbsx";
	protocol="application/pgp-signature"; micalg=PGP-SHA1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--Sig_/nRoTQDp2iT62iqi4y5Nwbsx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi,

Here is a small patch to fix a minor typo in the MTD map driver for
Sharp SL series devices.

Thanks,

Thomas

---

Fix minor typo in printk() message in the MTD map driver for Sharp SL
series devices.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 drivers/mtd/maps/sharpsl-flash.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: linux/drivers/mtd/maps/sharpsl-flash.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- linux.orig/drivers/mtd/maps/sharpsl-flash.c
+++ linux/drivers/mtd/maps/sharpsl-flash.c
@@ -92,7 +92,7 @@
 	parts =3D sharpsl_partitions;
 	nb_parts =3D ARRAY_SIZE(sharpsl_partitions);
=20
-	printk(KERN_NOTICE "Using %s partision definition\n", part_type);
+	printk(KERN_NOTICE "Using %s partition definition\n", part_type);
 	add_mtd_partitions(mymtd, parts, nb_parts);
=20
 	return 0;

--=20
Thomas Petazzoni, Free Electrons
Free Embedded Linux Training Materials
on http://free-electrons.com/training
(More than 1500 pages!)

--Sig_/nRoTQDp2iT62iqi4y5Nwbsx
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFHtGNE9lPLMJjT96cRAoTpAJ9LPGwKZLITFMWkhRwJ4xix8zSPLACfWCEm
RGnU3goSTy3paalgbIsJFLk=
=WBGr
-----END PGP SIGNATURE-----

--Sig_/nRoTQDp2iT62iqi4y5Nwbsx--
