Received: from mail-ie0-x22d.google.com ([2607:f8b0:4001:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WYKXi-0005vV-Qt
 for linux-mtd@lists.infradead.org; Thu, 10 Apr 2014 19:21:47 +0000
Received: by mail-ie0-f173.google.com with SMTP id rl12so4398281iec.4
 for <linux-mtd@lists.infradead.org>; Thu, 10 Apr 2014 12:21:25 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 06/10] mtd: st_spi_fsm: fixup Kconfig dependency
Date: Thu, 10 Apr 2014 12:21:00 -0700
Message-Id: <1397157664-24405-7-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1397157664-24405-1-git-send-email-computersforpeace@gmail.com>
References: <1397157664-24405-1-git-send-email-computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Huang Shijie <b32955@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>, Lee Jones <lee.jones@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I hear that this driver should depend on ARCH_STI, and that "SH" is not
actually a real symbol. At the same time, let's allow compile-testing on
other ARCH'es.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Acked-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/devices/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
index f9e32b53dfc6..9aae1042c14f 100644
--- a/drivers/mtd/devices/Kconfig
+++ b/drivers/mtd/devices/Kconfig
@@ -212,7 +212,7 @@ config MTD_DOCG3
 
 config MTD_ST_SPI_FSM
 	tristate "ST Microelectronics SPI FSM Serial Flash Controller"
-	depends on ARM || SH
+	depends on ARCH_STI || COMPILE_TEST
 	help
 	  This provides an MTD device driver for the ST Microelectronics
 	  SPI Fast Sequence Mode (FSM) Serial Flash Controller and support
-- 
1.8.3.2
