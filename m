Received: from imta21.fe.bosch.de ([139.15.243.226])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eMVXr-00068Z-Oz
 for linux-mtd@lists.infradead.org; Wed, 06 Dec 2017 08:59:22 +0000
Received: from smtp6-v.fe.bosch.de (imta24.fe.bosch.de [139.15.243.27])
 by imta21.fe.bosch.de (Postfix) with ESMTP id C3D89C09AE
 for <linux-mtd@lists.infradead.org>; Wed,  6 Dec 2017 09:49:18 +0100 (CET)
From: Dirk Behme <dirk.behme@de.bosch.com>
To: <linux-mtd@lists.infradead.org>, Richard Weinberger <richard@nod.at>
CC: <manfred@colorfullife.com>, <dirk.behme@de.bosch.com>, Manfred Spraul
 <manfred.spraul@de.bosch.com>
Subject: [PATCH 4/5] mtdram: Convert the flight recorder to a ring buffer.
Date: Wed, 6 Dec 2017 09:50:38 +0100
Message-ID: <20171206085039.27164-5-dirk.behme@de.bosch.com>
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

In flight recorder mode, all erase and write operations are logged.
The patch converts the internal buffer to a ring buffer, i.e.
it is not necessary anymore to read the complete buffer in one
syscall.

Signed-off-by: Manfred Spraul <manfred.spraul@de.bosch.com>
Cc: Manfred Spraul <manfred@colorfullife.com>
---
 drivers/mtd/devices/mtdram.c | 119 ++++++++++++++++++++++++++++++++-----------
 1 file changed, 90 insertions(+), 29 deletions(-)

diff --git a/drivers/mtd/devices/mtdram.c b/drivers/mtd/devices/mtdram.c
index a6f5a656eb94..202696bc92ef 100644
--- a/drivers/mtd/devices/mtdram.c
+++ b/drivers/mtd/devices/mtdram.c
@@ -38,45 +38,101 @@ MODULE_PARM_DESC(fr_enabled, "Set the initial enabled/disabled status");
 #endif
 
 static char *fr_buffer;
-static int fr_pos;
+static int fr_head;
+static int fr_tail;
 static struct dentry *fr_dentry;
 
 static DEFINE_MUTEX(fr_mutex);
 static DECLARE_WAIT_QUEUE_HEAD(fr_wait);
 
