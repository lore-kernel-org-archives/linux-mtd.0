Received: from xavier.telenet-ops.be ([195.130.132.52])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YS0IV-0007KQ-Gu
 for linux-mtd@lists.infradead.org; Sun, 01 Mar 2015 09:36:28 +0000
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Zhou Wang <wangzhou1@hisilicon.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd: nand: MTD_NAND_HISI504 should depend on HAS_DMA
Date: Sun,  1 Mar 2015 10:35:52 +0100
Message-Id: <1425202552-27125-1-git-send-email-geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If NO_DMA=y:

    drivers/built-in.o: In function `hisi_nfc_probe':
    hisi504_nand.c:(.text+0x23e646): undefined reference to `dmam_alloc_coherent'

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/mtd/nand/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 5b76a173cd95d6d5..5897d8d8fa5a962d 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -526,6 +526,7 @@ config MTD_NAND_SUNXI
 
 config MTD_NAND_HISI504
 	tristate "Support for NAND controller on Hisilicon SoC Hip04"
+	depends on HAS_DMA
 	help
 	  Enables support for NAND controller on Hisilicon SoC Hip04.
 
-- 
1.9.1
