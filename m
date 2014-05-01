Received: from mail-we0-f178.google.com ([74.125.82.178])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WfnlR-0003We-KZ
 for linux-mtd@lists.infradead.org; Thu, 01 May 2014 09:58:50 +0000
Received: by mail-we0-f178.google.com with SMTP id u56so2028002wes.9
 for <linux-mtd@lists.infradead.org>; Thu, 01 May 2014 02:58:25 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 39/47] mtd: nand: stm_nand_bch: parse partitions and register
 an MTD device
Date: Thu,  1 May 2014 10:56:46 +0100
Message-Id: <1398938214-17847-40-git-send-email-lee.jones@linaro.org>
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

Issue the core parse partitions and register as MTD device call.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/nand/stm_nand_bch.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/stm_nand_bch.c b/drivers/mtd/nand/stm_nand_bch.c
index 6aaa118..0f96f75 100644
--- a/drivers/mtd/nand/stm_nand_bch.c
+++ b/drivers/mtd/nand/stm_nand_bch.c
@@ -1924,6 +1924,7 @@ static void *stm_bch_dt_get_pdata(struct platform_device *pdev)
 
 static int stm_nand_bch_probe(struct platform_device *pdev)
 {
+	const char *part_probes[] = { "cmdlinepart", "ofpart", NULL, };
 	struct stm_plat_nand_bch_data *pdata = pdev->dev.platform_data;
 	struct device_node *np = pdev->dev.of_node;
 	struct mtd_part_parser_data ppdata;
@@ -2045,7 +2046,9 @@ static int stm_nand_bch_probe(struct platform_device *pdev)
 
 	nandi_dump_bad_blocks(nandi);
 
-	return 0;
+	/* Add partitions */
+	return mtd_device_parse_register(mtd, part_probes, &ppdata,
+					bank->partitions, bank->nr_partitions);
 }
 
 static int stm_nand_bch_remove(struct platform_device *pdev)
-- 
1.8.3.2
