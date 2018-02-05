Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eioqT-0008Uy-H5
 for linux-mtd@lists.infradead.org; Mon, 05 Feb 2018 22:02:42 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Cc: Peter Pan <peterpansjtu@gmail.com>,
 Frieder Schrempf <frieder.schrempf@exceet.de>
Subject: [PATCH v7 2/7] mtd: nand: Stop using full path when referring to
 files placed in the same dir
Date: Mon,  5 Feb 2018 23:02:00 +0100
Message-Id: <20180205220205.3528-3-boris.brezillon@bootlin.com>
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

Some NAND drivers are derived from other NAND drivers and state it in
their license header. Using full path to point to other driver files
sitting in the same directory is not such a good idea, since the NAND
drivers might be moved to a different directory at some point, and we
don't to patch all license/copyright headers everytime this happen.

The only exception where we keep full path is when the referred source
files no longer exist in the tree.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/ams-delta.c   | 2 +-
 drivers/mtd/nand/bf5xx_nand.c  | 4 ++--
 drivers/mtd/nand/mpc5121_nfc.c | 5 ++---
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/ams-delta.c b/drivers/mtd/nand/ams-delta.c
index e15991d81a20..f3eaea9df90b 100644
--- a/drivers/mtd/nand/ams-delta.c
+++ b/drivers/mtd/nand/ams-delta.c
@@ -3,7 +3,7 @@
  *
  *  Derived from drivers/mtd/toto.c
  *  Converted to platform driver by Janusz Krzysztofik <jkrzyszt@tis.icnet.pl>
- *  Partially stolen from drivers/mtd/nand/plat_nand.c
+ *  Partially stolen from plat_nand.c
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
diff --git a/drivers/mtd/nand/bf5xx_nand.c b/drivers/mtd/nand/bf5xx_nand.c
index 4a5f56f76efd..9a1d8d104570 100644
--- a/drivers/mtd/nand/bf5xx_nand.c
+++ b/drivers/mtd/nand/bf5xx_nand.c
@@ -5,10 +5,10 @@
  *
  * Blackfin BF5xx on-chip NAND flash controller driver
  *
- * Derived from drivers/mtd/nand/s3c2410.c
+ * Derived from s3c2410.c
  * Copyright (c) 2007 Ben Dooks <ben@simtec.co.uk>
  *
- * Derived from drivers/mtd/nand/cafe.c
+ * Derived from cafe.c
  * Copyright © 2006 Red Hat, Inc.
  * Copyright © 2006 David Woodhouse <dwmw2@infradead.org>
  *
diff --git a/drivers/mtd/nand/mpc5121_nfc.c b/drivers/mtd/nand/mpc5121_nfc.c
index b6b97cc9fba6..913b9d1225c6 100644
--- a/drivers/mtd/nand/mpc5121_nfc.c
+++ b/drivers/mtd/nand/mpc5121_nfc.c
@@ -6,9 +6,8 @@
  * by OSADL membership fees in 2009;  for details see www.osadl.org.
  *
  * Based on original driver from Freescale Semiconductor
- * written by John Rigby <jrigby@freescale.com> on basis
- * of drivers/mtd/nand/mxc_nand.c. Reworked and extended
- * Piotr Ziecik <kosmo@semihalf.com>.
+ * written by John Rigby <jrigby@freescale.com> on basis of mxc_nand.c.
+ * Reworked and extended by Piotr Ziecik <kosmo@semihalf.com>.
  *
  * This program is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License
-- 
2.14.1
