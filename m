Received: from phoenix.infradead.org ([195.224.96.167])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 193FaW-0007KH-JY
	for <linux-mtd@lists.infradead.org>; Wed, 09 Apr 2003 14:26:04 +0100
Received: from rumms.uni-mannheim.de ([134.155.50.52])
	by phoenix.infradead.org with esmtp (Exim 4.10)
	id 193FaY-0001KR-00
	for linux-mtd@lists.infradead.org; Wed, 09 Apr 2003 14:26:06 +0100
From: Thomas Schlichter <schlicht@uni-mannheim.de>
To: dwmw2@redhat.com
Date: Wed, 9 Apr 2003 14:46:08 +0200
MIME-Version: 1.0
Message-Id: <200304091446.20333.schlicht@uni-mannheim.de>
Content-Type: multipart/signed;
  protocol="application/pgp-signature";
  micalg=pgp-sha1;
  boundary="Boundary-03=_cYBl+sAkJORkvoV";
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
cc: trivial@rustcorp.com.au
Subject: [TRIVIAL PATCH 2.5.67] fix compilation error for mtdblock.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--Boundary-03=_cYBl+sAkJORkvoV
Content-Type: multipart/mixed;
  boundary="Boundary-01=_QYBl+093fi1PLpM"
Content-Transfer-Encoding: 7bit
Content-Description: signed data
Content-Disposition: inline

--Boundary-01=_QYBl+093fi1PLpM
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Content-Description: body text
Content-Disposition: inline

Just added the missing right parenthesis..

   Thomas
--Boundary-01=_QYBl+093fi1PLpM
Content-Type: text/x-diff;
  charset="iso-8859-15";
  name="mtdblock.diff"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline; filename="mtdblock.diff"

=2D-- linux-2.5.67/drivers/mtd/mtdblock.c.orig	Wed Apr  9 14:00:10 2003
+++ linux-2.5.67/drivers/mtd/mtdblock.c	Wed Apr  9 14:00:32 2003
@@ -388,7 +388,7 @@
 	struct mtdblk_dev *mtdblk;
 	unsigned int res;
=20
=2D	while ((req =3D elv_next_request(&mtd_queue) !=3D NULL) {
+	while ((req =3D elv_next_request(&mtd_queue)) !=3D NULL) {
 		struct mtdblk_dev **p =3D req->rq_disk->private_data;
 		spin_unlock_irq(mtd_queue.queue_lock);
 		mtdblk =3D *p;

--Boundary-01=_QYBl+093fi1PLpM--

--Boundary-03=_cYBl+sAkJORkvoV
Content-Type: application/pgp-signature
Content-Description: signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+lBYbYAiN+WRIZzQRAiwRAKCsI9dHdiwTWOgwsp7KLBeiMT6x4QCfcgvM
1Me1uYN6Vw/rK+MlRl0p/wU=
=Zteu
-----END PGP SIGNATURE-----

--Boundary-03=_cYBl+sAkJORkvoV--
