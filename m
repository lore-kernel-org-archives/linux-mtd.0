Received: from mail-lf0-x22c.google.com ([2a00:1450:4010:c07::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aoU5J-000377-TB
 for linux-mtd@lists.infradead.org; Fri, 08 Apr 2016 10:56:18 +0000
Received: by mail-lf0-x22c.google.com with SMTP id g184so76564021lfb.3
 for <linux-mtd@lists.infradead.org>; Fri, 08 Apr 2016 03:55:56 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Wan ZongShun <mcuos.com@gmail.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] mtd: nand: nuc900: allow compiling with COMPILE_TEST
Date: Fri,  8 Apr 2016 12:55:45 +0200
Message-Id: <1460112945-9226-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This driver doesn't seem to have any compile-time arch dependencies. I
was able to compile it on CONFIG_MIPS and CONFIG_ARM.

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/mtd/nand/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index f05e0e9..382e0f4 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -511,7 +511,7 @@ config MTD_NAND_SOCRATES
 
 config MTD_NAND_NUC900
 	tristate "Support for NAND on Nuvoton NUC9xx/w90p910 evaluation boards."
-	depends on ARCH_W90X900
+	depends on ARCH_W90X900 || COMPILE_TEST
 	help
 	  This enables the driver for the NAND Flash on evaluation board based
 	  on w90p910 / NUC9xx.
-- 
1.8.4.5
