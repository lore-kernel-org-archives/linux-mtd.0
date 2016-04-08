Received: from mail-lf0-x236.google.com ([2a00:1450:4010:c07::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aoTjZ-0007WF-8U
 for linux-mtd@lists.infradead.org; Fri, 08 Apr 2016 10:33:49 +0000
Received: by mail-lf0-x236.google.com with SMTP id e190so74386046lfe.0
 for <linux-mtd@lists.infradead.org>; Fri, 08 Apr 2016 03:33:29 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Olof Johansson <olof@lixom.net>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC PA SEMI PWRFICIENT),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] mtd: nand: pasemi: switch to pr_* functions
Date: Fri,  8 Apr 2016 12:33:09 +0200
Message-Id: <1460111589-18781-1-git-send-email-zajec5@gmail.com>
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

This patch also replaces %08llx with %08zx for printing resource start
address. Old format was triggering:
warning: format ‘%08llx’ expects type ‘long long unsigned int’, but argument 2 has type ‘resource_size_t’

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/mtd/nand/pasemi_nand.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/pasemi_nand.c b/drivers/mtd/nand/pasemi_nand.c
index 63fcb8c..e928549 100644
--- a/drivers/mtd/nand/pasemi_nand.c
+++ b/drivers/mtd/nand/pasemi_nand.c
@@ -112,8 +112,7 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	/* Allocate memory for MTD device structure and private data */
 	chip = kzalloc(sizeof(struct nand_chip), GFP_KERNEL);
 	if (!chip) {
-		printk(KERN_WARNING
-		       "Unable to allocate PASEMI NAND MTD device structure\n");
+		pr_warn("Unable to allocate PASEMI NAND MTD device structure\n");
 		err = -ENOMEM;
 		goto out;
 	}
@@ -163,13 +162,13 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	}
 
 	if (mtd_device_register(pasemi_nand_mtd, NULL, 0)) {
-		printk(KERN_ERR "pasemi_nand: Unable to register MTD device\n");
+		pr_err("pasemi_nand: Unable to register MTD device\n");
 		err = -ENODEV;
 		goto out_lpc;
 	}
 
-	printk(KERN_INFO "PA Semi NAND flash at %08llx, control at I/O %x\n",
-	       res.start, lpcctl);
+	pr_info("PA Semi NAND flash at %08zx, control at I/O %x\n", res.start,
+		lpcctl);
 
 	return 0;
 
-- 
1.8.4.5
