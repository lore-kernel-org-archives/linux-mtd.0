Received: from mail-qk0-x231.google.com ([2607:f8b0:400d:c09::231])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d5dpj-0000ry-Be
 for linux-mtd@lists.infradead.org; Tue, 02 May 2017 19:51:42 +0000
Received: by mail-qk0-x231.google.com with SMTP id u75so126701968qka.3
 for <linux-mtd@lists.infradead.org>; Tue, 02 May 2017 12:51:17 -0700 (PDT)
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, richard@nod.at,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH v2 2/2] mtd: nand: Add Mediatek machine dependency
Date: Tue,  2 May 2017 16:49:52 -0300
Message-Id: <20170502194952.4188-3-ezequiel@vanguardiasur.com.ar>
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

The Mediatek NAND driver is only needed for a specific
platform, so avoid cluttering the configuration.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 drivers/mtd/nand/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index effe767fc347..0bd2319d3035 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -556,6 +556,7 @@ config MTD_NAND_QCOM
 
 config MTD_NAND_MTK
 	tristate "Support for NAND controller on MTK SoCs"
+	depends on ARCH_MEDIATEK || COMPILE_TEST
 	depends on HAS_DMA
 	help
 	  Enables support for NAND controller on MTK SoCs.
-- 
2.12.2
