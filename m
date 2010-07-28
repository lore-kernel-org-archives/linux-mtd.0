MIME-Version: 1.0
Date: Wed, 28 Jul 2010 13:59:10 +0800
Message-ID: <AANLkTi=PFrFBYM34HjBpb2G9U0T22CS8EkeKCtg16RjK@mail.gmail.com>
Subject: [PATCH 29/29] pxa3xx_nand: new read oob logic only works with new
	silicon
From: Haojian Zhuang <haojian.zhuang@gmail.com>
To: Eric Miao <eric.y.miao@gmail.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	David Woodhouse <david.woodhouse@intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>, linux-mtd@lists.infradead.org,
	Lei Wen <leiwen@marvell.com>
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From 45ab26923b14a6380b4d8b69902ce3faae7f82d1 Mon Sep 17 00:00:00 2001
From: Lei Wen <leiwen@marvell.com>
Date: Tue, 13 Jul 2010 21:10:32 +0800
Subject: [PATCH 29/29] pxa3xx_nand: new read oob logic only works with
new silicon


Signed-off-by: Lei Wen <leiwen@marvell.com>
---
 drivers/mtd/nand/pxa3xx_nand.c |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index bc2f56d..068232c 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -360,6 +360,8 @@ static void pxa3xx_nand_set_timing(struct
pxa3xx_nand_info *info,
 static void pxa3xx_set_datasize(struct pxa3xx_nand_info *info)
 {
 	struct pxa3xx_nand *nand = info->nand_data;
+	struct platform_device *pdev = nand->pdev;
+	struct pxa3xx_nand_platform_data *pdata = pdev->dev.platform_data;
 	int oob_enable = info->reg_ndcr & NDCR_SPARE_EN;

 	if (info->page_size < PAGE_CHUNK_SIZE) {
@@ -388,7 +390,10 @@ static void pxa3xx_set_datasize(struct
pxa3xx_nand_info *info)
 		return;
 	}

-	if (nand->command == NAND_CMD_READOOB) {
+	if (nand->command == NAND_CMD_READOOB
+		&& pdata->controller_attrs & PXA3XX_NAKED_CMD_EN) {
+		/* This special handle read oob method can only be used
+		 * with silicon support naked command*/
 		switch (info->ecc_strength) {
 		case HAMMING_STRENGTH:
 			nand->ndcb1[3] = 2 * PAGE_CHUNK_SIZE + OOB_CHUNK_SIZE;
-- 
1.7.0.4
