Received: from mail-gx0-f11.google.com ([209.85.217.11])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LKbTE-0001Dy-4K
	for linux-mtd@lists.infradead.org; Wed, 07 Jan 2009 16:41:28 +0000
Received: by mail-gx0-f11.google.com with SMTP id 4so614104gxk.15
	for <linux-mtd@lists.infradead.org>;
	Wed, 07 Jan 2009 08:41:28 -0800 (PST)
Sender: Bryan Wu <cooloney.lkml@gmail.com>
From: Bryan Wu <cooloney@kernel.org>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] Blackfin NFC Driver: drop pointless casts with
	set_dma_callback()
Date: Thu,  8 Jan 2009 00:41:59 +0800
Message-Id: <1231346519-28603-4-git-send-email-cooloney@kernel.org>
In-Reply-To: <1231346519-28603-1-git-send-email-cooloney@kernel.org>
References: <1231346519-28603-1-git-send-email-cooloney@kernel.org>
Cc: Bryan Wu <cooloney@kernel.org>, Mike Frysinger <vapier.adi@gmail.com>
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
---
 drivers/mtd/nand/bf5xx_nand.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/bf5xx_nand.c b/drivers/mtd/nand/bf5xx_nand.c
index 520314d..4c2a67c 100644
--- a/drivers/mtd/nand/bf5xx_nand.c
+++ b/drivers/mtd/nand/bf5xx_nand.c
@@ -572,7 +572,7 @@ static int bf5xx_nand_dma_init(struct bf5xx_nand_info *info)
 	SSYNC();
 #endif
 
-	set_dma_callback(CH_NFC, (void *) bf5xx_nand_dma_irq, (void *) info);
+	set_dma_callback(CH_NFC, bf5xx_nand_dma_irq, info);
 
 	/* Turn off the DMA channel first */
 	disable_dma(CH_NFC);
-- 
1.5.6
