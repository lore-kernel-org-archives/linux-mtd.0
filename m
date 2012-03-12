From: Huang Shijie <b32955@freescale.com>
To: <artem.bityutskiy@intel.com>
Subject: [PATCH] mtd/gpmi : fix the wrong DMA command.
Date: Mon, 12 Mar 2012 10:22:18 +0800
Message-ID: <1331518938-24047-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 w.sang@pengutronix.de, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The last DMA command of ECC read page is used to disable the BCH module.
But the original code missed to set the pio[2] which is used to set the
GPMI_HW_GPMI_ECCCTRL register. fix it now.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-lib.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
index 5e3c505..c34dab1 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
@@ -1061,8 +1061,9 @@ int gpmi_read_page(struct gpmi_nand_data *this,
 		| BF_GPMI_CTRL0_ADDRESS(address)
 		| BF_GPMI_CTRL0_XFER_COUNT(geo->page_size);
 	pio[1] = 0;
+	pio[2] = 0; /* clear GPMI_HW_GPMI_ECCCTRL, disable the BCH. */
 	desc = channel->device->device_prep_slave_sg(channel,
-				(struct scatterlist *)pio, 2,
+				(struct scatterlist *)pio, 3,
 				DMA_TRANS_NONE,
 				DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
 	if (!desc) {
-- 
1.7.3.2
