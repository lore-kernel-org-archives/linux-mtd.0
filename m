Received: from mail-pd0-f180.google.com ([209.85.192.180])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VTUDt-0001Gl-UJ
 for linux-mtd@lists.infradead.org; Tue, 08 Oct 2013 10:09:03 +0000
Received: by mail-pd0-f180.google.com with SMTP id y10so8538278pdj.11
 for <linux-mtd@lists.infradead.org>; Tue, 08 Oct 2013 03:08:39 -0700 (PDT)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/1] mtd: socrates_nand: Use dev_err instead of printk
Date: Tue,  8 Oct 2013 15:38:08 +0530
Message-Id: <1381226888-23901-1-git-send-email-sachin.kamat@linaro.org>
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

dev_err is preferred to printk.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/mtd/nand/socrates_nand.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/socrates_nand.c b/drivers/mtd/nand/socrates_nand.c
index e77da7e..9a9fa49 100644
--- a/drivers/mtd/nand/socrates_nand.c
+++ b/drivers/mtd/nand/socrates_nand.c
@@ -155,7 +155,7 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 
 	host->io_base = of_iomap(ofdev->dev.of_node, 0);
 	if (host->io_base == NULL) {
-		printk(KERN_ERR "socrates_nand: ioremap failed\n");
+		dev_err(&ofdev->dev, "ioremap failed\n");
 		return -EIO;
 	}
 
-- 
1.7.9.5
