Received: from mail-pd0-x234.google.com ([2607:f8b0:400e:c02::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YvrEX-0002zD-G0
 for linux-mtd@lists.infradead.org; Fri, 22 May 2015 17:59:46 +0000
Received: by pdbqa5 with SMTP id qa5so24984734pdb.0
 for <linux-mtd@lists.infradead.org>; Fri, 22 May 2015 10:59:24 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: remove incorrect file name
Date: Fri, 22 May 2015 10:58:57 -0700
Message-Id: <1432317537-11387-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an example of why it doesn't make much sense to put this
information here in the first place. I don't really know what purpose it
serves.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/devices/spear_smi.c | 4 ++--
 drivers/mtd/nand/nand_base.c    | 2 --
 drivers/mtd/nand/nand_bbt.c     | 2 --
 drivers/mtd/nand/nand_ids.c     | 2 --
 drivers/mtd/nand/ndfc.c         | 2 --
 5 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/devices/spear_smi.c b/drivers/mtd/devices/spear_smi.c
index 508bab3bd0c4..04b24d2b03f2 100644
--- a/drivers/mtd/devices/spear_smi.c
+++ b/drivers/mtd/devices/spear_smi.c
@@ -1,8 +1,8 @@
 /*
  * SMI (Serial Memory Controller) device driver for Serial NOR Flash on
  * SPEAr platform
- * The serial nor interface is largely based on drivers/mtd/m25p80.c,
- * however the SPI interface has been replaced by SMI.
+ * The serial nor interface is largely based on m25p80.c, however the SPI
+ * interface has been replaced by SMI.
  *
  * Copyright © 2010 STMicroelectronics.
  * Ashish Priyadarshi
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index c4619e3ac4ab..a157757347ec 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1,6 +1,4 @@
 /*
- *  drivers/mtd/nand.c
- *
  *  Overview:
  *   This is the generic MTD driver for NAND flash devices. It should be
  *   capable of working with almost all NAND chips currently available.
diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 2c4fa1a17031..63a1a36a3f4b 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -1,6 +1,4 @@
 /*
- *  drivers/mtd/nand_bbt.c
- *
  *  Overview:
  *   Bad block table support for the NAND driver
  *
diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
index dd620c19c619..7124400d903b 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -1,6 +1,4 @@
 /*
- *  drivers/mtd/nandids.c
- *
  *  Copyright (C) 2002 Thomas Gleixner (tglx@linutronix.de)
  *
  * This program is free software; you can redistribute it and/or modify
diff --git a/drivers/mtd/nand/ndfc.c b/drivers/mtd/nand/ndfc.c
index 3187c6b92d9a..67a1b3f911cf 100644
--- a/drivers/mtd/nand/ndfc.c
+++ b/drivers/mtd/nand/ndfc.c
@@ -1,6 +1,4 @@
 /*
- *  drivers/mtd/ndfc.c
- *
  *  Overview:
  *   Platform independent driver for NDFC (NanD Flash Controller)
  *   integrated into EP440 cores
-- 
1.9.1
