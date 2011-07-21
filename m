From: jhbird.choi@samsung.com
To: linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] mtd: s3c2410 nand: Remove uncessary null check
Date: Thu, 21 Jul 2011 15:33:58 +0900
Message-Id: <1311230038-6111-1-git-send-email-jhbird.choi@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Jonghwan Choi <jhbird.choi@samsung.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Jonghwan Choi <jhbird.choi@samsung.com>

clk_get() return a pointer to the struct clk or an ERR_PTR().

Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
---
 drivers/mtd/nand/s3c2410.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index 4405468..18ff2f5 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -723,7 +723,7 @@ static int s3c24xx_nand_remove(struct platform_device *pdev)
 
 	/* free the common resources */
 
-	if (info->clk != NULL && !IS_ERR(info->clk)) {
+	if (!IS_ERR(info->clk)) {
 		s3c2410_nand_clk_set_state(info, CLOCK_DISABLE);
 		clk_put(info->clk);
 	}
-- 
1.7.0
