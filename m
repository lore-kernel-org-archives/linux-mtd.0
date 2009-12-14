Received: from exprod6og101.obsmtp.com ([64.18.1.181])
	by bombadil.infradead.org with smtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NKIar-0000yv-Hv
	for linux-mtd@lists.infradead.org; Mon, 14 Dec 2009 21:36:42 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH] nomadik_nand.c: use resource_size()
Date: Mon, 14 Dec 2009 16:36:37 -0500
Message-ID: <BD79186B4FD85F4B8E60E381CAEE19090200EA5D@mi8nycmail19.Mi8.com>
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

diff --git a/drivers/mtd/nand/nomadik_nand.c =
b/drivers/mtd/nand/nomadik_nand.c
index 7c302d5..ed966c0 100644
--- a/drivers/mtd/nand/nomadik_nand.c
+++ b/drivers/mtd/nand/nomadik_nand.c
@@ -104,21 +104,21 @@ static int nomadik_nand_probe(struct =
platform_device *pdev)
 		ret =3D -EIO;
 		goto err_unmap;
 	}
-	host->addr_va =3D ioremap(res->start, res->end - res->start + 1);
+	host->addr_va =3D ioremap(res->start, resource_size(res));
=20
 	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, =
"nand_data");
 	if (!res) {
 		ret =3D -EIO;
 		goto err_unmap;
 	}
-	host->data_va =3D ioremap(res->start, res->end - res->start + 1);
+	host->data_va =3D ioremap(res->start, resource_size(res));
=20
 	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, =
"nand_cmd");
 	if (!res) {
 		ret =3D -EIO;
 		goto err_unmap;
 	}
-	host->cmd_va =3D ioremap(res->start, res->end - res->start + 1);
+	host->cmd_va =3D ioremap(res->start, resource_size(res));
=20
 	if (!host->addr_va || !host->data_va || !host->cmd_va) {
 		ret =3D -ENOMEM;=20
