Received: from conuserg-09.nifty.com ([210.131.2.76])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fraqb-0005Ku-TR
 for linux-mtd@lists.infradead.org; Mon, 20 Aug 2018 03:27:20 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Dinh Nguyen <dinguyen@kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd: nand: denali: use SPDX-License-Identifier and fix
 license mismatch
Date: Mon, 20 Aug 2018 12:26:36 +0900
Message-Id: <1534735596-10876-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use SPDX-License-Identifier instead of the license boilerplates.

This conversion makes it easier for us to scan the license, then
I notice license mismatch problems.

The license blocks in denali* indicate GPL-2.0 "only", while the
MODULE_LICENSE in denali.c and denali_dt.c is GPL-2.0 "or later"
as explained in include/linux/module.h as follows:

  "GPL"                           [GNU Public License v2 or later]
  "GPL v2"                        [GNU Public License v2]

I fixed the MODULE_LICENSE tags, assuming the license blocks are
the authors' intention.

Also, add missing MODULE_DESCRIPTION/AUTHOR to denali.c

While I am touching the license things, I added my credit to denali.c
because this driver was largely re-written by me in 2017.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/raw/denali.c     | 17 +++++++----------
 drivers/mtd/nand/raw/denali.h     | 10 +---------
 drivers/mtd/nand/raw/denali_dt.c  | 12 ++----------
 drivers/mtd/nand/raw/denali_pci.c | 10 +---------
 4 files changed, 11 insertions(+), 38 deletions(-)

diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
index ca18612..9f432f0 100644
--- a/drivers/mtd/nand/raw/denali.c
+++ b/drivers/mtd/nand/raw/denali.c
@@ -1,15 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * NAND Flash Controller Device Driver
  * Copyright © 2009-2010, Intel Corporation and its suppliers.
  *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
+ * Copyright (c) 2017 Socionext Inc.
+ *   Reworked by Masahiro Yamada <yamada.masahiro@socionext.com>
  */
 
 #include <linux/bitfield.h>
@@ -25,8 +20,6 @@
 
 #include "denali.h"
 
-MODULE_LICENSE("GPL");
-
 #define DENALI_NAND_NAME    "denali-nand"
 
 /* for Indexed Addressing */
@@ -1396,3 +1389,7 @@ void denali_remove(struct denali_nand_info *denali)
 	denali_disable_irq(denali);
 }
 EXPORT_SYMBOL(denali_remove);
+
+MODULE_DESCRIPTION("Driver core for Denali NAND controller");
+MODULE_AUTHOR("Intel Corporation and its suppliers");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/mtd/nand/raw/denali.h b/drivers/mtd/nand/raw/denali.h
index 1f8feaf..57a5498 100644
--- a/drivers/mtd/nand/raw/denali.h
+++ b/drivers/mtd/nand/raw/denali.h
@@ -1,15 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * NAND Flash Controller Device Driver
  * Copyright (c) 2009 - 2010, Intel Corporation and its suppliers.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #ifndef __DENALI_H__
diff --git a/drivers/mtd/nand/raw/denali_dt.c b/drivers/mtd/nand/raw/denali_dt.c
index 0faaad0..7c6a8a4 100644
--- a/drivers/mtd/nand/raw/denali_dt.c
+++ b/drivers/mtd/nand/raw/denali_dt.c
@@ -1,16 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * NAND Flash Controller Device Driver for DT
  *
  * Copyright © 2011, Picochip.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include <linux/clk.h>
@@ -202,6 +194,6 @@ static struct platform_driver denali_dt_driver = {
 };
 module_platform_driver(denali_dt_driver);
 
-MODULE_LICENSE("GPL");
+MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Jamie Iles");
 MODULE_DESCRIPTION("DT driver for Denali NAND controller");
diff --git a/drivers/mtd/nand/raw/denali_pci.c b/drivers/mtd/nand/raw/denali_pci.c
index 7c8efc4..48e9ac5 100644
--- a/drivers/mtd/nand/raw/denali_pci.c
+++ b/drivers/mtd/nand/raw/denali_pci.c
@@ -1,15 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * NAND Flash Controller Device Driver
  * Copyright © 2009-2010, Intel Corporation and its suppliers.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
  */
 
 #include <linux/errno.h>
-- 
2.7.4
