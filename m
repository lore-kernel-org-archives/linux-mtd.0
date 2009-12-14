Received: from exprod6og110.obsmtp.com ([64.18.1.25])
	by bombadil.infradead.org with smtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NKHzc-0006WE-53
	for linux-mtd@lists.infradead.org; Mon, 14 Dec 2009 20:58:12 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH] atmel_nand.c: use resource_size()
Date: Mon, 14 Dec 2009 15:58:06 -0500
Message-ID: <BD79186B4FD85F4B8E60E381CAEE19090200EA41@mi8nycmail19.Mi8.com>
From: "H Hartley Sweeten" <hartleys@visionengravers.com>
To: "kernel list" <linux-kernel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>
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

---

diff --git a/drivers/mtd/nand/atmel_nand.c =
b/drivers/mtd/nand/atmel_nand.c
index f8e9975..162b4f2 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -399,7 +399,7 @@ static int __init atmel_nand_probe(struct =
platform_device *pdev)
 		return -ENOMEM;
 	}
=20
-	host->io_base =3D ioremap(mem->start, mem->end - mem->start + 1);
+	host->io_base =3D ioremap(mem->start, resource_size(mem));
 	if (host->io_base =3D=3D NULL) {
 		printk(KERN_ERR "atmel_nand: ioremap failed\n");
 		res =3D -EIO;
@@ -433,7 +433,7 @@ static int __init atmel_nand_probe(struct =
platform_device *pdev)
 	if (no_ecc)
 		nand_chip->ecc.mode =3D NAND_ECC_NONE;
 	if (hard_ecc && regs) {
-		host->ecc =3D ioremap(regs->start, regs->end - regs->start + 1);
+		host->ecc =3D ioremap(regs->start, resource_size(regs));
 		if (host->ecc =3D=3D NULL) {
 			printk(KERN_ERR "atmel_nand: ioremap failed\n");
 			res =3D -EIO;=20
