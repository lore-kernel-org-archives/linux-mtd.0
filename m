Received: from mail-lf0-x22c.google.com ([2a00:1450:4010:c07::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aoUMo-0003Af-Vh
 for linux-mtd@lists.infradead.org; Fri, 08 Apr 2016 11:14:23 +0000
Received: by mail-lf0-x22c.google.com with SMTP id c126so76845799lfb.2
 for <linux-mtd@lists.infradead.org>; Fri, 08 Apr 2016 04:14:02 -0700 (PDT)
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
Subject: [PATCH V2] mtd: nand: pasemi: switch to pr_* functions
Date: Fri,  8 Apr 2016 13:13:23 +0200
Message-Id: <1460114003-19926-1-git-send-email-zajec5@gmail.com>
In-Reply-To: <1460111589-18781-1-git-send-email-zajec5@gmail.com>
References: <1460111589-18781-1-git-send-email-zajec5@gmail.com>
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

1) Use pr_fmt to keep messages consistent
2) Don't warn if kzalloc fails as it dumps stack on its own
3) Use %pR format for displaying whole resource to avoid:
warning: format ‘%08llx’ expects type ‘long long unsigned int’, but argument 2 has type ‘resource_size_t’

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/mtd/nand/pasemi_nand.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/pasemi_nand.c b/drivers/mtd/nand/pasemi_nand.c
index 63fcb8c..e8372b4 100644
--- a/drivers/mtd/nand/pasemi_nand.c
+++ b/drivers/mtd/nand/pasemi_nand.c
@@ -22,6 +22,8 @@
 
 #undef DEBUG
 
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/mtd/mtd.h>
@@ -112,8 +114,6 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	/* Allocate memory for MTD device structure and private data */
 	chip = kzalloc(sizeof(struct nand_chip), GFP_KERNEL);
 	if (!chip) {
-		printk(KERN_WARNING
-		       "Unable to allocate PASEMI NAND MTD device structure\n");
 		err = -ENOMEM;
 		goto out;
 	}
@@ -163,13 +163,12 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	}
 
 	if (mtd_device_register(pasemi_nand_mtd, NULL, 0)) {
-		printk(KERN_ERR "pasemi_nand: Unable to register MTD device\n");
+		pr_err("Unable to register MTD device\n");
 		err = -ENODEV;
 		goto out_lpc;
 	}
 
-	printk(KERN_INFO "PA Semi NAND flash at %08llx, control at I/O %x\n",
-	       res.start, lpcctl);
+	pr_info("PA Semi NAND flash at %pR, control at I/O %x\n", &res, lpcctl);
 
 	return 0;
 
-- 
1.8.4.5
