Received: from mail.rptsys.com ([192.119.205.245])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f0Btm-00014p-Gc
 for linux-mtd@lists.infradead.org; Sun, 25 Mar 2018 20:05:52 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id E494B641431
 for <linux-mtd@lists.infradead.org>; Sun, 25 Mar 2018 15:05:03 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id xr4lft5A4Li7 for <linux-mtd@lists.infradead.org>;
 Sun, 25 Mar 2018 15:05:03 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 06B29641435
 for <linux-mtd@lists.infradead.org>; Sun, 25 Mar 2018 15:05:03 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id ft311VfRFbub for <linux-mtd@lists.infradead.org>;
 Sun, 25 Mar 2018 15:05:02 -0500 (CDT)
Received: from vali.starlink.edu (vali.starlink.edu [192.168.3.21])
 by mail.rptsys.com (Postfix) with ESMTP id 31854641431
 for <linux-mtd@lists.infradead.org>; Sun, 25 Mar 2018 15:05:02 -0500 (CDT)
Date: Sun, 25 Mar 2018 15:05:01 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: linux-mtd@lists.infradead.org
Message-ID: <746862757.61253.1522008301855.JavaMail.zimbra@raptorengineeringinc.com>
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
---
 drivers/mtd/devices/powernv_flash.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/devices/powernv_flash.c b/drivers/mtd/devices/powernv_flash.c
index 26f9feaa5d17..f76045f78221 100644
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
@@ -47,6 +48,8 @@ enum flash_op {
 	FLASH_OP_ERASE,
 };
 
+static char const * const part_probes[] = { "ofpart", NULL };
+
 /*
  * Don't return -ERESTARTSYS if we can't get a token, the MTD core
  * might have split up the call from userspace and called into the
@@ -267,9 +270,14 @@ static int powernv_flash_probe(struct platform_device *pdev)
 	/*
 	 * The current flash that skiboot exposes is one contiguous flash chip
 	 * with an ffs partition at the start, it should prove easier for users
-	 * to deal with partitions or not as they see fit
+	 * to deal with partitions or not as they see fit.  skitboot places this
+	 * on the first MTD partition.
+	 *
+	 * Certain partitions may also be exposed to the host, such as the boot
+	 * kernel firmware partition.
 	 */
-	return mtd_device_register(&data->mtd, NULL, 0);
+	mtd_set_of_node(&data->mtd, dev->of_node);
+	return mtd_device_parse_register(&data->mtd, part_probes, NULL, NULL, 0);
 }
 
 /**
-- 
2.16.1
