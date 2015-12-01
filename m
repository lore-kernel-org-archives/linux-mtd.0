Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a3ig8-0001cs-5Y
 for linux-mtd@lists.infradead.org; Tue, 01 Dec 2015 11:01:02 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <computersforpeace@gmail.com>, <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, Dongsheng Yang
 <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v1 7/7] mtd: mtd_raid: implement ioctl for mtd raid
Date: Tue, 1 Dec 2015 18:52:37 +0800
Message-ID: <1448967157-17423-8-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1448967157-17423-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1448967157-17423-1-git-send-email-yangds.fnst@cn.fujitsu.com>
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

This is ioctl interface for mtd raid. Currently
we support two operations create and destroy.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 drivers/mtd/mtd_raid/ioctl.c | 137 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 137 insertions(+)
 create mode 100644 drivers/mtd/mtd_raid/ioctl.c

diff --git a/drivers/mtd/mtd_raid/ioctl.c b/drivers/mtd/mtd_raid/ioctl.c
new file mode 100644
index 0000000..22facee
--- /dev/null
+++ b/drivers/mtd/mtd_raid/ioctl.c
@@ -0,0 +1,137 @@
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
+#include <linux/compat.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+
+#include "mtd_raid.h"
+
+static int ioctl_create_check(int *mtd_nums, int dev_count, size_t substripe_size)
+{
+	int i = 0;
+
+	if (dev_count < 0 || substripe_size < 0)
+		return -EINVAL;
+
+	for (i = 0; i < dev_count; i++) {
+		if (mtd_nums[i] < 0)
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
+int mtd_raid_ioctl_create(struct mtd_raid_create_req *create_req, int *mtd_nums)
+{
+	enum mtd_raid_level raid_level = create_req->raid_level;
+	int dev_count = create_req->dev_count;
+	int substripe_size = create_req->substripe_size;
+
+	if (ioctl_create_check(mtd_nums, dev_count, substripe_size))
+		return -EINVAL;
+
+	return mtd_raid_create(raid_level, mtd_nums, dev_count, substripe_size);
+}
+
+int mtd_raid_ioctl_destroy(struct mtd_raid_destroy_req *destroy_req)
+{
+	struct mtd_raid *raid = NULL;
+
+	raid = mtd_raid_list_get(destroy_req->mtd_num);
+	if (!raid)
+		return -EINVAL;
+
+	return mtd_raid_destroy(raid);
+}
+
+static long ctrl_cdev_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
+{
+	int err = 0;
+	void __user *argp = (void __user *)arg;
+
+	if (!capable(CAP_SYS_RESOURCE))
+		return -EPERM;
+
+	switch (cmd) {
+	case MTD_RAID_IOC_CREATE:
+	{
+		struct mtd_raid_create_req *req;
+		int dev_count = 0;
+		int *mtd_nums = NULL;
+
+		req = memdup_user(argp, sizeof(*req));
+		if (IS_ERR(req)) {
+			err = PTR_ERR(req);
+			goto out;
+		}
+
+		dev_count = req->dev_count;
+		mtd_nums = memdup_user(argp + sizeof(*req), sizeof(int) * dev_count);
+		if (IS_ERR(mtd_nums)) {
+			err = PTR_ERR(mtd_nums);
+			goto out;
+		}
+
+		err = mtd_raid_ioctl_create(req, mtd_nums);
+		break;
+	}
+	case MTD_RAID_IOC_DESTROY:
+	{
+		struct mtd_raid_destroy_req *req;
+
+		req = memdup_user(argp, sizeof(*req));
+		if (IS_ERR(req)) {
+			err = PTR_ERR(req);
+			goto out;
+		}
+
+		err = mtd_raid_ioctl_destroy(req);
+		break;
+	}
+
+	default:
+		err = -ENOTTY;
+		break;
+	}
+
+out:
+	return err;
+}
+
+#ifdef CONFIG_COMPAT
+static long ctrl_cdev_compat_ioctl(struct file *file, unsigned int cmd,
+				   unsigned long arg)
+{
+	unsigned long translated_arg = (unsigned long)compat_ptr(arg);
+
+	return ctrl_cdev_ioctl(file, cmd, translated_arg);
+}
+#else
+#define ctrl_cdev_compat_ioctl NULL
+#endif
+
+const struct file_operations mtd_raid_ctrl_cdev_operations = {
+	.owner          = THIS_MODULE,
+	.unlocked_ioctl = ctrl_cdev_ioctl,
+	.compat_ioctl   = ctrl_cdev_compat_ioctl,
+	.llseek		= no_llseek,
+};
-- 
1.8.4.2
