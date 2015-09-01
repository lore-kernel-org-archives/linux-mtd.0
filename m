Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZWri9-0002tx-WE
 for linux-mtd@lists.infradead.org; Tue, 01 Sep 2015 19:59:18 +0000
Received: by pacwi10 with SMTP id wi10so5858398pac.3
 for <linux-mtd@lists.infradead.org>; Tue, 01 Sep 2015 12:58:57 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
	Marek Vasut <marex@denx.de>
Subject: [PATCH 02/10] mtd: spi-nor: make bitfield constants more consistent
Date: Tue,  1 Sep 2015 12:57:07 -0700
Message-Id: <1441137435-52862-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1441137435-52862-1-git-send-email-computersforpeace@gmail.com>
References: <1441137435-52862-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These status bits use different ways of representing similar integer
constants -- some are decimal, some are hex. Make them more consistent.

At the same time, impose my own preference, since IMO it's clearer what
these are when using the BIT() macro.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 include/linux/mtd/spi-nor.h | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 91e165fa3918..321a055bc266 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -63,24 +63,24 @@
 #define SPINOR_OP_WD_EVCR      0x61    /* Write EVCR register */
 
 /* Status Register bits. */
-#define SR_WIP			1	/* Write in progress */
-#define SR_WEL			2	/* Write enable latch */
+#define SR_WIP			BIT(0)	/* Write in progress */
+#define SR_WEL			BIT(1)	/* Write enable latch */
 /* meaning of other SR_* bits may differ between vendors */
-#define SR_BP0			4	/* Block protect 0 */
-#define SR_BP1			8	/* Block protect 1 */
-#define SR_BP2			0x10	/* Block protect 2 */
-#define SR_SRWD			0x80	/* SR write protect */
+#define SR_BP0			BIT(2)	/* Block protect 0 */
+#define SR_BP1			BIT(3)	/* Block protect 1 */
+#define SR_BP2			BIT(4)	/* Block protect 2 */
+#define SR_SRWD			BIT(7)	/* SR write protect */
 
-#define SR_QUAD_EN_MX		0x40	/* Macronix Quad I/O */
+#define SR_QUAD_EN_MX		BIT(6)	/* Macronix Quad I/O */
 
 /* Enhanced Volatile Configuration Register bits */
-#define EVCR_QUAD_EN_MICRON    0x80    /* Micron Quad I/O */
+#define EVCR_QUAD_EN_MICRON	BIT(7)	/* Micron Quad I/O */
 
 /* Flag Status Register bits */
-#define FSR_READY		0x80
+#define FSR_READY		BIT(7)
 
 /* Configuration Register bits. */
-#define CR_QUAD_EN_SPAN		0x2	/* Spansion Quad I/O */
+#define CR_QUAD_EN_SPAN		BIT(1)	/* Spansion Quad I/O */
 
 enum read_mode {
 	SPI_NOR_NORMAL = 0,
-- 
2.5.0.457.gab17608
