Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RtMW1-0000P4-LZ
 for linux-mtd@lists.infradead.org; Fri, 03 Feb 2012 17:01:42 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/4] mtd: add offset and length checks to the API function
Date: Fri,  3 Feb 2012 19:01:29 +0200
Message-Id: <1328288491-8744-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1328288491-8744-1-git-send-email-dedekind1@gmail.com>
References: <1328288491-8744-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Add verification of the offset and length to MTD API functions and verify that
MTD device offset and length are within MTD device size.

The modified API functions are:

'mtd_erase()'
'mtd_point()'
'mtd_unpoint()'
'mtd_get_unmapped_area()'
'mtd_read()'
'mtd_write()'
'mtd_panic_write()'
'mtd_lock()'
'mtd_unlock()'
'mtd_is_locked()'
'mtd_block_isbad()'
'mtd_block_markbad()'

This patch also uninlines these functions and exports in mtdcore.c because they
are not performance-critical and do not have to be inlined.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/mtdcore.c   |  150 +++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/mtd.h |  129 +++++-----------------------------------
 2 files changed, 167 insertions(+), 112 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 5ea22cf..13bd4fa 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -683,6 +683,156 @@ void __put_mtd_device(struct mtd_info *mtd)
 EXPORT_SYMBOL_GPL(__put_mtd_device);
 
 /*
+ * Erase is an asynchronous operation.  Device drivers are supposed
+ * to call instr->callback() whenever the operation completes, even
+ * if it completes with a failure.
+ * Callers are supposed to pass a callback function and wait for it
+ * to be called before writing to the block.
+ */
+int mtd_erase(struct mtd_info *mtd, struct erase_info *instr)
+{
+	if (instr->addr > mtd->size || instr->len > mtd->size - instr->addr)
+		return -EINVAL;
+	return mtd->_erase(mtd, instr);
+}
+EXPORT_SYMBOL_GPL(mtd_erase);
+
+/*
+ * This stuff for eXecute-In-Place. phys is optional and may be set to NULL.
+ */
+int mtd_point(struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen,
+	      void **virt, resource_size_t *phys)
+{
+	uint64_t ofs = from;
+
+	*retlen = 0;
+	if (!mtd->_point)
+		return -EOPNOTSUPP;
+	if (from < 0 || from > mtd->size || len > mtd->size - from)
+		return -EINVAL;
+	return mtd->_point(mtd, from, len, retlen, virt, phys);
+}
+EXPORT_SYMBOL_GPL(mtd_point);
+
+/* We probably shouldn't allow XIP if the unpoint isn't a NULL */
+int mtd_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
+{
+	if (!mtd->_point)
+		return -EOPNOTSUPP;
+	if (from < 0 || from > mtd->size || len > mtd->size - from)
+		return -EINVAL;
+	return mtd->_unpoint(mtd, from, len);
+}
+EXPORT_SYMBOL_GPL(mtd_unpoint);
+
+/*
+ * Allow NOMMU mmap() to directly map the device (if not NULL)
+ * - return the address to which the offset maps
+ * - return -ENOSYS to indicate refusal to do the mapping
+ */
+unsigned long mtd_get_unmapped_area(struct mtd_info *mtd, unsigned long len,
+				    unsigned long offset, unsigned long flags)
+{
+	if (!mtd->_get_unmapped_area)
+		return -EOPNOTSUPP;
+	if (offset > mtd->size || len > mtd->size - offset)
+		return -EINVAL;
+	return mtd->_get_unmapped_area(mtd, len, offset, flags);
+}
+EXPORT_SYMBOL_GPL(mtd_get_unmapped_area);
+
+int mtd_read(struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen,
+	     u_char *buf)
+{
+	if (from < 0 || from > mtd->size || len > mtd->size - from)
+		return -EINVAL;
+	return mtd->_read(mtd, from, len, retlen, buf);
+}
+EXPORT_SYMBOL_GPL(mtd_read);
+
+int mtd_write(struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen,
+	      const u_char *buf)
+{
+	*retlen = 0;
+	if (!mtd->_write)
+		return -EROFS;
+	if (to < 0 || to > mtd->size || len > mtd->size - to)
+		return -EINVAL;
+	return mtd->_write(mtd, to, len, retlen, buf);
+}
+EXPORT_SYMBOL_GPL(mtd_write);
+
+/*
+ * In blackbox flight recorder like scenarios we want to make successful writes
+ * in interrupt context. panic_write() is only intended to be called when its
+ * known the kernel is about to panic and we need the write to succeed. Since
+ * the kernel is not going to be running for much longer, this function can
+ * break locks and delay to ensure the write succeeds (but not sleep).
+ */
+int mtd_panic_write(struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen,
+		    const u_char *buf)
+{
+	*retlen = 0;
+	if (!mtd->_panic_write)
+		return -EOPNOTSUPP;
+	if (to < 0 || to > mtd->size || len > mtd->size - to)
+		return -EINVAL;
+	return mtd->_panic_write(mtd, to, len, retlen, buf);
+}
+EXPORT_SYMBOL_GPL(mtd_panic_write);
+
+/* Chip-supported device locking */
+int mtd_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
+{
+	if (!mtd->_lock)
+		return -EOPNOTSUPP;
+	if (ofs < 0 || ofs > mtd->size || len > mtd->size - ofs)
+		return -EINVAL;
+	return mtd->_lock(mtd, ofs, len);
+}
+EXPORT_SYMBOL_GPL(mtd_lock);
+
+int mtd_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
+{
+	if (!mtd->_unlock)
+		return -EOPNOTSUPP;
+	if (ofs < 0 || ofs > mtd->size || len > mtd->size - ofs)
+		return -EINVAL;
+	return mtd->_unlock(mtd, ofs, len);
+}
+EXPORT_SYMBOL_GPL(mtd_unlock);
+
+int mtd_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
+{
+	if (!mtd->_is_locked)
+		return -EOPNOTSUPP;
+	if (ofs < 0 || ofs > mtd->size || len > mtd->size - ofs)
+		return -EINVAL;
+	return mtd->_is_locked(mtd, ofs, len);
+}
+EXPORT_SYMBOL_GPL(mtd_is_locked);
+
+int mtd_block_isbad(struct mtd_info *mtd, loff_t ofs)
+{
+	if (!mtd->_block_isbad)
+		return 0;
+	if (ofs < 0 || ofs > mtd->size)
+		return -EINVAL;
+	return mtd->_block_isbad(mtd, ofs);
+}
+EXPORT_SYMBOL_GPL(mtd_block_isbad);
+
+int mtd_block_markbad(struct mtd_info *mtd, loff_t ofs)
+{
+	if (!mtd->_block_markbad)
+		return -EOPNOTSUPP;
+	if (ofs < 0 || ofs > mtd->size)
+		return -EINVAL;
+	return mtd->_block_markbad(mtd, ofs);
+}
+EXPORT_SYMBOL_GPL(mtd_block_markbad);
+
+/*
  * default_mtd_writev - the default writev method
  * @mtd: mtd device description object pointer
  * @vecs: the vectors to write
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 8c24311..317a80c 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -240,83 +240,18 @@ struct mtd_info {
 	int usecount;
 };
 
-/*
- * Erase is an asynchronous operation.  Device drivers are supposed
- * to call instr->callback() whenever the operation completes, even
- * if it completes with a failure.
- * Callers are supposed to pass a callback function and wait for it
- * to be called before writing to the block.
- */
-static inline int mtd_erase(struct mtd_info *mtd, struct erase_info *instr)
-{
-	return mtd->_erase(mtd, instr);
-}
-
-/*
- * This stuff for eXecute-In-Place. phys is optional and may be set to NULL.
- */
-static inline int mtd_point(struct mtd_info *mtd, loff_t from, size_t len,
-			    size_t *retlen, void **virt, resource_size_t *phys)
-{
-	*retlen = 0;
-	if (!mtd->_point)
-		return -EOPNOTSUPP;
-	return mtd->_point(mtd, from, len, retlen, virt, phys);
-}
-
-/* We probably shouldn't allow XIP if the unpoint isn't a NULL */
-static inline int mtd_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
-{
-	if (!mtd->_point)
-		return -EOPNOTSUPP;
-	return mtd->_unpoint(mtd, from, len);
-}
-
-/*
- * Allow NOMMU mmap() to directly map the device (if not NULL)
- * - return the address to which the offset maps
- * - return -ENOSYS to indicate refusal to do the mapping
- */
-static inline unsigned long mtd_get_unmapped_area(struct mtd_info *mtd,
-						  unsigned long len,
-						  unsigned long offset,
-						  unsigned long flags)
-{
-	if (!mtd->_get_unmapped_area)
-		return -EOPNOTSUPP;
-	return mtd->_get_unmapped_area(mtd, len, offset, flags);
-}
-
-static inline int mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
-			   size_t *retlen, u_char *buf)
-{
-	return mtd->_read(mtd, from, len, retlen, buf);
-}
-
-static inline int mtd_write(struct mtd_info *mtd, loff_t to, size_t len,
-			    size_t *retlen, const u_char *buf)
-{
-	*retlen = 0;
-	if (!mtd->_write)
-		return -EROFS;
-	return mtd->_write(mtd, to, len, retlen, buf);
-}
-
-/*
- * In blackbox flight recorder like scenarios we want to make successful writes
- * in interrupt context. panic_write() is only intended to be called when its
- * known the kernel is about to panic and we need the write to succeed. Since
- * the kernel is not going to be running for much longer, this function can
- * break locks and delay to ensure the write succeeds (but not sleep).
- */
-static inline int mtd_panic_write(struct mtd_info *mtd, loff_t to, size_t len,
-				  size_t *retlen, const u_char *buf)
-{
-	*retlen = 0;
-	if (!mtd->_panic_write)
-		return -EOPNOTSUPP;
-	return mtd->_panic_write(mtd, to, len, retlen, buf);
-}
+int mtd_erase(struct mtd_info *mtd, struct erase_info *instr);
+int mtd_point(struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen,
+	      void **virt, resource_size_t *phys);
+int mtd_unpoint(struct mtd_info *mtd, loff_t from, size_t len);
+unsigned long mtd_get_unmapped_area(struct mtd_info *mtd, unsigned long len,
+				    unsigned long offset, unsigned long flags);
+int mtd_read(struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen,
+	     u_char *buf);
+int mtd_write(struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen,
+	      const u_char *buf);
+int mtd_panic_write(struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen,
+		    const u_char *buf);
 
 static inline int mtd_read_oob(struct mtd_info *mtd, loff_t from,
 			       struct mtd_oob_ops *ops)
