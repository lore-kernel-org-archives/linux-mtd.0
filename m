Received: from mail-gg0-f179.google.com ([209.85.161.179])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VdW44-0004AT-H2
 for linux-mtd@lists.infradead.org; Tue, 05 Nov 2013 02:08:21 +0000
Received: by mail-gg0-f179.google.com with SMTP id q4so2234832ggn.24
 for <linux-mtd@lists.infradead.org>; Mon, 04 Nov 2013 18:07:24 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: computersforpeace@gmail.com
Subject: [PATCH] mtd: gpmi: Use devm_kzalloc()
Date: Tue,  5 Nov 2013 00:07:05 -0200
Message-Id: <1383617225-8504-1-git-send-email-festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, b32955@freescale.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Fabio Estevam <fabio.estevam@freescale.com>

Using devm_kzalloc() can make the code simpler.

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 7ac2280..4b6d802 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -1732,7 +1732,7 @@ static int gpmi_nand_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	this = kzalloc(sizeof(*this), GFP_KERNEL);
+	this = devm_kzalloc(&pdev->dev, sizeof(*this), GFP_KERNEL);
 	if (!this) {
 		pr_err("Failed to allocate per-device memory\n");
 		return -ENOMEM;
@@ -1762,7 +1762,6 @@ exit_nfc_init:
 	release_resources(this);
 exit_acquire_resources:
 	dev_err(this->dev, "driver registration failed: %d\n", ret);
-	kfree(this);
 
 	return ret;
 }
@@ -1773,7 +1772,6 @@ static int gpmi_nand_remove(struct platform_device *pdev)
 
 	gpmi_nfc_exit(this);
 	release_resources(this);
-	kfree(this);
 	return 0;
 }
 
-- 
1.8.1.2
