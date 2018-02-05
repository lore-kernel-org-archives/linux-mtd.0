Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eioqT-0008V2-H6
 for linux-mtd@lists.infradead.org; Mon, 05 Feb 2018 22:02:42 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Cc: Peter Pan <peterpansjtu@gmail.com>,
 Frieder Schrempf <frieder.schrempf@exceet.de>
Subject: [PATCH v7 4/7] mtd: nand: State when references to other drivers are
 no longer valid
Date: Mon,  5 Feb 2018 23:02:02 +0100
Message-Id: <20180205220205.3528-5-boris.brezillon@bootlin.com>
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

A lot of NAND drivers have been derived from other old NAND drivers
which have since then been removed from the Linux tree. When this is
the case, specify when the file the header is referring to has been
removed so that people can find the original implementation more
easily.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 arch/cris/arch-v32/drivers/mach-a3/nandflash.c | 2 +-
 arch/cris/arch-v32/drivers/mach-fs/nandflash.c | 2 +-
 drivers/mtd/nand/ams-delta.c                   | 2 +-
 drivers/mtd/nand/atmel/nand-controller.c       | 4 ++--
 drivers/mtd/nand/atmel/pmecc.c                 | 4 ++--
 drivers/mtd/nand/atmel/pmecc.h                 | 4 ++--
 drivers/mtd/nand/cmx270_nand.c                 | 2 +-
 drivers/mtd/nand/fsmc_nand.c                   | 2 +-
 8 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/cris/arch-v32/drivers/mach-a3/nandflash.c b/arch/cris/arch-v32/drivers/mach-a3/nandflash.c
index 925a98eb6d68..7ec29d2d3661 100644
--- a/arch/cris/arch-v32/drivers/mach-a3/nandflash.c
+++ b/arch/cris/arch-v32/drivers/mach-a3/nandflash.c
@@ -3,7 +3,7 @@
  *
  *  Copyright (c) 2007
  *
- *  Derived from drivers/mtd/nand/spia.c
+ *  Derived from drivers/mtd/nand/spia.c (removed in v3.8)
  *	  Copyright (C) 2000 Steven J. Hill (sjhill@realitydiluted.com)
  *
  * This program is free software; you can redistribute it and/or modify
diff --git a/arch/cris/arch-v32/drivers/mach-fs/nandflash.c b/arch/cris/arch-v32/drivers/mach-fs/nandflash.c
index 53b56a429dde..7ce72906039a 100644
--- a/arch/cris/arch-v32/drivers/mach-fs/nandflash.c
+++ b/arch/cris/arch-v32/drivers/mach-fs/nandflash.c
@@ -3,7 +3,7 @@
  *
  *  Copyright (c) 2004
  *
- *  Derived from drivers/mtd/nand/spia.c
+ *  Derived from drivers/mtd/nand/spia.c (removed in v3.8)
  *	  Copyright (C) 2000 Steven J. Hill (sjhill@realitydiluted.com)
  *
  * This program is free software; you can redistribute it and/or modify
