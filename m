Received: from atl4mhob13.myregisteredsite.com ([209.17.115.51])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z9tY2-0000Xt-A6
 for linux-mtd@lists.infradead.org; Tue, 30 Jun 2015 11:17:55 +0000
Received: from mailpod.hostingplatform.com ([10.30.71.204])
 by atl4mhob13.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
 t5UBHTHB006674
 for <linux-mtd@lists.infradead.org>; Tue, 30 Jun 2015 07:17:29 -0400
From: Mike Looijmans <mike.looijmans@topic.nl>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: spi-nor: Only set Micron quad-read mode when controller
 in 4-lane TX mode
Date: Tue, 30 Jun 2015 13:17:22 +0200
Message-Id: <1435663042-25425-1-git-send-email-mike.looijmans@topic.nl>
Cc: Mike Looijmans <mike.looijmans@topic.nl>, linux-kernel@vger.kernel.org,
 git@xilinx.com, computersforpeace@gmail.com, dwmw2@infradead.org,
 beanhuo@micron.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Micron QUAD mode expects command, address and data on 4 lanes instead of just
one for command (extended SPI mode). This requires the controller to be in a
special mode, so check first if the controller could be in that mode. If a
controller does not have the SPI_TX_QUAD mode set, this setting has no chance
of being valid at all, so don't try to enable it then, and just keep using
the extended SPI mode.

Tested on a Zynq 7000 with a n25q256a flash chip, this failed to function
because of the introduction of:
"driver:mtd:spi-nor: Add quad I/O support for Micron spi nor"
This commit sets QUAD mode for most Micron chips without asking the controller
whether it's possible to do so, and without telling the controller that a
different mode is required, so it couldn't work.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 drivers/mtd/spi-nor/spi-nor.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index e8f6131..10ba94f 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1398,6 +1398,8 @@ static int set_quad_mode(struct spi_nor *nor, struct flash_info *info)
 		}
 		return status;
 	case CFI_MFR_ST:
+		if (!(nor->spi->mode & SPI_TX_QUAD))
+			return 0;
 		status = micron_quad_enable(nor);
 		if (status) {
 			dev_err(nor->dev, "Micron quad-read not enabled\n");
-- 
1.9.1
