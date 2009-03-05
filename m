Received: from exprod6og107.obsmtp.com ([64.18.1.208])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LfNSc-0004On-Uu
	for linux-mtd@lists.infradead.org; Thu, 05 Mar 2009 23:58:46 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH] mtd: plat_nand: add platform probe/remove callbacks
Date: Thu, 5 Mar 2009 18:58:12 -0500
Message-ID: <BD79186B4FD85F4B8E60E381CAEE1909013B7114@mi8nycmail19.Mi8.com>
From: "hartleys" <hartleys@visionengravers.com>
To: <linux-kernel@vger.kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mtd@lists.infradead.org,
	Alexander Clouter <alex@digriz.org.uk>, vitalywool@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add optional probe and remove callbacks to the plat_nand driver.

Some platforms may require additional setup, such as configuring
the memory controller, before the nand device can be accessed.
This patch provides an optional callback to handle this setup as
well as a callback to teardown the setup.

This patch was originally submitted to linux-mtd but it was
suggested I post it here for a broader review.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
Tested-By: Alexander Clouter <alex@digriz.org.uk>

---

diff --git a/drivers/mtd/nand/plat_nand.c b/drivers/mtd/nand/plat_nand.c
index 75f9f48..600fbe9 100644
--- a/drivers/mtd/nand/plat_nand.c
+++ b/drivers/mtd/nand/plat_nand.c
@@ -70,6 +70,13 @@ static int __init plat_nand_probe(struct
platform_device *pdev)
=20
 	platform_set_drvdata(pdev, data);
=20
+	/* Handle any platform specific setup */
+	if (pdata->ctrl.probe) {
+		res =3D pdata->ctrl.probe(pdev);
+		if (res)
+			goto out;
+	}
+
 	/* Scan to find existance of the device */
 	if (nand_scan(&data->mtd, 1)) {
 		res =3D -ENXIO;
@@ -99,6 +106,8 @@ static int __init plat_nand_probe(struct
platform_device *pdev)
=20
 	nand_release(&data->mtd);
 out:
+	if (pdata->ctrl.remove)
+		pdata->ctrl.remove(pdev);
 	platform_set_drvdata(pdev, NULL);
 	iounmap(data->io_base);
 	kfree(data);
@@ -111,15 +120,15 @@ out:
 static int __devexit plat_nand_remove(struct platform_device *pdev)
 {
 	struct plat_nand_data *data =3D platform_get_drvdata(pdev);
-#ifdef CONFIG_MTD_PARTITIONS
 	struct platform_nand_data *pdata =3D pdev->dev.platform_data;
-#endif
=20
 	nand_release(&data->mtd);
 #ifdef CONFIG_MTD_PARTITIONS
 	if (data->parts && data->parts !=3D pdata->chip.partitions)
 		kfree(data->parts);
 #endif
+	if (pdata->ctrl.remove)
+		pdata->ctrl.remove(pdev);
 	iounmap(data->io_base);
 	kfree(data);
=20
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index db5b63d..4c88163 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -577,8 +577,13 @@ struct platform_nand_chip {
 	void			*priv;
 };
=20
+/* Keep gcc happy */
+struct platform_device;
+
 /**
  * struct platform_nand_ctrl - controller level device structure
+ * @probe:		platform specific function to probe/setup
hardware
+ * @remove:		platform specific function to remove/teardown
hardware
  * @hwcontrol:		platform specific hardware control structure
  * @dev_ready:		platform specific function to read ready/busy
pin
  * @select_chip:	platform specific chip select function
@@ -589,6 +594,8 @@ struct platform_nand_chip {
  * All fields are optional and depend on the hardware driver
requirements
  */
 struct platform_nand_ctrl {
+	int		(*probe)(struct platform_device *pdev);
+	void		(*remove)(struct platform_device *pdev);
 	void		(*hwcontrol)(struct mtd_info *mtd, int cmd);
 	int		(*dev_ready)(struct mtd_info *mtd);
 	void		(*select_chip)(struct mtd_info *mtd, int chip);=20
