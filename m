Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a7fs7-00005N-LZ
 for linux-mtd@lists.infradead.org; Sat, 12 Dec 2015 08:49:48 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <shengyong1@huawei.com>, <richard@nod.at>,
 <boris.brezillon@free-electrons.com>, <linux-cris-kernel@axis.com>,
 <starvik@axis.com>, <jesper.nilsson@axis.com>, <jschultz@xes-inc.com>,
 <ard.biesheuvel@linaro.org>, <asierra@xes-inc.com>,
 <colin.king@canonical.com>, <fabf@skynet.be>,
 <linux-mtd@lists.infradead.org>, <dmitry.torokhov@gmail.com>
CC: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v2 5/7] mtd: mtd_raid: introduce raid0 implementation
Date: Sat, 12 Dec 2015 16:41:05 +0800
Message-ID: <1449909667-7759-6-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1449909667-7759-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1449909667-7759-1-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is implementation of raid0, the main work of it
is mapping logical address to physical address.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 drivers/mtd/mtd_raid/raid0.c | 136 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 136 insertions(+)
 create mode 100644 drivers/mtd/mtd_raid/raid0.c

diff --git a/drivers/mtd/mtd_raid/raid0.c b/drivers/mtd/mtd_raid/raid0.c
new file mode 100644
index 0000000..d72a6b7
--- /dev/null
+++ b/drivers/mtd/mtd_raid/raid0.c
@@ -0,0 +1,136 @@
+/*
+ * This file is part of MTD RAID.
+ *
+ * Copyright (C) 2015 Dongsheng Yang. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published by
+ * the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program; if not, write to the Free Software Foundation, Inc., 51
+ * Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
+ *
+ * Authors: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
+ */
+
+/**
+ * This file implement raid0.
+ * RAID0:
+ *
+ * Flash A:
+ * 	------------------------------
+ * 	|  A1   |  A2   | ... |  An  |
+ * 	------------------------------
+ * Flash B:
+ * 	------------------------------
+ * 	|  B1   |  B2   | ... |  Bn  |
+ * 	------------------------------
+ * Flash C:
+ * 	------------------------------
+ * 	|  C1   |  C2   | ... |  Cn  |
+ * 	------------------------------
+ *
+ * RAID0:
+ * 	-----------------------------------------------------------------------
+ * 	|  A1   |  B1  |  C1  |  A2  |  B2  |  C2  | ... |  An  |  Bn  |  Cn  |
+ * 	-----------------------------------------------------------------------
+ *
+ * Detail to see:
+ * https://en.wikipedia.org/wiki/Standard_RAID_levels
+ */
+
+#include <linux/slab.h>
+#include <linux/kthread.h>
+
+#include "mtd_raid.h"
+
+static int raid0_logical_to_physical(struct mtd_raid *raid, loff_t from, size_t len, int copy_num,
+			      int *devid, loff_t *subdev_off, size_t *size)
+{
+	loff_t stripe_size, stripe_offs, stripe_num, substripe_offs, substripe_num;
+
+	stripe_size = raid->substripe_size * raid->npebs_per_leb;
+	stripe_offs = do_div(from, stripe_size);
+	stripe_num = from;
+	substripe_offs = do_div(stripe_offs, raid->substripe_size);
+	substripe_num = stripe_offs;
+
+	*devid = substripe_num;
+	*subdev_off = stripe_num * raid->substripe_size + substripe_offs;
+	*size = len;
+	if (*size > raid->substripe_size - substripe_offs)
+		*size = raid->substripe_size - substripe_offs;
+
+	return 0;
+}
+
+struct mtd_raid *mtd_raid0_create(int dev_count, size_t substripe_size)
+{
+	struct mtd_raid0 *raid0 = NULL;
+	struct mtd_raid *raid = NULL;
+
+	raid0 = kzalloc(sizeof(struct mtd_raid0) + sizeof(struct mtd_raid_dev) * dev_count, GFP_KERNEL);
+	if (!raid0)
+		goto out;
+
+	raid = &raid0->raid;
+	raid->raid_level = MTD_RAID_LEVEL_RAID0;
+	raid->ops = &mtd_raid0_ops;
+	raid->ncopies = 1;
+	raid->npebs_per_leb = dev_count;
+
+	return &raid0->raid;
+out:
+	return NULL;
+}
+
+static int raid0_init(struct mtd_raid *raid,
+			    int dev_count, size_t substripe_size)
+{
+	int ret = 0;
+	int i = 0;
+	int raid_id = 0;
+	struct mtd_info *mtd = &raid->mtd;
+	struct mtd_info *subdev0 = raid->devs[0].mtd;
+	struct mtd_info *subdev = NULL;
+
+	raid_id = mtd_raid_list_register(MTD_RAID_LEVEL_RAID0, raid);
+	sprintf(raid->name, "mtd0-%d", raid_id);
+	mtd->name = raid->name;
+
+	for (i = 0; i < dev_count; i++) {
+		subdev = raid->devs[i].mtd;
+		if (subdev0->size != subdev->size) {
+			pr_err("Incompatible size on \"%s\"",
+			       subdev->name);
+			ret = -EINVAL;
+			goto out;
+		}
+
+		mtd->size += subdev->size;
+		mtd->erasesize += subdev->erasesize;
+	}
+out:
+	return ret;
+}
+
+
+void raid0_destroy(struct mtd_raid *mtd_raid)
+{
+	struct mtd_raid0 *raid0 = MTD_RAID_RAID0(mtd_raid);
+
+	mtd_raid_list_unregister(&raid0->raid);
+	kfree(raid0);
+}
+
+const struct mtd_raid_operations mtd_raid0_ops = {
+	.init    = raid0_init,
+	.destroy = raid0_destroy,
+	.logical_to_physical  = raid0_logical_to_physical,
+};
-- 
1.8.4.2
