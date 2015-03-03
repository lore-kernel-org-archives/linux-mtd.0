From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] mtd: nand: pxa3xx: Switch FIFO draining to jiffies-based
 timeout
Date: Tue,  3 Mar 2015 10:55:29 +0100
Message-Id: <1425376529-1860-1-git-send-email-maxime.ripard@free-electrons.com>
Cc: Boris Brezillon <boris@free-electrons.com>, linux-mtd@lists.infradead.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Now that the driver handles the FIFO draining in a threaded interrupt, we can
base our timeout on jiffies and sleeping, instead of using mdelay.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 3f09f2e9aeb4..1eb957c347cd 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -496,16 +496,15 @@ static void drain_fifo(struct pxa3xx_nand_info *info, void *data, int len)
 		while (len > 8) {
 			__raw_readsl(info->mmio_base + NDDB, data, 8);
 
-			for (timeout = 0;
-			     !(nand_readl(info, NDSR) & NDSR_RDDREQ);
-			     timeout++) {
-				if (timeout >= 5) {
+			timeout = jiffies + msecs_to_jiffies(5);
+			while (!(nand_readl(info, NDSR) & NDSR_RDDREQ)) {
+				if (!time_before(jiffies, timeout)) {
 					dev_err(&info->pdev->dev,
 						"Timeout on RDDREQ while draining the FIFO\n");
 					return;
 				}
 
-				mdelay(1);
+				msleep(1);
 			}
 
 			data += 32;
-- 
2.3.0
