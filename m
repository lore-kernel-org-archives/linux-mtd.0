Received: from mail-bl2nam02on0056.outbound.protection.outlook.com
 ([104.47.38.56] helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZxDXX-0006ci-98
 for linux-mtd@lists.infradead.org; Fri, 13 Nov 2015 12:33:16 +0000
From: Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
To: <dwmw2@infradead.org>, <computersforpeace@gmail.com>, <zajec5@gmail.com>,
 <shijie.huang@intel.com>, <juhosg@openwrt.org>, <marex@denx.de>,
 <mika.westerberg@linux.intel.com>, <beanhuo@micron.com>, <furquan@google.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <michals@xilinx.com>, <harinik@xilinx.com>, <punnaia@xilinx.com>,
 <anirudh@xilinx.com>, <svemula@xilinx.com>, Anurag Kumar Vulisha
 <anuragku@xilinx.com>
Subject: [PATCH] mtd: spi-nor: Add Global Block-Protection Unlock support for
 SST flash parts
Date: Fri, 13 Nov 2015 18:02:38 +0530
Message-ID: <1447417958-20896-1-git-send-email-anuragku@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds Global block protection unlock support for SST flash parts

Signed-off-by: Anurag Kumar Vulisha <anuragku@xilinx.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 8 ++++++++
 include/linux/mtd/spi-nor.h   | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 4988390..787ab95 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -68,6 +68,8 @@ struct flash_info {
 #define	SPI_NOR_DUAL_READ	0x20    /* Flash supports Dual Read */
 #define	SPI_NOR_QUAD_READ	0x40    /* Flash supports Quad Read */
 #define	USE_FSR			0x80	/* use flag status register */
+/* Unlock the Global protection for sst flashes */
+#define	SST_GLOBAL_PROT_UNLK	0x100
 };
 
 #define JEDEC_MFR(info)	((info)->id[0])
@@ -1204,6 +1206,12 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 	    JEDEC_MFR(info) == SNOR_MFR_WINBOND) {
 		write_enable(nor);
 		write_sr(nor, 0);
+
+		if (info->flags & SST_GLOBAL_PROT_UNLK) {
+			write_enable(nor);
+			/* Unlock global write protection bits */
+			nor->write_reg(nor, GLOBAL_BLKPROT_UNLK, NULL, 0);
+		}
 	}
 
 	if (!mtd->name)
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index c8723b6..37e1abf 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -65,6 +65,7 @@
 #define SPINOR_OP_BP		0x02	/* Byte program */
 #define SPINOR_OP_WRDI		0x04	/* Write disable */
 #define SPINOR_OP_AAI_WP	0xad	/* Auto address increment word program */
+#define GLOBAL_BLKPROT_UNLK	0x98	/* Clear global write protection bits */
 
 /* Used for Macronix and Winbond flashes. */
 #define SPINOR_OP_EN4B		0xb7	/* Enter 4-byte mode */
-- 
2.1.2
