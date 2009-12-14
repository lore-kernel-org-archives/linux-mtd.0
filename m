Received: from exprod6og108.obsmtp.com ([64.18.1.21])
	by bombadil.infradead.org with smtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NKIVG-0007hK-3E
	for linux-mtd@lists.infradead.org; Mon, 14 Dec 2009 21:30:58 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH] drivers/mtd/nand/gpio.c: use resource_size()
Date: Mon, 14 Dec 2009 16:30:46 -0500
Message-ID: <BD79186B4FD85F4B8E60E381CAEE19090200EA54@mi8nycmail19.Mi8.com>
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

Use resource_size().

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
Cc: David Woodhouse <dwmw2@infradead.org>

---

diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
index 8f902e7..41f7d22 100644
--- a/drivers/mtd/nand/gpio.c
+++ b/drivers/mtd/nand/gpio.c
@@ -181,11 +181,11 @@ static int __devexit gpio_nand_remove(struct =
platform_device *dev)
 	res =3D platform_get_resource(dev, IORESOURCE_MEM, 1);
 	iounmap(gpiomtd->io_sync);
 	if (res)
-		release_mem_region(res->start, res->end - res->start + 1);
+		release_mem_region(res->start, resource_size(res));
=20
 	res =3D platform_get_resource(dev, IORESOURCE_MEM, 0);
 	iounmap(gpiomtd->nand_chip.IO_ADDR_R);
-	release_mem_region(res->start, res->end - res->start + 1);
+	release_mem_region(res->start, resource_size(res));
=20
 	if (gpio_is_valid(gpiomtd->plat.gpio_nwp))
 		gpio_set_value(gpiomtd->plat.gpio_nwp, 0);
@@ -208,14 +208,14 @@ static void __iomem *request_and_remap(struct =
resource *res, size_t size,
 {
 	void __iomem *ptr;
=20
-	if (!request_mem_region(res->start, res->end - res->start + 1, name)) =
{
+	if (!request_mem_region(res->start, resource_size(res), name)) {
 		*err =3D -EBUSY;
 		return NULL;
 	}
=20
 	ptr =3D ioremap(res->start, size);
 	if (!ptr) {
-		release_mem_region(res->start, res->end - res->start + 1);
+		release_mem_region(res->start, resource_size(res));
 		*err =3D -ENOMEM;
 	}
 	return ptr;
@@ -338,10 +338,10 @@ err_nwp:
 err_nce:
 	iounmap(gpiomtd->io_sync);
 	if (res1)
-		release_mem_region(res1->start, res1->end - res1->start + 1);
+		release_mem_region(res1->start, resource_size(res1));
 err_sync:
 	iounmap(gpiomtd->nand_chip.IO_ADDR_R);
-	release_mem_region(res0->start, res0->end - res0->start + 1);
+	release_mem_region(res0->start, resouce_size(res0));
 err_map:
 	kfree(gpiomtd);
 	return ret;=20
