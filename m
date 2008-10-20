Received: from ganesha.gnumonks.org ([2001:780:45:1d:2e0:81ff:fe28:898a])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Krqm8-0006Vx-Cu
	for linux-mtd@lists.infradead.org; Mon, 20 Oct 2008 09:10:08 +0000
Date: Mon, 20 Oct 2008 11:09:47 +0200
From: Harald Welte <laforge@gnumonks.org>
To: Ben Dooks <ben@trinity.fluff.org>
Subject: [PATCH] S3C24xx NAND: Correct tacls_max for S3C2410
Message-ID: <20081020090947.GZ1048@prithivi.gnumonks.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

At least according to my S3C2410X manual, the maximum tacls setting
for the 2410 is 8, not 4.  S3C2410 is therefore like the S3C2412 (and 2443),
not like 2440 and 2442.

Signed-of-by: Harald Welte <laforge@openmoko.org>

diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index 4413d76..251f7a3 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -183,10 +183,20 @@ static int s3c2410_nand_inithw(struct s3c2410_nand_in=
fo *info,
 {
 	struct s3c2410_platform_nand *plat =3D to_nand_plat(pdev);
 	unsigned long clkrate =3D clk_get_rate(info->clk);
-	int tacls_max =3D (info->cpu_type =3D=3D TYPE_S3C2412) ? 8 : 4;
+	int tacls_max;
 	int tacls, twrph0, twrph1;
 	unsigned long cfg =3D 0;
=20
+	switch (info->cpu_type) {
+	case TYPE_S3C2410:
+	case TYPE_S3C2412:
+		tacls_max =3D 8;
+		break;
+	default:
+		tacls_max =3D 4;
+		break;
+	}
+
 	/* calculate the timing information for the controller */
=20
 	clkrate /=3D 1000;	/* turn clock into kHz for ease of use */
--=20
- Harald Welte <laforge@gnumonks.org>           http://laforge.gnumonks.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
"Privacy in residential applications is a desirable marketing option."
                                                  (ETSI EN 300 175-7 Ch. A6)
