Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bQM0m-0000GF-JT
 for linux-mtd@lists.infradead.org; Thu, 21 Jul 2016 22:00:09 +0000
Received: by mail-pf0-x241.google.com with SMTP id g202so6100876pfb.1
 for <linux-mtd@lists.infradead.org>; Thu, 21 Jul 2016 14:59:48 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-kernel@vger.kernel.org
Subject: [PATCH] Kconfig: nand: Remove redundant dependency on MTD_NAND
Date: Thu, 21 Jul 2016 14:59:19 -0700
Message-Id: <1469138361-14173-2-git-send-email-andrew.smirnov@gmail.com>
In-Reply-To: <1469138361-14173-1-git-send-email-andrew.smirnov@gmail.com>
References: <1469138361-14173-1-git-send-email-andrew.smirnov@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Config MTD_NAND_FSL_IFC is already located inside 'if MTD_NAND'
statment, so there's no need to explicitly specify it as a dependency.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 drivers/mtd/nand/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index e528747..756f39e 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -436,7 +436,7 @@ config MTD_NAND_FSL_ELBC
 
 config MTD_NAND_FSL_IFC
 	tristate "NAND support for Freescale IFC controller"
-	depends on MTD_NAND && FSL_SOC
+	depends on FSL_SOC
 	select FSL_IFC
 	select MEMORY
 	help
-- 
2.5.5
