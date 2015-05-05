Received: from michel.telenet-ops.be ([195.130.137.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ypfmb-0003Uv-IS
 for linux-mtd@lists.infradead.org; Tue, 05 May 2015 16:33:23 +0000
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Courbot <gnurou@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 13/27] mtd: Allow compile test of GPIO consumers if !GPIOLIB
Date: Tue,  5 May 2015 18:32:29 +0200
Message-Id: <1430843563-18615-13-git-send-email-geert@linux-m68k.org>
In-Reply-To: <1430843563-18615-1-git-send-email-geert@linux-m68k.org>
References: <1430836404-15513-1-git-send-email-geert@linux-m68k.org>
 <1430843563-18615-1-git-send-email-geert@linux-m68k.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The GPIO subsystem provides dummy GPIO consumer functions if GPIOLIB is
not enabled. Hence drivers that depend on GPIOLIB, but use GPIO consumer
functionality only, can still be compiled if GPIOLIB is not enabled.

Relax the dependency on GPIOLIB if COMPILE_TEST is enabled, where
appropriate.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/maps/Kconfig | 2 +-
 drivers/mtd/nand/Kconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index e715ae90632f82e6..7c95a656f9e47933 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -326,7 +326,7 @@ config MTD_BFIN_ASYNC
 
 config MTD_GPIO_ADDR
 	tristate "GPIO-assisted Flash Chip Support"
-	depends on GPIOLIB
+	depends on GPIOLIB || COMPILE_TEST
 	depends on MTD_COMPLEX_MAPPINGS
 	help
 	  Map driver which allows flashes to be partially physically addressed
diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 5897d8d8fa5a962d..f318e1b5bf973267 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -76,7 +76,7 @@ config MTD_NAND_DENALI_SCRATCH_REG_ADDR
 
 config MTD_NAND_GPIO
 	tristate "GPIO assisted NAND Flash driver"
-	depends on GPIOLIB
+	depends on GPIOLIB || COMPILE_TEST
 	help
 	  This enables a NAND flash driver where control signals are
 	  connected to GPIO pins, and commands and data are communicated
-- 
1.9.1
