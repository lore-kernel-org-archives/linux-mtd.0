Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eioqT-0008Uz-EW
 for linux-mtd@lists.infradead.org; Mon, 05 Feb 2018 22:02:40 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Cc: Peter Pan <peterpansjtu@gmail.com>,
 Frieder Schrempf <frieder.schrempf@exceet.de>
Subject: [PATCH v7 1/7] mtd: nand: Get rid of comments giving the file path
 inside the file itself
Date: Mon,  5 Feb 2018 23:01:59 +0100
Message-Id: <20180205220205.3528-2-boris.brezillon@bootlin.com>
In-Reply-To: <20180205220205.3528-1-boris.brezillon@bootlin.com>
References: <20180205220205.3528-1-boris.brezillon@bootlin.com>
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

From: Boris Brezillon <boris.brezillon@free-electrons.com>

Some files add a comment giving the path of the file inside the Linux
tree, which is pretty useless since the reader had to find the file to
open it.

Getting rid of these comments will also allow us to easily move these
files around when needed.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/Makefile        | 3 ---
 drivers/mtd/nand/ams-delta.c     | 2 --
 drivers/mtd/nand/au1550nd.c      | 2 --
 drivers/mtd/nand/bf5xx_nand.c    | 3 +--
 drivers/mtd/nand/cmx270_nand.c   | 2 --
 drivers/mtd/nand/cs553x_nand.c   | 2 --
 drivers/mtd/nand/diskonchip.c    | 2 --
 drivers/mtd/nand/fsmc_nand.c     | 2 --
 drivers/mtd/nand/gpio.c          | 2 --
 drivers/mtd/nand/nand_ecc.c      | 2 --
 drivers/mtd/nand/orion_nand.c    | 2 --
 drivers/mtd/nand/pxa3xx_nand.c   | 2 --
 drivers/mtd/nand/s3c2410.c       | 3 +--
 drivers/mtd/nand/sharpsl.c       | 2 --
 drivers/mtd/nand/socrates_nand.c | 2 --
 include/linux/mtd/bbm.h          | 2 --
 include/linux/mtd/nand_ecc.h     | 2 --
 include/linux/mtd/ndfc.h         | 2 --
 18 files changed, 2 insertions(+), 37 deletions(-)

diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index 921634ba400c..4e0982476267 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -1,7 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
-#
-# linux/drivers/nand/Makefile
-#
 
 obj-$(CONFIG_MTD_NAND)			+= nand.o
 obj-$(CONFIG_MTD_NAND_ECC)		+= nand_ecc.o
