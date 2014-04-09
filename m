Received: from mail-ie0-x235.google.com ([2607:f8b0:4001:c03::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXwNN-0005ac-PD
 for linux-mtd@lists.infradead.org; Wed, 09 Apr 2014 17:33:34 +0000
Received: by mail-ie0-f181.google.com with SMTP id tp5so2752778ieb.40
 for <linux-mtd@lists.infradead.org>; Wed, 09 Apr 2014 10:33:08 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 6/9] mtd: st_spi_fsm: fixup Kconfig dependency
Date: Wed,  9 Apr 2014 10:32:51 -0700
Message-Id: <1397064774-31784-6-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1397064774-31784-1-git-send-email-computersforpeace@gmail.com>
References: <1397064774-31784-1-git-send-email-computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Huang Shijie <b32955@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-spi@vger.kernel.org
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
Cc: Lee Jones <lee.jones@linaro.org>
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
