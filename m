Received: from metis.ext.4.pengutronix.de ([92.198.50.35])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cbmOz-0006o5-ML
 for linux-mtd@lists.infradead.org; Thu, 09 Feb 2017 10:56:39 +0000
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH] mtd: Add partition device node to mtd partition devices
Date: Thu,  9 Feb 2017 11:50:24 +0100
Message-Id: <20170209105024.1579-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Sascha Hauer <s.hauer@pengutronix.de>

The user visible change here is that mtd partitions get an of_node link
in sysfs.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/mtd/mtdpart.c          | 1 +
 drivers/mtd/ofpart.c           | 1 +
 include/linux/mtd/partitions.h | 1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index fccdd49bb964..d0b919ab85c0 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -424,6 +424,7 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
 	slave->mtd.dev.parent = IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER) ?
 				&master->dev :
 				master->dev.parent;
+	slave->mtd.dev.of_node = part->of_node;
 
 	slave->mtd._read = part_read;
 	slave->mtd._write = part_write;
diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
index ede407d6e106..464470122493 100644
--- a/drivers/mtd/ofpart.c
+++ b/drivers/mtd/ofpart.c
@@ -108,6 +108,7 @@ static int parse_ofpart_partitions(struct mtd_info *master,
 
 		parts[i].offset = of_read_number(reg, a_cells);
 		parts[i].size = of_read_number(reg + a_cells, s_cells);
+		parts[i].of_node = pp;
 
 		partname = of_get_property(pp, "label", &len);
 		if (!partname)
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index 70736e1e6c8f..06df1e06b6e0 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -41,6 +41,7 @@ struct mtd_partition {
 	uint64_t size;			/* partition size */
 	uint64_t offset;		/* offset within the master MTD space */
 	uint32_t mask_flags;		/* master MTD flags to mask out for this partition */
+	struct device_node *of_node;
 };
 
 #define MTDPART_OFS_RETAIN	(-3)
-- 
2.11.0
