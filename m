Received: from mail-lf0-x22d.google.com ([2a00:1450:4010:c07::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aqHPZ-0006GT-GO
 for linux-mtd@lists.infradead.org; Wed, 13 Apr 2016 09:48:38 +0000
Received: by mail-lf0-x22d.google.com with SMTP id g184so61848834lfb.3
 for <linux-mtd@lists.infradead.org>; Wed, 13 Apr 2016 02:48:16 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Egor Martovetsky <egor@pasemi.com>, Olof Johansson <olof@lixom.net>,
 Joe Perches <joe@perches.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC PA SEMI PWRFICIENT),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH V3] mtd: nand: pasemi: switch to dev_* printing functions
Date: Wed, 13 Apr 2016 11:48:05 +0200
Message-Id: <1460540885-4506-1-git-send-email-zajec5@gmail.com>
In-Reply-To: <1460114003-19926-1-git-send-email-zajec5@gmail.com>
References: <1460114003-19926-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It also contains some minor related changes:
1) Don't warn if kzalloc fails as it dumps stack on its own
2) Use %pR format for displaying whole resource to avoid:
warning: format ‘%08llx’ expects type ‘long long unsigned int’, but argument 2 has type ‘resource_size_t’

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
V3: Switch to dev_* instead of pr_*
---
 drivers/mtd/nand/pasemi_nand.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/pasemi_nand.c b/drivers/mtd/nand/pasemi_nand.c
index 63fcb8c..5de7591 100644
--- a/drivers/mtd/nand/pasemi_nand.c
+++ b/drivers/mtd/nand/pasemi_nand.c
@@ -92,8 +92,9 @@ int pasemi_device_ready(struct mtd_info *mtd)
 
 static int pasemi_nand_probe(struct platform_device *ofdev)
 {
+	struct device *dev = &ofdev->dev;
 	struct pci_dev *pdev;
-	struct device_node *np = ofdev->dev.of_node;
+	struct device_node *np = dev->of_node;
 	struct resource res;
 	struct nand_chip *chip;
 	int err = 0;
@@ -107,13 +108,11 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	if (pasemi_nand_mtd)
 		return -ENODEV;
 
-	pr_debug("pasemi_nand at %pR\n", &res);
+	dev_dbg(dev, "pasemi_nand at %pR\n", &res);
 
 	/* Allocate memory for MTD device structure and private data */
 	chip = kzalloc(sizeof(struct nand_chip), GFP_KERNEL);
 	if (!chip) {
-		printk(KERN_WARNING
-		       "Unable to allocate PASEMI NAND MTD device structure\n");
 		err = -ENOMEM;
 		goto out;
 	}
@@ -121,7 +120,7 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	pasemi_nand_mtd = nand_to_mtd(chip);
 
 	/* Link the private data with the MTD structure */
-	pasemi_nand_mtd->dev.parent = &ofdev->dev;
+	pasemi_nand_mtd->dev.parent = dev;
 
 	chip->IO_ADDR_R = of_iomap(np, 0);
 	chip->IO_ADDR_W = chip->IO_ADDR_R;
@@ -163,13 +162,13 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	}
 
 	if (mtd_device_register(pasemi_nand_mtd, NULL, 0)) {
-		printk(KERN_ERR "pasemi_nand: Unable to register MTD device\n");
+		dev_err(dev, "Unable to register MTD device\n");
 		err = -ENODEV;
 		goto out_lpc;
 	}
 
-	printk(KERN_INFO "PA Semi NAND flash at %08llx, control at I/O %x\n",
-	       res.start, lpcctl);
+	dev_info(dev, "PA Semi NAND flash at %pR, control at I/O %x\n", &res,
+		 lpcctl);
 
 	return 0;
 
-- 
1.8.4.5
