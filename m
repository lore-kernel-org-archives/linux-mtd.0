Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00FAAC001B0
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Nov 2023 06:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kQB8EsgBeI9q0/MyueX2GotAn3NN3CqAJMgUr8VwUkc=; b=yuH6eB5Cb4Bv/9
	PyDYHpE8T8VPjR93vtIcC5E4G0YvSLuaGzHK+10bPxswwkjwoN2ml9VWl5nS85QGos77e3DhvoIoH
	EI511Yep7BDd20CtTa3QGoqLhTq/hzD93BViYf1zzijOCY1n1bA9pLYV7a+T3iUvlZzwW7BYv6a4O
	MeOGIq9u2wiXHH1VISARg5vfFf6K0LjwoqoH36Ks1iAPMbaNiROs4DqrDekOI9QE6Qm5+7slK3Slj
	pZqm2z2VcktTnFvxCYgmxbdrAH29L6gNyeq7+eeviJB7ngj3x7f03o1fl8qGYTNtmgdv0CQx9u6m2
	OGp56B/U5jHjOeURYw0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyo1p-00Aqc1-2F;
	Fri, 03 Nov 2023 06:51:37 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyo1j-00AqYl-2H
	for linux-mtd@lists.infradead.org;
	Fri, 03 Nov 2023 06:51:35 +0000
Received: from dggpemd200001.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4SMBCH4VzbzrTvZ;
	Fri,  3 Nov 2023 14:48:11 +0800 (CST)
Received: from huawei.com (10.175.127.227) by dggpemd200001.china.huawei.com
 (7.185.36.224) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1258.23; Fri, 3 Nov
 2023 14:51:15 +0800
From: ZhaoLong Wang <wangzhaolong1@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <wangzhaolong1@huawei.com>, <yi.zhang@huawei.com>,
	<yangerkun@huawei.com>
Subject: [PATCH v4 3/5] ubi: Add six fault injection type for testing
Date: Fri, 3 Nov 2023 14:55:34 +0800
Message-ID: <20231103065536.3778940-4-wangzhaolong1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20231103065536.3778940-1-wangzhaolong1@huawei.com>
References: <20231103065536.3778940-1-wangzhaolong1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemd200001.china.huawei.com (7.185.36.224)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_235132_218565_DB4385C5 
X-CRM114-Status: GOOD (  23.27  )
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

This commit adds six fault injection type for testing to cover the
abnormal path of the UBI driver.

Inject the following faults when the UBI reads the LEB:
 +----------------------------+-----------------------------------+
 |    Interface name          |       emulate behavior            |
 +----------------------------+-----------------------------------+
 |  emulate_eccerr            | ECC error                         |
 +----------------------------+-----------------------------------+
 |  emulate_read_failure      | read failure                      |
 |----------------------------+-----------------------------------+
 |  emulate_io_ff             | read content as all FF            |
 |----------------------------+-----------------------------------+
 |  emulate_io_ff_bitflips    | content FF with MTD err reported  |
 +----------------------------+-----------------------------------+
 |  emulate_bad_hdr           | bad leb header                    |
 |----------------------------+-----------------------------------+
 |  emulate_bad_hdr_ebadmsg   | bad header with ECC err           |
 +----------------------------+-----------------------------------+

Signed-off-by: ZhaoLong Wang <wangzhaolong1@huawei.com>
---
 drivers/mtd/ubi/debug.c |  30 +++++++
 drivers/mtd/ubi/debug.h | 172 ++++++++++++++++++++++++++++++++++++++--
 drivers/mtd/ubi/io.c    |  76 +++++++++++++++++-
 drivers/mtd/ubi/ubi.h   |  30 ++++---
 4 files changed, 287 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index 3ce5265e3a16..e8aa1827f23a 100644
--- a/drivers/mtd/ubi/debug.c
+++ b/drivers/mtd/ubi/debug.c
@@ -13,10 +13,16 @@
 #include <linux/fault-inject.h>
 
 #ifdef CONFIG_MTD_UBI_FAULT_INJECTION
+static DECLARE_FAULT_ATTR(fault_eccerr_attr);
 static DECLARE_FAULT_ATTR(fault_bitflips_attr);
+static DECLARE_FAULT_ATTR(fault_read_failure_attr);
 static DECLARE_FAULT_ATTR(fault_write_failure_attr);
 static DECLARE_FAULT_ATTR(fault_erase_failure_attr);
 static DECLARE_FAULT_ATTR(fault_power_cut_attr);
