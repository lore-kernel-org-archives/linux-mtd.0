Received: from mail-wg0-x230.google.com ([2a00:1450:400c:c00::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V4Bge-000234-0o
 for linux-mtd@lists.infradead.org; Tue, 30 Jul 2013 15:18:08 +0000
Received: by mail-wg0-f48.google.com with SMTP id f12so5537047wgh.27
 for <linux-mtd@lists.infradead.org>; Tue, 30 Jul 2013 08:17:44 -0700 (PDT)
From: Richard Genoud <richard.genoud@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Subject: [PATCH resend] MTD: atmel_nand: using a stronger ECC is not dangerous
Date: Tue, 30 Jul 2013 17:17:29 +0200
Message-Id: <1375197449-32370-1-git-send-email-richard.genoud@gmail.com>
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
Acked-by: Josh Wu <josh.wu@atmel.com>
---
It seems that this patch has been forgotten (even by me)
for some months. (was already acked by Josh then)
Reference of the discussion leading to this patch:
http://comments.gmane.org/gmane.linux.drivers.mtd/46342

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
