Received: from mail-we0-f172.google.com ([74.125.82.172])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wfnkf-0002j8-SA
 for linux-mtd@lists.infradead.org; Thu, 01 May 2014 09:58:02 +0000
Received: by mail-we0-f172.google.com with SMTP id u57so2913174wes.31
 for <linux-mtd@lists.infradead.org>; Thu, 01 May 2014 02:57:39 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 16/47] mtd: nand: stm_nand_bch: add compatible page size check
Date: Thu,  1 May 2014 10:56:23 +0100
Message-Id: <1398938214-17847-17-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1398938214-17847-1-git-send-email-lee.jones@linaro.org>
References: <1398938214-17847-1-git-send-email-lee.jones@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, kernel@stlinux.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/nand/stm_nand_bch.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mtd/nand/stm_nand_bch.c b/drivers/mtd/nand/stm_nand_bch.c
index fdb06517..a1c25d0 100644
--- a/drivers/mtd/nand/stm_nand_bch.c
+++ b/drivers/mtd/nand/stm_nand_bch.c
@@ -29,6 +29,9 @@
 #include "stm_nand_regs.h"
 #include "stm_nand_dt.h"
 
+/* NANDi BCH Controller properties */
+#define NANDI_BCH_SECTOR_SIZE			1024
+
 /* Bad Block Table (BBT) */
 struct nandi_bbt_info {
 	uint32_t	bbt_size;		/* Size of bad-block table */
@@ -921,6 +924,12 @@ static int stm_nand_bch_probe(struct platform_device *pdev)
 		dev_warn(&pdev->dev, "No timing data available\n");
 	}
 
+	if (mtd->writesize < NANDI_BCH_SECTOR_SIZE) {
+		dev_err(nandi->dev,
+			"page size incompatible with BCH ECC sector\n");
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
-- 
1.8.3.2
