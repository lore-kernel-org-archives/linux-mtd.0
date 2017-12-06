Received: from imta21.fe.bosch.de ([139.15.243.226])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eMVXr-00068n-Ou
 for linux-mtd@lists.infradead.org; Wed, 06 Dec 2017 08:59:16 +0000
Received: from smtp6-v.fe.bosch.de (imta23.fe.bosch.de [139.15.243.227])
 by imta21.fe.bosch.de (Postfix) with ESMTP id D93ABC09B0
 for <linux-mtd@lists.infradead.org>; Wed,  6 Dec 2017 09:49:18 +0100 (CET)
From: Dirk Behme <dirk.behme@de.bosch.com>
To: <linux-mtd@lists.infradead.org>, Richard Weinberger <richard@nod.at>
CC: <manfred@colorfullife.com>, <dirk.behme@de.bosch.com>, Manfred Spraul
 <manfred.spraul@de.bosch.com>
Subject: [PATCH 3/5] mtdram: Allow to enable/disable flight recorder mode at
 runtime.
Date: Wed, 6 Dec 2017 09:50:37 +0100
Message-ID: <20171206085039.27164-4-dirk.behme@de.bosch.com>
In-Reply-To: <20171206085039.27164-1-dirk.behme@de.bosch.com>
References: <20171206085039.27164-1-dirk.behme@de.bosch.com>
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

From: Manfred Spraul <manfred@colorfullife.com>

The patch allows to enable/disable the flight recorder mode by
writing to the debugfs file.

Signed-off-by: Manfred Spraul <manfred.spraul@de.bosch.com>
Cc: Manfred Spraul <manfred@colorfullife.com>
---
 drivers/mtd/devices/mtdram.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/mtd/devices/mtdram.c b/drivers/mtd/devices/mtdram.c
index 1dc0a5ce0f07..a6f5a656eb94 100644
--- a/drivers/mtd/devices/mtdram.c
+++ b/drivers/mtd/devices/mtdram.c
@@ -87,8 +87,45 @@ static ssize_t nandrec_read_file(struct file *file, char __user *user_buf,
 	return r;
 }
 
+static ssize_t nandrec_write_file(struct file *file, const char __user *buf,
+				  size_t count, loff_t *ppos)
+{
+	ssize_t r;
+	char kbuf[8];
+
+	mutex_lock(&fr_mutex);
+
+	*ppos = 0;
+	memset(kbuf, 0, sizeof(kbuf));
+
+	r = debugfs_file_get(fr_dentry);
+	if (likely(!r)) {
+		r = simple_write_to_buffer(kbuf, sizeof(kbuf) - 1,
+					   ppos, buf, count);
+		debugfs_file_put(fr_dentry);
+	}
+
+	if (r > 0) {
+		unsigned long newval;
+		int ret;
+
+		ret = kstrtoul(kbuf, 0, &newval);
+		if (ret == 0)
+			fr_enabled = newval;
+		else
+			r = ret;
+	}
+	if (fr_enabled)
+		pr_info("MTDRAM flight recorder enabled.\n");
+	else
+		pr_info("MTDRAM flight recorder disabled.\n");
+	mutex_unlock(&fr_mutex);
+	return r;
+}
+
 static const struct file_operations fr_fops = {
 	.read =		nandrec_read_file,
+	.write =	nandrec_write_file,
 	.open =		simple_open,
 };
 
-- 
2.14.1
