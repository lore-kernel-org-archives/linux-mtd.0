Received: from szxga02-in.huawei.com ([119.145.14.65])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z591l-0005FC-Fk
 for linux-mtd@lists.infradead.org; Wed, 17 Jun 2015 08:48:58 +0000
From: Sheng Yong <shengyong1@huawei.com>
To: <computersforpeace@gmail.com>, <dwmw2@infradead.org>
Subject: [PATCH 2/2] mtd: nandsim: fix double free
Date: Wed, 17 Jun 2015 08:45:13 +0000
Message-ID: <1434530713-81591-3-git-send-email-shengyong1@huawei.com>
In-Reply-To: <1434530713-81591-1-git-send-email-shengyong1@huawei.com>
References: <1434530713-81591-1-git-send-email-shengyong1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: richard@nod.at, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Do not call free_device() in init_nandsim, the caller - ns_init_module -
will take care of that if something goes wrong.

Signed-off-by: Sheng Yong <shengyong1@huawei.com>
---
 drivers/mtd/nand/nandsim.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 33e4064..9c655f1 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -730,8 +730,7 @@ static int init_nandsim(struct mtd_info *mtd)
 	/* Fill the partition_info structure */
 	if (parts_num > ARRAY_SIZE(ns->partitions)) {
 		NS_ERR("too many partitions.\n");
-		ret = -EINVAL;
-		goto error;
+		return -EINVAL;
 	}
 	remains = ns->geom.totsz;
 	next_offset = 0;
@@ -740,8 +739,7 @@ static int init_nandsim(struct mtd_info *mtd)
 
 		if (!part_sz || part_sz > remains) {
 			NS_ERR("bad partition size.\n");
-			ret = -EINVAL;
-			goto error;
+			return -EINVAL;
 		}
 		ns->partitions[i].name   = get_partition_name(i);
 		ns->partitions[i].offset = next_offset;
@@ -753,8 +751,7 @@ static int init_nandsim(struct mtd_info *mtd)
 	if (remains) {
 		if (parts_num + 1 > ARRAY_SIZE(ns->partitions)) {
 			NS_ERR("too many partitions.\n");
-			ret = -EINVAL;
-			goto error;
+			return -EINVAL;
 		}
 		ns->partitions[i].name   = get_partition_name(i);
 		ns->partitions[i].offset = next_offset;
@@ -789,24 +786,18 @@ static int init_nandsim(struct mtd_info *mtd)
 	printk("options: %#x\n",                ns->options);
 
 	if ((ret = alloc_device(ns)) != 0)
-		goto error;
+		return ret;
 
 	/* Allocate / initialize the internal buffer */
 	ns->buf.byte = kmalloc(ns->geom.pgszoob, GFP_KERNEL);
 	if (!ns->buf.byte) {
 		NS_ERR("init_nandsim: unable to allocate %u bytes for the internal buffer\n",
 			ns->geom.pgszoob);
-		ret = -ENOMEM;
-		goto error;
+		return -ENOMEM;
 	}
 	memset(ns->buf.byte, 0xFF, ns->geom.pgszoob);
 
 	return 0;
-
-error:
-	free_device(ns);
-
-	return ret;
 }
 
 /*
-- 
1.8.3.4
