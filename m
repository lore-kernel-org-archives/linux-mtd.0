Received: from mail.rptsys.com ([192.119.205.245])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fhWjl-0000ZF-JC
 for linux-mtd@lists.infradead.org; Mon, 23 Jul 2018 09:02:39 +0000
Date: Mon, 23 Jul 2018 04:02:19 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: linux-mtd@lists.infradead.org, Stewart Smith <stewart@linux.vnet.ibm.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Message-ID: <1959109367.8330026.1532336539584.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH] mtd/powernv_flash: Enable partition support
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On certain systems, such as the Talos II, skiboot emits a partition
table for the main PNOR MTD device in the generated device tree.

Allow this partition table to be parsed and the partitions to be
exposed via MTD device partition nodes.

Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
---
 drivers/mtd/devices/powernv_flash.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/powernv_flash.c b/drivers/mtd/devices/powernv_flash.c
index c1312b141ae0..a2c6b30925c4 100644
--- a/drivers/mtd/devices/powernv_flash.c
+++ b/drivers/mtd/devices/powernv_flash.c
@@ -2,6 +2,7 @@
  * OPAL PNOR flash MTD abstraction
  *
  * Copyright IBM 2015
+ * Copyright Raptor Engineering, LLC 2018
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
@@ -259,8 +260,10 @@ static int powernv_flash_probe(struct platform_device *pdev)
 	/*
 	 * The current flash that skiboot exposes is one contiguous flash chip
 	 * with an ffs partition at the start, it should prove easier for users
-	 * to deal with partitions or not as they see fit
+	 * to deal with partitions or not as they see fit.  skiboot places this
+	 * on the first MTD partition.
 	 */
+	mtd_set_of_node(&data->mtd, dev->of_node);
 	return mtd_device_register(&data->mtd, NULL, 0);
 }
 
-- 
2.18.0
