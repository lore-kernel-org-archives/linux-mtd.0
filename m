From: Nicolas Ferre <nicolas.ferre@atmel.com>
To: <linux-arm-kernel@lists.infradead.org>, <linux-mtd@lists.infradead.org>,
 Josh Wu <josh.wu@atmel.com>
Subject: [PATCH] MTD: atmel_nand: POI fall back is not an issue: change log
 level
Date: Wed, 12 Feb 2014 12:26:54 +0100
Message-ID: <1392204414-20700-1-git-send-email-nicolas.ferre@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: computersforpeace@gmail.com, Nicolas Ferre <nicolas.ferre@atmel.com>,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Nicolas Ferre <nicolas.ferre@atmel.com>
---
 drivers/mtd/nand/atmel_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index c36e9b84487c..8d210f8a072d 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -430,7 +430,7 @@ err_dma:
 	dma_unmap_single(dma_dev->dev, phys_addr, len, dir);
 err_buf:
 	if (err != 0)
-		dev_warn(host->dev, "Fall back to CPU I/O\n");
+		dev_dbg(host->dev, "Fall back to CPU I/O\n");
 	return err;
 }
 
-- 
1.8.2.2
