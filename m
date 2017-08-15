Received: from bran.ispras.ru ([83.149.199.196] helo=smtp.ispras.ru)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dharS-0004qi-Ax
 for linux-mtd@lists.infradead.org; Tue, 15 Aug 2017 12:22:20 +0000
From: Anton Vasilyev <vasilyev@ispras.ru>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Anton Vasilyev <vasilyev@ispras.ru>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 ldv-project@linuxtesting.org
Subject: [PATCH v1] mtd: plat-ram: use release_mem_region instead of
 release_resource
Date: Tue, 15 Aug 2017 15:21:34 +0300
Message-Id: <1502799694-669-1-git-send-email-vasilyev@ispras.ru>
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
v1: Fix commit based on Boris Brezillon review
---
 drivers/mtd/maps/plat-ram.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/maps/plat-ram.c b/drivers/mtd/maps/plat-ram.c
index 5157289..90bc87f 100644
--- a/drivers/mtd/maps/plat-ram.c
+++ b/drivers/mtd/maps/plat-ram.c
@@ -100,8 +100,8 @@ static int platram_remove(struct platform_device *pdev)
 	/* release resources */
 
 	if (info->area) {
-		release_resource(info->area);
-		kfree(info->area);
+		release_mem_region(info->area->start,
+				resource_size(info->area));
 	}
 
 	if (info->map.virt != NULL)
-- 
2.7.4
