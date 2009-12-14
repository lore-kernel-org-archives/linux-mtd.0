Received: from exprod6og103.obsmtp.com ([64.18.1.185])
	by bombadil.infradead.org with smtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NKINX-0001QA-0n
	for linux-mtd@lists.infradead.org; Mon, 14 Dec 2009 21:22:57 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH] fls_upm.c: use resource_size()
Date: Mon, 14 Dec 2009 16:22:49 -0500
Message-ID: <BD79186B4FD85F4B8E60E381CAEE19090200EA4E@mi8nycmail19.Mi8.com>
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

diff --git a/drivers/mtd/nand/fsl_upm.c b/drivers/mtd/nand/fsl_upm.c
index d120cd8..0b9eaec 100644
--- a/drivers/mtd/nand/fsl_upm.c
+++ b/drivers/mtd/nand/fsl_upm.c
@@ -302,7 +302,7 @@ static int __devinit fun_probe(struct of_device =
*ofdev,
 				  FSL_UPM_WAIT_WRITE_BYTE;
=20
 	fun->io_base =3D devm_ioremap_nocache(&ofdev->dev, io_res.start,
-					    io_res.end - io_res.start + 1);
+					    resource_size(&io_res));
 	if (!fun->io_base) {
 		ret =3D -ENOMEM;
 		goto err2;=20
