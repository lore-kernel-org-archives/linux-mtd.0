Received: from [69.28.251.93] (helo=b32.net)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OVuHv-0003AG-91
	for linux-mtd@lists.infradead.org; Mon, 05 Jul 2010 22:37:20 +0000
From: Kevin Cernekee <cernekee@gmail.com>
Date: Mon, 5 Jul 2010 15:10:37 -0700
Subject: [PATCH 4/5] libmtd: add support for 64-bit offsets, OOB
Message-Id: <b025d903aab9bff2a1f0ddadff7f31a8@localhost>
References: <4822394121cd0a8f08b0bd3ecd6af199@localhost>
In-Reply-To: <4822394121cd0a8f08b0bd3ecd6af199@localhost>
To: <dedekind1@gmail.com>, <saeed.bishara@gmail.com>, <jwboyer@gmail.com>
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
 include/libmtd.h |   26 +++++++++++++++++++++
 lib/libmtd.c     |   65 +++++++++++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 88 insertions(+), 3 deletions(-)

diff --git a/include/libmtd.h b/include/libmtd.h
index 0aea966..2241343 100644
--- a/include/libmtd.h
+++ b/include/libmtd.h
@@ -149,6 +149,32 @@ int mtd_get_dev_info1(libmtd_t desc, int mtd_num, struct mtd_dev_info *mtd);
 int mtd_erase(const struct mtd_dev_info *mtd, int fd, int eb);
 
 /**
+ * mtd_read_oob - read OOB bytes
+ * @fd: MTD device node file descriptor
+ * @start: page-aligned start address
+ * @length: number of OOB bytes to read
+ * @data: read buffer
+ *
+ * This function reads @length OOB bytes starting from address @start on
+ * MTD device described by @fd. Returns %0 in case of success and %-1 in
+ * case of failure.
+ */
+int mtd_read_oob(int fd, uint64_t start, uint64_t length, void *data);
+
+/**
+ * mtd_write_oob - write OOB bytes
+ * @fd: MTD device node file descriptor
+ * @start: page-aligned start address
+ * @length: number of OOB bytes to write
+ * @data: write buffer
+ *
+ * This function writes @length OOB bytes starting from address @start on
+ * MTD device described by @fd. Returns %0 in case of success and %-1 in
+ * case of failure.
+ */
+int mtd_write_oob(int fd, uint64_t start, uint64_t length, void *data);
+
+/**
  * mtd_torture - torture an eraseblock.
  * @mtd: MTD device description object
  * @fd: MTD device node file descriptor
diff --git a/lib/libmtd.c b/lib/libmtd.c
index 3ff031c..368493b 100644
--- a/lib/libmtd.c
+++ b/lib/libmtd.c
@@ -32,6 +32,7 @@
 #include <sys/stat.h>
 #include <sys/ioctl.h>
 #include <mtd/mtd-user.h>
+#include <mtd/mtd-abi.h>
 
 #include <libmtd.h>
 #include "libmtd_int.h"
@@ -791,11 +792,69 @@ int mtd_get_dev_info(libmtd_t desc, const char *node, struct mtd_dev_info *mtd)
 
 int mtd_erase(const struct mtd_dev_info *mtd, int fd, int eb)
 {
-	struct erase_info_user ei;
+	int ret;
+	struct erase_info_user64 ei;
 
-	ei.start = eb * mtd->eb_size;;
+	ei.start = (__u64)eb * mtd->eb_size;
 	ei.length = mtd->eb_size;
-	return ioctl(fd, MEMERASE, &ei);
+	ret = ioctl(fd, MEMERASE64, &ei);
+
+	if (ret < 0 && errno == ENOTTY) {
+		struct erase_info_user ei_old;
+
+		ei_old.start = (__u32)ei.start;
+		ei_old.length = (__u32)ei.length;
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
+static int mtd_oob_op(int cmd, int cmd_old, int fd, uint64_t start,
+	uint64_t length, void *data)
+{
+	int ret;
+	struct mtd_oob_buf64 oob;
+
+	oob.start = start;
+	oob.length = length;
+	oob.usr_ptr = (__u64)(unsigned long)data;
+
+	ret = ioctl(fd, cmd, &oob);
+
+	if (ret < 0 && errno == ENOTTY) {
+		struct mtd_oob_buf oob_old;
+
+		oob_old.start = (__u32)oob.start;
+		oob_old.length = (__u32)oob.length;
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
+int mtd_read_oob(int fd, uint64_t start, uint64_t length, void *data)
+{
+	return mtd_oob_op(MEMREADOOB64, MEMREADOOB, fd, start, length, data);
+}
+
+int mtd_write_oob(int fd, uint64_t start, uint64_t length, void *data)
+{
+	return mtd_oob_op(MEMWRITEOOB64, MEMWRITEOOB, fd, start, length, data);
 }
 
 /* Patterns to write to a physical eraseblock when torturing it */
-- 
1.6.5
