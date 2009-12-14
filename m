Received: from exprod6ob114.obsmtp.com ([64.18.1.32] helo=psmtp.com)
	by bombadil.infradead.org with smtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NKIty-0007ca-UD
	for linux-mtd@lists.infradead.org; Mon, 14 Dec 2009 21:56:27 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH] drivers/mtd/nand/s3c2410.c: use resource_size()
Date: Mon, 14 Dec 2009 16:56:22 -0500
Message-ID: <BD79186B4FD85F4B8E60E381CAEE19090200EA66@mi8nycmail19.Mi8.com>
From: "H Hartley Sweeten" <hartleys@visionengravers.com>
To: "kernel list" <linux-kernel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Ben Dooks <ben-linux@fluff.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use resource_size().

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Ben Dooks <ben-linux@fluff.org>

---

diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index 68b5b3a..3b5a8cc 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -957,7 +957,7 @@ static int s3c24xx_nand_probe(struct platform_device =
*pdev)
=20
 	/* currently we assume we have the one resource */
 	res  =3D pdev->resource;
-	size =3D res->end - res->start + 1;
+	size =3D resource_size(res);
=20
 	info->area =3D request_mem_region(res->start, size, pdev->name);
 =20
