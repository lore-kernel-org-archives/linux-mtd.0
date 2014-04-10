Received: from mail-ie0-x230.google.com ([2607:f8b0:4001:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WYKXo-0005vc-14
 for linux-mtd@lists.infradead.org; Thu, 10 Apr 2014 19:21:52 +0000
Received: by mail-ie0-f176.google.com with SMTP id rd18so4254469iec.7
 for <linux-mtd@lists.infradead.org>; Thu, 10 Apr 2014 12:21:31 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 10/10] mtd: spi-nor: allow to be built as module
Date: Thu, 10 Apr 2014 12:21:04 -0700
Message-Id: <1397157664-24405-11-git-send-email-computersforpeace@gmail.com>
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

There's no reason this can't be a module. Also, give SPI-NOR its own
submenu.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/spi-nor/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
index d682fb440e06..f8acfa4310ef 100644
--- a/drivers/mtd/spi-nor/Kconfig
+++ b/drivers/mtd/spi-nor/Kconfig
@@ -1,5 +1,5 @@
-config MTD_SPI_NOR
-	bool "SPI-NOR device support"
+menuconfig MTD_SPI_NOR
+	tristate "SPI-NOR device support"
 	depends on MTD
 	help
 	  This is the framework for the SPI NOR which can be used by the SPI
-- 
1.8.3.2