+static DECLARE_FAULT_ATTR(fault_io_ff_attr);
+static DECLARE_FAULT_ATTR(fault_io_ff_bitflips_attr);
+static DECLARE_FAULT_ATTR(fault_bad_hdr_attr);
+static DECLARE_FAULT_ATTR(fault_bad_hdr_ebadmsg_attr);
 
 #define FAIL_ACTION(name, fault_attr)			\
 bool should_fail_##name(void)				\
@@ -24,10 +30,16 @@ bool should_fail_##name(void)				\
 	return should_fail(&fault_attr, 1);		\
 }
 
+FAIL_ACTION(eccerr,		fault_eccerr_attr)
 FAIL_ACTION(bitflips,		fault_bitflips_attr)
+FAIL_ACTION(read_failure,	fault_read_failure_attr)
 FAIL_ACTION(write_failure,	fault_write_failure_attr)
 FAIL_ACTION(erase_failure,	fault_erase_failure_attr)
 FAIL_ACTION(power_cut,		fault_power_cut_attr)
+FAIL_ACTION(io_ff,		fault_io_ff_attr)
+FAIL_ACTION(io_ff_bitflips,	fault_io_ff_bitflips_attr)
+FAIL_ACTION(bad_hdr,		fault_bad_hdr_attr)
+FAIL_ACTION(bad_hdr_ebadmsg,	fault_bad_hdr_ebadmsg_attr)
 #endif
 
 /**
@@ -244,6 +256,12 @@ static void dfs_create_fault_entry(struct dentry *parent)
 		return;
 	}
 
+	fault_create_debugfs_attr("emulate_eccerr", dir,
+				  &fault_eccerr_attr);
+
+	fault_create_debugfs_attr("emulate_read_failure", dir,
+				  &fault_read_failure_attr);
+
 	fault_create_debugfs_attr("emulate_bitflips", dir,
 				  &fault_bitflips_attr);
 
@@ -255,6 +273,18 @@ static void dfs_create_fault_entry(struct dentry *parent)
 
 	fault_create_debugfs_attr("emulate_power_cut", dir,
 				  &fault_power_cut_attr);
+
+	fault_create_debugfs_attr("emulate_io_ff", dir,
+				  &fault_io_ff_attr);
+
+	fault_create_debugfs_attr("emulate_io_ff_bitflips", dir,
+				  &fault_io_ff_bitflips_attr);
+
+	fault_create_debugfs_attr("emulate_bad_hdr", dir,
+				  &fault_bad_hdr_attr);
+
+	fault_create_debugfs_attr("emulate_bad_hdr_ebadmsg", dir,
+				  &fault_bad_hdr_ebadmsg_attr);
 }
 #endif
 
diff --git a/drivers/mtd/ubi/debug.h b/drivers/mtd/ubi/debug.h
index 7386c40474de..ccb8f5958faf 100644
--- a/drivers/mtd/ubi/debug.h
+++ b/drivers/mtd/ubi/debug.h
@@ -87,18 +87,45 @@ static inline int ubi_dbg_erase_failure(const struct ubi_device *ubi)
 /* Emulate a power cut when writing EC/VID header */
 #define MASK_POWER_CUT_EC			(1 << 0)
 #define MASK_POWER_CUT_VID			(1 << 1)
+/* Emulate a power cut when writing data*/
+#define MASK_POWER_CUT_DATA			(1 << 2)
+/* Emulate bit-flips */
+#define MASK_BITFLIPS				(1 << 3)
+/* Emulate ecc error */
+#define MASK_ECCERR				(1 << 4)
+/* Emulates -EIO during data read */
+#define MASK_READ_FAILURE			(1 << 5)
+#define MASK_READ_FAILURE_EC			(1 << 6)
+#define MASK_READ_FAILURE_VID			(1 << 7)
+/* Emulates -EIO during data write */
+#define MASK_WRITE_FAILURE			(1 << 8)
+/* Emulates -EIO during erase a PEB*/
+#define MASK_ERASE_FAILURE			(1 << 9)
+/* Return UBI_IO_FF when reading EC/VID header */
+#define MASK_IO_FF_EC				(1 << 10)
+#define MASK_IO_FF_VID				(1 << 11)
+/* Return UBI_IO_FF_BITFLIPS when reading EC/VID header */
+#define MASK_IO_FF_BITFLIPS_EC			(1 << 12)
+#define MASK_IO_FF_BITFLIPS_VID			(1 << 13)
+/* Return UBI_IO_BAD_HDR when reading EC/VID header */
+#define MASK_BAD_HDR_EC				(1 << 14)
+#define MASK_BAD_HDR_VID			(1 << 15)
+/* Return UBI_IO_BAD_HDR_EBADMSG when reading EC/VID header */
+#define MASK_BAD_HDR_EBADMSG_EC			(1 << 16)
+#define MASK_BAD_HDR_EBADMSG_VID		(1 << 17)
 
 #ifdef CONFIG_MTD_UBI_FAULT_INJECTION