@@ -405,27 +340,11 @@ static inline void mtd_sync(struct mtd_info *mtd)
 		mtd->_sync(mtd);
 }
 
-/* Chip-supported device locking */
-static inline int mtd_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
-{
-	if (!mtd->_lock)
-		return -EOPNOTSUPP;
-	return mtd->_lock(mtd, ofs, len);
-}
-
-static inline int mtd_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
-{
-	if (!mtd->_unlock)
-		return -EOPNOTSUPP;
-	return mtd->_unlock(mtd, ofs, len);
-}
-
-static inline int mtd_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
-{
-	if (!mtd->_is_locked)
-		return -EOPNOTSUPP;
-	return mtd->_is_locked(mtd, ofs, len);
-}
+int mtd_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
+int mtd_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
+int mtd_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len);
+int mtd_block_isbad(struct mtd_info *mtd, loff_t ofs);
+int mtd_block_markbad(struct mtd_info *mtd, loff_t ofs);
 
 static inline int mtd_suspend(struct mtd_info *mtd)
 {
@@ -438,20 +357,6 @@ static inline void mtd_resume(struct mtd_info *mtd)
 		mtd->_resume(mtd);
 }
 
-static inline int mtd_block_isbad(struct mtd_info *mtd, loff_t ofs)
-{
-	if (!mtd->_block_isbad)
-		return 0;
-	return mtd->_block_isbad(mtd, ofs);
-}
-
-static inline int mtd_block_markbad(struct mtd_info *mtd, loff_t ofs)
-{
-	if (!mtd->_block_markbad)
-		return -EOPNOTSUPP;
-	return mtd->_block_markbad(mtd, ofs);
-}
-
 static inline uint32_t mtd_div_by_eb(uint64_t sz, struct mtd_info *mtd)
 {
 	if (mtd->erasesize_shift)
-- 
1.7.9
