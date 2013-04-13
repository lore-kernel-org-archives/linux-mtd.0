Received: from smtp37.i.mail.ru ([94.100.177.97])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UQuY8-0000oz-00
 for linux-mtd@lists.infradead.org; Sat, 13 Apr 2013 07:07:01 +0000
From: Alexander Shiyan <shc_work@mail.ru>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/5] mtd: nand-gpio: Unneeded dependency on ARM removed
Date: Sat, 13 Apr 2013 11:06:34 +0400
Message-Id: <1365836798-29035-1-git-send-email-shc_work@mail.ru>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Alexander Shiyan <shc_work@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 drivers/mtd/nand/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 1cca712..5d1856d 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -75,7 +75,7 @@ config MTD_NAND_DENALI_SCRATCH_REG_ADDR
 
 config MTD_NAND_GPIO
 	tristate "GPIO NAND Flash driver"
-	depends on GENERIC_GPIO && ARM
+	depends on GENERIC_GPIO
 	help
 	  This enables a GPIO based NAND flash driver.
 
-- 
1.8.1.5