+static int nandrec_available_read(void)
+{
+	if (fr_head >= fr_tail)
+		return fr_head - fr_tail;
+
+	return fr_head + FR_BUFFER_TOTAL_SIZE - fr_tail;
+}
+
+static int nandrec_available_write(void)
+{
+	return FR_BUFFER_TOTAL_SIZE
+		- nandrec_available_read() - FR_BUFFER_MARGIN;
+}
+
+static void nandrec_advance_head(int count)
+{
+	WARN_ON(count > nandrec_available_write());
+
+	fr_head += count;
+	if (fr_head > FR_BUFFER_TOTAL_SIZE)
+		fr_head -= FR_BUFFER_TOTAL_SIZE;
+}
+
+static void nandrec_advance_tail(int count)
+{
+	WARN_ON(count > nandrec_available_read());
+
+	fr_tail += count;
+	if (fr_tail > FR_BUFFER_TOTAL_SIZE)
+		fr_tail -= FR_BUFFER_TOTAL_SIZE;
+
+	if (fr_tail == fr_head) {
+		fr_tail = 0;
+		fr_head = 0;
+	}
+}
+
 static ssize_t nandrec_read_file(struct file *file, char __user *user_buf,
 				 size_t count, loff_t *ppos)
 {
 	ssize_t r;
+	int max_data;
 
 	mutex_lock(&fr_mutex);
 
-	/* Every read must read all available data */
-	if (count < fr_pos) {
-		r = -EINVAL;
-		goto out_unlock;
-	}
+	max_data = nandrec_available_read();
 
-	if (fr_pos == 0) {
+	if (max_data == 0) {
 		r = 0;
 		goto out_unlock;
 	}
 
+	if (count > max_data)
+		count = max_data;
+
 	*ppos = 0;
 
 	r = debugfs_file_get(fr_dentry);
-	count = fr_pos;
 	if (likely(!r)) {
-		r = simple_read_from_buffer(user_buf, count, ppos, fr_buffer,
-					    FR_BUFFER_TOTAL_SIZE);
+		loff_t rpos;
+
+		rpos = fr_tail;
+		if (fr_tail + count > FR_BUFFER_TOTAL_SIZE) {
+			ssize_t tmp;
+
+			tmp = FR_BUFFER_TOTAL_SIZE - fr_tail;
+			r = simple_read_from_buffer(user_buf, tmp,
+						    &rpos, fr_buffer,
+						    FR_BUFFER_TOTAL_SIZE);
+			if (r == tmp) {
+				rpos = 0;
+				tmp = simple_read_from_buffer(user_buf + tmp,
+							count - tmp,
+							&rpos, fr_buffer,
+							FR_BUFFER_TOTAL_SIZE);
+				if (tmp > 0)
+					r += tmp;
+			}
+		} else {
+			r = simple_read_from_buffer(user_buf, count,
+						    &rpos, fr_buffer,
+						    FR_BUFFER_TOTAL_SIZE);
+		}
 		debugfs_file_put(fr_dentry);
 	}
 
-	/* Every read must read all available data */
-	WARN_ON(fr_pos != r);
-
-	/* Every read clears the kernel buffer */
-	fr_pos = 0;
+	if (r > 0)
+		nandrec_advance_tail(r);
 
 	/* if someone waits, wake him up */
 	if (waitqueue_active(&fr_wait))
@@ -137,31 +193,39 @@ static const struct file_operations fr_fops = {
 
 static void write_u32(u32 data)
 {
-	u32 *target = (u32 *)(fr_buffer + fr_pos);
+	u32 *target = (u32 *)(fr_buffer + fr_head);
 
 	if (fr_enabled) {
 		*target = cpu_to_le32(data);
-		fr_pos += round_up(sizeof(u32), 8);
+		nandrec_advance_head(round_up(sizeof(u32), 8));
 	}
 }
 
 static void write_u64(u64 data)
 {
-	u64 *target = (u64 *)(fr_buffer + fr_pos);
+	u64 *target = (u64 *)(fr_buffer + fr_head);
 
 	if (fr_enabled) {
 		*target = cpu_to_le64(data);
-		fr_pos += round_up(sizeof(u64), 8);
+		nandrec_advance_head(round_up(sizeof(u64), 8));
 	}
 }
 
 static void write_blob(const u_char *data, int len)
 {
-	u32 *target = (u32 *)(fr_buffer + fr_pos);
+	u32 *target = (u32 *)(fr_buffer + fr_head);
 
 	if (fr_enabled) {
-		memcpy(target, data, len);
-		fr_pos += round_up(len, 8);
+		if (fr_head + len > FR_BUFFER_TOTAL_SIZE) {
+			int p1;
+
+			p1 = FR_BUFFER_TOTAL_SIZE - fr_head;
+			memcpy(target, data, p1);
+			memcpy(fr_buffer, data + p1, len - p1);
+		} else {
+			memcpy(target, data, len);
+		}
+		nandrec_advance_head(round_up(len, 8));
 	}
 }
 
@@ -170,12 +234,11 @@ static void start_write(int size)
 	mutex_lock(&fr_mutex);
 
 	if (fr_enabled) {
-		while (fr_pos + size + 2*8 >=
-				FR_BUFFER_TOTAL_SIZE - FR_BUFFER_MARGIN) {
+		while (nandrec_available_write() < size + 2*8) {
 			DEFINE_WAIT(wait);
 
-			pr_info("%p: Waiting - write count %d, current %d.\n",
-				current, size, fr_pos);
+			pr_info("%p: Waiting - write count %d, current %d/%d.\n",
+				current, size, fr_tail, fr_head);
 
 			prepare_to_wait(&fr_wait, &wait, TASK_UNINTERRUPTIBLE);
 
@@ -191,10 +254,8 @@ static void start_write(int size)
 
 static void end_write(void)
 {
-	if (fr_enabled) {
+	if (fr_enabled)
 		write_u32(MAGIC_END);
-		WARN_ON(fr_pos > FR_BUFFER_TOTAL_SIZE - FR_BUFFER_MARGIN);
-	}
 	mutex_unlock(&fr_mutex);
 }
 
-- 
2.14.1
