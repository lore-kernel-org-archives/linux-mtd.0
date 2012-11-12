Received: from mail-ee0-f49.google.com ([74.125.83.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TXsjn-00055k-LZ
 for linux-mtd@lists.infradead.org; Mon, 12 Nov 2012 12:03:36 +0000
Received: by mail-ee0-f49.google.com with SMTP id c1so3339724eek.36
 for <linux-mtd@lists.infradead.org>; Mon, 12 Nov 2012 04:03:34 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH V2 1/6] bcma: export PLL reading function
Date: Mon, 12 Nov 2012 13:03:20 +0100
Message-Id: <1352721805-14064-2-git-send-email-zajec5@gmail.com>
In-Reply-To: <1352721805-14064-1-git-send-email-zajec5@gmail.com>
References: <1352721805-14064-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is required by NAND flash driver for initializing wait counters.

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/bcma/driver_chipcommon_pmu.c |    3 ++-
 include/linux/bcma/bcma.h            |    1 +
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/bcma/driver_chipcommon_pmu.c b/drivers/bcma/driver_chipcommon_pmu.c
index 201faf1..657f235 100644
--- a/drivers/bcma/driver_chipcommon_pmu.c
+++ b/drivers/bcma/driver_chipcommon_pmu.c
@@ -13,12 +13,13 @@
 #include <linux/export.h>
 #include <linux/bcma/bcma.h>
 
-static u32 bcma_chipco_pll_read(struct bcma_drv_cc *cc, u32 offset)
+u32 bcma_chipco_pll_read(struct bcma_drv_cc *cc, u32 offset)
 {
 	bcma_cc_write32(cc, BCMA_CC_PLLCTL_ADDR, offset);
 	bcma_cc_read32(cc, BCMA_CC_PLLCTL_ADDR);
 	return bcma_cc_read32(cc, BCMA_CC_PLLCTL_DATA);
 }
+EXPORT_SYMBOL_GPL(bcma_chipco_pll_read);
 
 void bcma_chipco_pll_write(struct bcma_drv_cc *cc, u32 offset, u32 value)
 {
diff --git a/include/linux/bcma/bcma.h b/include/linux/bcma/bcma.h
index 4180eb7..4fb6bd7 100644
--- a/include/linux/bcma/bcma.h
+++ b/include/linux/bcma/bcma.h
@@ -345,6 +345,7 @@ extern void bcma_core_set_clockmode(struct bcma_device *core,
 				    enum bcma_clkmode clkmode);
 extern void bcma_core_pll_ctl(struct bcma_device *core, u32 req, u32 status,
 			      bool on);
+extern u32 bcma_chipco_pll_read(struct bcma_drv_cc *cc, u32 offset);
 #define BCMA_DMA_TRANSLATION_MASK	0xC0000000
 #define  BCMA_DMA_TRANSLATION_NONE	0x00000000
 #define  BCMA_DMA_TRANSLATION_DMA32_CMT	0x40000000 /* Client Mode Translation for 32-bit DMA */
-- 
1.7.7
