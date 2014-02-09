Received: from mail.sigma-star.at ([95.130.255.111])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WCZR0-0008D2-Sm
 for linux-mtd@lists.infradead.org; Sun, 09 Feb 2014 18:48:57 +0000
From: Richard Weinberger <richard@nod.at>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org (open list:MEMORY TECHNOLOGY...),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 15/28] Remove TI_AEMIF
Date: Sun,  9 Feb 2014 19:47:53 +0100
Message-Id: <1391971686-9517-16-git-send-email-richard@nod.at>
In-Reply-To: <1391971686-9517-1-git-send-email-richard@nod.at>
References: <1391971686-9517-1-git-send-email-richard@nod.at>
Cc: Richard Weinberger <richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The symbol is an orphan, get rid of it.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 90ff447..a195d57 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -465,7 +465,7 @@ config MTD_NAND_SH_FLCTL
 
 config MTD_NAND_DAVINCI
         tristate "Support NAND on DaVinci/Keystone SoC"
-        depends on ARCH_DAVINCI || (ARCH_KEYSTONE && TI_AEMIF)
+        depends on ARCH_DAVINCI || ARCH_KEYSTONE
         help
 	  Enable the driver for NAND flash chips on Texas Instruments
 	  DaVinci/Keystone processors.
-- 
1.8.4.2
