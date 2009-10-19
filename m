Received: from exprod6og107.obsmtp.com ([64.18.1.208])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N01uu-0001GI-8x
	for linux-mtd@lists.infradead.org; Mon, 19 Oct 2009 23:45:36 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH] plat_nand: request memory resource before doing ioremap
Date: Mon, 19 Oct 2009 19:45:29 -0400
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190901E24741@mi8nycmail19.Mi8.com>
From: "H Hartley Sweeten" <hartleys@visionengravers.com>
To: <linux-mtd@lists.infradead.org>
Cc: David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add a request_mem_region() before doing the ioremap().  Also, use the
resource_size macro instead of doing the end - start + 1 calc by hand.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
Cc: David Woodhouse <dwmw2@infradead.org>

---

diff --git a/drivers/mtd/nand/plat_nand.c b/drivers/mtd/nand/plat_nand.c
index 4e16c6f..8d46731 100644
--- a/drivers/mtd/nand/plat_nand.c
+++ b/drivers/mtd/nand/plat_nand.c
@@ -34,7 +34,12 @@ static int __devinit plat_nand_probe(struct =
platform_device *pdev)
 {
 	struct platform_nand_data *pdata =3D pdev->dev.platform_data;
 	struct plat_nand_data *data;
-	int res =3D 0;
+	struct resource *res;
+	int err =3D 0;
+
+	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -ENXIO;
=20
 	/* Allocate memory for the device structure (and zero it) */
 	data =3D kzalloc(sizeof(struct plat_nand_data), GFP_KERNEL);
@@ -43,12 +48,18 @@ static int __devinit plat_nand_probe(struct =
platform_device *pdev)
 		return -ENOMEM;
 	}
=20
-	data->io_base =3D ioremap(pdev->resource[0].start,
-				pdev->resource[0].end - pdev->resource[0].start + 1);
+	if (!request_mem_region(res->start, resource_size(res),
+				dev_name(&pdev->dev))) {
+		dev_err(&pdev->dev, "request_mem_region failed\n");
+		err =3D -EBUSY;
+		goto out_free;
+	}
+
+	data->io_base =3D ioremap(res->start, resource_size(res));
 	if (data->io_base =3D=3D NULL) {
 		dev_err(&pdev->dev, "ioremap failed\n");
-		kfree(data);
-		return -EIO;
+		err =3D -EIO;
+		goto out_release_io;
 	}
=20
 	data->chip.priv =3D &data;
@@ -74,24 +85,24 @@ static int __devinit plat_nand_probe(struct =
platform_device *pdev)
=20
 	/* Handle any platform specific setup */
 	if (pdata->ctrl.probe) {
-		res =3D pdata->ctrl.probe(pdev);
-		if (res)
+		err =3D pdata->ctrl.probe(pdev);
+		if (err)
 			goto out;
 	}
=20
 	/* Scan to find existance of the device */
 	if (nand_scan(&data->mtd, 1)) {
-		res =3D -ENXIO;
+		err =3D -ENXIO;
 		goto out;
 	}
=20
 #ifdef CONFIG_MTD_PARTITIONS
 	if (pdata->chip.part_probe_types) {
-		res =3D parse_mtd_partitions(&data->mtd,
+		err =3D parse_mtd_partitions(&data->mtd,
 					pdata->chip.part_probe_types,
 					&data->parts, 0);
-		if (res > 0) {
-			add_mtd_partitions(&data->mtd, data->parts, res);
+		if (err > 0) {
+			add_mtd_partitions(&data->mtd, data->parts, err);
 			return 0;
 		}
 	}
@@ -99,14 +110,14 @@ static int __devinit plat_nand_probe(struct =
platform_device *pdev)
 		pdata->chip.set_parts(data->mtd.size, &pdata->chip);
 	if (pdata->chip.partitions) {
 		data->parts =3D pdata->chip.partitions;
-		res =3D add_mtd_partitions(&data->mtd, data->parts,
+		err =3D add_mtd_partitions(&data->mtd, data->parts,
 			pdata->chip.nr_partitions);
 	} else
 #endif
-	res =3D add_mtd_device(&data->mtd);
+	err =3D add_mtd_device(&data->mtd);
=20
-	if (!res)
-		return res;
+	if (!err)
+		return err;
=20
 	nand_release(&data->mtd);
 out:
@@ -114,8 +125,11 @@ out:
 		pdata->ctrl.remove(pdev);
 	platform_set_drvdata(pdev, NULL);
 	iounmap(data->io_base);
+out_release_io:
+	release_mem_region(res->start, resource_size(res));
+out_free:
 	kfree(data);
-	return res;
+	return err;
 }
=20
 /*
@@ -125,6 +139,9 @@ static int __devexit plat_nand_remove(struct =
platform_device *pdev)
 {
 	struct plat_nand_data *data =3D platform_get_drvdata(pdev);
 	struct platform_nand_data *pdata =3D pdev->dev.platform_data;
+	struct resource *res;
+
+	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
=20
 	nand_release(&data->mtd);
 #ifdef CONFIG_MTD_PARTITIONS
@@ -134,6 +151,7 @@ static int __devexit plat_nand_remove(struct =
platform_device *pdev)
 	if (pdata->ctrl.remove)
 		pdata->ctrl.remove(pdev);
 	iounmap(data->io_base);
+	release_mem_region(res->start, resource_size(res));
 	kfree(data);
=20
 	return 0;=20
