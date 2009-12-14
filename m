Received: from exprod6og107.obsmtp.com ([64.18.1.208])
	by bombadil.infradead.org with smtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NKIKY-0002oo-4C
	for linux-mtd@lists.infradead.org; Mon, 14 Dec 2009 21:19:52 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH] fsl_elbc_nand.c: user resource_size()
Date: Mon, 14 Dec 2009 16:19:44 -0500
Message-ID: <BD79186B4FD85F4B8E60E381CAEE19090200EA4C@mi8nycmail19.Mi8.com>
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

diff --git a/drivers/mtd/nand/fsl_elbc_nand.c =
b/drivers/mtd/nand/fsl_elbc_nand.c
index ddd37d2..f5ed403 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c
@@ -883,7 +883,7 @@ static int __devinit fsl_elbc_chip_probe(struct =
fsl_elbc_ctrl *ctrl,
 	priv->ctrl =3D ctrl;
 	priv->dev =3D ctrl->dev;
=20
-	priv->vbase =3D ioremap(res.start, res.end - res.start + 1);
+	priv->vbase =3D ioremap(res.start, resource_size(&res));
 	if (!priv->vbase) {
 		dev_err(ctrl->dev, "failed to map chip region\n");
 		ret =3D -ENOMEM;=20
