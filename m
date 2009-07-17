Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MRplI-0002NR-Gk
	for linux-mtd@lists.infradead.org; Fri, 17 Jul 2009 15:54:20 +0000
From: Wolfram Sang <w.sang@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mtd/physmap_of: use resource_size()
Date: Fri, 17 Jul 2009 17:54:14 +0200
Message-Id: <1247846054-25656-1-git-send-email-w.sang@pengutronix.de>
Cc: Wolfram Sang <w.sang@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
---
 drivers/mtd/maps/physmap_of.c |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index 45eee20..fd524ba 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -190,6 +190,7 @@ static int __devinit of_flash_probe(struct of_device *dev,
 	const u32 *p;
 	int reg_tuple_size;
 	struct mtd_info **mtd_list = NULL;
+	resource_size_t res_size;
 
 	reg_tuple_size = (of_n_addr_cells(dp) + of_n_size_cells(dp)) * sizeof(u32);
 
@@ -233,8 +234,8 @@ static int __devinit of_flash_probe(struct of_device *dev,
 			(unsigned long long)res.end);
 
 		err = -EBUSY;
-		info->list[i].res = request_mem_region(res.start, res.end -
-						       res.start + 1,
+		res_size = resource_size(&res);
+		info->list[i].res = request_mem_region(res.start, res_size,
 						       dev_name(&dev->dev));
 		if (!info->list[i].res)
 			goto err_out;
@@ -249,7 +250,7 @@ static int __devinit of_flash_probe(struct of_device *dev,
 
 		info->list[i].map.name = dev_name(&dev->dev);
 		info->list[i].map.phys = res.start;
-		info->list[i].map.size = res.end - res.start + 1;
+		info->list[i].map.size = res_size;
 		info->list[i].map.bankwidth = *width;
 
 		err = -ENOMEM;
-- 
1.6.3.1
