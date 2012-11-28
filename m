Received: from mail-qc0-f177.google.com ([209.85.216.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TdgbQ-0004g2-La
 for linux-mtd@lists.infradead.org; Wed, 28 Nov 2012 12:18:58 +0000
Received: by mail-qc0-f177.google.com with SMTP id u28so9497571qcs.36
 for <linux-mtd@lists.infradead.org>; Wed, 28 Nov 2012 04:18:55 -0800 (PST)
From: Ezequiel Garcia <elezegarcia@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] ubi: Embed ubi_debug_info field in ubi_device struct
Date: Wed, 28 Nov 2012 09:18:30 -0300
Message-Id: <1354105110-24721-3-git-send-email-elezegarcia@gmail.com>
In-Reply-To: <1354105110-24721-1-git-send-email-elezegarcia@gmail.com>
References: <1354105110-24721-1-git-send-email-elezegarcia@gmail.com>
Cc: Ezequiel Garcia <elezegarcia@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ubi_debug_info struct was dynamically allocated which
is always suboptimal, for it tends to fragment memory
and make the code error-prone.
Fix this by embedding it in ubi_device struct.

Cc: Artem Bityutskiy <dedekind1@gmail.com>
Signed-off-by: Ezequiel Garcia <elezegarcia@gmail.com>
---
 drivers/mtd/ubi/build.c |    9 +-------
 drivers/mtd/ubi/debug.c |   34 +++---------------------------
 drivers/mtd/ubi/debug.h |   52 +++++-----------------------------------------
 drivers/mtd/ubi/ubi.h   |   40 +++++++++++++++++++++++++++++++++++-
 4 files changed, 50 insertions(+), 85 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 9003f98..3eac8774 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -985,14 +985,10 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 	if (!ubi->fm_buf)
 		goto out_free;
 #endif
-	err = ubi_debugging_init_dev(ubi);
-	if (err)
-		goto out_free;
-
 	err = ubi_attach(ubi, 0);
 	if (err) {
 		ubi_err("failed to attach mtd%d, error %d", mtd->index, err);
-		goto out_debugging;
+		goto out_free;
 	}
 
 	if (ubi->autoresize_vol_id != -1) {
@@ -1053,8 +1049,6 @@ out_detach:
 	ubi_wl_close(ubi);
 	ubi_free_internal_volumes(ubi);
 	vfree(ubi->vtbl);
-out_debugging:
-	ubi_debugging_exit_dev(ubi);
 out_free:
 	vfree(ubi->peb_buf);
 	vfree(ubi->fm_buf);
@@ -1132,7 +1126,6 @@ int ubi_detach_mtd_dev(int ubi_num, int anyway)
 	ubi_free_internal_volumes(ubi);
 	vfree(ubi->vtbl);
 	put_mtd_device(ubi->mtd);
-	ubi_debugging_exit_dev(ubi);
 	vfree(ubi->peb_buf);
 	vfree(ubi->fm_buf);
 	ubi_msg("mtd%d is detached from ubi%d", ubi->mtd->index, ubi->ubi_num);
diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index 26908a5..63cb1d7 100644
--- a/drivers/mtd/ubi/debug.c
+++ b/drivers/mtd/ubi/debug.c
@@ -217,32 +217,6 @@ void ubi_dump_mkvol_req(const struct ubi_mkvol_req *req)
 	pr_err("\t1st 16 characters of name: %s\n", nm);
 }
 
-/**
- * ubi_debugging_init_dev - initialize debugging for an UBI device.
- * @ubi: UBI device description object
- *
- * This function initializes debugging-related data for UBI device @ubi.
- * Returns zero in case of success and a negative error code in case of
- * failure.
- */
-int ubi_debugging_init_dev(struct ubi_device *ubi)
-{
-	ubi->dbg = kzalloc(sizeof(struct ubi_debug_info), GFP_KERNEL);
-	if (!ubi->dbg)
-		return -ENOMEM;
-
-	return 0;
-}
-
-/**
- * ubi_debugging_exit_dev - free debugging data for an UBI device.
- * @ubi: UBI device description object
- */
-void ubi_debugging_exit_dev(struct ubi_device *ubi)
-{
-	kfree(ubi->dbg);
-}
-
 /*
  * Root directory for UBI stuff in debugfs. Contains sub-directories which
  * contain the stuff specific to particular UBI devices.
@@ -295,7 +269,7 @@ static ssize_t dfs_file_read(struct file *file, char __user *user_buf,
 	ubi = ubi_get_device(ubi_num);
 	if (!ubi)
 		return -ENODEV;
-	d = ubi->dbg;
+	d = &ubi->dbg;
 
 	if (dent == d->dfs_chk_gen)
 		val = d->chk_gen;
@@ -341,7 +315,7 @@ static ssize_t dfs_file_write(struct file *file, const char __user *user_buf,
 	ubi = ubi_get_device(ubi_num);
 	if (!ubi)
 		return -ENODEV;
-	d = ubi->dbg;
+	d = &ubi->dbg;
 
 	buf_size = min_t(size_t, count, (sizeof(buf) - 1));
 	if (copy_from_user(buf, user_buf, buf_size)) {
@@ -398,7 +372,7 @@ int ubi_debugfs_init_dev(struct ubi_device *ubi)
 	unsigned long ubi_num = ubi->ubi_num;
 	const char *fname;
 	struct dentry *dent;
-	struct ubi_debug_info *d = ubi->dbg;
+	struct ubi_debug_info *d = &ubi->dbg;
 
 	if (!IS_ENABLED(CONFIG_DEBUG_FS))
 		return 0;
@@ -471,5 +445,5 @@ out:
 void ubi_debugfs_exit_dev(struct ubi_device *ubi)
 {
 	if (IS_ENABLED(CONFIG_DEBUG_FS))
-		debugfs_remove_recursive(ubi->dbg->dfs_dir);
+		debugfs_remove_recursive(ubi->dbg.dfs_dir);
 }
diff --git a/drivers/mtd/ubi/debug.h b/drivers/mtd/ubi/debug.h
index 0add8d8..33f8f3b 100644
--- a/drivers/mtd/ubi/debug.h
+++ b/drivers/mtd/ubi/debug.h
@@ -60,51 +60,11 @@ void ubi_dump_aeb(const struct ubi_ainf_peb *aeb, int type);
 void ubi_dump_mkvol_req(const struct ubi_mkvol_req *req);
 int ubi_self_check_all_ff(struct ubi_device *ubi, int pnum, int offset,
 			  int len);
-int ubi_debugging_init_dev(struct ubi_device *ubi);
-void ubi_debugging_exit_dev(struct ubi_device *ubi);
 int ubi_debugfs_init(void);
 void ubi_debugfs_exit(void);
 int ubi_debugfs_init_dev(struct ubi_device *ubi);
 void ubi_debugfs_exit_dev(struct ubi_device *ubi);
 
-/*
- * The UBI debugfs directory name pattern and maximum name length (3 for "ubi"
- * + 2 for the number plus 1 for the trailing zero byte.
- */
-#define UBI_DFS_DIR_NAME "ubi%d"
-#define UBI_DFS_DIR_LEN  (3 + 2 + 1)
-
-/**
- * struct ubi_debug_info - debugging information for an UBI device.
- *
- * @chk_gen: if UBI general extra checks are enabled
- * @chk_io: if UBI I/O extra checks are enabled
- * @disable_bgt: disable the background task for testing purposes
- * @emulate_bitflips: emulate bit-flips for testing purposes
- * @emulate_io_failures: emulate write/erase failures for testing purposes
- * @dfs_dir_name: name of debugfs directory containing files of this UBI device
- * @dfs_dir: direntry object of the UBI device debugfs directory
- * @dfs_chk_gen: debugfs knob to enable UBI general extra checks
- * @dfs_chk_io: debugfs knob to enable UBI I/O extra checks
- * @dfs_disable_bgt: debugfs knob to disable the background task
- * @dfs_emulate_bitflips: debugfs knob to emulate bit-flips
- * @dfs_emulate_io_failures: debugfs knob to emulate write/erase failures
- */
-struct ubi_debug_info {
-	unsigned int chk_gen:1;
-	unsigned int chk_io:1;
-	unsigned int disable_bgt:1;
-	unsigned int emulate_bitflips:1;
-	unsigned int emulate_io_failures:1;
-	char dfs_dir_name[UBI_DFS_DIR_LEN + 1];
-	struct dentry *dfs_dir;
-	struct dentry *dfs_chk_gen;
-	struct dentry *dfs_chk_io;
-	struct dentry *dfs_disable_bgt;
-	struct dentry *dfs_emulate_bitflips;
-	struct dentry *dfs_emulate_io_failures;
-};
-
 /**
  * ubi_dbg_is_bgt_disabled - if the background thread is disabled.
  * @ubi: UBI device description object
@@ -114,7 +74,7 @@ struct ubi_debug_info {
  */
 static inline int ubi_dbg_is_bgt_disabled(const struct ubi_device *ubi)
 {
-	return ubi->dbg->disable_bgt;
+	return ubi->dbg.disable_bgt;
 }
 
 /**
@@ -125,7 +85,7 @@ static inline int ubi_dbg_is_bgt_disabled(const struct ubi_device *ubi)
  */
 static inline int ubi_dbg_is_bitflip(const struct ubi_device *ubi)
 {
-	if (ubi->dbg->emulate_bitflips)
+	if (ubi->dbg.emulate_bitflips)
 		return !(random32() % 200);
 	return 0;
 }
@@ -139,7 +99,7 @@ static inline int ubi_dbg_is_bitflip(const struct ubi_device *ubi)
  */
 static inline int ubi_dbg_is_write_failure(const struct ubi_device *ubi)
 {
-	if (ubi->dbg->emulate_io_failures)
+	if (ubi->dbg.emulate_io_failures)
 		return !(random32() % 500);
 	return 0;
 }
@@ -153,18 +113,18 @@ static inline int ubi_dbg_is_write_failure(const struct ubi_device *ubi)
  */
 static inline int ubi_dbg_is_erase_failure(const struct ubi_device *ubi)
 {
-	if (ubi->dbg->emulate_io_failures)
+	if (ubi->dbg.emulate_io_failures)
 		return !(random32() % 400);
 	return 0;
 }
 
 static inline int ubi_dbg_chk_io(const struct ubi_device *ubi)
 {
-	return ubi->dbg->chk_io;
+	return ubi->dbg.chk_io;
 }
 
 static inline int ubi_dbg_chk_gen(const struct ubi_device *ubi)
 {
-	return ubi->dbg->chk_gen;
+	return ubi->dbg.chk_gen;
 }
 #endif /* !__UBI_DEBUG_H__ */
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index d28b002..8c78386 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -85,6 +85,13 @@
 #define UBI_UNKNOWN -1
 
 /*
+ * The UBI debugfs directory name pattern and maximum name length (3 for "ubi"
+ * + 2 for the number plus 1 for the trailing zero byte.
+ */
+#define UBI_DFS_DIR_NAME "ubi%d"
+#define UBI_DFS_DIR_LEN  (3 + 2 + 1)
+
+/*
  * Error codes returned by the I/O sub-system.
  *
  * UBI_IO_FF: the read region of flash contains only 0xFFs
@@ -342,6 +349,37 @@ struct ubi_volume_desc {
 struct ubi_wl_entry;
 
 /**
+ * struct ubi_debug_info - debugging information for an UBI device.
+ *
+ * @chk_gen: if UBI general extra checks are enabled
+ * @chk_io: if UBI I/O extra checks are enabled
+ * @disable_bgt: disable the background task for testing purposes
+ * @emulate_bitflips: emulate bit-flips for testing purposes
+ * @emulate_io_failures: emulate write/erase failures for testing purposes
+ * @dfs_dir_name: name of debugfs directory containing files of this UBI device
+ * @dfs_dir: direntry object of the UBI device debugfs directory
+ * @dfs_chk_gen: debugfs knob to enable UBI general extra checks
+ * @dfs_chk_io: debugfs knob to enable UBI I/O extra checks
+ * @dfs_disable_bgt: debugfs knob to disable the background task
+ * @dfs_emulate_bitflips: debugfs knob to emulate bit-flips
+ * @dfs_emulate_io_failures: debugfs knob to emulate write/erase failures
+ */
+struct ubi_debug_info {
+	unsigned int chk_gen:1;
+	unsigned int chk_io:1;
+	unsigned int disable_bgt:1;
+	unsigned int emulate_bitflips:1;
+	unsigned int emulate_io_failures:1;
+	char dfs_dir_name[UBI_DFS_DIR_LEN + 1];
+	struct dentry *dfs_dir;
+	struct dentry *dfs_chk_gen;
+	struct dentry *dfs_chk_io;
+	struct dentry *dfs_disable_bgt;
+	struct dentry *dfs_emulate_bitflips;
+	struct dentry *dfs_emulate_io_failures;
+};
+
+/**
  * struct ubi_device - UBI device description structure
  * @dev: UBI device object to use the the Linux device model
  * @cdev: character device object to create character device
@@ -548,7 +586,7 @@ struct ubi_device {
 	struct mutex buf_mutex;
 	struct mutex ckvol_mutex;
 
-	struct ubi_debug_info *dbg;
+	struct ubi_debug_info dbg;
 };
 
 /**
-- 
1.7.8.6
