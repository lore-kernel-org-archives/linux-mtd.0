Received: from mail-wi0-f170.google.com ([209.85.212.170])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSMbc-00025h-TY
 for linux-mtd@lists.infradead.org; Tue, 25 Mar 2014 08:21:09 +0000
Received: by mail-wi0-f170.google.com with SMTP id bs8so3173440wib.3
 for <linux-mtd@lists.infradead.org>; Tue, 25 Mar 2014 01:20:46 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC 15/47] mtd: nand: stm_nand_bch: add compatible page size check
Date: Tue, 25 Mar 2014 08:19:32 +0000
Message-Id: <1395735604-26706-16-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1395735604-26706-1-git-send-email-lee.jones@linaro.org>
References: <1395735604-26706-1-git-send-email-lee.jones@linaro.org>
Cc: angus.clark@st.com, kernel@stlinux.com, lee.jones@linaro.org,
 linux-mtd@lists.infradead.org, pekon@ti.com, computersforpeace@gmail.com,
 dwmw2@infradead.org
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
index fbcd1b9..93fe835 100644
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
@@ -774,6 +777,12 @@ static int stm_nand_bch_probe(struct platform_device *pdev)
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
