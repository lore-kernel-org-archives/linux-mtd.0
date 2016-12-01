Received: from mail1.bemta12.messagelabs.com ([216.82.251.9])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCOVj-00036f-Ad
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2016 10:22:42 +0000
To: Brian Norris <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>
CC: linux-mtd <linux-mtd@lists.infradead.org>
From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Subject: [PATCH] mtd: nand: tango: Add standard legalese header
Message-ID: <583FF9D6.9090109@sigmadesigns.com>
Date: Thu, 1 Dec 2016 11:22:14 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Provide proper copyright notice and license information.

Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
---
I originally didn't provide this information because I thought
MODULE_AUTHOR defined the copyright holder, and MODULE_LICENSE
defined the license. (So I figured the header was redundant.)
---
 drivers/mtd/nand/tango_nand.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mtd/nand/tango_nand.c b/drivers/mtd/nand/tango_nand.c
index 7ed35348993e..cc23db64f0ca 100644
--- a/drivers/mtd/nand/tango_nand.c
+++ b/drivers/mtd/nand/tango_nand.c
@@ -1,3 +1,11 @@
+/*
+ * Copyright (C) 2016 Sigma Designs
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * version 2 as published by the Free Software Foundation.
+ */
+
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/clk.h>
-- 
2.9.0
