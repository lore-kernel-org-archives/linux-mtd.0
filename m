Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E6C3C6FD1D
	for <linux-mtd@archiver.kernel.org>; Sat, 18 Mar 2023 01:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R6GG2PSQuFK3YzKvwEkpFoJtUQnpWMyySJcObLJa+tc=; b=09TwEEDJLh0s5X
	pU9Ek0tegXYn38J1clovBFdmqdSJb2uGun29GhoEajyv7Tsty0dD4yy1teOIr+HRZ1k7FCgwp8z6Q
	ElqHA4JCS199kAPBsME9S+TlCI1j9sl74IIy2Dn+RmW7UlrsQ2saQw/niQP46LZPIf6QQZmBtgGZW
	ZPSJ5aNWMYlnxv6F7CzaS0NpOKSr5T89GbMbBZ0QTj+VRnUHlpweoBl7iSqkM+H8ROf5SfGTwzrSv
	HMGNo48wgoPyx3yR4zroMzVA/Fmvp7Y0KSVaZiZbBfd8mvjOQ2yxaTwp+5lmJk0eUWnfNpVLkjg1l
	FmYZkA47dd+FwFalcKRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdLp7-003tif-2N;
	Sat, 18 Mar 2023 01:57:33 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdLoz-003tdZ-0G
	for linux-mtd@lists.infradead.org;
	Sat, 18 Mar 2023 01:57:29 +0000
Received: from dggpemm100009.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4PdkYt4Qv8zSlqp;
	Sat, 18 Mar 2023 09:53:54 +0800 (CST)
Received: from huawei.com (10.175.127.227) by dggpemm100009.china.huawei.com
 (7.185.36.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Sat, 18 Mar
 2023 09:57:13 +0800
From: ZhaoLong Wang <wangzhaolong1@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <wangzhaolong1@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH -next 1/5] ubi: Using the Fault Injection Framework to refactor the debugfs interface
Date: Sat, 18 Mar 2023 09:56:17 +0800
Message-ID: <20230318015621.1408243-2-wangzhaolong1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230318015621.1408243-1-wangzhaolong1@huawei.com>
References: <20230318015621.1408243-1-wangzhaolong1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm100009.china.huawei.com (7.185.36.113)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_185725_474462_481CE2C2 
X-CRM114-Status: GOOD (  28.94  )
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
fault injection framework to reconstruct the debugfs interface.

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
 drivers/mtd/ubi/Kconfig |   8 +++
 drivers/mtd/ubi/debug.c | 147 ++++++++++++++++------------------------
 drivers/mtd/ubi/debug.h |  91 ++++++++++++++++++++-----
 drivers/mtd/ubi/io.c    |  10 ++-
 drivers/mtd/ubi/ubi.h   |  37 ++--------
 5 files changed, 150 insertions(+), 143 deletions(-)

diff --git a/drivers/mtd/ubi/Kconfig b/drivers/mtd/ubi/Kconfig
index 2ed77b7b3fcb..0a0180a3a54b 100644
--- a/drivers/mtd/ubi/Kconfig
+++ b/drivers/mtd/ubi/Kconfig
@@ -103,5 +103,13 @@ config MTD_UBI_BLOCK
 	   When selected, this feature will be built in the UBI driver.
 
 	   If in doubt, say "N".
+config MTD_UBI_FAULT_INJECTION
+	bool "Fault injection capability of UBI device"
+	default n
+	depends on FAULT_INJECTION_DEBUG_FS
+	help
+	   this option enable fault-injection support for UBI devices for
+	   testing purposes and is only interesting to developers.
 
+	   If unsure, say N.
 endif # MTD_UBI
diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index 27168f511d6d..2550522e2cd5 100644
--- a/drivers/mtd/ubi/debug.c
+++ b/drivers/mtd/ubi/debug.c
@@ -10,6 +10,23 @@
 #include <linux/uaccess.h>
 #include <linux/module.h>
 #include <linux/seq_file.h>
+#include <linux/fault-inject.h>
+
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
@@ -212,6 +229,31 @@ void ubi_dump_mkvol_req(const struct ubi_mkvol_req *req)
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
@@ -232,6 +274,10 @@ int ubi_debugfs_init(void)
 		return err;
 	}
 
+#ifdef CONFIG_MTD_UBI_FAULT_INJECTION
+	dfs_create_fault_entry(dfs_rootdir);
+#endif
+
 	return 0;
 }
 
