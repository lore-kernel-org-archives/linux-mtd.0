Received: from imta21.fe.bosch.de ([139.15.243.226])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eMVXs-00068m-5G
 for linux-mtd@lists.infradead.org; Wed, 06 Dec 2017 08:59:22 +0000
Received: from smtp6-v.fe.bosch.de (imta24.fe.bosch.de [139.15.243.27])
 by imta21.fe.bosch.de (Postfix) with ESMTP id D80E4C09AF
 for <linux-mtd@lists.infradead.org>; Wed,  6 Dec 2017 09:49:18 +0100 (CET)
From: Dirk Behme <dirk.behme@de.bosch.com>
To: <linux-mtd@lists.infradead.org>, Richard Weinberger <richard@nod.at>
CC: <manfred@colorfullife.com>, <dirk.behme@de.bosch.com>, Manfred Spraul
 <manfred.spraul@de.bosch.com>
Subject: [PATCH 2/5] mtdram: Add flight recorder
Date: Wed, 6 Dec 2017 09:50:36 +0100
Message-ID: <20171206085039.27164-3-dirk.behme@de.bosch.com>
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

The patch adds the option to enable a flight recorder for the
mtdram test device: All ERASE and WRITE commands are logged, e.g.
to perform targeted power fail testing.

Signed-off-by: Manfred Spraul <manfred.spraul@de.bosch.com>
Cc: Manfred Spraul <manfred@colorfullife.com>
---
 drivers/mtd/devices/Kconfig  |  25 +++++
 drivers/mtd/devices/mtdram.c | 239 ++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 252 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
index d8b67ba0b5de..8647214089c9 100644
--- a/drivers/mtd/devices/Kconfig
+++ b/drivers/mtd/devices/Kconfig
@@ -200,6 +200,31 @@ config MTDRAM_WRITEBUF_SIZE
 	  This allows you to specify the writebuf size that is reported
 	  by the device emulated by the MTDRAM driver.
 
+config MTDRAM_FLIGHTRECORDER
+	bool "Flight recorder for MTDRAM test device"
+	depends on (MTD_MTDRAM && DEBUG_FS)
+	default n
+	help
+	  This allows you to enable flight recorder mode for the MTDRAM test
+	  device: All ERASE and WRITE commands are logged and exposed in
+	  debugfs.
+
+config MTDRAM_FLIGHTRECORDER_BUFFER_SIZE
+	int "MTDRAM flightrecorder buffer size in KiB"
+	depends on MTDRAM_FLIGHTRECORDER
+	default "131072"
+	help
+	  This allows you to set the size of the flight recorder buffer for
+	  the MTDRAM test device.
+
+config MTDRAM_FLIGHTRECORDER_ENABLED
+	bool "Flight recorder for MTDRAM test device"
+	default y
+	depends on MTDRAM_FLIGHTRECORDER
+	help
+	  This flag sets the initial setting of the flight recorder. If enabled,
+	  the recording starts immediate at module start.
+
 config MTD_BLOCK2MTD
 	tristate "MTD using block device"
 	depends on BLOCK
diff --git a/drivers/mtd/devices/mtdram.c b/drivers/mtd/devices/mtdram.c
index 0c8652ac0395..1dc0a5ce0f07 100644
--- a/drivers/mtd/devices/mtdram.c
+++ b/drivers/mtd/devices/mtdram.c
@@ -18,6 +18,190 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/mtdram.h>
 
