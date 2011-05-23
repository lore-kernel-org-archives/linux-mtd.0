Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QORO5-0002TQ-3n
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:25:25 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so5098499wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:25:20 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 38/62] mtd/diskonchip: convert to mtd_device_register()
Date: Mon, 23 May 2011 10:23:19 +0100
Message-Id: <1306142623-24952-39-git-send-email-jamie@jamieiles.com>
In-Reply-To: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
References: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
Cc: Jamie Iles <jamie@jamieiles.com>, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Convert to mtd_device_register() and remove the CONFIG_MTD_PARTITIONS
preprocessor conditionals as partitioning is always available.

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 drivers/mtd/nand/diskonchip.c |   18 +++++++-----------
 1 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/diskonchip.c b/drivers/mtd/nand/diskonchip.c
index 657b9f4..7837728 100644
--- a/drivers/mtd/nand/diskonchip.c
+++ b/drivers/mtd/nand/diskonchip.c
@@ -1360,11 +1360,9 @@ static int __init nftl_scan_bbt(struct mtd_info *mtd)
 	   At least as nand_bbt.c is currently written. */
 	if ((ret = nand_scan_bbt(mtd, NULL)))
 		return ret;
-	add_mtd_device(mtd);
-#ifdef CONFIG_MTD_PARTITIONS
+	mtd_device_register(mtd, NULL, 0);
 	if (!no_autopart)
-		add_mtd_partitions(mtd, parts, numparts);
-#endif
+		mtd_device_register(mtd, parts, numparts);
 	return 0;
 }
 
@@ -1419,11 +1417,9 @@ static int __init inftl_scan_bbt(struct mtd_info *mtd)
 	   autopartitioning, but I want to give it more thought. */
 	if (!numparts)
 		return -EIO;
-	add_mtd_device(mtd);
-#ifdef CONFIG_MTD_PARTITIONS
+	mtd_device_register(mtd, NULL, 0);
 	if (!no_autopart)
-		add_mtd_partitions(mtd, parts, numparts);
-#endif
+		mtd_device_register(mtd, parts, numparts);
 	return 0;
 }
 
@@ -1678,9 +1674,9 @@ static int __init doc_probe(unsigned long physadr)
 		/* DBB note: i believe nand_release is necessary here, as
 		   buffers may have been allocated in nand_base.  Check with
 		   Thomas. FIX ME! */
-		/* nand_release will call del_mtd_device, but we haven't yet
-		   added it.  This is handled without incident by
-		   del_mtd_device, as far as I can tell. */
+		/* nand_release will call mtd_device_unregister, but we
+		   haven't yet added it.  This is handled without incident by
+		   mtd_device_unregister, as far as I can tell. */
 		nand_release(mtd);
 		kfree(mtd);
 		goto fail;
-- 
1.7.4.4
