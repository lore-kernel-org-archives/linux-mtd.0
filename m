Received: from conuserg011.nifty.com ([202.248.44.37]
 helo=conuserg011-v.nifty.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a94CE-0005Tf-WA
 for linux-mtd@lists.infradead.org; Wed, 16 Dec 2015 05:00:15 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: denali: make MTD_NAND_DENALI_DT dependent on OF
Date: Wed, 16 Dec 2015 14:00:09 +0900
Message-Id: <1450242009-24694-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The build passes even if CONFIG_OF is undefined, but it makes sense
to let it depend on OF.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 2896640..d803087 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -55,7 +55,7 @@ config MTD_NAND_DENALI_PCI
 config MTD_NAND_DENALI_DT
 	tristate "Support Denali NAND controller as a DT device"
 	select MTD_NAND_DENALI
-	depends on HAS_DMA && HAVE_CLK
+	depends on HAS_DMA && HAVE_CLK && OF
 	help
 	  Enable the driver for NAND flash on platforms using a Denali NAND
 	  controller as a DT device.
-- 
1.9.1
