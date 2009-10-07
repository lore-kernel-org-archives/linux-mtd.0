Received: from exprod6og110.obsmtp.com ([64.18.1.25])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mvdk2-0002Ve-3E
	for linux-mtd@lists.infradead.org; Wed, 07 Oct 2009 21:08:14 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH] Fix memory leak in mtd_dataflash
Date: Wed, 7 Oct 2009 17:08:08 -0400
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190901DB7B18@mi8nycmail19.Mi8.com>
From: "H Hartley Sweeten" <hartleys@visionengravers.com>
To: <linux-mtd@lists.infradead.org>
Cc: David Brownell <david-b@pacbell.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix a potential memory leak in mtd_dataflash driver.

The private data that is allocated when registering a DataFlash
device with the MTD subsystem is not released if an error occurs
when add_mtd_partitions() or add_mtd_device() is called.  Fix this
by adding an error path.  The memory is already released during a
remove.

Also, add a dev_set_drvdata(&spi->dev, NULL) before the kfree() so
that the spi device does not reference invalid data.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
Cc: David Brownell <david-b@pacbell.net>
Cc: linux-mtd@lists.infradead.org

---

diff --git a/drivers/mtd/devices/mtd_dataflash.c =
b/drivers/mtd/devices/mtd_dataflash.c
index 93e3627..1981740 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -636,6 +636,7 @@ add_dataflash_otp(struct spi_device *spi, char =
*name,
 	struct mtd_info			*device;
 	struct flash_platform_data	*pdata =3D spi->dev.platform_data;
 	char				*otp_tag =3D "";
+	int				err =3D 0;
=20
 	priv =3D kzalloc(sizeof *priv, GFP_KERNEL);
 	if (!priv)
@@ -693,13 +694,23 @@ add_dataflash_otp(struct spi_device *spi, char =
*name,
=20
 		if (nr_parts > 0) {
 			priv->partitioned =3D 1;
-			return add_mtd_partitions(device, parts, nr_parts);
+			err =3D add_mtd_partitions(device, parts, nr_parts);
+			goto out;
 		}
 	} else if (pdata && pdata->nr_parts)
 		dev_warn(&spi->dev, "ignoring %d default partitions on %s\n",
 				pdata->nr_parts, device->name);
=20
-	return add_mtd_device(device) =3D=3D 1 ? -ENODEV : 0;
+	if (add_mtd_device(device) =3D=3D 1)
+		err =3D -ENODEV;
+
+out:
+	if (!err)
+		return 0;
+
+	dev_set_drvdata(&spi->dev, NULL);
+	kfree(priv);
+	return err;
 }
=20
 static inline int __devinit
@@ -932,8 +943,10 @@ static int __devexit dataflash_remove(struct =
spi_device *spi)
 		status =3D del_mtd_partitions(&flash->mtd);
 	else
 		status =3D del_mtd_device(&flash->mtd);
-	if (status =3D=3D 0)
+	if (status =3D=3D 0) {
+		dev_set_drvdata(&spi->dev, NULL);
 		kfree(flash);
+	}
 	return status;
 }
 =20
