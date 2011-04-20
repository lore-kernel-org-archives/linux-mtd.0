Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCTo9-0005kZ-3a
	for linux-mtd@lists.infradead.org; Wed, 20 Apr 2011 09:34:50 +0000
From: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
To: Mike Frysinger <vapier.adi@gmail.com>,
	Artem Bityutskiy <dedekind1@gmail.com>, linux-mtd@lists.infradead.org
Subject: [PATCHv4 2/3] libmtd: use PRIu64 classifier for uint64_t printf
	arguments
Date: Wed, 20 Apr 2011 12:35:09 +0300
Message-Id: <0bd629717df8aefb5b2eca07fcf6c1abe8c67c70.1303292025.git.ext-andriy.shevchenko@nokia.com>
In-Reply-To: <54dce27649702199efe5afb3d14e8f3f6103da00.1303292025.git.ext-andriy.shevchenko@nokia.com>
In-Reply-To: <54dce27649702199efe5afb3d14e8f3f6103da00.1303292025.git.ext-andriy.shevchenko@nokia.com>
References: <BANLkTi=gsiTx9PHQ7HJpzuZT2DvzGU_OqA@mail.gmail.com>
	<54dce27649702199efe5afb3d14e8f3f6103da00.1303292025.git.ext-andriy.shevchenko@nokia.com>
References: <54dce27649702199efe5afb3d14e8f3f6103da00.1303292025.git.ext-andriy.shevchenko@nokia.com>
Cc: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
---
 lib/libmtd.c |   27 +++++++++++----------------
 1 files changed, 11 insertions(+), 16 deletions(-)

diff --git a/lib/libmtd.c b/lib/libmtd.c
index 418ba29..7fabd80 100644
--- a/lib/libmtd.c
+++ b/lib/libmtd.c
@@ -31,9 +31,11 @@
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <sys/ioctl.h>
-#include <mtd/mtd-user.h>
+#include <inttypes.h>
 
+#include <mtd/mtd-user.h>
 #include <libmtd.h>
+
 #include "libmtd_int.h"
 #include "common.h"
 
@@ -1096,19 +1098,16 @@ int do_oob_op(libmtd_t desc, const struct mtd_dev_info *mtd, int fd,
 
 	max_offs = (unsigned long long)mtd->eb_cnt * mtd->eb_size;
 	if (start >= max_offs) {
-		errmsg("bad page address %llu, mtd%d has %d eraseblocks "
-		       "(%llu bytes)", (unsigned long long) start, mtd->mtd_num,
-		       mtd->eb_cnt, max_offs);
+		errmsg("bad page address %" PRIu64 ", mtd%d has %d eraseblocks (%llu bytes)",
+		       start, mtd->mtd_num, mtd->eb_cnt, max_offs);
 		errno = EINVAL;
 		return -1;
 	}
 
 	oob_offs = start & (mtd->min_io_size - 1);
 	if (oob_offs + length > mtd->oob_size || length == 0) {
-		errmsg("Cannot write %llu OOB bytes to address %llu "
-		       "(OOB offset %u) - mtd%d OOB size is only %d bytes",
-		       (unsigned long long)length, (unsigned long long)start,
-		       oob_offs, mtd->mtd_num,  mtd->oob_size);
+		errmsg("Cannot write %" PRIu64 " OOB bytes to address %" PRIu64 " (OOB offset %u) - mtd%d OOB size is only %d bytes",
+		       length, start, oob_offs, mtd->mtd_num,  mtd->oob_size);
 		errno = EINVAL;
 		return -1;
 	}
@@ -1125,10 +1124,8 @@ int do_oob_op(libmtd_t desc, const struct mtd_dev_info *mtd, int fd,
 
 		if (errno != ENOTTY ||
 		    lib->offs64_ioctls != OFFS64_IOCTLS_UNKNOWN) {
-			sys_errmsg("%s ioctl failed for mtd%d, offset %llu "
-				   "(eraseblock %llu)", cmd64_str, mtd->mtd_num,
-				   (unsigned long long)start,
-				   (unsigned long long)start / mtd->eb_size);
+			sys_errmsg("%s ioctl failed for mtd%d, offset %" PRIu64 " (eraseblock %" PRIu64 ")",
+				   cmd64_str, mtd->mtd_num, start, start / mtd->eb_size);
 		}
 
 		/*
@@ -1152,10 +1149,8 @@ int do_oob_op(libmtd_t desc, const struct mtd_dev_info *mtd, int fd,
 
 	ret = ioctl(fd, cmd, &oob);
 	if (ret < 0)
-		sys_errmsg("%s ioctl failed for mtd%d, offset %llu "
-			   "(eraseblock %llu)", cmd_str, mtd->mtd_num,
-			   (unsigned long long)start,
-			   (unsigned long long)start / mtd->eb_size);
+		sys_errmsg("%s ioctl failed for mtd%d, offset %" PRIu64 " (eraseblock %" PRIu64 ")",
+			   cmd_str, mtd->mtd_num, start, start / mtd->eb_size);
 	return ret;
 }
 
-- 
1.6.3.3
