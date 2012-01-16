Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RmifE-00072m-39
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2012 09:15:40 +0000
Received: by iakl21 with SMTP id l21so10050389iak.36
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jan 2012 01:15:38 -0800 (PST)
Message-ID: <1326705441.14299.10.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] PM / MTD: Fix regressions related to mtd_suspend()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Date: Mon, 16 Jan 2012 11:17:21 +0200
In-Reply-To: <201201160018.02305.rjw@sisk.pl>
References: <201201151443.30897.rjw@sisk.pl>
 <1326637306.2201.22.camel@koala> <201201160018.02305.rjw@sisk.pl>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-4AQcwaFqBWtjamcUdu34"
Mime-Version: 1.0
Cc: LKML <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org,
 David Woodhouse <David.Woodhouse@intel.com>,
 Linux PM list <linux-pm@vger.kernel.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-4AQcwaFqBWtjamcUdu34
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Rafael!

I've pushed this patch to l2-mtd-2.6.git (David, would you please merge
it upstream?).

Rafael, should I add some tags with your name like Tested-by or
Acked-by?


=46rom d0eb0d769923d562781fcf43fdc6fa28e3823756 Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Date: Mon, 16 Jan 2012 11:07:16 +0200
Subject: [PATCH] mtd: fix MTD suspend

Commits 3fe4bae88460869a8e553397cd9057a4ee7ca341 and
079c985e7a6f4ce60f931cebfdd5ee3c3 broke MTD suspend in 2 ways:

1. When the '->suspend' method is not present, we return -EOPNOTSUPP, but
   the callers of 'mtd_suspend()' expects 0 instead.
2. Checking of the 'mtd' parameter against NULL has been incorrectly remove=
d
   in 'mtd_cls_suspend()'.

This patch fixes the breakages. This has been found, analyzed, reported
and tested by Rafael J. Wysocki <rjw@sisk.pl>.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/mtdcore.c   |    2 +-
 include/linux/mtd/mtd.h |    4 +---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index b265188..de96865 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -119,7 +119,7 @@ static int mtd_cls_suspend(struct device *dev, pm_messa=
ge_t state)
 {
        struct mtd_info *mtd =3D dev_get_drvdata(dev);
=20
-       return mtd_suspend(mtd);
+       return mtd ? mtd_suspend(mtd) : 0;
 }
=20
 static int mtd_cls_resume(struct device *dev)
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 1a81fde..d8c7aad 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -427,9 +427,7 @@ static inline int mtd_is_locked(struct mtd_info *mtd, l=
off_t ofs, uint64_t len)
=20
 static inline int mtd_suspend(struct mtd_info *mtd)
 {
-       if (!mtd->suspend)
-               return -EOPNOTSUPP;
-       return mtd->suspend(mtd);
+       return mtd->suspend ? mtd->suspend(mtd) : 0;
 }
=20
 static inline void mtd_resume(struct mtd_info *mtd)
--=20
1.7.8.3


--=20
Best Regards,
Artem Bityutskiy

--=-4AQcwaFqBWtjamcUdu34
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPE+shAAoJECmIfjd9wqK0fPYP/jxpPcUdtU4DTSUv/dzQTRSY
ER/C7vXski9AQT1ZOPCMkky4EyeFWm2uzK7zWiiEWkPCybJjj4r7LMqFRXqMlpHK
7pyLIRxZD3kqLT/frT1gxrbmZDb88AShXSbXP37yOLU4EKS84u8moCBiUoXc85OY
HvS8wwlQOKNiNYNt7d06lDgl9yPF1WZw64oZhSV4gy/DFco7d+iSzqQzoBGnLOdg
K32qjIsNXSxwfFgsdQP3hjz9AGDfxdkuHX+93BjOwHu6Co4XeJLkoT5SGxWO/0YI
+0SB1Diwl7W0n2IzP4ZeXYHD9gaAf4Kr05SW4Ti2Ftq5rwfwMCNo9Ouic1bvXXIz
3OqALpVg8dHaF+CZclfkYSvY/CfPzyWfI/4sHXRvS4evs5g2cEX7ghGEa/K+fa8x
08D8u+aYQHVz3IezpAQmTAg6pDKLCHphSCG6jvAYHv5qKbVq0SrDHsE2qNCmEvMe
D06WgQbscVdcBs+z/B1FzUsyvi6LFbP7md3k9xvxr+haTDj7+2E3opTI+zLMpAlV
tSFN90Fpz1f0e8UbjN1MJF62hWg/noBbjBQs0Oo2tnJlR/tNZ2ThXP5AmB2g80Gu
e6c3l0Y3tVhUYruHEPCpYJ7d/KgdE9K89m78mv52t/FKkbldKZKTQ4wDsRS1sSxs
Ura8/JSaIN535ZwQAIer
=4q0e
-----END PGP SIGNATURE-----

--=-4AQcwaFqBWtjamcUdu34--
