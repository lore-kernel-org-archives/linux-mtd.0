Received: from mail.ispras.ru ([83.149.199.45])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZQ18h-0007tW-Rd
 for linux-mtd@lists.infradead.org; Thu, 13 Aug 2015 22:38:24 +0000
From: Alexey Khoroshilov <khoroshilov@ispras.ru>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Cc: Alexey Khoroshilov <khoroshilov@ispras.ru>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org
Subject: [PATCH] mtd: nettel: do not ignore mtd_device_register() failure in
 nettel_init()
Date: Fri, 14 Aug 2015 01:37:47 +0300
Message-Id: <1439505467-32746-1-git-send-email-khoroshilov@ispras.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If mtd_device_register() fails in nettel_init(), iomap left mapped.

The patch adds failure handling for mtd_device_register().

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Alexey Khoroshilov <khoroshilov@ispras.ru>
---
 drivers/mtd/maps/nettel.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/maps/nettel.c b/drivers/mtd/maps/nettel.c
index eadcfffc4f9c..a577ef8553d0 100644
--- a/drivers/mtd/maps/nettel.c
+++ b/drivers/mtd/maps/nettel.c
@@ -385,20 +385,28 @@ static int __init nettel_init(void)
 	}
 	rc = mtd_device_register(intel_mtd, nettel_intel_partitions,
 				 num_intel_partitions);
+	if (rc)
+		goto out_map_destroy;
 #endif
 
 	if (amd_mtd) {
 		rc = mtd_device_register(amd_mtd, nettel_amd_partitions,
 					 num_amd_partitions);
+		if (rc)
+			goto out_mtd_unreg;
 	}
 
 #ifdef CONFIG_MTD_CFI_INTELEXT
 	register_reboot_notifier(&nettel_notifier_block);
 #endif
 
-	return(rc);
+	return rc;
 
+out_mtd_unreg:
 #ifdef CONFIG_MTD_CFI_INTELEXT
+	mtd_device_unregister(intel_mtd);
+out_map_destroy:
+	map_destroy(intel_mtd);
 out_unmap1:
 	iounmap(nettel_intel_map.virt);
 #endif
@@ -407,8 +415,7 @@ out_unmap2:
 	iounmap(nettel_mmcrp);
 	iounmap(nettel_amd_map.virt);
 
-	return(rc);
-
+	return rc;
 }
 
 /****************************************************************************/
-- 
1.9.1
