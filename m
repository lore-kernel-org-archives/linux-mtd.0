Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rd4g7-0001Lk-Dn
 for linux-mtd@lists.infradead.org; Tue, 20 Dec 2011 18:44:44 +0000
From: Mike Dunn <mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] MTD: pass driver methods through partition wrappers on
 unpartitioned devices
Date: Tue, 20 Dec 2011 10:42:15 -0800
Message-Id: <1324406536-18250-2-git-send-email-mikedunn@newsguy.com>
In-Reply-To: <1324406536-18250-1-git-send-email-mikedunn@newsguy.com>
References: <1324406536-18250-1-git-send-email-mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Mike Dunn <mikedunn@newsguy.com>,
 Scott Branden <sbranden@broadcom.com>, Wan ZongShun <mcuos.com@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Manuel Lauss <manuel.lauss@googlemail.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Vimal Singh <vimal.newwork@gmail.com>, Ralf Baechle <ralf@linux-mips.org>,
 Jiandong Zheng <jdzheng@broadcom.com>, Andres Salomon <dilinger@queued.net>,
 Olof Johansson <olof@lixom.net>, Jamie Iles <jamie@jamieiles.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ensure driver methods always go through the wrapper functions in the
partitioning code by creating a single "partition" on otherwise unpartitioned
devices.

Tested with nandsim, onenand_sim, and the diskonchip g4 nand driver (currently
out-of-tree).

Signed-off-by: Mike Dunn <mikedunn@newsguy.com>
---
 drivers/mtd/mtdcore.c |   17 ++++++++++++++---
 drivers/mtd/mtdpart.c |   10 +++++++---
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index b01993e..4ac1962 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -477,10 +477,21 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char **types,
 	if (err > 0) {
 		err = add_mtd_partitions(mtd, real_parts, err);
 		kfree(real_parts);
+
 	} else if (err == 0) {
-		err = add_mtd_device(mtd);
-		if (err == 1)
-			err = -ENODEV;
+		/*
+		 * For unpartitioned devices, create a single "partition" that
+		 * spans the entire device, so that driver methods go through
+		 * partition wrappers in all cases.
+		 */
+		struct mtd_partition single_part = {
+			.name = (char *)mtd->name,
+			.offset = 0,
+			.size = mtd->size,
+			.mask_flags = 0,
+			.ecclayout = mtd->ecclayout,
+		};
+		err = add_mtd_partitions(mtd, &single_part, 1);
 	}
 
 	return err;
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index a0bd2de..81975a5 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -665,9 +665,11 @@ int add_mtd_partitions(struct mtd_info *master,
 {
 	struct mtd_part *slave;
 	uint64_t cur_offset = 0;
-	int i;
+	int i, ret;
 
-	printk(KERN_NOTICE "Creating %d MTD partitions on \"%s\":\n", nbparts, master->name);
+	if (nbparts > 1)
+		printk(KERN_NOTICE "Creating %d MTD partitions on \"%s\":\n",
+		       nbparts, master->name);
 
 	for (i = 0; i < nbparts; i++) {
 		slave = allocate_partition(master, parts + i, i, cur_offset);
@@ -678,7 +680,9 @@ int add_mtd_partitions(struct mtd_info *master,
 		list_add(&slave->list, &mtd_partitions);
 		mutex_unlock(&mtd_partitions_mutex);
 
-		add_mtd_device(&slave->mtd);
+		ret = add_mtd_device(&slave->mtd);
+		if (ret == 1)
+			return -ENODEV;
 
 		cur_offset = slave->offset + slave->mtd.size;
 	}
-- 
1.7.3.4
