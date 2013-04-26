Received: from smtp18.mail.ru ([94.100.176.155])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UVnq6-0002pA-51
 for linux-mtd@lists.infradead.org; Fri, 26 Apr 2013 18:57:48 +0000
From: Alexander Shiyan <shc_work@mail.ru>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 5/7] mtd: nand-gpio: Unneeded dependency on ARM removed
Date: Fri, 26 Apr 2013 22:57:26 +0400
Message-Id: <1367002648-8269-5-git-send-email-shc_work@mail.ru>
In-Reply-To: <1367002648-8269-1-git-send-email-shc_work@mail.ru>
References: <1367002648-8269-1-git-send-email-shc_work@mail.ru>
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
index a60f6c1..3ae9105 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -75,7 +75,7 @@ config MTD_NAND_DENALI_SCRATCH_REG_ADDR
 
 config MTD_NAND_GPIO
 	tristate "GPIO NAND Flash driver"
-	depends on GPIOLIB && ARM
+	depends on GPIOLIB
 	help
 	  This enables a GPIO based NAND flash driver.
 
-- 
1.8.1.5
