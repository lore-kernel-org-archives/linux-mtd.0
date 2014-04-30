Received: from mail-by2lp0239.outbound.protection.outlook.com
 ([207.46.163.239] helo=na01-by2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WfMVZ-0002qu-JS
 for linux-mtd@lists.infradead.org; Wed, 30 Apr 2014 04:52:38 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH 1/2] mtd: print out the partition's read-only flag
Date: Wed, 30 Apr 2014 11:53:29 +0800
Message-ID: <1398830010-3628-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We may set a partition to be read only with DT property or kernel cmdline,
such as the kernel cmdline:
  mtdparts=50000000.nor:2m(boot)ro,2m(dtb),5m(kernel),-(test)

This patch prints out the partition's read-only flag in the boot precedure,
which makes us more clear about the read-only partition.

Before this patch, the partitions show like this:
	0x000000000000-0x000000200000 : "boot"
	0x000000200000-0x000000400000 : "dtb"
	0x000000400000-0x000000900000 : "kernel"
	0x000000900000-0x000002000000 : "test"

After this patch, the partitions show like this:

	0x000000000000-0x000000200000 : "boot"	 (Read-Only)
	0x000000200000-0x000000400000 : "dtb"
	0x000000400000-0x000000900000 : "kernel"
	0x000000900000-0x000002000000 : "test"

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/mtdpart.c |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 84f5866..f660658 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -458,9 +458,6 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
 	if (slave->mtd.size == MTDPART_SIZ_FULL)
 		slave->mtd.size = master->size - slave->offset;
 
-	printk(KERN_NOTICE "0x%012llx-0x%012llx : \"%s\"\n", (unsigned long long)slave->offset,
-		(unsigned long long)(slave->offset + slave->mtd.size), slave->mtd.name);
-
 	/* let's do some sanity checks */
 	if (slave->offset >= master->size) {
 		/* let's register it anyway to preserve ordering */
@@ -517,6 +514,12 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
 			part->name);
 	}
 
+	printk(KERN_NOTICE "0x%012llx-0x%012llx : \"%s\"\t%s\n",
+		(unsigned long long)slave->offset,
+		(unsigned long long)(slave->offset + slave->mtd.size),
+		slave->mtd.name,
+		slave->mtd.flags & MTD_WRITEABLE ? "" : " (Read-Only)");
+
 	slave->mtd.ecclayout = master->ecclayout;
 	slave->mtd.ecc_step_size = master->ecc_step_size;
 	slave->mtd.ecc_strength = master->ecc_strength;
-- 
1.7.2.rc3
