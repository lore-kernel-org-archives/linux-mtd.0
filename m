Received: from [69.28.251.93] (helo=b32.net)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OWfBx-00056C-Nk
	for linux-mtd@lists.infradead.org; Thu, 08 Jul 2010 00:42:19 +0000
From: Kevin Cernekee <cernekee@gmail.com>
Date: Wed, 7 Jul 2010 17:30:13 -0700
Subject: [PATCHv2 4/5] libmtd: add support for 64-bit offsets, OOB
Message-Id: <c65631c48fb5d2de8d25f65bffa5e22d@localhost>
In-Reply-To: <eb53f5a0215250d7e523de47d15b0d12@localhost>
References: <eb53f5a0215250d7e523de47d15b0d12@localhost>
To: <dedekind1@gmail.com>, <saeed.bishara@gmail.com>, <jwboyer@gmail.com>,
	<vapier.adi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Change mtd_erase() so that it attempts to use MEMERASE64 first, then falls
back to the old <2.6.31 MEMERASE if MEMERASE64 is unsupported.

Add mtd_read_oob(), mtd_write_oob() functions to wrap the OOB ioctls.
Similar ioctl fallback logic is used in these functions as well.

Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
---
 include/libmtd.h |   36 ++++++++++++++++++++++-
 lib/libmtd.c     |   82 ++++++++++++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 111 insertions(+), 7 deletions(-)

diff --git a/include/libmtd.h b/include/libmtd.h
index 0aea966..292d8c3 100644
--- a/include/libmtd.h
+++ b/include/libmtd.h
@@ -66,6 +66,7 @@ struct mtd_info
  * @region_cnt: count of additional erase regions
  * @writable: zero if the device is read-only
  * @bb_allowed: non-zero if the MTD device may have bad eraseblocks
+ * @legacy_ioctls: non-zero if the kernel lacks MEMERASE64, MEM*OOB64
  */
 struct mtd_dev_info
 {
@@ -84,6 +85,7 @@ struct mtd_dev_info
 	int region_cnt;
 	unsigned int writable:1;
 	unsigned int bb_allowed:1;
+	unsigned int legacy_ioctls:1;
 };
 
 /**
@@ -146,7 +148,37 @@ int mtd_get_dev_info1(libmtd_t desc, int mtd_num, struct mtd_dev_info *mtd);
  * This function erases eraseblock @eb of MTD device described by @fd. Returns
  * %0 in case of success and %-1 in case of failure.
  */
-int mtd_erase(const struct mtd_dev_info *mtd, int fd, int eb);
+int mtd_erase(struct mtd_dev_info *mtd, int fd, int eb);
+
+/**
+ * mtd_read_oob - read OOB bytes
+ * @mtd: MTD device description object
+ * @fd: MTD device node file descriptor
+ * @start: page-aligned start address
+ * @length: number of OOB bytes to read
+ * @data: read buffer
+ *
+ * This function reads @length OOB bytes starting from address @start on
+ * MTD device described by @fd. Returns %0 in case of success and %-1 in
+ * case of failure.
+ */
+int mtd_read_oob(struct mtd_dev_info *mtd, int fd, uint64_t start,
+	uint64_t length, void *data);
+
+/**
+ * mtd_write_oob - write OOB bytes
+ * @mtd: MTD device description object
+ * @fd: MTD device node file descriptor
+ * @start: page-aligned start address
+ * @length: number of OOB bytes to write
+ * @data: write buffer
+ *
+ * This function writes @length OOB bytes starting from address @start on
+ * MTD device described by @fd. Returns %0 in case of success and %-1 in
+ * case of failure.
+ */
+int mtd_write_oob(struct mtd_dev_info *mtd, int fd, uint64_t start,
+	uint64_t length, void *data);
 
 /**
  * mtd_torture - torture an eraseblock.
@@ -157,7 +189,7 @@ int mtd_erase(const struct mtd_dev_info *mtd, int fd, int eb);
  * This function tortures eraseblock @eb. Returns %0 in case of success and %-1
  * in case of failure.
  */
