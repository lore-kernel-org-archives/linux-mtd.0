Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF58C19F5C
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Oct 2023 06:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2lg0glTQoa8sCQPADG1r/q9jp1Yf4GUAQjW4AtAUpX0=; b=bsIPFNuZOvQoPv
	ogaxKKqaOfWZQqbIWN2dYAza4ZvxYvh/DgDh9ybkQML27Oxmz8PM5bHQqbFsaxzZZhEeeQ582ekKn
	/aWHO51OOx3mypcM6wxSRYiQYmCoO3E33gkCroWD7BeNa2/6ZoEAxN8vlu9Mr4O3IUxc1p9DVd1g/
	Sl/oAQ9rkX+dVHT5Qkk0ndkERXgz98XaYgA4tvcfAb7qF/ih8UL1AcHrrb9hdTyw4oeUcC6O/qU8Y
	THI1ztz0ut7jN3gP7tU5EsHLoxBBkaiU5PmCfVLiEh8qVF9639PeHyr6uAO/7bUuBb4NVRbgoKrkA
	ktj4EJxZEEa8rSJJCqQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtjEW-001LvU-1V;
	Fri, 20 Oct 2023 06:43:44 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtjEQ-001LrB-05
	for linux-mtd@lists.infradead.org;
	Fri, 20 Oct 2023 06:43:41 +0000
Received: from dggpemm500009.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4SBZfd1NJtzcd9g;
	Fri, 20 Oct 2023 14:38:33 +0800 (CST)
Received: from huawei.com (10.175.127.227) by dggpemm500009.china.huawei.com
 (7.185.36.225) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Fri, 20 Oct
 2023 14:43:19 +0800
From: ZhaoLong Wang <wangzhaolong1@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <wangzhaolong1@huawei.com>, <yi.zhang@huawei.com>,
	<yangerkun@huawei.com>
