Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Na9fv-00041a-Ev
	for linux-mtd@lists.infradead.org; Wed, 27 Jan 2010 15:19:27 +0000
Received: from vaebh105.NOE.Nokia.com (vaebh105.europe.nokia.com
	[10.160.244.31])
	by mgw-mx09.nokia.com (Switch-3.3.3/Switch-3.3.3) with ESMTP id
	o0RFJECQ015807
	for <linux-mtd@lists.infradead.org>; Wed, 27 Jan 2010 09:19:22 -0600
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 5/5] UBI: add write checking
Date: Wed, 27 Jan 2010 17:19:00 +0200
Message-Id: <1264605540-13144-6-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1264605540-13144-1-git-send-email-dedekind1@gmail.com>
References: <1264605540-13144-1-git-send-email-dedekind1@gmail.com>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Add an extra debugging check function which validates writes.
After every write it reads the data back, compares it with the
original data, and complains if they mismatch.

Useful for debugging. No-op if extra debugging checks are disabled.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/debug.h |    4 +++
 drivers/mtd/ubi/io.c    |   70 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 74 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/ubi/debug.h b/drivers/mtd/ubi/debug.h
index f30bcb3..17a1071 100644
--- a/drivers/mtd/ubi/debug.h
+++ b/drivers/mtd/ubi/debug.h
@@ -96,8 +96,11 @@ void ubi_dbg_dump_flash(struct ubi_device *ubi, int pnum, int offset, int len);
 
 #ifdef CONFIG_MTD_UBI_DEBUG_PARANOID
 int ubi_dbg_check_all_ff(struct ubi_device *ubi, int pnum, int offset, int len);
+int ubi_dbg_check_write(struct ubi_device *ubi, const void *buf, int pnum,
+			int offset, int len);
 #else
 #define ubi_dbg_check_all_ff(ubi, pnum, offset, len) 0
+#define ubi_dbg_check_write(ubi, buf, pnum, offset, len) 0
 #endif
 
 #ifdef CONFIG_MTD_UBI_DEBUG_DISABLE_BGT
@@ -176,6 +179,7 @@ static inline int ubi_dbg_is_erase_failure(void)
 #define ubi_dbg_is_write_failure() 0
 #define ubi_dbg_is_erase_failure() 0
 #define ubi_dbg_check_all_ff(ubi, pnum, offset, len) 0
+#define ubi_dbg_check_write(ubi, buf, pnum, offset, len) 0
 
 #endif /* !CONFIG_MTD_UBI_DEBUG */
 #endif /* !__UBI_DEBUG_H__ */
diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index a250129..b4ecc84 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -273,6 +273,21 @@ int ubi_io_write(struct ubi_device *ubi, const void *buf, int pnum, int offset,
 	} else
 		ubi_assert(written == len);
 
+	if (!err) {
+		err = ubi_dbg_check_write(ubi, buf, pnum, offset, len);
+		if (err)
+			return err;
+
+		/*
+		 * Since we always write sequentially, the rest of the PEB has
+		 * to contain only 0xFF bytes.
+		 */
+		offset += len;
+		len = ubi->peb_size - offset;
+		if (len)
+			err = ubi_dbg_check_all_ff(ubi, pnum, offset, len);
+	}
+
 	return err;
 }
 
@@ -1282,6 +1297,61 @@ exit:
 }
 
 /**
+ * ubi_dbg_check_write - make sure write succeeded.
+ * @ubi: UBI device description object
+ * @buf: buffer with data which were written
+ * @pnum: physical eraseblock number the data were written to
+ * @offset: offset within the physical eraseblock the data were written to
+ * @len: how many bytes were written
+ *
+ * This functions reads data which were recently written and compares it with
+ * the original data buffer - the data have to match. Returns zero if the data
+ * match and a negative error code if not or in case of failure.
+ */
+int ubi_dbg_check_write(struct ubi_device *ubi, const void *buf, int pnum,
+			int offset, int len)
+{
+	int err, i;
+
+	mutex_lock(&ubi->dbg_buf_mutex);
+	err = ubi_io_read(ubi, ubi->dbg_peb_buf, pnum, offset, len);
+	if (err)
+		goto out_unlock;
+
+	for (i = 0; i < len; i++) {
+		uint8_t c = ((uint8_t *)buf)[i];
+		uint8_t c1 = ((uint8_t *)ubi->dbg_peb_buf)[i];
+		int dump_len;
+
+		if (c == c1)
+			continue;
+
+		ubi_err("paranoid check failed for PEB %d:%d, len %d",
+			pnum, offset, len);
+		ubi_msg("data differ at position %d", i);
+		dump_len = max_t(int, 128, len - i);
+		ubi_msg("hex dump of the original buffer from %d to %d",
+			i, i + dump_len);
+		print_hex_dump(KERN_DEBUG, "", DUMP_PREFIX_OFFSET, 32, 1,
+			       buf + i, dump_len, 1);
+		ubi_msg("hex dump of the read buffer from %d to %d",
+			i, i + dump_len);
+		print_hex_dump(KERN_DEBUG, "", DUMP_PREFIX_OFFSET, 32, 1,
+			       ubi->dbg_peb_buf + i, dump_len, 1);
+		ubi_dbg_dump_stack();
+		err = -EINVAL;
+		goto out_unlock;
+	}
+	mutex_unlock(&ubi->dbg_buf_mutex);
+
+	return 0;
+
+out_unlock:
+	mutex_unlock(&ubi->dbg_buf_mutex);
+	return err;
+}
+
+/**
  * ubi_dbg_check_all_ff - check that a region of flash is empty.
  * @ubi: UBI device description object
  * @pnum: the physical eraseblock number to check
-- 
1.6.6
