Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPP9o-0005tv-5o
 for linux-mtd@lists.infradead.org; Tue, 19 Jul 2016 07:09:34 +0000
Received: by mail-lf0-x241.google.com with SMTP id l89so520879lfi.2
 for <linux-mtd@lists.infradead.org>; Tue, 19 Jul 2016 00:09:11 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Kalle Valo <kvalo@codeaurora.org>,
	linux-wireless@vger.kernel.org
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org (open list:MEMORY TECHNOLOGY DEVICES (MTD)),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] mtd: add arch dependency for MTD_BCM47XXSFLASH symbol
Date: Tue, 19 Jul 2016 09:08:32 +0200
Message-Id: <1468912123-14899-1-git-send-email-zajec5@gmail.com>
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

We dropped strict MIPS dependency for bcm47xxsflash driver in:
commit 5651d6aaf489 ("mtd: bcm47xxsflash: use ioremap_cache() instead of
KSEG0ADDR()") but using ioremap_cache still limits building it to few
selected architectures only.

A recent commit 57d8f7dd2132 ("bcma: allow enabling serial flash support
on non-MIPS SoCs") automatically dropped MIPS dependency for
MTD_BCM47XXSFLASH which broke building e.g. on powerpc and cris.

The bcma change is alright as it doesn't break building bcma code in any
way. MTD_BCM47XXSFLASH on the other hand should be limited to archs
which need it and can build it (by providing ioremap_cache).

Fixes: 57d8f7dd2132 ("bcma: allow enabling serial flash support on non-MIPS SoCs")
Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>
---
That bcma commit breaking building landed in the wireless-drivers-next.
Is that possible to get this patch through the same tree?
---
 drivers/mtd/devices/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
index f73c416..64a2485 100644
--- a/drivers/mtd/devices/Kconfig
+++ b/drivers/mtd/devices/Kconfig
@@ -114,7 +114,7 @@ config MTD_SST25L
 
 config MTD_BCM47XXSFLASH
 	tristate "R/O support for serial flash on BCMA bus"
-	depends on BCMA_SFLASH
+	depends on BCMA_SFLASH && (MIPS || ARM)
 	help
 	  BCMA bus can have various flash memories attached, they are
 	  registered by bcma as platform devices. This enables driver for
-- 
1.8.4.5
