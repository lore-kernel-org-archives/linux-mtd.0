Received: from mail-ua0-x244.google.com ([2607:f8b0:400c:c08::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fbqx3-0003bo-Im
 for linux-mtd@lists.infradead.org; Sat, 07 Jul 2018 17:24:55 +0000
Received: by mail-ua0-x244.google.com with SMTP id x18-v6so9415333uaj.9
 for <linux-mtd@lists.infradead.org>; Sat, 07 Jul 2018 10:24:41 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: boris.brezillon@bootlin.com
Cc: han.xu@nxp.com, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 Fabio Estevam <fabio.estevam@nxp.com>
Subject: [PATCH v2 1/2] mtd: rawnand: gpmi: Switch to SPDX identifier
Date: Sat,  7 Jul 2018 14:25:20 -0300
Message-Id: <1530984321-29242-1-git-send-email-festevam@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Fabio Estevam <fabio.estevam@nxp.com>

Adopt the SPDX license identifier headers to ease license compliance
management.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
Changes since v1:
- Only use // style for SPDX line (Miquel)

 drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c  | 15 +--------------
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 15 +--------------
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h | 11 +----------
 3 files changed, 3 insertions(+), 38 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
index 83697b8..88ea220 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
@@ -1,22 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * Freescale GPMI NAND Flash Driver
  *
  * Copyright (C) 2008-2011 Freescale Semiconductor, Inc.
  * Copyright (C) 2008 Embedded Alley Solutions, Inc.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License along
- * with this program; if not, write to the Free Software Foundation, Inc.,
- * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
  */
 #include <linux/delay.h>
 #include <linux/clk.h>
diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index f6aa358..46d90e7 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -1,22 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * Freescale GPMI NAND Flash Driver
  *
  * Copyright (C) 2010-2015 Freescale Semiconductor, Inc.
  * Copyright (C) 2008 Embedded Alley Solutions, Inc.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License along
- * with this program; if not, write to the Free Software Foundation, Inc.,
- * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
  */
 #include <linux/clk.h>
 #include <linux/slab.h>
diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
index 6aa10d6..69cd0cb 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
@@ -1,18 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
 /*
  * Freescale GPMI NAND Flash Driver
  *
  * Copyright (C) 2010-2011 Freescale Semiconductor, Inc.
  * Copyright (C) 2008 Embedded Alley Solutions, Inc.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
  */
 #ifndef __DRIVERS_MTD_NAND_GPMI_NAND_H
 #define __DRIVERS_MTD_NAND_GPMI_NAND_H
-- 
2.7.4