-/* Emulate bit-flips */
-#define MASK_BITFLIPS				(1 << 2)
-/* Emulates -EIO during write/erase */
-#define MASK_WRITE_FAILURE			(1 << 3)
-#define MASK_ERASE_FAILURE			(1 << 4)
 
+extern bool should_fail_eccerr(void);
 extern bool should_fail_bitflips(void);
+extern bool should_fail_read_failure(void);
 extern bool should_fail_write_failure(void);
 extern bool should_fail_erase_failure(void);
 extern bool should_fail_power_cut(void);
+extern bool should_fail_io_ff(void);
+extern bool should_fail_io_ff_bitflips(void);
+extern bool should_fail_bad_hdr(void);
+extern bool should_fail_bad_hdr_ebadmsg(void);
 
 static inline bool ubi_dbg_fail_bitflip(const struct ubi_device *ubi)
 {
@@ -122,19 +149,72 @@ static inline bool ubi_dbg_fail_erase(const struct ubi_device *ubi)
 }
 
 static inline bool ubi_dbg_fail_power_cut(const struct ubi_device *ubi,
-					unsigned int caller)
+					  unsigned int caller)
 {
 	if (ubi->dbg.emulate_failures & caller)
 		return should_fail_power_cut();
 	return false;
 }
 
+static inline bool ubi_dbg_fail_read(const struct ubi_device *ubi,
+				     unsigned int caller)
+{
+	if (ubi->dbg.emulate_failures & caller)
+		return should_fail_read_failure();
+	return false;
+}
+
+static inline bool ubi_dbg_fail_eccerr(const struct ubi_device *ubi)
+{
+	if (ubi->dbg.emulate_failures & MASK_ECCERR)
+		return should_fail_eccerr();
+	return false;
+}
+
+static inline bool ubi_dbg_fail_ff(const struct ubi_device *ubi,
+				   unsigned int caller)
+{
+	if (ubi->dbg.emulate_failures & caller)
+		return should_fail_io_ff();
+	return false;
+}
+
+static inline bool ubi_dbg_fail_ff_bitflips(const struct ubi_device *ubi,
+					    unsigned int caller)
+{
+	if (ubi->dbg.emulate_failures & caller)
+		return should_fail_io_ff_bitflips();
+	return false;
+}
+
+static inline bool ubi_dbg_fail_bad_hdr(const struct ubi_device *ubi,
+				        unsigned int caller)
+{
+	if (ubi->dbg.emulate_failures & caller)
+		return should_fail_bad_hdr();
+	return false;
+}
+
+static inline bool ubi_dbg_fail_bad_hdr_ebadmsg(const struct ubi_device *ubi,
+					        unsigned int caller)
+{
+	if (ubi->dbg.emulate_failures & caller)
+		return should_fail_bad_hdr_ebadmsg();
+	return false;
+}
 #else /* CONFIG_MTD_UBI_FAULT_INJECTION */
 
 #define ubi_dbg_fail_bitflip(u)           false
 #define ubi_dbg_fail_write(u)             false
 #define ubi_dbg_fail_erase(u)             false
 #define ubi_dbg_fail_power_cut(u,c)       false
