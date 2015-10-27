Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zqu7D-00075R-L3
 for linux-mtd@lists.infradead.org; Tue, 27 Oct 2015 02:36:00 +0000
Received: by pacfv9 with SMTP id fv9so215610747pac.3
 for <linux-mtd@lists.infradead.org>; Mon, 26 Oct 2015 19:35:39 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Frans Klaver <fransklaver@gmail.com>
Subject: [PATCH] mtd: physmap_of: assign parent for the concatenated MTD
Date: Mon, 26 Oct 2015 19:35:13 -0700
Message-Id: <1445913313-18917-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If there is more than one map region for this device, then the
concatenated MTD will not have a parent device assigned to it -- only
the sub-devices (which are not actually registered with the framework)
will have their parents assigned. Let's assign the concatenated device
correctly.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Frans Klaver <fransklaver@gmail.com>
---
This has a minor context conflict with [1], so I've just based this patch on
top of it. I could adjust the context, depending on which comes first.

(I noticed this while passing through drivers for [1])

[1] http://lists.infradead.org/pipermail/linux-mtd/2015-October/062825.html

 drivers/mtd/maps/physmap_of.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index 6ebe674262cc..305eaa4c15d4 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -309,6 +309,7 @@ static int of_flash_probe(struct platform_device *dev)
 	if (err)
 		goto err_out;
 
+	info->cmtd->dev.parent = &dev->dev;
 	info->cmtd->dev.of_node = dp;
 	part_probe_types = of_get_probes(dp);
 	if (!part_probe_types) {
-- 
2.6.0.rc2.230.g3dd15c0
