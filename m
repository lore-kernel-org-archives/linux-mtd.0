Received: from mail-pb0-f54.google.com ([209.85.160.54])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VTU7w-0000zU-Jx
 for linux-mtd@lists.infradead.org; Tue, 08 Oct 2013 10:02:54 +0000
Received: by mail-pb0-f54.google.com with SMTP id ro12so8378067pbb.13
 for <linux-mtd@lists.infradead.org>; Tue, 08 Oct 2013 03:02:31 -0700 (PDT)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] mtd: socrates_nand: Use devm_kzalloc
Date: Tue,  8 Oct 2013 15:31:46 +0530
Message-Id: <1381226506-23030-2-git-send-email-sachin.kamat@linaro.org>
In-Reply-To: <1381226506-23030-1-git-send-email-sachin.kamat@linaro.org>
References: <1381226506-23030-1-git-send-email-sachin.kamat@linaro.org>
Cc: sachin.kamat@linaro.org, artem.bityutskiy@linux.intel.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

devm_kzalloc is device managed and makes code simpler.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/mtd/nand/socrates_nand.c |   10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/socrates_nand.c b/drivers/mtd/nand/socrates_nand.c
index f44c7c8..e77da7e 100644
--- a/drivers/mtd/nand/socrates_nand.c
+++ b/drivers/mtd/nand/socrates_nand.c
@@ -149,17 +149,13 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 	struct mtd_part_parser_data ppdata;
 
 	/* Allocate memory for the device structure (and zero it) */
-	host = kzalloc(sizeof(struct socrates_nand_host), GFP_KERNEL);
-	if (!host) {
-		printk(KERN_ERR
-		       "socrates_nand: failed to allocate device structure.\n");
+	host = devm_kzalloc(&ofdev->dev, sizeof(*host), GFP_KERNEL);
+	if (!host)
 		return -ENOMEM;
-	}
 
 	host->io_base = of_iomap(ofdev->dev.of_node, 0);
 	if (host->io_base == NULL) {
 		printk(KERN_ERR "socrates_nand: ioremap failed\n");
-		kfree(host);
 		return -EIO;
 	}
 
@@ -212,7 +208,6 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 
 out:
 	iounmap(host->io_base);
-	kfree(host);
 	return res;
 }
 
@@ -227,7 +222,6 @@ static int socrates_nand_remove(struct platform_device *ofdev)
 	nand_release(mtd);
 
 	iounmap(host->io_base);
-	kfree(host);
 
 	return 0;
 }
-- 
1.7.9.5
