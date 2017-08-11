Received: from bran.ispras.ru ([83.149.199.196] helo=smtp.ispras.ru)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dg9TV-0003ul-8X
 for linux-mtd@lists.infradead.org; Fri, 11 Aug 2017 12:55:39 +0000
From: Anton Vasilyev <vasilyev@ispras.ru>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Anton Vasilyev <vasilyev@ispras.ru>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 ldv-project@linuxtesting.org
Subject: [PATCH] mtd: plat-ram: use release_mem_region instead of
 release_resource
Date: Fri, 11 Aug 2017 15:55:03 +0300
Message-Id: <1502456103-1576-1-git-send-email-vasilyev@ispras.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use api pair of request_mem_region and release_mem_region
instead of release_resource.

Found by Linux Driver Verification project (linuxtesting.

Signed-off-by: Anton Vasilyev <vasilyev@ispras.ru>
---
 drivers/mtd/maps/plat-ram.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/maps/plat-ram.c b/drivers/mtd/maps/plat-ram.c
index 5157289..baaf146 100644
--- a/drivers/mtd/maps/plat-ram.c
+++ b/drivers/mtd/maps/plat-ram.c
@@ -82,6 +82,7 @@ static inline void platram_setrw(struct platram_info *info, int to)
 static int platram_remove(struct platform_device *pdev)
 {
 	struct platram_info *info = to_platram_info(pdev);
+	resource_size_t res_size;
 
 	dev_dbg(&pdev->dev, "removing device\n");
 
@@ -100,8 +101,8 @@ static int platram_remove(struct platform_device *pdev)
 	/* release resources */
 
 	if (info->area) {
-		release_resource(info->area);
-		kfree(info->area);
+		res_size = resource_size(info->area)
+		release_mem_region(info->area->start, res_size);
 	}
 
 	if (info->map.virt != NULL)
-- 
2.7.4
