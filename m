Received: from exprod6ob117.obsmtp.com ([64.18.1.38] helo=psmtp.com)
	by bombadil.infradead.org with smtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NKIFC-0008Tz-DT
	for linux-mtd@lists.infradead.org; Mon, 14 Dec 2009 21:14:19 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH] davinci_nand.c: use resource_size()
Date: Mon, 14 Dec 2009 16:13:13 -0500
Message-ID: <BD79186B4FD85F4B8E60E381CAEE19090200EA46@mi8nycmail19.Mi8.com>
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

The ioremap'ed sizes are off by 1, use resource_size() for correct =
value.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
Cc: David Woodhouse <dwmw2@infradead.org>

---

diff --git a/drivers/mtd/nand/davinci_nand.c =
b/drivers/mtd/nand/davinci_nand.c
index f13f5b9..b6905f8 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -566,8 +566,8 @@ static int __init nand_davinci_probe(struct =
platform_device *pdev)
 		goto err_nomem;
 	}
=20
-	vaddr =3D ioremap(res1->start, res1->end - res1->start);
-	base =3D ioremap(res2->start, res2->end - res2->start);
+	vaddr =3D ioremap(res1->start, resource_size(res1));
+	base =3D ioremap(res2->start, resource_size(res2));
 	if (!vaddr || !base) {
 		dev_err(&pdev->dev, "ioremap failed\n");
 		ret =3D -EINVAL;=20
