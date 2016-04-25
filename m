Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1auolT-0004nH-0K
 for linux-mtd@lists.infradead.org; Mon, 25 Apr 2016 22:13:59 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 2/8] mtd-utils: Add multi-block erase function
Date: Tue, 26 Apr 2016 00:13:23 +0200
Message-Id: <1461622409-14970-3-git-send-email-richard@nod.at>
In-Reply-To: <1461622409-14970-1-git-send-email-richard@nod.at>
References: <1461622409-14970-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 include/libmtd.h | 14 ++++++++++++++
 lib/libmtd.c     | 16 +++++++++++++---
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/include/libmtd.h b/include/libmtd.h
index a78c8cb..f3089d4 100644
--- a/include/libmtd.h
+++ b/include/libmtd.h
@@ -174,6 +174,20 @@ int mtd_lock(const struct mtd_dev_info *mtd, int fd, int eb);
 int mtd_unlock(const struct mtd_dev_info *mtd, int fd, int eb);
 
 /**
+ * mtd_erase - erase multiple eraseblocks.
+ * @desc: MTD library descriptor
+ * @mtd: MTD device description object
+ * @fd: MTD device node file descriptor
+ * @eb: index of first eraseblock to erase
+ * @blocks: the number of eraseblocks to erase
+ *
+ * This function erases eraseblock @eb of MTD device described by @fd. Returns
+ * %0 in case of success and %-1 in case of failure.
+ */
+int mtd_erase_multi(libmtd_t desc, const struct mtd_dev_info *mtd,
+			int fd, int eb, int blocks);
+
+/**
  * mtd_erase - erase an eraseblock.
  * @desc: MTD library descriptor
  * @mtd: MTD device description object
diff --git a/lib/libmtd.c b/lib/libmtd.c
index 1717468..6101238 100644
--- a/lib/libmtd.c
+++ b/lib/libmtd.c
@@ -845,7 +845,8 @@ int mtd_unlock(const struct mtd_dev_info *mtd, int fd, int eb)
 	return mtd_xlock(mtd, fd, eb, MEMUNLOCK);
 }
 
-int mtd_erase(libmtd_t desc, const struct mtd_dev_info *mtd, int fd, int eb)
+int mtd_erase_multi(libmtd_t desc, const struct mtd_dev_info *mtd,
+			int fd, int eb, int blocks)
 {
 	int ret;
 	struct libmtd *lib = (struct libmtd *)desc;
@@ -856,8 +857,12 @@ int mtd_erase(libmtd_t desc, const struct mtd_dev_info *mtd, int fd, int eb)
 	if (ret)
 		return ret;
 
-	ei64.start = (__u64)eb * mtd->eb_size;
-	ei64.length = mtd->eb_size;
+	ret = mtd_valid_erase_block(mtd, eb + blocks - 1);
+	if (ret)
+		return ret;
+
+	ei64.start = (__u64)eb * (__u64)mtd->eb_size;
+	ei64.length = (__u64)mtd->eb_size * (__u64)blocks;
 
 	if (lib->offs64_ioctls == OFFS64_IOCTLS_SUPPORTED ||
 	    lib->offs64_ioctls == OFFS64_IOCTLS_UNKNOWN) {
@@ -892,6 +897,11 @@ int mtd_erase(libmtd_t desc, const struct mtd_dev_info *mtd, int fd, int eb)
 	return 0;
 }
 
+int mtd_erase(libmtd_t desc, const struct mtd_dev_info *mtd, int fd, int eb)
+{
+	return mtd_erase_multi(desc, mtd, fd, eb, 1);
+}
+
 int mtd_regioninfo(int fd, int regidx, struct region_info_user *reginfo)
 {
 	int ret;
-- 
2.7.3