+#define ubi_dbg_fail_read(u,c)            false
+#define ubi_dbg_fail_eccerr(u)            false
+#define ubi_dbg_fail_ff(u,c)              false
+#define ubi_dbg_fail_ff_bitflips(u,v)     false
+#define ubi_dbg_fail_bad_hdr(u,c)         false
+#define ubi_dbg_fail_bad_hdr_ebadmsg(u,c) false
+
 #endif
 
 /**
@@ -192,6 +272,86 @@ static inline bool ubi_dbg_is_erase_failure(const struct ubi_device *ubi)
 	return ubi_dbg_fail_erase(ubi);
 }
 
+/**
+ * ubi_dbg_is_eccerr - if it is time to emulate ECC error.
+ * @ubi: UBI device description object
+ *
+ * Returns true if a ECC error should be emulated, otherwise returns false.
+ */
+static inline bool ubi_dbg_is_eccerr(const struct ubi_device *ubi)
+{
+	return ubi_dbg_fail_eccerr(ubi);
+}
+
+/**
+ * ubi_dbg_is_read_failure - if it is time to emulate a read failure.
+ * @ubi: UBI device description object
+ *
+ * Returns true if a read failure should be emulated, otherwise returns
+ * false.
+ */
+static inline bool ubi_dbg_is_read_failure(const struct ubi_device *ubi,
+					   unsigned int caller)
+{
+	return ubi_dbg_fail_read(ubi, caller);
+}
+
+/**
+ * ubi_dbg_is_ff - if it is time to emulate that read region is only 0xFF.
+ * @ubi: UBI device description object
+ *
+ * Returns true if read region should be emulated 0xFF, otherwise
+ * returns false.
+ */
+static inline bool ubi_dbg_is_ff(const struct ubi_device *ubi,
+				 unsigned int caller)
+{
+	return ubi_dbg_fail_ff(ubi, caller);
+}
+
+/**
+ * ubi_dbg_is_ff_bitflips - if it is time to emulate that read region is only 0xFF
+ * with error reported by the MTD driver
+ *
+ * @ubi: UBI device description object
+ *
+ * Returns true if read region should be emulated 0xFF and error
+ * reported by the MTD driver, otherwise returns false.
+ */
+static inline bool ubi_dbg_is_ff_bitflips(const struct ubi_device *ubi,
+					  unsigned int caller)
+{
+	return ubi_dbg_fail_ff_bitflips(ubi, caller);
+}
+
+/**
+ * ubi_dbg_is_bad_hdr - if it is time to emulate a bad header
+ * @ubi: UBI device description object
+ *
+ * Returns true if a bad header error should be emulated, otherwise
+ * returns false.
+ */
+static inline bool ubi_dbg_is_bad_hdr(const struct ubi_device *ubi,
+				      unsigned int caller)
+{
+	return ubi_dbg_fail_bad_hdr(ubi, caller);
+}
+
+/**
+ * ubi_dbg_is_bad_hdr_ebadmsg - if it is time to emulate a bad header with
+ * ECC error.
+ *
+ * @ubi: UBI device description object
+ *
+ * Returns true if a bad header with ECC error should be emulated, otherwise
+ * returns false.
+ */
+static inline bool ubi_dbg_is_bad_hdr_ebadmsg(const struct ubi_device *ubi,
+					      unsigned int caller)
+{
+	return ubi_dbg_fail_bad_hdr_ebadmsg(ubi, caller);
+}
+
 /**
  * ubi_dbg_is_bgt_disabled - if the background thread is disabled.
  * @ubi: UBI device description object
diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index ffa7bbf27bc2..ae2a44b44b0d 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -195,7 +195,19 @@ int ubi_io_read(const struct ubi_device *ubi, void *buf, int pnum, int offset,
 
 		if (ubi_dbg_is_bitflip(ubi)) {
 			dbg_gen("bit-flip (emulated)");
-			err = UBI_IO_BITFLIPS;
+			return UBI_IO_BITFLIPS;
+		}
+
+		if (ubi_dbg_is_read_failure(ubi, MASK_READ_FAILURE)) {
+			ubi_warn(ubi, "cannot read %d bytes from PEB %d:%d (emulated)",
+				 len, pnum, offset);
+			return -EIO;
+		}
+
+		if (ubi_dbg_is_eccerr(ubi)) {
+			ubi_warn(ubi, "ECC error (emulated) while reading %d bytes from PEB %d:%d, read %zd bytes",
+				 len, pnum, offset, read);
+			return -EBADMSG;
 		}
 	}
 
@@ -782,7 +794,36 @@ int ubi_io_read_ec_hdr(struct ubi_device *ubi, int pnum,
 	 * If there was %-EBADMSG, but the header CRC is still OK, report about
 	 * a bit-flip to force scrubbing on this PEB.
 	 */
