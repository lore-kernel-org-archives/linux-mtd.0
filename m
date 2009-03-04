Received: from smtp1.linux-foundation.org ([140.211.169.13])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lexee-0008BS-Jl
	for linux-mtd@lists.infradead.org; Wed, 04 Mar 2009 20:25:27 +0000
Message-Id: <200903042001.n24K1UFh028756@imap1.linux-foundation.org>
Subject: [patch 03/15] mtd: Blackfin NFC Driver: drop pointless casts with
	set_dma_callback()
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Wed, 04 Mar 2009 12:01:30 -0800
Cc: akpm@linux-foundation.org, linux-mtd@lists.infradead.org,
	cooloney@kernel.org, vapier.adi@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Mike Frysinger <vapier.adi@gmail.com>

Signed-off-by: Mike Frysinger <vapier.adi@gmail.com>
Signed-off-by: Bryan Wu <cooloney@kernel.org>
Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/mtd/nand/bf5xx_nand.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -puN drivers/mtd/nand/bf5xx_nand.c~blackfin-nfc-driver-drop-pointless-casts-with-set_dma_callback drivers/mtd/nand/bf5xx_nand.c
--- a/drivers/mtd/nand/bf5xx_nand.c~blackfin-nfc-driver-drop-pointless-casts-with-set_dma_callback
+++ a/drivers/mtd/nand/bf5xx_nand.c
@@ -572,7 +572,7 @@ static int bf5xx_nand_dma_init(struct bf
 	SSYNC();
 #endif
 
-	set_dma_callback(CH_NFC, (void *) bf5xx_nand_dma_irq, (void *) info);
+	set_dma_callback(CH_NFC, bf5xx_nand_dma_irq, info);
 
 	/* Turn off the DMA channel first */
 	disable_dma(CH_NFC);
_