+#ifdef CONFIG_MTDRAM_FLIGHTRECORDER
+
+#include <linux/debugfs.h>
+#include <linux/sched.h>
+
+static unsigned long fr_buffersize = CONFIG_MTDRAM_FLIGHTRECORDER_BUFFER_SIZE;
+
+#define FR_BUFFER_TOTAL_SIZE	(fr_buffersize * 1024)
+#define FR_BUFFER_MARGIN	512
+
+static bool fr_enabled = CONFIG_MTDRAM_FLIGHTRECORDER_ENABLED;
+
+#ifdef MODULE
+module_param(fr_buffersize, ulong, 0);
+MODULE_PARM_DESC(fr_buffersize, "Flight recorder buffer size KiB");
+module_param(fr_enabled, bool, 0);
+MODULE_PARM_DESC(fr_enabled, "Set the initial enabled/disabled status");
+#endif
+
+static char *fr_buffer;
+static int fr_pos;
+static struct dentry *fr_dentry;
+
+static DEFINE_MUTEX(fr_mutex);
+static DECLARE_WAIT_QUEUE_HEAD(fr_wait);
+
+static ssize_t nandrec_read_file(struct file *file, char __user *user_buf,
+				 size_t count, loff_t *ppos)
+{
+	ssize_t r;
+
+	mutex_lock(&fr_mutex);
+
+	/* Every read must read all available data */
+	if (count < fr_pos) {
+		r = -EINVAL;
+		goto out_unlock;
+	}
+
+	if (fr_pos == 0) {
+		r = 0;
+		goto out_unlock;
+	}
+
+	*ppos = 0;
+
+	r = debugfs_file_get(fr_dentry);
+	count = fr_pos;
+	if (likely(!r)) {
+		r = simple_read_from_buffer(user_buf, count, ppos, fr_buffer,
+					    FR_BUFFER_TOTAL_SIZE);
+		debugfs_file_put(fr_dentry);
+	}
+
+	/* Every read must read all available data */
+	WARN_ON(fr_pos != r);
+
+	/* Every read clears the kernel buffer */
+	fr_pos = 0;
+
+	/* if someone waits, wake him up */
+	if (waitqueue_active(&fr_wait))
+		wake_up(&fr_wait);
+
+out_unlock:
+	mutex_unlock(&fr_mutex);
+	return r;
+}
+
+static const struct file_operations fr_fops = {
+	.read =		nandrec_read_file,
+	.open =		simple_open,
+};
+
+#define MAGIC_START	0x12345678UL
+#define MAGIC_END	0x87654321UL
+
+#define FUNC_WRITE	1UL
+#define FUNC_ERASE	2UL
+
+static void write_u32(u32 data)
+{
+	u32 *target = (u32 *)(fr_buffer + fr_pos);
+
+	if (fr_enabled) {
+		*target = cpu_to_le32(data);
+		fr_pos += round_up(sizeof(u32), 8);
+	}
+}
+
+static void write_u64(u64 data)
+{
+	u64 *target = (u64 *)(fr_buffer + fr_pos);
+
+	if (fr_enabled) {
+		*target = cpu_to_le64(data);
+		fr_pos += round_up(sizeof(u64), 8);
+	}
+}
+
+static void write_blob(const u_char *data, int len)
+{
+	u32 *target = (u32 *)(fr_buffer + fr_pos);
+
+	if (fr_enabled) {
+		memcpy(target, data, len);
+		fr_pos += round_up(len, 8);
+	}
+}
+
+static void start_write(int size)
+{
+	mutex_lock(&fr_mutex);
+
+	if (fr_enabled) {
+		while (fr_pos + size + 2*8 >=
+				FR_BUFFER_TOTAL_SIZE - FR_BUFFER_MARGIN) {
+			DEFINE_WAIT(wait);
+
+			pr_info("%p: Waiting - write count %d, current %d.\n",
+				current, size, fr_pos);
+
+			prepare_to_wait(&fr_wait, &wait, TASK_UNINTERRUPTIBLE);
+
+			mutex_unlock(&fr_mutex);
+
+			schedule();
+			mutex_lock(&fr_mutex);
+			finish_wait(&fr_wait, &wait);
+		}
+		write_u32(MAGIC_START);
+	}
+}
+
+static void end_write(void)
+{
+	if (fr_enabled) {
+		write_u32(MAGIC_END);
+		WARN_ON(fr_pos > FR_BUFFER_TOTAL_SIZE - FR_BUFFER_MARGIN);
+	}
+	mutex_unlock(&fr_mutex);
+}
+
+static int fr_init(void)
+{
+	fr_buffer = vmalloc(FR_BUFFER_TOTAL_SIZE);
+	if (!fr_buffer)
+		return -ENOMEM;
+
+	memset(fr_buffer, 0xfa, FR_BUFFER_TOTAL_SIZE);
+
+	fr_dentry = debugfs_create_file("mtdram", 0600, NULL, NULL,
+					&fr_fops);
+
+	if (IS_ERR(fr_dentry)) {
+		vfree(fr_buffer);
+		fr_buffer = NULL;
+		return -ENOMEM;
+	}
+	return 0;
+}
+
+static void fr_exit(void)
+{
+	if (fr_buffer) {
+		debugfs_remove(fr_dentry);
+		vfree(fr_buffer);
+		fr_buffer = NULL;
+	}
+}
+
+#else /* CONFIG_MTDRAM_FLIGHTRECORDER */
+
+static int fr_init(void)
+{
+	return 0;
+}
+
+static void fr_exit(void)
+{
+}
+
+#endif /* CONFIG_MTDRAM_FLIGHTRECORDER */
+
 static unsigned long total_size = CONFIG_MTDRAM_TOTAL_SIZE;
 static unsigned long erase_size = CONFIG_MTDRAM_ERASE_SIZE;
 static unsigned long writebuf_size = CONFIG_MTDRAM_WRITEBUF_SIZE;
