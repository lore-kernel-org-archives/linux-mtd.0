Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKkux-0004O1-64
 for linux-mtd@lists.infradead.org; Thu, 30 Jul 2015 10:18:28 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 stable@vger.kernel.org
Subject: [PATCH] mtd: mtdpart: fix add_mtd_partitions error path
Date: Thu, 30 Jul 2015 12:18:03 +0200
Message-Id: <1438251483-20888-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If we fail to allocate a partition structure in the middle of the partition
creation process, the already allocated partitions are never removed, which
means they are still present in the partition list and their resources are
never freed.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: stable@vger.kernel.org
---
 drivers/mtd/mtdpart.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index cafdb88..919a936 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -664,8 +664,10 @@ int add_mtd_partitions(struct mtd_info *master,
 
 	for (i = 0; i < nbparts; i++) {
 		slave = allocate_partition(master, parts + i, i, cur_offset);
-		if (IS_ERR(slave))
+		if (IS_ERR(slave)) {
+			del_mtd_partitions(master);
 			return PTR_ERR(slave);
+		}
 
 		mutex_lock(&mtd_partitions_mutex);
 		list_add(&slave->list, &mtd_partitions);
-- 
1.9.1
