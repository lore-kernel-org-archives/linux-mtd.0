Received: from 213-225-1-219.nat.highway.a1.net ([213.225.1.219]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fuDND-0000R0-Cd
 for linux-mtd@lists.infradead.org; Mon, 27 Aug 2018 08:59:49 +0000
From: Christoph Hellwig <hch@lst.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: rawnand: qcom: don't include dma-direct.h
Date: Mon, 27 Aug 2018 10:59:43 +0200
Message-Id: <20180827085943.24324-1-hch@lst.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A recent commit removed the incorrect use of phys_to_dma from this
driver, but failed to remove the dma-direct.h include, so do that
now.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 1 -
 include/linux/dma-mapping.h       | 6 ++++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index d1d470bb32e4..d2831b0b28fb 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -23,7 +23,6 @@
 #include <linux/of_device.h>
 #include <linux/delay.h>
 #include <linux/dma/qcom_bam_dma.h>
-#include <linux/dma-direct.h> /* XXX: drivers shall never use this directly! */
 
 /* NANDc reg offsets */
 #define	NAND_FLASH_CMD			0x00
