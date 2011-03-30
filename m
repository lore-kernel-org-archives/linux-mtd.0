From: Hong Xu <hong.xu@atmel.com>
To: linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org
Subject: [PATCH 3/3] MTD/atmel_nand: Fix support for CPUs that do not support
	DMA access
Date: Wed, 30 Mar 2011 16:26:41 +0800
Message-Id: <1301473601-29570-3-git-send-email-hong.xu@atmel.com>
In-Reply-To: <1301473601-29570-1-git-send-email-hong.xu@atmel.com>
References: <1301473601-29570-1-git-send-email-hong.xu@atmel.com>
Cc: Hong Xu <hong.xu@atmel.com>, nicolas.ferre@atmel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

use_dma was always "1" even if the CPU does not support DMA

Tested on AT91SAM9261EK by Jean-Christophe PLAGNIOL-VILLARD

Reported-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Signed-off-by: Hong Xu <hong.xu@atmel.com>
---
 drivers/mtd/nand/atmel_nand.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index c36ea50..1b43654 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -599,7 +599,10 @@ static int __init atmel_nand_probe(struct platform_device *pdev)
 		nand_chip->options |= NAND_USE_FLASH_BBT;
 	}
 
-	if (cpu_has_dma() && use_dma) {
+	if (!cpu_has_dma())
+		use_dma = 0;
+
+	if (use_dma) {
 		dma_cap_mask_t mask;
 
 		dma_cap_zero(mask);
-- 
1.7.3.3
