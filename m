Received: from hauke-m.de ([2001:41d0:8:b27b::1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bELjn-0006mr-Jj
 for linux-mtd@lists.infradead.org; Sat, 18 Jun 2016 19:17:00 +0000
From: Hauke Mehrtens <hauke@hauke-m.de>
To: dwmw2@infradead.org,
	computersforpeace@gmail.com
Cc: linux-mtd@lists.infradead.org,
	Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH] mtd: add of_node in partition parser
Date: Sat, 18 Jun 2016 21:16:33 +0200
Message-Id: <1466277393-14749-1-git-send-email-hauke@hauke-m.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This adds the of_node to each partition when it was defined in device
tree. This makes it possible to define additional attributes at each
partition for example which file system or other layer to use.

Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 drivers/mtd/mtdpart.c          | 1 +
 drivers/mtd/ofpart.c           | 2 ++
 include/linux/mtd/partitions.h | 1 +
 3 files changed, 4 insertions(+)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 1f13e32..2f557ab 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -412,6 +412,7 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
 	slave->mtd.dev.parent = IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER) ?
 				&master->dev :
 				master->dev.parent;
+	slave->mtd.dev.of_node = part->of_node;
 
 	slave->mtd._read = part_read;
 	slave->mtd._write = part_write;
diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
index ede407d..de7d66d 100644
--- a/drivers/mtd/ofpart.c
+++ b/drivers/mtd/ofpart.c
@@ -120,6 +120,8 @@ static int parse_ofpart_partitions(struct mtd_info *master,
 		if (of_get_property(pp, "lock", &len))
 			parts[i].mask_flags |= MTD_POWERUP_LOCK;
 
+		parts[i].of_node = pp;
+
 		i++;
 	}
 
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index 70736e1..b97315e 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -41,6 +41,7 @@ struct mtd_partition {
 	uint64_t size;			/* partition size */
 	uint64_t offset;		/* offset within the master MTD space */
 	uint32_t mask_flags;		/* master MTD flags to mask out for this partition */
+	struct device_node *of_node;	/* device tree node of this partition */
 };
 
 #define MTDPART_OFS_RETAIN	(-3)
-- 
2.8.1