@@ -268,27 +314,12 @@ static ssize_t dfs_file_read(struct file *file, char __user *user_buf,
 		val = d->chk_fastmap;
 	else if (dent == d->dfs_disable_bgt)
 		val = d->disable_bgt;
-	else if (dent == d->dfs_emulate_bitflips)
-		val = d->emulate_bitflips;
-	else if (dent == d->dfs_emulate_io_failures)
-		val = d->emulate_io_failures;
-	else if (dent == d->dfs_emulate_power_cut) {
-		snprintf(buf, sizeof(buf), "%u\n", d->emulate_power_cut);
+	else if (dent == d->dfs_emulate_failures) {
+		snprintf(buf, sizeof(buf), "%u\n", d->emulate_failures);
 		count = simple_read_from_buffer(user_buf, count, ppos,
 						buf, strlen(buf));
 		goto out;
-	} else if (dent == d->dfs_power_cut_min) {
-		snprintf(buf, sizeof(buf), "%u\n", d->power_cut_min);
-		count = simple_read_from_buffer(user_buf, count, ppos,
-						buf, strlen(buf));
-		goto out;
-	} else if (dent == d->dfs_power_cut_max) {
-		snprintf(buf, sizeof(buf), "%u\n", d->power_cut_max);
-		count = simple_read_from_buffer(user_buf, count, ppos,
-						buf, strlen(buf));
-		goto out;
-	}
-	else {
+	} else {
 		count = -EINVAL;
 		goto out;
 	}
@@ -330,20 +361,10 @@ static ssize_t dfs_file_write(struct file *file, const char __user *user_buf,
 		goto out;
 	}
 
-	if (dent == d->dfs_power_cut_min) {
-		if (kstrtouint(buf, 0, &d->power_cut_min) != 0)
-			count = -EINVAL;
-		goto out;
-	} else if (dent == d->dfs_power_cut_max) {
-		if (kstrtouint(buf, 0, &d->power_cut_max) != 0)
+	if (dent == d->dfs_emulate_failures) {
+		if (kstrtouint(buf, 0, &d->emulate_failures) != 0)
 			count = -EINVAL;
 		goto out;
-	} else if (dent == d->dfs_emulate_power_cut) {
-		if (kstrtoint(buf, 0, &val) != 0)
-			count = -EINVAL;
-		else
-			d->emulate_power_cut = val;
-		goto out;
 	}
 
 	if (buf[0] == '1')
@@ -363,10 +384,6 @@ static ssize_t dfs_file_write(struct file *file, const char __user *user_buf,
 		d->chk_fastmap = val;
 	else if (dent == d->dfs_disable_bgt)
 		d->disable_bgt = val;
-	else if (dent == d->dfs_emulate_bitflips)
-		d->emulate_bitflips = val;
-	else if (dent == d->dfs_emulate_io_failures)
-		d->emulate_io_failures = val;
 	else
 		count = -EINVAL;
 
@@ -386,6 +403,7 @@ static const struct file_operations dfs_fops = {
 	.owner  = THIS_MODULE,
 };
 
+
 /* As long as the position is less then that total number of erase blocks,
  * we still have more to print.
  */
@@ -533,32 +551,14 @@ int ubi_debugfs_init_dev(struct ubi_device *ubi)
 						 d->dfs_dir, (void *)ubi_num,
 						 &dfs_fops);
 
-	d->dfs_emulate_bitflips = debugfs_create_file("tst_emulate_bitflips",
-						      mode, d->dfs_dir,
-						      (void *)ubi_num,
-						      &dfs_fops);
-
-	d->dfs_emulate_io_failures = debugfs_create_file("tst_emulate_io_failures",
-							 mode, d->dfs_dir,
-							 (void *)ubi_num,
-							 &dfs_fops);
-
-	d->dfs_emulate_power_cut = debugfs_create_file("tst_emulate_power_cut",
-						       mode, d->dfs_dir,
-						       (void *)ubi_num,
-						       &dfs_fops);
-
-	d->dfs_power_cut_min = debugfs_create_file("tst_emulate_power_cut_min",
-						   mode, d->dfs_dir,
-						   (void *)ubi_num, &dfs_fops);
-
-	d->dfs_power_cut_max = debugfs_create_file("tst_emulate_power_cut_max",
-						   mode, d->dfs_dir,
-						   (void *)ubi_num, &dfs_fops);
-
 	debugfs_create_file("detailed_erase_block_info", S_IRUSR, d->dfs_dir,
 			    (void *)ubi_num, &eraseblk_count_fops);
 
+#ifdef CONFIG_MTD_UBI_FAULT_INJECTION
+	d->dfs_emulate_failures = debugfs_create_file("emulate_failures", mode,
+						      d->dfs_dir, (void *)ubi_num,
+						      &dfs_fops);
+#endif
 	return 0;
 }
 
@@ -571,36 +571,3 @@ void ubi_debugfs_exit_dev(struct ubi_device *ubi)
 	if (IS_ENABLED(CONFIG_DEBUG_FS))
 		debugfs_remove_recursive(ubi->dbg.dfs_dir);
 }
-
-/**
- * ubi_dbg_power_cut - emulate a power cut if it is time to do so
- * @ubi: UBI device description object
- * @caller: Flags set to indicate from where the function is being called
- *
- * Returns non-zero if a power cut was emulated, zero if not.
- */
-int ubi_dbg_power_cut(struct ubi_device *ubi, int caller)
-{
-	unsigned int range;
-
-	if ((ubi->dbg.emulate_power_cut & caller) == 0)
-		return 0;
-
-	if (ubi->dbg.power_cut_counter == 0) {
-		ubi->dbg.power_cut_counter = ubi->dbg.power_cut_min;
-
-		if (ubi->dbg.power_cut_max > ubi->dbg.power_cut_min) {
-			range = ubi->dbg.power_cut_max - ubi->dbg.power_cut_min;
-			ubi->dbg.power_cut_counter += get_random_u32_below(range);
-		}
-		return 0;
-	}
-
-	ubi->dbg.power_cut_counter--;
-	if (ubi->dbg.power_cut_counter)
-		return 0;
-
-	ubi_msg(ubi, "XXXXXXXXXXXXXXX emulating a power cut XXXXXXXXXXXXXXXX");
-	ubi_ro_mode(ubi);
-	return 1;
-}
diff --git a/drivers/mtd/ubi/debug.h b/drivers/mtd/ubi/debug.h
index 23676f32b681..bf843433a901 100644
--- a/drivers/mtd/ubi/debug.h
+++ b/drivers/mtd/ubi/debug.h
@@ -8,6 +8,18 @@
 #ifndef __UBI_DEBUG_H__
 #define __UBI_DEBUG_H__
 
+/**
+ * MASK_XXX: Mask for emulate_failures in ubi_debug_info.The mask is used to
+ * precisely control the type and process of fault injection.
+ */
+/* Emulate bit-flips */
+#define MASK_BITFLIPS		(1 << 0)
+/* Emulates -EIO during write/erase */
+#define MASK_IO_FAILURE		(1 << 1)
+/* Emulate a power cut when writing EC/VID header */
+#define MASK_POWER_CUT_EC	(1 << 2)
+#define MASK_POWER_CUT_VID	(1 << 3)
+
 void ubi_dump_flash(struct ubi_device *ubi, int pnum, int offset, int len);
 void ubi_dump_ec_hdr(const struct ubi_ec_hdr *ec_hdr);
 void ubi_dump_vid_hdr(const struct ubi_vid_hdr *vid_hdr);
@@ -64,46 +76,90 @@ static inline int ubi_dbg_is_bgt_disabled(const struct ubi_device *ubi)
 	return ubi->dbg.disable_bgt;
 }
 
