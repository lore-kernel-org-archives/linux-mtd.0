Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T4WUE-0000Wd-HR
 for linux-mtd@lists.infradead.org; Thu, 23 Aug 2012 12:26:11 +0000
Message-ID: <1345725030.2848.236.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v3 0/6] UBI: add max_beb_per1024 parameter / ioctl
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>, Richard Genoud
 <richard.genoud@gmail.com>
Date: Thu, 23 Aug 2012 15:30:30 +0300
In-Reply-To: <20120823133655.72157b18@pixies.home.jungo.com>
References: <1345478416-23900-1-git-send-email-richard.genoud@gmail.com>
 <1345716615.2848.229.camel@sauron.fi.intel.com>
 <20120823133655.72157b18@pixies.home.jungo.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-aqX0yE5aqPHYsbXSsHkm"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-aqX0yE5aqPHYsbXSsHkm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=46rom fa7595564e95672ab87d4a910c6bc02123b75e88 Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Date: Thu, 23 Aug 2012 13:01:11 +0300
Subject: [PATCH] UBI: disallow max_beb_per1024 on NOR flash

If the flash does not admit of bad blocks (e.g., NOR) - disallow using
'max_beb_per1024'.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---

Second attempt, did not test :-)

 drivers/mtd/ubi/build.c |   18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 355756b..aaf7df3 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -646,8 +646,18 @@ static int io_init(struct ubi_device *ubi, int max_beb=
_per1024)
 	ubi->flash_size =3D ubi->mtd->size;
=20
 	if (mtd_can_have_bb(ubi->mtd)) {
-		ubi->bad_allowed =3D 1;
+		if (max_beb_per1024 < 0 ||
+		    max_beb_per1024 > MAX_MTD_UBI_BEB_LIMIT)
+			return -EINVAL;
+		if (!max_beb_per1024)
+			max_beb_per1024 =3D CONFIG_MTD_UBI_BEB_LIMIT;
+
 		ubi->bad_peb_limit =3D get_bad_peb_limit(ubi, max_beb_per1024);
+		ubi->bad_allowed =3D 1;
+	} else if (max_beb_per1024) {
+		ubi_err("mtd%d does not admit of bad blocks, max_beb_per1024 "
+			"cannot be used", mtd->index);
+		return -EINVAL;
 	}
=20
 	if (ubi->mtd->type =3D=3D MTD_NORFLASH) {
@@ -857,12 +867,6 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_n=
um,
 	struct ubi_device *ubi;
 	int i, err, ref =3D 0;
=20
-	if (max_beb_per1024 < 0 || max_beb_per1024 > MAX_MTD_UBI_BEB_LIMIT)
-		return -EINVAL;
-
-	if (!max_beb_per1024)
-		max_beb_per1024 =3D CONFIG_MTD_UBI_BEB_LIMIT;
-
 	/*
 	 * Check if we already have the same MTD device attached.
 	 *
--=20
1.7.10.4


--=-aqX0yE5aqPHYsbXSsHkm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQNiJmAAoJECmIfjd9wqK0BOIP/A6oVq2YoH5TWJWylpYCyH9n
ngtT3xxoZUpFcmjjyMbVX/cmm9/LQ81wnKCpnHhvKWYnspAO8/kEoVW9hK+4Ivlg
2WRIx6Lhrvutf4kFmsnSpp3mKS5EICkloK90i0pVhyJ+wOsuZYR6cUG+P2U4mzgA
3p3LVMHEy7YfzsGMBTiQRA1tKbpAVVtEsa/8Yv37T4eKoGKRhyg4g434a2Fd3Gr0
esMQE8BO2+6AUsnEeQ0s3X11h0hIGLaGEXq47J+e13FVkU5aHmUMl13eRlXRBLxM
ZkzBcg/LdOfeeJbS2SLcKh2Q3Fsbxjqw+4kRwz+e6isljU6Ki9+/PEuncOe+jWtg
vLvasUAIYQAniFNWm/FtWC3FXmnTXOH8252d4c4QlPeu5SNaI+3G4LJFBbYmy8hS
BrsetfrEdIOG4XIgE0G7RD47eybSnX5mr2KYuhIKsb5IsXBaU/sdu3DTzWaIEvk+
J9gYzHrxpBQzf+udn4ftDgGydrVEbv2ouA/wGKNwFGaAhUxzZbWDzJLehy/tAR9i
bzSt21V0q2MKXcFvBLqmAQM6cXpe+myIBKCcU30uIKbcFuaURRHUO/2C2QlqXmXY
pLNF/GJYlpWWG6+UeElDPMAqGLP+SWD3jombpQsftbo0+uB/bB3aMBdzKigelO/Q
a5Tgq4mR/lcoN4dX+6tn
=DCRn
-----END PGP SIGNATURE-----

--=-aqX0yE5aqPHYsbXSsHkm--
