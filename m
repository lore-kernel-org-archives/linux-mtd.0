Received: from gerard.telenet-ops.be ([195.130.132.48])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UaY1v-0003mE-PK
 for linux-mtd@lists.infradead.org; Thu, 09 May 2013 21:05:39 +0000
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 06/12] mtd: MTD_NAND_DENALI should depend on HAS_DMA
Date: Thu,  9 May 2013 23:04:48 +0200
Message-Id: <1368133494-22198-6-git-send-email-geert@linux-m68k.org>
In-Reply-To: <1368133494-22198-1-git-send-email-geert@linux-m68k.org>
References: <1368133494-22198-1-git-send-email-geert@linux-m68k.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If NO_DMA=y:

drivers/built-in.o: In function `denali_remove':
drivers/mtd/nand/denali.c:1605: undefined reference to `dma_unmap_single'
drivers/built-in.o: In function `denali_read_page_raw':
drivers/mtd/nand/denali.c:1190: undefined reference to `dma_sync_single_for_cpu'
drivers/built-in.o: In function `denali_read_page':
drivers/mtd/nand/denali.c:1140: undefined reference to `dma_sync_single_for_cpu'
drivers/built-in.o: In function `write_page':
drivers/mtd/nand/denali.c:1051: undefined reference to `dma_sync_single_for_cpu'
drivers/built-in.o: In function `denali_init':
drivers/mtd/nand/denali.c:1433: undefined reference to `dma_set_mask'
drivers/mtd/nand/denali.c:1438: undefined reference to `dma_map_single'
drivers/mtd/nand/denali.c:1442: undefined reference to `dma_mapping_error'

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/nand/Kconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 81bf5e5..ac06f79 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -51,6 +51,7 @@ config MTD_NAND_MUSEUM_IDS
 
 config MTD_NAND_DENALI
         tristate "Support Denali NAND controller"
+	depends on HAS_DMA
         help
 	  Enable support for the Denali NAND controller.  This should be
 	  combined with either the PCI or platform drivers to provide device
-- 
1.7.0.4