+#ifdef CONFIG_MTD_UBI_FAULT_INJECTION
+
+extern bool should_fail_bitflips(void);
+extern bool should_fail_io_failures(void);
+extern bool should_fail_power_cut(void);
+
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
+	if (ubi->dbg.emulate_failures & MASK_BITFLIPS)
+		return should_fail_bitflips();
+	return false;
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
+	if (ubi->dbg.emulate_failures & MASK_IO_FAILURE)
+		return should_fail_io_failures();
+	return false;
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
+{
+	if (ubi->dbg.emulate_failures & MASK_IO_FAILURE)
+		return should_fail_io_failures();
+	return false;
+}
+
+/**
+ * ubi_dbg_power_cut - if it is time to emulate power cut.
+ * @ubi: UBI device description object
+ *
+ * Returns true if power cut should be emulated, otherwise returns false.
+ */
+static inline bool ubi_dbg_power_cut(const struct ubi_device *ubi,
+				     unsigned int caller)
+{
+	if (ubi->dbg.emulate_failures & caller)
+		return should_fail_power_cut();
+	return false;
+}
+
+#else /* CONFIG_MTD_UBI_FAULT_INJECTION */
+
+static inline bool ubi_dbg_is_bitflip(const struct ubi_device *ubi)
+{
+	return false;
+}
+
+static inline bool ubi_dbg_is_write_failure(const struct ubi_device *ubi)
+{
+	return false;
+}
+
+static inline bool ubi_dbg_is_erase_failure(const struct ubi_device *ubi)
+{
+	return false;
+}
+
+static inline bool ubi_dbg_power_cut(const struct ubi_device *ubi,
+				     unsigned int caller)
 {
-	if (ubi->dbg.emulate_io_failures)
-		return !get_random_u32_below(400);
-	return 0;
+	return false;
 }
