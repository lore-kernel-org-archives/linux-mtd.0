Received: from mail-wg0-f45.google.com ([74.125.82.45])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSMcG-0002Ew-8f
 for linux-mtd@lists.infradead.org; Tue, 25 Mar 2014 08:21:52 +0000
Received: by mail-wg0-f45.google.com with SMTP id l18so80376wgh.16
 for <linux-mtd@lists.infradead.org>; Tue, 25 Mar 2014 01:21:26 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC 36/47] mtd: nand: stm_nand_bch: parse partitions and register an
 MTD device
Date: Tue, 25 Mar 2014 08:19:53 +0000
Message-Id: <1395735604-26706-37-git-send-email-lee.jones@linaro.org>
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

Issue the core parse partitions and register as MTD device call.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/nand/stm_nand_bch.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/stm_nand_bch.c b/drivers/mtd/nand/stm_nand_bch.c
index abbb4d9..a0f0ae2 100644
--- a/drivers/mtd/nand/stm_nand_bch.c
+++ b/drivers/mtd/nand/stm_nand_bch.c
@@ -1738,6 +1738,7 @@ static void *stm_bch_dt_get_pdata(struct platform_device *pdev)
 
 static int stm_nand_bch_probe(struct platform_device *pdev)
 {
+	const char *part_probes[] = { "cmdlinepart", "ofpart", NULL, };
 	struct stm_plat_nand_bch_data *pdata = pdev->dev.platform_data;
 	struct device_node *np = pdev->dev.of_node;
 	struct mtd_part_parser_data ppdata;
@@ -1873,7 +1874,9 @@ static int stm_nand_bch_probe(struct platform_device *pdev)
 
 	nandi_dump_bad_blocks(nandi);
 
-	return 0;
+	/* Add partitions */
+	return mtd_device_parse_register(mtd, part_probes, &ppdata,
+					bank->partitions, bank->nr_partitions);
 }
 
 static int stm_nand_bch_remove(struct platform_device *pdev)
-- 
1.8.3.2
