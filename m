Received: from mail-qt0-x236.google.com ([2607:f8b0:400d:c0d::236])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d5dpg-0000rv-8p
 for linux-mtd@lists.infradead.org; Tue, 02 May 2017 19:51:37 +0000
Received: by mail-qt0-x236.google.com with SMTP id m36so121398095qtb.0
 for <linux-mtd@lists.infradead.org>; Tue, 02 May 2017 12:51:15 -0700 (PDT)
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, richard@nod.at,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH v2 1/2] mtd: nand: Add Hisilicon machine dependency
Date: Tue,  2 May 2017 16:49:51 -0300
Message-Id: <20170502194952.4188-2-ezequiel@vanguardiasur.com.ar>
In-Reply-To: <20170502194952.4188-1-ezequiel@vanguardiasur.com.ar>
References: <20170502194952.4188-1-ezequiel@vanguardiasur.com.ar>
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
index c3029528063b..effe767fc347 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -542,6 +542,7 @@ config MTD_NAND_SUNXI
 
 config MTD_NAND_HISI504
 	tristate "Support for NAND controller on Hisilicon SoC Hip04"
+	depends on ARCH_HISI || COMPILE_TEST
 	depends on HAS_DMA
 	help
 	  Enables support for NAND controller on Hisilicon SoC Hip04.
-- 
2.12.2