@@ -63,6 +247,15 @@ static int ram_erase(struct mtd_info *mtd, struct erase_info *instr)
 	if (check_offs_len(mtd, instr->addr, instr->len))
 		return -EINVAL;
 	memset((char *)mtd->priv + instr->addr, 0xff, instr->len);
+
+#ifdef CONFIG_MTDRAM_FLIGHTRECORDER
+	start_write(3*8);
+	write_u32(FUNC_ERASE);
+	write_u64(instr->addr);
+	write_u64(instr->len);
+	end_write();
+#endif
+
 	instr->state = MTD_ERASE_DONE;
 	mtd_erase_callback(instr);
 	return 0;
@@ -114,12 +307,23 @@ static int ram_write(struct mtd_info *mtd, loff_t to, size_t len,
 		size_t *retlen, const u_char *buf)
 {
 	memcpy((char *)mtd->priv + to, buf, len);
+
+#ifdef CONFIG_MTDRAM_FLIGHTRECORDER
+	start_write(3*8 + len);
+	write_u32(FUNC_WRITE);
+	write_u64(to);
+	write_u64(len);
+	write_blob(buf, len);
+	end_write();
+#endif
+
 	*retlen = len;
 	return 0;
 }
 
 static void __exit cleanup_mtdram(void)
 {
+	fr_exit();
 	if (mtd_info) {
 		mtd_device_unregister(mtd_info);
 		vfree(mtd_info->priv);
@@ -163,25 +367,36 @@ static int __init init_mtdram(void)
 	if (!total_size)
 		return -EINVAL;
 
+	err = -ENOMEM;
+
 	/* Allocate some memory */
 	mtd_info = kmalloc(sizeof(struct mtd_info), GFP_KERNEL);
 	if (!mtd_info)
-		return -ENOMEM;
+		goto fail_mtdinfo;
 
 	addr = vmalloc(MTDRAM_TOTAL_SIZE);
-	if (!addr) {
-		kfree(mtd_info);
-		mtd_info = NULL;
-		return -ENOMEM;
-	}
+	if (!addr)
+		goto fail_ramdisk;
+
 	err = mtdram_init_device(mtd_info, addr, MTDRAM_TOTAL_SIZE, "mtdram test device");
-	if (err) {
-		vfree(addr);
-		kfree(mtd_info);
-		mtd_info = NULL;
-		return err;
-	}
+	if (err)
+		goto fail_init_device;
+
 	memset(mtd_info->priv, 0xff, MTDRAM_TOTAL_SIZE);
+	err = fr_init();
+	if (err)
+		goto fail_fr_init;
+
+	return 0;
+
+fail_fr_init:
+	mtd_device_unregister(mtd_info);
+fail_init_device:
+	vfree(addr);
+fail_ramdisk:
+	kfree(mtd_info);
+	mtd_info = NULL;
+fail_mtdinfo:
 	return err;
 }
 
-- 
2.14.1
