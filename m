Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dzk6u-0002Qt-AR
 for linux-mtd@lists.infradead.org; Wed, 04 Oct 2017 13:53:18 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Cc: "Mario J. Rugiero" <mrugiero@gmail.com>
Subject: [PATCH 2/2] mtd: mtdpart: Create a symlink to the master debugfs dir
Date: Wed,  4 Oct 2017 15:52:39 +0200
Message-Id: <20171004135239.16316-2-boris.brezillon@free-electrons.com>
In-Reply-To: <20171004135239.16316-1-boris.brezillon@free-electrons.com>
References: <20171004135239.16316-1-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It's sometime hard to figure out which master device is attached to an
MTD partition, especially when this master device is not registered to
the device model.

Add a symlink to master's debugfs dir from the partition debugfs dir to
help with that.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/mtdpart.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index a308e707392d..6f81acdd7f34 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -21,6 +21,7 @@
  *
  */
 
+#include <linux/debugfs.h>
 #include <linux/module.h>
 #include <linux/types.h>
 #include <linux/kernel.h>
@@ -778,15 +779,18 @@ int add_mtd_partitions(struct mtd_info *master,
 {
 	struct mtd_part *slave;
 	uint64_t cur_offset = 0;
-	int i;
+	int ret = 0, i;
+	char *link;
 
 	printk(KERN_NOTICE "Creating %d MTD partitions on \"%s\":\n", nbparts, master->name);
+	link = kasprintf(GFP_KERNEL, "../%s", dev_name(&master->dev));
 
 	for (i = 0; i < nbparts; i++) {
 		slave = allocate_partition(master, parts + i, i, cur_offset);
 		if (IS_ERR(slave)) {
 			del_mtd_partitions(master);
-			return PTR_ERR(slave);
+			ret = PTR_ERR(slave);
+			break;
 		}
 
 		mutex_lock(&mtd_partitions_mutex);
@@ -798,10 +802,13 @@ int add_mtd_partitions(struct mtd_info *master,
 		if (parts[i].types)
 			mtd_parse_part(slave, parts[i].types);
 
+		debugfs_create_symlink("master", slave->mtd.dbg.dfs_dir, link);
 		cur_offset = slave->offset + slave->mtd.size;
 	}
 
-	return 0;
+	kfree(link);
+
+	return ret;
 }
 
 static DEFINE_SPINLOCK(part_parser_lock);
-- 
2.11.0