+#endif
 
 static inline int ubi_dbg_chk_io(const struct ubi_device *ubi)
 {
@@ -125,5 +181,4 @@ static inline void ubi_enable_dbg_chk_fastmap(struct ubi_device *ubi)
 	ubi->dbg.chk_fastmap = 1;
 }
 
-int ubi_dbg_power_cut(struct ubi_device *ubi, int caller);
 #endif /* !__UBI_DEBUG_H__ */
diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 01b644861253..906ad0811d52 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -821,8 +821,11 @@ int ubi_io_write_ec_hdr(struct ubi_device *ubi, int pnum,
 	if (err)
 		return err;
 
-	if (ubi_dbg_power_cut(ubi, POWER_CUT_EC_WRITE))
+	if (ubi_dbg_power_cut(ubi, MASK_POWER_CUT_EC)) {
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
+	if (ubi_dbg_power_cut(ubi, MASK_POWER_CUT_VID)) {
+		ubi_warn(ubi, "XXXXX emulating a power cut when writing VID header XXXXX");
+		ubi_ro_mode(ubi);
 		return -EROFS;
+	}
 
 	err = ubi_io_write(ubi, p, pnum, ubi->vid_hdr_aloffset,
 			   ubi->vid_hdr_alsize);
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index c8f1bd4fa100..e20e9a6f9c05 100644
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
@@ -395,46 +384,28 @@ struct ubi_volume_desc {
  * @chk_io: if UBI I/O extra checks are enabled
  * @chk_fastmap: if UBI fastmap extra checks are enabled
  * @disable_bgt: disable the background task for testing purposes
- * @emulate_bitflips: emulate bit-flips for testing purposes
- * @emulate_io_failures: emulate write/erase failures for testing purposes
- * @emulate_power_cut: emulate power cut for testing purposes
- * @power_cut_counter: count down for writes left until emulated power cut
- * @power_cut_min: minimum number of writes before emulating a power cut
- * @power_cut_max: maximum number of writes until emulating a power cut
+ * @emulate_failures: emulate failures for testing purposes
  * @dfs_dir_name: name of debugfs directory containing files of this UBI device
  * @dfs_dir: direntry object of the UBI device debugfs directory
  * @dfs_chk_gen: debugfs knob to enable UBI general extra checks
  * @dfs_chk_io: debugfs knob to enable UBI I/O extra checks
  * @dfs_chk_fastmap: debugfs knob to enable UBI fastmap extra checks
  * @dfs_disable_bgt: debugfs knob to disable the background task
- * @dfs_emulate_bitflips: debugfs knob to emulate bit-flips
- * @dfs_emulate_io_failures: debugfs knob to emulate write/erase failures
- * @dfs_emulate_power_cut: debugfs knob to emulate power cuts
- * @dfs_power_cut_min: debugfs knob for minimum writes before power cut
- * @dfs_power_cut_max: debugfs knob for maximum writes until power cut
+ * @dfs_emulate_failures: debugfs entry to control the fault injection type
  */
 struct ubi_debug_info {
 	unsigned int chk_gen:1;
 	unsigned int chk_io:1;
 	unsigned int chk_fastmap:1;
 	unsigned int disable_bgt:1;
-	unsigned int emulate_bitflips:1;
-	unsigned int emulate_io_failures:1;
-	unsigned int emulate_power_cut:2;
-	unsigned int power_cut_counter;
-	unsigned int power_cut_min;
-	unsigned int power_cut_max;
+	unsigned int emulate_failures;
 	char dfs_dir_name[UBI_DFS_DIR_LEN + 1];
 	struct dentry *dfs_dir;
 	struct dentry *dfs_chk_gen;
 	struct dentry *dfs_chk_io;
 	struct dentry *dfs_chk_fastmap;
 	struct dentry *dfs_disable_bgt;
-	struct dentry *dfs_emulate_bitflips;
-	struct dentry *dfs_emulate_io_failures;
-	struct dentry *dfs_emulate_power_cut;
-	struct dentry *dfs_power_cut_min;
-	struct dentry *dfs_power_cut_max;
+	struct dentry *dfs_emulate_failures;
 };
 
 /**
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
