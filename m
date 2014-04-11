Received: from mail-qc0-x22e.google.com ([2607:f8b0:400d:c01::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WYghA-0005Nu-Qo
 for linux-mtd@lists.infradead.org; Fri, 11 Apr 2014 19:01:01 +0000
Received: by mail-qc0-f174.google.com with SMTP id c9so6304358qcz.19
 for <linux-mtd@lists.infradead.org>; Fri, 11 Apr 2014 12:00:39 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 06/11] mtd: st_spi_fsm: fixup Kconfig dependency
Date: Fri, 11 Apr 2014 12:00:01 -0700
Message-Id: <1397242806-7575-7-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1397242806-7575-1-git-send-email-computersforpeace@gmail.com>
References: <1397242806-7575-1-git-send-email-computersforpeace@gmail.com>
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
Reviewed-by: Marek Vasut <marex@denx.de>
---
v3: no change

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
