Received: from mail-qt0-x22e.google.com ([2607:f8b0:400d:c0d::22e])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d5bwS-0005dr-K5
 for linux-mtd@lists.infradead.org; Tue, 02 May 2017 17:50:30 +0000
Received: by mail-qt0-x22e.google.com with SMTP id m36so118474899qtb.0
 for <linux-mtd@lists.infradead.org>; Tue, 02 May 2017 10:50:08 -0700 (PDT)
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, richard@nod.at,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH 2/2] mtd: nand: Add Mediatek machine dependency
Date: Tue,  2 May 2017 14:48:43 -0300
Message-Id: <20170502174843.6877-3-ezequiel@vanguardiasur.com.ar>
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

The Mediatek NAND driver is only needed for a specific
platform, so avoid cluttering the configuration.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 drivers/mtd/nand/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 04f4a556bc93..67e82a64330e 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -556,6 +556,7 @@ config MTD_NAND_QCOM
 
 config MTD_NAND_MTK
 	tristate "Support for NAND controller on MTK SoCs"
+	depends on ARCH_MEDIATEK
 	depends on HAS_DMA
 	help
 	  Enables support for NAND controller on MTK SoCs.
-- 
2.12.2
