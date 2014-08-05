Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XEaGM-0000Ts-6n
 for linux-mtd@lists.infradead.org; Tue, 05 Aug 2014 08:38:35 +0000
From: Gerhard Sittig <gsi@denx.de>
To: devicetree@vger.kernel.org, Jamie Iles <jamie@jamieiles.com>,
 linux-mtd@lists.infradead.org, Mike Rapoport <mike@compulab.co.il>,
 Alexander Shiyan <shc_work@mail.ru>
Subject: =?UTF-8?q?=5BPATCH=20v1=202/2=5D=20mtd=3A=20nand=3A=20gpio=3A=20improve=20comments=20about=20GPIO=20assisted=20operation?=
Date: Tue,  5 Aug 2014 10:37:26 +0200
Message-Id: <1407227846-3257-2-git-send-email-gsi@denx.de>
In-Reply-To: <1407227846-3257-1-git-send-email-gsi@denx.de>
References: <1407227846-3257-1-git-send-email-gsi@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>, Gerhard Sittig <gsi@denx.de>,
 Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>,
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

The drivers/mtd/nand/gpio.c driver does not GPIO bitbang the complete
NAND protocol, but instead is GPIO _assisted_ -- a memory mapped interface
communicates commands and data, and only few control signals are connected
to GPIO pins.

Expand comments in the driver source and in the Kconfig description to
better reflect the very nature of the driver.  The previous text could be
mistaken for complete GPIO bitbanging.

Signed-off-by: Gerhard Sittig <gsi@denx.de>
---
 drivers/mtd/nand/Kconfig |    6 ++++--
 drivers/mtd/nand/gpio.c  |    4 +++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index f1cf503517fd..0ef8b35b459f 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -75,10 +75,12 @@ config MTD_NAND_DENALI_SCRATCH_REG_ADDR
           boards, the scratch register is at 0xFF108018.
 
 config MTD_NAND_GPIO
-	tristate "GPIO NAND Flash driver"
+	tristate "GPIO assisted NAND Flash driver"
 	depends on GPIOLIB
 	help
-	  This enables a GPIO based NAND flash driver.
+	  This enables a NAND flash driver where control signals are
+	  connected to GPIO pins, and commands and data are communicated
+	  via a memory mapped interface.
 
 config MTD_NAND_AMS_DELTA
 	tristate "NAND Flash device on Amstrad E3"
diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
index 117ce333fdd4..226eda6f2eee 100644
--- a/drivers/mtd/nand/gpio.c
+++ b/drivers/mtd/nand/gpio.c
@@ -8,7 +8,9 @@
  *
  * © 2004 Simtec Electronics
  *
- * Device driver for NAND connected via GPIO
+ * Device driver for NAND flash that uses a memory mapped interface to
+ * read/write the NAND commands and data, and GPIO pins for control signals
+ * (the DT binding refers to this as "GPIO assisted NAND flash")
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
-- 
1.7.10.4
