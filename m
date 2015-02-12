From: Antoine Tenart <antoine.tenart@free-electrons.com>
To: sebastian.hesselbarth@gmail.com, ezequiel.garcia@free-electrons.com,
 dwmw2@infradead.org, computersforpeace@gmail.com
Subject: [PATCH v2 05/10] mtd: pxa3xx_nand: add a default chunk size
Date: Thu, 12 Feb 2015 15:53:31 +0100
Message-Id: <1423752816-26219-6-git-send-email-antoine.tenart@free-electrons.com>
In-Reply-To: <1423752816-26219-1-git-send-email-antoine.tenart@free-electrons.com>
References: <1423752816-26219-1-git-send-email-antoine.tenart@free-electrons.com>
Cc: thomas.petazzoni@free-electrons.com, boris.brezillon@free-electrons.com,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 linux-kernel@vger.kernel.org, zmxu@marvell.com, linux-mtd@lists.infradead.org,
 jszhang@marvell.com, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add a default chunk size of 512 in the pxa3xx nand driver.

Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 64628bff3fa5..8ed045195d31 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1430,6 +1430,9 @@ static int pxa3xx_nand_scan(struct mtd_info *mtd)
 	if (pdata->keep_config && !pxa3xx_nand_detect_config(info))
 		goto KEEP_CONFIG;
 
+	/* Set a default chunk size */
+	info->chunk_size = 512;
+
 	ret = pxa3xx_nand_sensing(info);
 	if (ret) {
 		dev_info(&info->pdev->dev, "There is no chip on cs %d!\n",
-- 
2.3.0
