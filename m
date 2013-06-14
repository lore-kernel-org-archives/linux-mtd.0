From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH 2/4] mtd: gpmi: use DMA channel 0 for all the nand chips
Date: Fri, 14 Jun 2013 16:06:23 +0800
Message-ID: <1371197185-27491-3-git-send-email-b32955@freescale.com>
In-Reply-To: <1371197185-27491-1-git-send-email-b32955@freescale.com>
References: <1371197185-27491-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We only have one DMA channel : the channel 0.
Use DMA channel 0 to access all the nand chips.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 25ecfa1..036e5e4 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -226,9 +226,8 @@ int common_nfc_set_geometry(struct gpmi_nand_data *this)
 
 struct dma_chan *get_dma_chan(struct gpmi_nand_data *this)
 {
-	int chipnr = this->current_chip;
-
-	return this->dma_chans[chipnr];
+	/* We use the DMA channel 0 to access all the nand chips. */
+	return this->dma_chans[0];
 }
 
 /* Can we use the upper's buffer directly for DMA? */
-- 
1.7.1
