Received: from mail-wi0-x230.google.com ([2a00:1450:400c:c05::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UiQPj-0003RH-1r
 for linux-mtd@lists.infradead.org; Fri, 31 May 2013 14:34:43 +0000
Received: by mail-wi0-f176.google.com with SMTP id hr14so755769wib.9
 for <linux-mtd@lists.infradead.org>; Fri, 31 May 2013 07:34:21 -0700 (PDT)
From: Richard Genoud <richard.genoud@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] MTD: atmel_nand: using a stronger ECC is not dangerous
Date: Fri, 31 May 2013 16:34:10 +0200
Message-Id: <1370010850-20860-1-git-send-email-richard.genoud@gmail.com>
Cc: Richard Genoud <richard.genoud@gmail.com>, Josh Wu <josh.wu@atmel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We don't have to issue a warning when a stronger error correting
capability is chosen.

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 drivers/mtd/nand/atmel_nand.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 2d23d29..2415cdc 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -1002,7 +1002,7 @@ static int __init atmel_pmecc_nand_init_params(struct platform_device *pdev,
 		return err_no;
 	}
 
-	if (cap != host->pmecc_corr_cap ||
+	if (cap > host->pmecc_corr_cap ||
 			sector_size != host->pmecc_sector_size)
 		dev_info(host->dev, "WARNING: Be Caution! Using different PMECC parameters from Nand ONFI ECC reqirement.\n");
 
-- 
1.7.10.4