-int mtd_torture(const struct mtd_dev_info *mtd, int fd, int eb);
+int mtd_torture(struct mtd_dev_info *mtd, int fd, int eb);
 
 /**
  * mtd_is_bad - check if eraseblock is bad.
diff --git a/lib/libmtd.c b/lib/libmtd.c
index 3ff031c..66e794a 100644
--- a/lib/libmtd.c
+++ b/lib/libmtd.c
@@ -32,6 +32,7 @@
 #include <sys/stat.h>
 #include <sys/ioctl.h>
 #include <mtd/mtd-user.h>
+#include <mtd/mtd-abi.h>
 
 #include <libmtd.h>
 #include "libmtd_int.h"
@@ -789,13 +790,84 @@ int mtd_get_dev_info(libmtd_t desc, const char *node, struct mtd_dev_info *mtd)
 	return mtd_get_dev_info1(desc, mtd_num, mtd);
 }
 
-int mtd_erase(const struct mtd_dev_info *mtd, int fd, int eb)
+int mtd_erase(struct mtd_dev_info *mtd, int fd, int eb)
 {
-	struct erase_info_user ei;
+	int ret;
+	struct erase_info_user64 ei;
 
-	ei.start = eb * mtd->eb_size;;
+	ei.start = (__u64)eb * mtd->eb_size;
 	ei.length = mtd->eb_size;
-	return ioctl(fd, MEMERASE, &ei);
+
+	if (!mtd->legacy_ioctls) {
+		ret = ioctl(fd, MEMERASE64, &ei);
+		if (ret < 0 && errno == ENOTTY)
+			mtd->legacy_ioctls = 1;
+	}
+
+	if (mtd->legacy_ioctls) {
+		struct erase_info_user ei_old;
+
+		ei_old.start = ei.start;
+		ei_old.length = ei.length;
+
+		if (ei_old.start != ei.start) {
+			errno = EOVERFLOW;
+			return -1;
+		}
+
+		ret = ioctl(fd, MEMERASE, &ei_old);
+	}
+
+	return ret;
+}
+
+static int mtd_oob_op(int cmd, int cmd_old, struct mtd_dev_info *mtd, int fd,
+	uint64_t start, uint64_t length, void *data)
+{
+	int ret;
+	struct mtd_oob_buf64 oob;
+
+	oob.start = start;
+	oob.length = length;
+	oob.usr_ptr = (__u64)(unsigned long)data;
+
+	if (!mtd->legacy_ioctls) {
+		ret = ioctl(fd, cmd, &oob);
+		if (ret < 0 && errno == ENOTTY)
+			mtd->legacy_ioctls = 1;
+	}
+
+	if (mtd->legacy_ioctls) {
+		struct mtd_oob_buf oob_old;
+
+		oob_old.start = oob.start;
+		oob_old.length = oob.length;
+		oob_old.ptr = data;
+
+		if (oob_old.start != oob.start ||
+				oob_old.length != oob.length) {
+			errno = EOVERFLOW;
+			return -1;
+		}
+
+		ret = ioctl(fd, cmd_old, &oob_old);
+	}
+
+	return ret;
+}
+
+int mtd_read_oob(struct mtd_dev_info *mtd, int fd, uint64_t start,
+	uint64_t length, void *data)
+{
+	return mtd_oob_op(MEMREADOOB64, MEMREADOOB, mtd, fd, start, length,
+		data);
+}
+
+int mtd_write_oob(struct mtd_dev_info *mtd, int fd, uint64_t start,
+	uint64_t length, void *data)
+{
+	return mtd_oob_op(MEMWRITEOOB64, MEMWRITEOOB, mtd, fd, start, length,
+		data);
 }
 
 /* Patterns to write to a physical eraseblock when torturing it */
@@ -820,7 +892,7 @@ static int check_pattern(const void *buf, uint8_t patt, int size)
 	return 1;
 }
 
-int mtd_torture(const struct mtd_dev_info *mtd, int fd, int eb)
+int mtd_torture(struct mtd_dev_info *mtd, int fd, int eb)
 {
 	int err, i, patt_count;
 	void *buf;
-- 
1.7.0.4
