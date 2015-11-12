Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwgKH-00026W-1l
 for linux-mtd@lists.infradead.org; Thu, 12 Nov 2015 01:05:21 +0000
Received: by pacdm15 with SMTP id dm15so46721442pac.3
 for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2015 17:05:00 -0800 (PST)
Date: Wed, 11 Nov 2015 17:04:57 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 devicetree@vger.kernel.org
Subject: [PATCH v2] mtd: assign mtd->dev.of_node when creating partition
 devices
Message-ID: <20151112010457.GE96199@google.com>
References: <1447287964-63309-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1447287964-63309-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Boris BREZILLON <boris.brezillon@free-electrons.com>

MTD partitions may have been created from a DT definition, and in this case
the ->of_node of the struct device embedded in mtd_info should point to
the DT node that was used to create the partition.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
v2: drop most of the get/put node handling; allow the MTD core to do
    this in {add,del}_mtd_device()

    depends on: http://patchwork.ozlabs.org/patch/543159/

v1: http://patchwork.ozlabs.org/patch/538838/

 drivers/mtd/mtdpart.c          | 1 +
 drivers/mtd/ofpart.c           | 2 +-
 include/linux/mtd/partitions.h | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index f8ba153f63bf..c2b6e967a160 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -391,6 +391,7 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
 	slave->mtd.dev.parent = IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER) ?
 				&master->dev :
 				master->dev.parent;
+	mtd_set_of_node(&slave->mtd, part->of_node);
 
 	slave->mtd._read = part_read;
 	slave->mtd._write = part_write;
diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
index f78d2aea5545..dacf4c405dec 100644
--- a/drivers/mtd/ofpart.c
+++ b/drivers/mtd/ofpart.c
@@ -111,6 +111,7 @@ static int parse_ofpart_partitions(struct mtd_info *master,
 		if (of_get_property(pp, "lock", &len))
 			(*pparts)[i].mask_flags |= MTD_POWERUP_LOCK;
 
+		(*pparts)[i].of_node = pp;
 		i++;
 	}
 
@@ -124,7 +125,6 @@ ofpart_fail:
 	       master->name, pp->full_name, mtd_node->full_name);
 	ret = -EINVAL;
 ofpart_none:
-	of_node_put(pp);
 	kfree(*pparts);
 	*pparts = NULL;
 	return ret;
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index 773975a3c9e6..282644c0c5c0 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -42,6 +42,7 @@ struct mtd_partition {
 	uint64_t offset;		/* offset within the master MTD space */
 	uint32_t mask_flags;		/* master MTD flags to mask out for this partition */
 	struct nand_ecclayout *ecclayout;	/* out of band layout for this partition (NAND only) */
+	struct device_node *of_node;	/* OF node attached to the partition */
 };
 
 #define MTDPART_OFS_RETAIN	(-3)
-- 
2.6.0.rc2.230.g3dd15c0
