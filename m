Received: from exprod6og116.obsmtp.com ([64.18.1.37])
	by bombadil.infradead.org with smtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NKJ8r-0006sR-44
	for linux-mtd@lists.infradead.org; Mon, 14 Dec 2009 22:11:50 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH] tmio_nand.c: use dev_get_platdata() and resource_size()
Date: Mon, 14 Dec 2009 17:11:44 -0500
Message-ID: <BD79186B4FD85F4B8E60E381CAEE19090200EA6E@mi8nycmail19.Mi8.com>
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

Remove unnecessary casts and use dev_get_platdata() to retrieve the
struct mfd_cell data from the platform.

Use resource_size() for the ioremap()'s.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
Cc: David Woodhouse <dwmw2@infradead.org>

---

diff --git a/drivers/mtd/nand/tmio_nand.c b/drivers/mtd/nand/tmio_nand.c
index 92c7334..65fa469 100644
--- a/drivers/mtd/nand/tmio_nand.c
+++ b/drivers/mtd/nand/tmio_nand.c
@@ -318,7 +318,7 @@ static int tmio_nand_correct_data(struct mtd_info =
*mtd, unsigned char *buf,
=20
 static int tmio_hw_init(struct platform_device *dev, struct tmio_nand =
*tmio)
 {
-	struct mfd_cell *cell =3D (struct mfd_cell *)dev->dev.platform_data;
+	struct mfd_cell *cell =3D dev_get_platdata(&dev->dev);
 	int ret;
=20
 	if (cell->enable) {
@@ -362,7 +362,7 @@ static int tmio_hw_init(struct platform_device *dev, =
struct tmio_nand *tmio)
=20
 static void tmio_hw_stop(struct platform_device *dev, struct tmio_nand =
*tmio)
 {
-	struct mfd_cell *cell =3D (struct mfd_cell *)dev->dev.platform_data;
+	struct mfd_cell *cell =3D dev_get_platdata(&dev->dev);
=20
 	tmio_iowrite8(FCR_MODE_POWER_OFF, tmio->fcr + FCR_MODE);
 	if (cell->disable)
@@ -371,7 +371,7 @@ static void tmio_hw_stop(struct platform_device =
*dev, struct tmio_nand *tmio)
=20
 static int tmio_probe(struct platform_device *dev)
 {
-	struct mfd_cell *cell =3D (struct mfd_cell *)dev->dev.platform_data;
+	struct mfd_cell *cell =3D dev_get_platdata(&dev->dev);
 	struct tmio_nand_data *data =3D cell->driver_data;
 	struct resource *fcr =3D platform_get_resource(dev,
 			IORESOURCE_MEM, 0);
@@ -404,14 +404,14 @@ static int tmio_probe(struct platform_device *dev)
 	mtd->priv =3D nand_chip;
 	mtd->name =3D "tmio-nand";
=20
-	tmio->ccr =3D ioremap(ccr->start, ccr->end - ccr->start + 1);
+	tmio->ccr =3D ioremap(ccr->start, resource_size(ccr));
 	if (!tmio->ccr) {
 		retval =3D -EIO;
 		goto err_iomap_ccr;
 	}
=20
 	tmio->fcr_base =3D fcr->start & 0xfffff;
-	tmio->fcr =3D ioremap(fcr->start, fcr->end - fcr->start + 1);
+	tmio->fcr =3D ioremap(fcr->start, resource_size(fcr));
 	if (!tmio->fcr) {
 		retval =3D -EIO;
 		goto err_iomap_fcr;
@@ -515,7 +515,7 @@ static int tmio_remove(struct platform_device *dev)
 #ifdef CONFIG_PM
 static int tmio_suspend(struct platform_device *dev, pm_message_t =
state)
 {
-	struct mfd_cell *cell =3D (struct mfd_cell *)dev->dev.platform_data;
+	struct mfd_cell *cell =3D dev_get_platdata(&dev->dev);
=20
 	if (cell->suspend)
 		cell->suspend(dev);
@@ -526,7 +526,7 @@ static int tmio_suspend(struct platform_device *dev, =
pm_message_t state)
=20
 static int tmio_resume(struct platform_device *dev)
 {
-	struct mfd_cell *cell =3D (struct mfd_cell *)dev->dev.platform_data;
+	struct mfd_cell *cell =3D dev_get_platdata(&dev->dev);
=20
 	/* FIXME - is this required or merely another attack of the broken
 	 * SHARP platform? Looks suspicious.=20
