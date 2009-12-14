Received: from exprod6ob109.obsmtp.com ([64.18.1.22] helo=psmtp.com)
	by bombadil.infradead.org with smtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NKImQ-0002yC-Pl
	for linux-mtd@lists.infradead.org; Mon, 14 Dec 2009 21:48:39 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH] orion_nand.c: add error handling and use resource_size()
Date: Mon, 14 Dec 2009 16:48:34 -0500
Message-ID: <BD79186B4FD85F4B8E60E381CAEE19090200EA65@mi8nycmail19.Mi8.com>
From: "H Hartley Sweeten" <hartleys@visionengravers.com>
To: "kernel list" <linux-kernel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>
Cc: David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use platform_get_resource() to fetch the memory resource and
add error handling for when it is missing. Use resource_size()
for the ioremap().

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
Cc: David Woodhouse <dwmw2@infradead.org>

---

diff --git a/drivers/mtd/nand/orion_nand.c =
b/drivers/mtd/nand/orion_nand.c
index f59c074..9903460 100644
--- a/drivers/mtd/nand/orion_nand.c
+++ b/drivers/mtd/nand/orion_nand.c
@@ -74,6 +74,7 @@ static int __init orion_nand_probe(struct =
platform_device *pdev)
 	struct mtd_info *mtd;
 	struct nand_chip *nc;
 	struct orion_nand_data *board;
+	struct resource *res;
 	void __iomem *io_base;
 	int ret =3D 0;
 #ifdef CONFIG_MTD_PARTITIONS
@@ -89,8 +90,13 @@ static int __init orion_nand_probe(struct =
platform_device *pdev)
 	}
 	mtd =3D (struct mtd_info *)(nc + 1);
=20
-	io_base =3D ioremap(pdev->resource[0].start,
-			pdev->resource[0].end - pdev->resource[0].start + 1);
+	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		err =3D -ENODEV;
+		goto no_res;
+	}
+
+	io_base =3D ioremap(res->start, resource_size(res));
 	if (!io_base) {
 		printk(KERN_ERR "orion_nand: ioremap failed\n");
 		ret =3D -EIO;=20
