Received: from mail-pd0-x22e.google.com ([2607:f8b0:400e:c02::22e])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YvDzf-0005Nr-HE
 for linux-mtd@lists.infradead.org; Thu, 21 May 2015 00:05:49 +0000
Received: by pdea3 with SMTP id a3so86950371pde.2
 for <linux-mtd@lists.infradead.org>; Wed, 20 May 2015 17:05:24 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 3/3] mtd: brcmnand: remove unnecessary fields from brcmnand_soc
Date: Wed, 20 May 2015 17:05:06 -0700
Message-Id: <1432166706-4320-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1432166706-4320-1-git-send-email-computersforpeace@gmail.com>
References: <1432166706-4320-1-git-send-email-computersforpeace@gmail.com>
Cc: Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, Hauke Mehrtens <hauke@hauke-m.de>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These really aren't needed, especially now that we embed the soc struct
in our private struct, so we can stash things there if needed.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/brcmnand/brcmnand.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/nand/brcmnand/brcmnand.h b/drivers/mtd/nand/brcmnand/brcmnand.h
index a20c73630b7b..09a9043637b5 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.h
+++ b/drivers/mtd/nand/brcmnand/brcmnand.h
@@ -21,8 +21,6 @@ struct platform_device;
 struct dev_pm_ops;
 
 struct brcmnand_soc {
-	struct platform_device *pdev;
-	void *priv;
 	bool (*ctlrdy_ack)(struct brcmnand_soc *soc);
 	void (*ctlrdy_set_enabled)(struct brcmnand_soc *soc, bool en);
 	void (*prepare_data_bus)(struct brcmnand_soc *soc, bool prepare);
-- 
1.9.1