-	return read_err ? UBI_IO_BITFLIPS : 0;
+	if (read_err)
+		return UBI_IO_BITFLIPS;
+
+	if (ubi_dbg_is_read_failure(ubi, MASK_READ_FAILURE_EC)) {
+		ubi_warn(ubi, "cannot read EC header from PEB %d(emulated)",
+			 pnum);
+		return -EIO;
+	}
+
+	if (ubi_dbg_is_ff(ubi, MASK_IO_FF_EC)) {
+		ubi_warn(ubi, "bit-all-ff (emulated)");
+		return UBI_IO_FF;
+	}
+
+	if (ubi_dbg_is_ff_bitflips(ubi, MASK_IO_FF_BITFLIPS_EC)) {
+		ubi_warn(ubi, "bit-all-ff with error reported by MTD driver (emulated)");
+		return UBI_IO_FF_BITFLIPS;
+	}
+
+	if (ubi_dbg_is_bad_hdr(ubi, MASK_BAD_HDR_EC)) {
+		ubi_warn(ubi, "bad_hdr (emulated)");
+		return UBI_IO_BAD_HDR;
+	}
+
+	if (ubi_dbg_is_bad_hdr_ebadmsg(ubi, MASK_BAD_HDR_EBADMSG_EC)) {
+		ubi_warn(ubi, "bad_hdr with ECC error (emulated)");
+		return UBI_IO_BAD_HDR_EBADMSG;
+	}
+
+	return 0;
 }
 
 /**
@@ -1032,7 +1073,36 @@ int ubi_io_read_vid_hdr(struct ubi_device *ubi, int pnum,
 		return -EINVAL;
 	}
 
-	return read_err ? UBI_IO_BITFLIPS : 0;
+	if (read_err)
+		return UBI_IO_BITFLIPS;
+
+	if (ubi_dbg_is_read_failure(ubi, MASK_READ_FAILURE_VID)) {
+		ubi_warn(ubi, "cannot read VID header from PEB %d(emulated)",
+			 pnum);
+		return -EIO;
+	}
+
+	if (ubi_dbg_is_ff(ubi, MASK_IO_FF_VID)) {
+		ubi_warn(ubi, "bit-all-ff (emulated)\n");
+		return UBI_IO_FF;
+	}
+
+	if (ubi_dbg_is_ff_bitflips(ubi, MASK_IO_FF_BITFLIPS_VID)) {
+		ubi_warn(ubi, "bit-all-ff with error reported by MTD driver (emulated)\n");
+		return UBI_IO_FF_BITFLIPS;
+	}
+
+	if (ubi_dbg_is_bad_hdr(ubi, MASK_BAD_HDR_VID)) {
+		ubi_warn(ubi, "bad_hdr (emulated)\n");
+		return UBI_IO_BAD_HDR;
+	}
+
+	if (ubi_dbg_is_bad_hdr_ebadmsg(ubi, MASK_BAD_HDR_EBADMSG_VID)) {
+		ubi_warn(ubi, "bad_hdr with ECC error (emulated)\n");
+		return UBI_IO_BAD_HDR_EBADMSG;
+	}
+
+	return 0;
 }
 
 /**
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 41f57d5717b2..e4b547514504 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -1117,6 +1117,19 @@ static inline struct ubi_vid_hdr *ubi_get_vid_hdr(struct ubi_vid_io_buf *vidb)
 	return vidb->hdr;
 }
 
+/**
+ * ubi_ro_mode - switch to read-only mode.
+ * @ubi: UBI device description object
+ */
+static inline void ubi_ro_mode(struct ubi_device *ubi)
+{
+	if (!ubi->ro_mode) {
+		ubi->ro_mode = 1;
+		ubi_warn(ubi, "switch to read-only mode");
+		dump_stack();
+	}
+}
+
 /*
  * This function is equivalent to 'ubi_io_read()', but @offset is relative to
  * the beginning of the logical eraseblock, not to the beginning of the
@@ -1138,20 +1151,13 @@ static inline int ubi_io_write_data(struct ubi_device *ubi, const void *buf,
 				    int pnum, int offset, int len)
 {
 	ubi_assert(offset >= 0);
-	return ubi_io_write(ubi, buf, pnum, offset + ubi->leb_start, len);
-}
 
-/**
- * ubi_ro_mode - switch to read-only mode.
- * @ubi: UBI device description object
- */
-static inline void ubi_ro_mode(struct ubi_device *ubi)
-{
-	if (!ubi->ro_mode) {
-		ubi->ro_mode = 1;
-		ubi_warn(ubi, "switch to read-only mode");
-		dump_stack();
+	if (ubi_dbg_power_cut(ubi, MASK_POWER_CUT_DATA)) {
+		ubi_warn(ubi, "XXXXX emulating a power cut when writing data XXXXX");
+		ubi_ro_mode(ubi);
+		return -EROFS;
 	}
+	return ubi_io_write(ubi, buf, pnum, offset + ubi->leb_start, len);
 }
 
 /**
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
