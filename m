Received: from exprod6ob111.obsmtp.com ([64.18.1.26] helo=psmtp.com)
	by bombadil.infradead.org with smtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NKIwy-0003BE-43
	for linux-mtd@lists.infradead.org; Mon, 14 Dec 2009 21:59:34 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH] drivers/mtd/nand/sh_flctl.c: use resource_size()
Date: Mon, 14 Dec 2009 16:59:27 -0500
Message-ID: <BD79186B4FD85F4B8E60E381CAEE19090200EA68@mi8nycmail19.Mi8.com>
From: "H Hartley Sweeten" <hartleys@visionengravers.com>
To: "kernel list" <linux-kernel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>
Cc: shimoda.yoshihiro@renesas.com, David Woodhouse <dwmw2@infradead.org>
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
Cc: Yoshihiro Shimoda <shimoda.yoshihiro@renesas.com>

---

diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
index 02bef21..4260ab7 100644
--- a/drivers/mtd/nand/sh_flctl.c
+++ b/drivers/mtd/nand/sh_flctl.c
@@ -797,7 +797,7 @@ static int __init flctl_probe(struct platform_device =
*pdev)
 		goto err;
 	}
=20
-	flctl->reg =3D ioremap(res->start, res->end - res->start + 1);
+	flctl->reg =3D ioremap(res->start, resource_size(res));
 	if (flctl->reg =3D=3D NULL) {
 		printk(KERN_ERR "%s: ioremap error.\n", __func__);
 		ret =3D -ENOMEM;=20
