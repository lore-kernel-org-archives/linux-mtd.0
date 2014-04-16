Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WaLah-00004r-1I
 for linux-mtd@lists.infradead.org; Wed, 16 Apr 2014 08:53:11 +0000
Received: by mail-pa0-f42.google.com with SMTP id fb1so10766788pad.1
 for <linux-mtd@lists.infradead.org>; Wed, 16 Apr 2014 01:52:50 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/2] mtd: st_spi_fsm: only build for ARM
Date: Wed, 16 Apr 2014 01:43:02 -0700
Message-Id: <1397637782-26843-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1397637782-26843-1-git-send-email-computersforpeace@gmail.com>
References: <1397637782-26843-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Lee Jones <lee.jones@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

COMPILE_TEST allows us to build this driver on other arch'es. But not
all arch'es have the right I/O accessors -- particularly, x86 is missing
readsl() and writesl().

So just restrict this driver to ARCH_STI. It's still buildable for a
multiplatform ARM kernel, so it can get decent compile coverage.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/devices/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
index 9aae1042c14f..c49d0b127fef 100644
--- a/drivers/mtd/devices/Kconfig
+++ b/drivers/mtd/devices/Kconfig
@@ -212,7 +212,7 @@ config MTD_DOCG3
 
 config MTD_ST_SPI_FSM
 	tristate "ST Microelectronics SPI FSM Serial Flash Controller"
-	depends on ARCH_STI || COMPILE_TEST
+	depends on ARCH_STI
 	help
 	  This provides an MTD device driver for the ST Microelectronics
 	  SPI Fast Sequence Mode (FSM) Serial Flash Controller and support
-- 
1.8.3.2
