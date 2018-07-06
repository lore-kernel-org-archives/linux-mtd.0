Received: from mail-ua0-x243.google.com ([2607:f8b0:400c:c08::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fbUWg-00025i-BG
 for linux-mtd@lists.infradead.org; Fri, 06 Jul 2018 17:28:11 +0000
Received: by mail-ua0-x243.google.com with SMTP id r18-v6so7996366ual.13
 for <linux-mtd@lists.infradead.org>; Fri, 06 Jul 2018 10:27:59 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: boris.brezillon@bootlin.com
Cc: han.xu@nxp.com, linux-mtd@lists.infradead.org,
 Fabio Estevam <fabio.estevam@nxp.com>
Subject: [PATCH] mtd: rawnand: gpmi: Switch to SPDX identifier
Date: Fri,  6 Jul 2018 14:28:23 -0300
Message-Id: <1530898103-27125-1-git-send-email-festevam@gmail.com>
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
 drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c  | 27 +++++++--------------------
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 27 +++++++--------------------
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h | 11 +----------
 3 files changed, 15 insertions(+), 50 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
index 83697b8..5673cb2 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
@@ -1,23 +1,10 @@
-/*
- * Freescale GPMI NAND Flash Driver
- *
- * Copyright (C) 2008-2011 Freescale Semiconductor, Inc.
- * Copyright (C) 2008 Embedded Alley Solutions, Inc.
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
- */
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Freescale GPMI NAND Flash Driver
+//
+// Copyright (C) 2008-2011 Freescale Semiconductor, Inc.
+// Copyright (C) 2008 Embedded Alley Solutions, Inc.
+
 #include <linux/delay.h>
 #include <linux/clk.h>
 #include <linux/slab.h>
diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index f6aa358..ff1453f 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -1,23 +1,10 @@
-/*
- * Freescale GPMI NAND Flash Driver
- *
- * Copyright (C) 2010-2015 Freescale Semiconductor, Inc.
- * Copyright (C) 2008 Embedded Alley Solutions, Inc.
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
- */
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Freescale GPMI NAND Flash Driver
+//
+// Copyright (C) 2010-2015 Freescale Semiconductor, Inc.
+// Copyright (C) 2008 Embedded Alley Solutions, Inc.
+
 #include <linux/clk.h>
 #include <linux/slab.h>
 #include <linux/sched/task_stack.h>
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