diff --git a/drivers/mtd/nand/ams-delta.c b/drivers/mtd/nand/ams-delta.c
index d60ada45c549..e15991d81a20 100644
--- a/drivers/mtd/nand/ams-delta.c
+++ b/drivers/mtd/nand/ams-delta.c
@@ -1,6 +1,4 @@
 /*
- *  drivers/mtd/nand/ams-delta.c
- *
  *  Copyright (C) 2006 Jonathan McDowell <noodles@earth.li>
  *
  *  Derived from drivers/mtd/toto.c
diff --git a/drivers/mtd/nand/au1550nd.c b/drivers/mtd/nand/au1550nd.c
index 8ab827edf94e..df0ef1f1e2f5 100644
--- a/drivers/mtd/nand/au1550nd.c
+++ b/drivers/mtd/nand/au1550nd.c
@@ -1,6 +1,4 @@
 /*
- *  drivers/mtd/nand/au1550nd.c
- *
  *  Copyright (C) 2004 Embedded Edge, LLC
  *
  * This program is free software; you can redistribute it and/or modify
diff --git a/drivers/mtd/nand/bf5xx_nand.c b/drivers/mtd/nand/bf5xx_nand.c
index 87bbd177b3e5..4a5f56f76efd 100644
--- a/drivers/mtd/nand/bf5xx_nand.c
+++ b/drivers/mtd/nand/bf5xx_nand.c
@@ -1,5 +1,4 @@
-/* linux/drivers/mtd/nand/bf5xx_nand.c
- *
+/*
  * Copyright 2006-2008 Analog Devices Inc.
  *	http://blackfin.uclinux.org/
  *	Bryan Wu <bryan.wu@analog.com>
diff --git a/drivers/mtd/nand/cmx270_nand.c b/drivers/mtd/nand/cmx270_nand.c
index b01c9804590e..66749ade9654 100644
--- a/drivers/mtd/nand/cmx270_nand.c
+++ b/drivers/mtd/nand/cmx270_nand.c
@@ -1,6 +1,4 @@
 /*
- *  linux/drivers/mtd/nand/cmx270-nand.c
- *
  *  Copyright (C) 2006 Compulab, Ltd.
  *  Mike Rapoport <mike@compulab.co.il>
  *
diff --git a/drivers/mtd/nand/cs553x_nand.c b/drivers/mtd/nand/cs553x_nand.c
index d48877540f14..be1f28fc7363 100644
--- a/drivers/mtd/nand/cs553x_nand.c
+++ b/drivers/mtd/nand/cs553x_nand.c
@@ -1,6 +1,4 @@
 /*
- * drivers/mtd/nand/cs553x_nand.c
- *
  * (C) 2005, 2006 Red Hat Inc.
  *
  * Author: David Woodhouse <dwmw2@infradead.org>
diff --git a/drivers/mtd/nand/diskonchip.c b/drivers/mtd/nand/diskonchip.c
index 6bc93ea66f50..1af77f798fe5 100644
--- a/drivers/mtd/nand/diskonchip.c
+++ b/drivers/mtd/nand/diskonchip.c
@@ -1,6 +1,4 @@
 /*
- * drivers/mtd/nand/diskonchip.c
- *
  * (C) 2003 Red Hat, Inc.
  * (C) 2004 Dan Brown <dan_brown@ieee.org>
  * (C) 2004 Kalev Lember <kalev@smartlink.ee>
diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index f49ed46fa770..e763161a7c82 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -1,6 +1,4 @@
 /*
- * drivers/mtd/nand/fsmc_nand.c
- *
  * ST Microelectronics
  * Flexible Static Memory Controller (FSMC)
  * Driver for NAND portions
diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
index 484f7fbc3f7d..6f6f100da118 100644
--- a/drivers/mtd/nand/gpio.c
+++ b/drivers/mtd/nand/gpio.c
@@ -1,6 +1,4 @@
 /*
- * drivers/mtd/nand/gpio.c
- *
  * Updated, and converted to generic GPIO based driver by Russell King.
  *
  * Written by Ben Dooks <ben@simtec.co.uk>
diff --git a/drivers/mtd/nand/nand_ecc.c b/drivers/mtd/nand/nand_ecc.c
index 7613a0388044..3630f0fe8fa4 100644
--- a/drivers/mtd/nand/nand_ecc.c
+++ b/drivers/mtd/nand/nand_ecc.c
@@ -2,8 +2,6 @@
  * This file contains an ECC algorithm that detects and corrects 1 bit
  * errors in a 256 byte block of data.
  *
- * drivers/mtd/nand/nand_ecc.c
- *
  * Copyright © 2008 Koninklijke Philips Electronics NV.
  *                  Author: Frans Meulenbroeks
  *
diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
index 5a5aa1f07d07..7825fd3ce66b 100644
--- a/drivers/mtd/nand/orion_nand.c
+++ b/drivers/mtd/nand/orion_nand.c
@@ -1,6 +1,4 @@
 /*
- * drivers/mtd/nand/orion_nand.c
- *
  * NAND support for Marvell Orion SoC platforms
  *
  * Tzachi Perelstein <tzachi@marvell.com>
diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 021374fe59dc..4407cde4eac6 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1,6 +1,4 @@
 /*
- * drivers/mtd/nand/pxa3xx_nand.c
- *
  * Copyright © 2005 Intel Corporation
  * Copyright © 2006 Marvell International Ltd.
  *
diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index 4c383eeec6f6..b5bc5f106c09 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -1,5 +1,4 @@
-/* linux/drivers/mtd/nand/s3c2410.c
- *
+/*
  * Copyright © 2004-2008 Simtec Electronics
  *	http://armlinux.simtec.co.uk/
  *	Ben Dooks <ben@simtec.co.uk>
diff --git a/drivers/mtd/nand/sharpsl.c b/drivers/mtd/nand/sharpsl.c
index f59c455d9f51..e93df02c825e 100644
--- a/drivers/mtd/nand/sharpsl.c
+++ b/drivers/mtd/nand/sharpsl.c
@@ -1,6 +1,4 @@
 /*
- * drivers/mtd/nand/sharpsl.c
- *
  *  Copyright (C) 2004 Richard Purdie
  *  Copyright (C) 2008 Dmitry Baryshkov
  *
diff --git a/drivers/mtd/nand/socrates_nand.c b/drivers/mtd/nand/socrates_nand.c
index 575997d0ef8a..9824a9923583 100644
--- a/drivers/mtd/nand/socrates_nand.c
+++ b/drivers/mtd/nand/socrates_nand.c
@@ -1,6 +1,4 @@
 /*
- * drivers/mtd/nand/socrates_nand.c
- *
  *  Copyright © 2008 Ilya Yanok, Emcraft Systems
  *
  *
diff --git a/include/linux/mtd/bbm.h b/include/linux/mtd/bbm.h
index 3bf8f954b642..3102bd754d18 100644
--- a/include/linux/mtd/bbm.h
+++ b/include/linux/mtd/bbm.h
@@ -1,6 +1,4 @@
 /*
- *  linux/include/linux/mtd/bbm.h
- *
  *  NAND family Bad Block Management (BBM) header file
  *    - Bad Block Table (BBT) implementation
  *
diff --git a/include/linux/mtd/nand_ecc.h b/include/linux/mtd/nand_ecc.h
index 4d8406c81652..8a2decf7462c 100644
--- a/include/linux/mtd/nand_ecc.h
+++ b/include/linux/mtd/nand_ecc.h
@@ -1,6 +1,4 @@
 /*
- *  drivers/mtd/nand_ecc.h
- *
  *  Copyright (C) 2000-2010 Steven J. Hill <sjhill@realitydiluted.com>
  *			    David Woodhouse <dwmw2@infradead.org>
  *			    Thomas Gleixner <tglx@linutronix.de>
diff --git a/include/linux/mtd/ndfc.h b/include/linux/mtd/ndfc.h
index d0558a982628..357e88b3263a 100644
--- a/include/linux/mtd/ndfc.h
+++ b/include/linux/mtd/ndfc.h
@@ -1,6 +1,4 @@
 /*
- *  linux/include/linux/mtd/ndfc.h
- *
  *  Copyright (c) 2006 Thomas Gleixner <tglx@linutronix.de>
  *
  * This program is free software; you can redistribute it and/or modify
-- 
2.14.1