Subject: [PATCH v3 1/5] ubi: Use the fault injection framework to enhance the fault injection capability
Date: Fri, 20 Oct 2023 14:47:59 +0800
Message-ID: <20231020064803.643399-2-wangzhaolong1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20231020064803.643399-1-wangzhaolong1@huawei.com>
References: <20231020064803.643399-1-wangzhaolong1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500009.china.huawei.com (7.185.36.225)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_234339_047277_39BD4E21 
X-CRM114-Status: GOOD (  28.33  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

To make debug parameters configurable at run time, use the
fault injection framework to reconstruct the debugfs interface,
and retain the legacy fault injection interface.

Now, the file emulate_failures and fault_attr files control whether
to enable fault emmulation.

The file emulate_failures receives a mask that controls type and
process of fault injection. Generally, for ease of use, you can
directly enter a mask with all 1s.

echo 0xffff > /sys/kernel/debug/ubi/ubi0/emulate_failures

And you need to configure other fault-injection capabilities for
testing purpose:

echo 100 > /sys/kernel/debug/ubi/fault_inject/emulate_power_cut/probability
echo 15 > /sys/kernel/debug/ubi/fault_inject/emulate_power_cut/space
echo 2 > /sys/kernel/debug/ubi/fault_inject/emulate_power_cut/verbose
echo -1 > /sys/kernel/debug/ubi/fault_inject/emulate_power_cut/times

The CONFIG_MTD_UBI_FAULT_INJECTION to enable the Fault Injection is
added to kconfig.

Signed-off-by: ZhaoLong Wang <wangzhaolong1@huawei.com>
---
 drivers/mtd/ubi/Kconfig |   9 +++
 drivers/mtd/ubi/debug.c |  68 +++++++++++++++++--
 drivers/mtd/ubi/debug.h | 142 +++++++++++++++++++++++++++++++++-------
 drivers/mtd/ubi/io.c    |  10 ++-
 drivers/mtd/ubi/ubi.h   |  15 ++---
 5 files changed, 202 insertions(+), 42 deletions(-)

diff --git a/drivers/mtd/ubi/Kconfig b/drivers/mtd/ubi/Kconfig
index 2ed77b7b3fcb..138fae7e8f96 100644
--- a/drivers/mtd/ubi/Kconfig
+++ b/drivers/mtd/ubi/Kconfig
@@ -104,4 +104,13 @@ config MTD_UBI_BLOCK
 
 	   If in doubt, say "N".
 
+config MTD_UBI_FAULT_INJECTION
+	bool "Fault injection capability of UBI device"
+	default n
+	depends on FAULT_INJECTION_DEBUG_FS
+	help
+	   this option enable fault-injection support for UBI devices for
+	   testing purposes.
+
+	   If in doubt, say "N".
 endif # MTD_UBI
diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index 27168f511d6d..81682bd72eb9 100644
--- a/drivers/mtd/ubi/debug.c
+++ b/drivers/mtd/ubi/debug.c
@@ -10,7 +10,23 @@
 #include <linux/uaccess.h>
 #include <linux/module.h>
 #include <linux/seq_file.h>
+#include <linux/fault-inject.h>
 
+#ifdef CONFIG_MTD_UBI_FAULT_INJECTION
+static DECLARE_FAULT_ATTR(fault_bitflips_attr);
+static DECLARE_FAULT_ATTR(fault_io_failures_attr);
+static DECLARE_FAULT_ATTR(fault_power_cut_attr);
+
+#define FAIL_ACTION(name, fault_attr)			\
+bool should_fail_##name(void)				\
+{							\
+	return should_fail(&fault_attr, 1);		\
+}
+
+FAIL_ACTION(bitflips,		fault_bitflips_attr)
+FAIL_ACTION(io_failures,	fault_io_failures_attr)
+FAIL_ACTION(power_cut,		fault_power_cut_attr)
+#endif
 
 /**
  * ubi_dump_flash - dump a region of flash.
@@ -212,6 +228,31 @@ void ubi_dump_mkvol_req(const struct ubi_mkvol_req *req)
  */
 static struct dentry *dfs_rootdir;
 
+#ifdef CONFIG_MTD_UBI_FAULT_INJECTION
+static void dfs_create_fault_entry(struct dentry *parent)
+{
+	struct dentry *dir;
+
+	dir = debugfs_create_dir("fault_inject", parent);
+	if (IS_ERR_OR_NULL(dir)) {
+		int err = dir ? PTR_ERR(dir) : -ENODEV;
+
+		pr_warn("UBI error: cannot create \"fault_inject\" debugfs directory, error %d\n",
+			err);
+		return;
+	}
+
+	fault_create_debugfs_attr("emulate_bitflips", dir,
+				  &fault_bitflips_attr);
+
+	fault_create_debugfs_attr("emulate_io_failures", dir,
+				  &fault_io_failures_attr);
+
+	fault_create_debugfs_attr("emulate_power_cut", dir,
+				  &fault_power_cut_attr);
+}
+#endif
+
 /**
  * ubi_debugfs_init - create UBI debugfs directory.
  *
@@ -232,6 +273,10 @@ int ubi_debugfs_init(void)
 		return err;
 	}
 
+#ifdef CONFIG_MTD_UBI_FAULT_INJECTION
+	dfs_create_fault_entry(dfs_rootdir);
+#endif
+
 	return 0;
 }
 
@@ -272,7 +317,12 @@ static ssize_t dfs_file_read(struct file *file, char __user *user_buf,
 		val = d->emulate_bitflips;
 	else if (dent == d->dfs_emulate_io_failures)
 		val = d->emulate_io_failures;
-	else if (dent == d->dfs_emulate_power_cut) {
+	else if (dent == d->dfs_emulate_failures) {
+		snprintf(buf, sizeof(buf), "0x%04x\n", d->emulate_failures);
+		count = simple_read_from_buffer(user_buf, count, ppos,
+							buf, strlen(buf));
+		goto out;
+	} else if (dent == d->dfs_emulate_power_cut) {
 		snprintf(buf, sizeof(buf), "%u\n", d->emulate_power_cut);
 		count = simple_read_from_buffer(user_buf, count, ppos,
 						buf, strlen(buf));
@@ -287,8 +337,7 @@ static ssize_t dfs_file_read(struct file *file, char __user *user_buf,
 		count = simple_read_from_buffer(user_buf, count, ppos,
 						buf, strlen(buf));
 		goto out;
-	}
-	else {
+	} else {
 		count = -EINVAL;
 		goto out;
 	}
@@ -330,7 +379,11 @@ static ssize_t dfs_file_write(struct file *file, const char __user *user_buf,
 		goto out;
 	}
 
-	if (dent == d->dfs_power_cut_min) {
+	if (dent == d->dfs_emulate_failures) {
+		if (kstrtouint(buf, 0, &d->emulate_failures) != 0)
+			count = -EINVAL;
+		goto out;
+	} else if (dent == d->dfs_power_cut_min) {
 		if (kstrtouint(buf, 0, &d->power_cut_min) != 0)
 			count = -EINVAL;
 		goto out;
@@ -559,6 +612,11 @@ int ubi_debugfs_init_dev(struct ubi_device *ubi)
 	debugfs_create_file("detailed_erase_block_info", S_IRUSR, d->dfs_dir,
 			    (void *)ubi_num, &eraseblk_count_fops);
 
+#ifdef CONFIG_MTD_UBI_FAULT_INJECTION
+	d->dfs_emulate_failures = debugfs_create_file("emulate_failures", mode,
+						      d->dfs_dir, (void *)ubi_num,
+						      &dfs_fops);
+#endif
 	return 0;
 }
 
@@ -600,7 +658,5 @@ int ubi_dbg_power_cut(struct ubi_device *ubi, int caller)
 	if (ubi->dbg.power_cut_counter)
 		return 0;
 
-	ubi_msg(ubi, "XXXXXXXXXXXXXXX emulating a power cut XXXXXXXXXXXXXXXX");
-	ubi_ro_mode(ubi);
 	return 1;
 }
diff --git a/drivers/mtd/ubi/debug.h b/drivers/mtd/ubi/debug.h
index 23676f32b681..fa7e12fa43f9 100644
--- a/drivers/mtd/ubi/debug.h
+++ b/drivers/mtd/ubi/debug.h
@@ -53,56 +53,153 @@ int ubi_debugfs_init_dev(struct ubi_device *ubi);
 void ubi_debugfs_exit_dev(struct ubi_device *ubi);
 
 /**
- * ubi_dbg_is_bgt_disabled - if the background thread is disabled.
+ * The following function is a legacy implementation of UBI fault-injection
+ * hook. When using more powerful fault injection capabilities, the legacy
+ * fault injection interface should be retained.
+ */
+int ubi_dbg_power_cut(struct ubi_device *ubi, int caller);
+
+static inline int ubi_dbg_bitflip(const struct ubi_device *ubi)
+{
+	if (ubi->dbg.emulate_bitflips)
+		return !get_random_u32_below(200);
+	return 0;
+}
+
+static inline int ubi_dbg_write_failure(const struct ubi_device *ubi)
+{
+	if (ubi->dbg.emulate_io_failures)
+		return !get_random_u32_below(500);
+	return 0;
+}
+
+static inline int ubi_dbg_erase_failure(const struct ubi_device *ubi)
+{
+	if (ubi->dbg.emulate_io_failures)
+		return !get_random_u32_below(400);
+	return 0;
+}
+
+/**
+ * MASK_XXX: Mask for emulate_failures in ubi_debug_info.The mask is used to
+ * precisely control the type and process of fault injection.
+ */
+/* Emulate a power cut when writing EC/VID header */
+#define MASK_POWER_CUT_EC			(1 << 0)
+#define MASK_POWER_CUT_VID			(1 << 1)
+
+#ifdef CONFIG_MTD_UBI_FAULT_INJECTION
+/* Emulate bit-flips */
+#define MASK_BITFLIPS				(1 << 2)
+/* Emulates -EIO during write/erase */
+#define MASK_IO_FAILURE				(1 << 3)
+
+extern bool should_fail_bitflips(void);
+extern bool should_fail_io_failures(void);
+extern bool should_fail_power_cut(void);
+
+static inline bool ubi_dbg_fail_bitflip(const struct ubi_device *ubi)
+{
+	if (ubi->dbg.emulate_failures & MASK_BITFLIPS)
+		return should_fail_bitflips();
+	return false;
+}
+
+static inline bool ubi_dbg_fail_write(const struct ubi_device *ubi)
+{
+	if (ubi->dbg.emulate_failures & MASK_IO_FAILURE)
+		return should_fail_io_failures();
+	return false;
+}
+
+static inline bool ubi_dbg_fail_erase(const struct ubi_device *ubi)
+{
+	if (ubi->dbg.emulate_failures & MASK_IO_FAILURE)
+		return should_fail_io_failures();
+	return false;
+}
+
+static inline bool ubi_dbg_fail_power_cut(const struct ubi_device *ubi,
+					unsigned int caller)
+{
+	if (ubi->dbg.emulate_failures & caller)
+		return should_fail_power_cut();
+	return false;
+}
+
+#else /* CONFIG_MTD_UBI_FAULT_INJECTION */
+
+#define ubi_dbg_fail_bitflip(u)           false
+#define ubi_dbg_fail_write(u)             false
+#define ubi_dbg_fail_erase(u)             false
+#define ubi_dbg_fail_power_cut(u,c)       false
+#endif
+
+/**
+ * ubi_dbg_is_power_cut - if it is time to emulate power cut.
  * @ubi: UBI device description object
  *
- * Returns non-zero if the UBI background thread is disabled for testing
- * purposes.
+ * Returns true if power cut should be emulated, otherwise returns false.
  */
-static inline int ubi_dbg_is_bgt_disabled(const struct ubi_device *ubi)
+static inline bool ubi_dbg_is_power_cut(struct ubi_device *ubi,
+					unsigned int caller)
 {
-	return ubi->dbg.disable_bgt;
+	if (ubi_dbg_power_cut(ubi, caller))
+		return true;
+	return ubi_dbg_fail_power_cut(ubi, caller);
 }
 
 /**
  * ubi_dbg_is_bitflip - if it is time to emulate a bit-flip.
  * @ubi: UBI device description object
  *
- * Returns non-zero if a bit-flip should be emulated, otherwise returns zero.
+ * Returns true if a bit-flip should be emulated, otherwise returns false.
  */
-static inline int ubi_dbg_is_bitflip(const struct ubi_device *ubi)
+static inline bool ubi_dbg_is_bitflip(const struct ubi_device *ubi)
 {
-	if (ubi->dbg.emulate_bitflips)
-		return !get_random_u32_below(200);
-	return 0;
+	if (ubi_dbg_bitflip(ubi))
+		return true;
+	return ubi_dbg_fail_bitflip(ubi);
 }
 
 /**
  * ubi_dbg_is_write_failure - if it is time to emulate a write failure.
  * @ubi: UBI device description object
  *
- * Returns non-zero if a write failure should be emulated, otherwise returns
- * zero.
+ * Returns true if a write failure should be emulated, otherwise returns
+ * false.
  */
-static inline int ubi_dbg_is_write_failure(const struct ubi_device *ubi)
+static inline bool ubi_dbg_is_write_failure(const struct ubi_device *ubi)
 {
-	if (ubi->dbg.emulate_io_failures)
-		return !get_random_u32_below(500);
-	return 0;
+	if (ubi_dbg_write_failure(ubi))
+		return true;;
+	return ubi_dbg_fail_write(ubi);
 }
 
 /**
  * ubi_dbg_is_erase_failure - if its time to emulate an erase failure.
  * @ubi: UBI device description object
  *
- * Returns non-zero if an erase failure should be emulated, otherwise returns
- * zero.
+ * Returns true if an erase failure should be emulated, otherwise returns
+ * false.
  */
-static inline int ubi_dbg_is_erase_failure(const struct ubi_device *ubi)
+static inline bool ubi_dbg_is_erase_failure(const struct ubi_device *ubi)
 {
-	if (ubi->dbg.emulate_io_failures)
-		return !get_random_u32_below(400);
-	return 0;
+	if (ubi_dbg_erase_failure(ubi))
+		return true;
+	return ubi_dbg_fail_erase(ubi);
+}
+
+/**
+ * ubi_dbg_is_bgt_disabled - if the background thread is disabled.
+ * @ubi: UBI device description object
+ *
+ * Returns non-zero if the UBI background thread is disabled for testing
+ * purposes.
+ */
+static inline int ubi_dbg_is_bgt_disabled(const struct ubi_device *ubi)
+{
+	return ubi->dbg.disable_bgt;
 }
 
 static inline int ubi_dbg_chk_io(const struct ubi_device *ubi)
@@ -125,5 +222,4 @@ static inline void ubi_enable_dbg_chk_fastmap(struct ubi_device *ubi)
 	ubi->dbg.chk_fastmap = 1;
 }
 
