Received: from exprod6og101.obsmtp.com ([64.18.1.181])
	by bombadil.infradead.org with smtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NKIXt-0003hg-AO
	for linux-mtd@lists.infradead.org; Mon, 14 Dec 2009 21:33:37 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH] mxc_nand.c: use resource_size()
Date: Mon, 14 Dec 2009 16:33:32 -0500
Message-ID: <BD79186B4FD85F4B8E60E381CAEE19090200EA56@mi8nycmail19.Mi8.com>
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
David Woodhouse <dwmw2@infradead.org>

---

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 65b26d5..fb58894 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -920,7 +920,7 @@ static int __init mxcnd_probe(struct platform_device =
*pdev)
 		goto eres;
 	}
=20
-	host->regs =3D ioremap(res->start, res->end - res->start + 1);
+	host->regs =3D ioremap(res->start, resource_size(res));
 	if (!host->regs) {
 		err =3D -ENOMEM;
 		goto eres;=20
