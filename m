Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WKPoG-0001YI-MJ
 for linux-mtd@lists.infradead.org; Mon, 03 Mar 2014 10:09:22 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v5 4/4] mtd: nand: omap: remove is_elm_present flag
Date: Mon, 3 Mar 2014 15:38:33 +0530
Message-ID: <1393841313-28214-5-git-send-email-pekon@ti.com>
In-Reply-To: <1393841313-28214-1-git-send-email-pekon@ti.com>
References: <1393841313-28214-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Stefan Roese <sr@denx.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 Felipe Balbi <balbi@ti.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Pekon Gupta <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

'is_elm_present' flag is not used anywhere. This check is implicitely
taken care while selecting appropriate ecc-scheme via DT or board-file.

Signed-off-by: Pekon Gupta <pekon@ti.com>
---
 drivers/mtd/nand/omap2.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index c057a88..5ce2097 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -163,7 +163,6 @@ struct omap_nand_info {
 	int					buf_len;
 	struct gpmc_nand_regs		reg;
 	/* fields specific for BCHx_HW ECC scheme */
-	bool				is_elm_used;
 	struct device			*elm_dev;
 	struct device_node		*of_node;
 };
@@ -1547,7 +1546,6 @@ static int is_elm_present(struct omap_nand_info *info,
 			struct device_node *elm_node, enum bch_ecc bch_type)
 {
 	struct platform_device *pdev;
-	info->is_elm_used = false;
 	/* check whether elm-id is passed via DT */
 	if (!elm_node) {
 		pr_err("nand: error: ELM DT node not found\n");
@@ -1563,7 +1561,6 @@ static int is_elm_present(struct omap_nand_info *info,
 	info->elm_dev = &pdev->dev;
 	if (elm_config(info->elm_dev, bch_type))
 		return -ENODEV;
-	info->is_elm_used = true;
 	return 0;
 }
 #endif /* CONFIG_MTD_NAND_ECC_BCH */
-- 
1.8.5.1.163.gd7aced9