-int ubi_dbg_power_cut(struct ubi_device *ubi, int caller);
 #endif /* !__UBI_DEBUG_H__ */
diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 01b644861253..ffa7bbf27bc2 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -821,8 +821,11 @@ int ubi_io_write_ec_hdr(struct ubi_device *ubi, int pnum,
 	if (err)
 		return err;
 
-	if (ubi_dbg_power_cut(ubi, POWER_CUT_EC_WRITE))
+	if (ubi_dbg_is_power_cut(ubi, MASK_POWER_CUT_EC)) {
+		ubi_warn(ubi, "XXXXX emulating a power cut when writing EC header XXXXX");
+		ubi_ro_mode(ubi);
 		return -EROFS;
+	}
 
 	err = ubi_io_write(ubi, ec_hdr, pnum, 0, ubi->ec_hdr_alsize);
 	return err;
@@ -1071,8 +1074,11 @@ int ubi_io_write_vid_hdr(struct ubi_device *ubi, int pnum,
 	if (err)
 		return err;
 
-	if (ubi_dbg_power_cut(ubi, POWER_CUT_VID_WRITE))
+	if (ubi_dbg_is_power_cut(ubi, MASK_POWER_CUT_VID)) {
+		ubi_warn(ubi, "XXXXX emulating a power cut when writing VID header XXXXX");
+		ubi_ro_mode(ubi);
 		return -EROFS;
+	}
 
 	err = ubi_io_write(ubi, p, pnum, ubi->vid_hdr_aloffset,
 			   ubi->vid_hdr_alsize);
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index c8f1bd4fa100..41f57d5717b2 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -142,17 +142,6 @@ enum {
 	UBI_BAD_FASTMAP,
 };
 
-/*
- * Flags for emulate_power_cut in ubi_debug_info
- *
- * POWER_CUT_EC_WRITE: Emulate a power cut when writing an EC header
- * POWER_CUT_VID_WRITE: Emulate a power cut when writing a VID header
- */
-enum {
-	POWER_CUT_EC_WRITE = 0x01,
-	POWER_CUT_VID_WRITE = 0x02,
-};
-
 /**
  * struct ubi_vid_io_buf - VID buffer used to read/write VID info to/from the
  *			   flash.
@@ -401,6 +390,7 @@ struct ubi_volume_desc {
  * @power_cut_counter: count down for writes left until emulated power cut
  * @power_cut_min: minimum number of writes before emulating a power cut
  * @power_cut_max: maximum number of writes until emulating a power cut
+ * @emulate_failures: emulate failures for testing purposes
  * @dfs_dir_name: name of debugfs directory containing files of this UBI device
  * @dfs_dir: direntry object of the UBI device debugfs directory
  * @dfs_chk_gen: debugfs knob to enable UBI general extra checks
@@ -412,6 +402,7 @@ struct ubi_volume_desc {
  * @dfs_emulate_power_cut: debugfs knob to emulate power cuts
  * @dfs_power_cut_min: debugfs knob for minimum writes before power cut
  * @dfs_power_cut_max: debugfs knob for maximum writes until power cut
+ * @dfs_emulate_failures: debugfs entry to control the fault injection type
  */
 struct ubi_debug_info {
 	unsigned int chk_gen:1;
@@ -424,6 +415,7 @@ struct ubi_debug_info {
 	unsigned int power_cut_counter;
 	unsigned int power_cut_min;
 	unsigned int power_cut_max;
+	unsigned int emulate_failures;
 	char dfs_dir_name[UBI_DFS_DIR_LEN + 1];
 	struct dentry *dfs_dir;
 	struct dentry *dfs_chk_gen;
@@ -435,6 +427,7 @@ struct ubi_debug_info {
 	struct dentry *dfs_emulate_power_cut;
 	struct dentry *dfs_power_cut_min;
 	struct dentry *dfs_power_cut_max;
+	struct dentry *dfs_emulate_failures;
 };
 
 /**
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