diff --git a/drivers/mtd/nand/ams-delta.c b/drivers/mtd/nand/ams-delta.c
index 25a92474fa59..24173a0a7875 100644
--- a/drivers/mtd/nand/ams-delta.c
+++ b/drivers/mtd/nand/ams-delta.c
@@ -1,7 +1,7 @@
 /*
  *  Copyright (C) 2006 Jonathan McDowell <noodles@earth.li>
  *
- *  Derived from drivers/mtd/nand/toto.c
+ *  Derived from drivers/mtd/nand/toto.c (removed in v2.6.28)
  *  Converted to platform driver by Janusz Krzysztofik <jkrzyszt@tis.icnet.pl>
  *  Partially stolen from plat_nand.c
  *
diff --git a/drivers/mtd/nand/atmel/nand-controller.c b/drivers/mtd/nand/atmel/nand-controller.c
index b2f00b398490..12f6753d47ae 100644
--- a/drivers/mtd/nand/atmel/nand-controller.c
+++ b/drivers/mtd/nand/atmel/nand-controller.c
@@ -9,10 +9,10 @@
  *
  *   Copyright 2003 Rick Bronson
  *
- *   Derived from drivers/mtd/nand/autcpu12.c
+ *   Derived from drivers/mtd/nand/autcpu12.c (removed in v3.8)
  *	Copyright 2001 Thomas Gleixner (gleixner@autronix.de)
  *
- *   Derived from drivers/mtd/spia.c
+ *   Derived from drivers/mtd/spia.c (removed in v3.8)
  *	Copyright 2000 Steven J. Hill (sjhill@cotw.com)
  *
  *
diff --git a/drivers/mtd/nand/atmel/pmecc.c b/drivers/mtd/nand/atmel/pmecc.c
index fcbe4fd6e684..9de29c9afb0c 100644
--- a/drivers/mtd/nand/atmel/pmecc.c
+++ b/drivers/mtd/nand/atmel/pmecc.c
@@ -9,10 +9,10 @@
  *
  *   Copyright 2003 Rick Bronson
  *
- *   Derived from drivers/mtd/nand/autcpu12.c
+ *   Derived from drivers/mtd/nand/autcpu12.c (removed in v3.8)
  *	Copyright 2001 Thomas Gleixner (gleixner@autronix.de)
  *
- *   Derived from drivers/mtd/spia.c
+ *   Derived from drivers/mtd/spia.c (removed in v3.8)
  *	Copyright 2000 Steven J. Hill (sjhill@cotw.com)
  *
  *   Add Hardware ECC support for AT91SAM9260 / AT91SAM9263
diff --git a/drivers/mtd/nand/atmel/pmecc.h b/drivers/mtd/nand/atmel/pmecc.h
index 817e0dd9fd15..808f1be0d6ad 100644
--- a/drivers/mtd/nand/atmel/pmecc.h
+++ b/drivers/mtd/nand/atmel/pmecc.h
@@ -9,10 +9,10 @@
  *
  *    Copyright © 2003 Rick Bronson
  *
- *    Derived from drivers/mtd/nand/autcpu12.c
+ *    Derived from drivers/mtd/nand/autcpu12.c (removed in v3.8)
  *        Copyright © 2001 Thomas Gleixner (gleixner@autronix.de)
  *
- *    Derived from drivers/mtd/spia.c
+ *    Derived from drivers/mtd/spia.c (removed in v3.8)
  *        Copyright © 2000 Steven J. Hill (sjhill@cotw.com)
  *
  *
diff --git a/drivers/mtd/nand/cmx270_nand.c b/drivers/mtd/nand/cmx270_nand.c
index 66749ade9654..02d6751e9efe 100644
--- a/drivers/mtd/nand/cmx270_nand.c
+++ b/drivers/mtd/nand/cmx270_nand.c
@@ -2,7 +2,7 @@
  *  Copyright (C) 2006 Compulab, Ltd.
  *  Mike Rapoport <mike@compulab.co.il>
  *
- *  Derived from drivers/mtd/nand/h1910.c
+ *  Derived from drivers/mtd/nand/h1910.c (removed in v3.10)
  *       Copyright (C) 2002 Marius Gröger (mag@sysgo.de)
  *       Copyright (c) 2001 Thomas Gleixner (gleixner@autronix.de)
  *
diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index e763161a7c82..a4a5da318eed 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -7,7 +7,7 @@
  * Vipin Kumar <vipin.kumar@st.com>
  * Ashish Priyadarshi
  *
- * Based on drivers/mtd/nand/nomadik_nand.c
+ * Based on drivers/mtd/nand/nomadik_nand.c (removed in v3.8)
  *
  * This file is licensed under the terms of the GNU General Public
  * License version 2. This program is licensed "as is" without any
-- 
2.14.1
