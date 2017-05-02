Received: from mail-qt0-x236.google.com ([2607:f8b0:400d:c0d::236])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d5bwQ-0005PP-Kz
 for linux-mtd@lists.infradead.org; Tue, 02 May 2017 17:50:28 +0000
Received: by mail-qt0-x236.google.com with SMTP id m36so118473946qtb.0
 for <linux-mtd@lists.infradead.org>; Tue, 02 May 2017 10:50:05 -0700 (PDT)
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, richard@nod.at,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH 1/2] mtd: nand: Add Hisilicon machine dependency
Date: Tue,  2 May 2017 14:48:42 -0300
Message-Id: <20170502174843.6877-2-ezequiel@vanguardiasur.com.ar>
In-Reply-To: <20170502174843.6877-1-ezequiel@vanguardiasur.com.ar>
References: <20170502174843.6877-1-ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The Hisilicon NAND driver is only needed for a specific
platform, so avoid cluttering the configuration.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 drivers/mtd/nand/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index c3029528063b..04f4a556bc93 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -542,6 +542,7 @@ config MTD_NAND_SUNXI
 
 config MTD_NAND_HISI504
 	tristate "Support for NAND controller on Hisilicon SoC Hip04"
+	depends on ARCH_HISI
 	depends on HAS_DMA
 	help
 	  Enables support for NAND controller on Hisilicon SoC Hip04.
-- 
2.12.2
