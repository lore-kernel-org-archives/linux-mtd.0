Received: from exprod6og106.obsmtp.com ([64.18.1.191])
	by bombadil.infradead.org with smtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NKI5R-0008MQ-Ub
	for linux-mtd@lists.infradead.org; Mon, 14 Dec 2009 21:04:14 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH] au1550nd.c: use kzalloc()
Date: Mon, 14 Dec 2009 16:04:07 -0500
Message-ID: <BD79186B4FD85F4B8E60E381CAEE19090200EA44@mi8nycmail19.Mi8.com>
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

Use kzalloc() instead of kmalloc()/memset().

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
Cc: David Woodhouse <dwmw2@infradead.org>

---

diff --git a/drivers/mtd/nand/au1550nd.c b/drivers/mtd/nand/au1550nd.c
index 92c334f..de190b8 100644
--- a/drivers/mtd/nand/au1550nd.c
+++ b/drivers/mtd/nand/au1550nd.c
@@ -450,7 +450,7 @@ static int __init au1xxx_nand_init(void)
 	u32 nand_phys;
=20
 	/* Allocate memory for MTD device structure and private data */
-	au1550_mtd =3D kmalloc(sizeof(struct mtd_info) + sizeof(struct =
nand_chip), GFP_KERNEL);
+	au1550_mtd =3D kzalloc(sizeof(struct mtd_info) + sizeof(struct =
nand_chip), GFP_KERNEL);
 	if (!au1550_mtd) {
 		printk("Unable to allocate NAND MTD dev structure.\n");
 		return -ENOMEM;
@@ -459,10 +459,6 @@ static int __init au1xxx_nand_init(void)
 	/* Get pointer to private data */
 	this =3D (struct nand_chip *)(&au1550_mtd[1]);
=20
-	/* Initialize structures */
-	memset(au1550_mtd, 0, sizeof(struct mtd_info));
-	memset(this, 0, sizeof(struct nand_chip));
-
 	/* Link the private data with the MTD structure */
 	au1550_mtd->priv =3D this;
 	au1550_mtd->owner =3D THIS_MODULE;=20
