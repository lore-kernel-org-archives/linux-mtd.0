Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VgqjF-0007fm-T6
 for linux-mtd@lists.infradead.org; Thu, 14 Nov 2013 06:48:39 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH 2/8] mtd: gpmi: delete the gpmi_pre_bbt_scan
Date: Thu, 14 Nov 2013 14:25:45 +0800
Message-ID: <1384410351-2169-3-git-send-email-b32955@freescale.com>
In-Reply-To: <1384410351-2169-1-git-send-email-b32955@freescale.com>
References: <1384410351-2169-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We do not scan the BBT after we call the gpmi_pre_bbt_scan,
so it has lost the meaning of existence.

This patch merges this function into gpmi_init_last, and delete it.
This patch does not change any logic.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |   20 +++++---------------
 1 files changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 739f131..9bce04b 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -1562,19 +1562,6 @@ static int gpmi_set_geometry(struct gpmi_nand_data *this)
 	return gpmi_alloc_dma_buffer(this);
 }
 
-static int gpmi_pre_bbt_scan(struct gpmi_nand_data  *this)
-{
-	/* Set up swap_block_mark, must be set before the gpmi_set_geometry() */
-	if (GPMI_IS_MX23(this))
-		this->swap_block_mark = false;
-	else
-		this->swap_block_mark = true;
-
-	/* Set up the medium geometry */
-	return gpmi_set_geometry(this);
-
-}
-
 static void gpmi_nfc_exit(struct gpmi_nand_data *this)
 {
 	nand_release(&this->mtd);
@@ -1589,8 +1576,11 @@ static int gpmi_init_last(struct gpmi_nand_data *this)
 	struct bch_geometry *bch_geo = &this->bch_geometry;
 	int ret;
 
-	/* Prepare for the BBT scan. */
-	ret = gpmi_pre_bbt_scan(this);
+	/* Set up swap_block_mark, must be set before the gpmi_set_geometry() */
+	this->swap_block_mark = !GPMI_IS_MX23(this);
+
+	/* Set up the medium geometry */
+	ret = gpmi_set_geometry(this);
 	if (ret)
 		return ret;
 
-- 
1.7.2.rc3
