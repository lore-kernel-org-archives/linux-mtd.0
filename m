Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WYBBM-0008A4-Iq
 for linux-mtd@lists.infradead.org; Thu, 10 Apr 2014 09:22:06 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH] mtd: spi-nor: add the copyright information
Date: Thu, 10 Apr 2014 16:27:28 +0800
Message-ID: <1397118448-23788-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: marex@denx.de, Huang Shijie <b32955@freescale.com>,
 computersforpeace@gmail.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add the copyright information for spi-nor.c and spi-nor.h.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
based on Brian's patch set.
---
 drivers/mtd/spi-nor/spi-nor.c |    6 +++++-
 include/linux/mtd/spi-nor.h   |    9 +++++++++
 2 files changed, 14 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index de04d6e..d6f44d5 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1,5 +1,9 @@
 /*
- * Cloned most of the code from the m25p80.c
+ * Based on m25p80.c, by Mike Lavender (mike@steroidmicros.com), with
+ * influence from lart.c (Abraham Van Der Merwe) and mtd_dataflash.c
+ *
+ * Copyright (C) 2005, Intec Automation Inc.
+ * Copyright (C) 2014, Freescale Semiconductor, Inc.
  *
  * This code is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 2a5c301..835f40a 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -1,3 +1,12 @@
+/*
+ * Copyright (C) 2014 Freescale Semiconductor, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
 #ifndef __LINUX_MTD_SPI_NOR_H
 #define __LINUX_MTD_SPI_NOR_H
 
-- 
1.7.2.rc3
