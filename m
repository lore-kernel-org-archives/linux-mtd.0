Received: from mail-wg0-x242.google.com ([2a00:1450:400c:c00::242])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2mn5-0005Dr-Fp
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 20:40:03 +0000
Received: by wggx12 with SMTP id x12so8981015wgg.1
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2015 13:39:44 -0700 (PDT)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2 33/60] mtd: nand: fsmc_nand: show parent device in sysfs
Date: Wed, 10 Jun 2015 22:38:47 +0200
Message-Id: <1433968754-10651-34-git-send-email-fransklaver@gmail.com>
In-Reply-To: <1433968754-10651-1-git-send-email-fransklaver@gmail.com>
References: <1433968754-10651-1-git-send-email-fransklaver@gmail.com>
Cc: linux-mtd@lists.infradead.org, Frans Klaver <fransklaver@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix a bug where parent device symlinks aren't shown in sysfs.

While at it, make use of the default owner value set by mtdcore.

Signed-off-by: Frans Klaver <fransklaver@gmail.com>
---
 drivers/mtd/nand/fsmc_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index e58af4b..a6717b9 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -1017,7 +1017,7 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	mtd->priv = nand;
 	nand->priv = host;
 
-	host->mtd.owner = THIS_MODULE;
+	host->mtd.dev.parent = &pdev->dev;
 	nand->IO_ADDR_R = host->data_va;
 	nand->IO_ADDR_W = host->data_va;
 	nand->cmd_ctrl = fsmc_cmd_ctrl;
-- 
2.4.0
