Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zx7jm-0001vC-9A
 for linux-mtd@lists.infradead.org; Fri, 13 Nov 2015 06:21:33 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <computersforpeace@gmail.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>
CC: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v3 01/27] ubifs: pick some common definitions into
 ubifs_common.h
Date: Fri, 13 Nov 2015 14:13:12 +0800
Message-ID: <1447395218-7061-2-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1447395218-7061-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1447395218-7061-1-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Currently, lpt.c is including mkfs.ubifs.h. That make
the lpt depend on mkfs.ubifs. It's not good if we want
to introduce some more tools for ubifs, such as fsck.ubifs.

This patch start to cut off the dependence from libs, such
as lpt, devtable, to mkfs.ubifs.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.h   | 46 +-------------------------------
 ubifs-utils/mkfs.ubifs/ubifs_common.h | 50 +++++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+), 45 deletions(-)
 create mode 100644 ubifs-utils/mkfs.ubifs/ubifs_common.h

diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.h b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.h
index 944a159..d6d46a2 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.h
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.h
@@ -23,37 +23,12 @@
 #ifndef __MKFS_UBIFS_H__
 #define __MKFS_UBIFS_H__
 
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <limits.h>
-#include <string.h>
-#include <stdint.h>
-#include <endian.h>
-#include <byteswap.h>
-#include <linux/types.h>
-#include <linux/fs.h>
-
-#include <getopt.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
-#include <fcntl.h>
-#include <dirent.h>
-#include <errno.h>
-#include <libgen.h>
-#include <ctype.h>
-#include <uuid/uuid.h>
-#include <sys/file.h>
-
-#include <mtd/ubifs-media.h>
+#include "ubifs_common.h"
 
 /* common.h requires the PROGRAM_NAME macro */
 #define PROGRAM_NAME "mkfs.ubifs"
 #include "common.h"
 
-#include "libubi.h"
-#include "defs.h"
 #include "crc16.h"
 #include "ubifs.h"
 #include "key.h"
@@ -74,25 +49,6 @@
 #error MKFS_UBIFS_COMPR_ZLIB != UBIFS_COMPR_ZLIB
 #endif
 
-extern int verbose;
-extern int debug_level;
-
-#define dbg_msg(lvl, fmt, ...) do {if (debug_level >= lvl)                \
-	printf("mkfs.ubifs: %s: " fmt "\n", __FUNCTION__, ##__VA_ARGS__); \
-} while(0)
-
-#define err_msg(fmt, ...) ({                                \
-	fprintf(stderr, "Error: " fmt "\n", ##__VA_ARGS__); \
-	-1;                                                 \
-})
-
-#define sys_err_msg(fmt, ...) ({                                         \
-	int err_ = errno;                                                \
-	fprintf(stderr, "Error: " fmt "\n", ##__VA_ARGS__);              \
-	fprintf(stderr, "       %s (error %d)\n", strerror(err_), err_); \
-	-1;                                                              \
-})
-
 /**
  * struct path_htbl_element - an element of the path hash table.
  * @path: the UBIFS path the element describes (the key of the element)
diff --git a/ubifs-utils/mkfs.ubifs/ubifs_common.h b/ubifs-utils/mkfs.ubifs/ubifs_common.h
new file mode 100644
index 0000000..958c20a
--- /dev/null
+++ b/ubifs-utils/mkfs.ubifs/ubifs_common.h
@@ -0,0 +1,50 @@
+#ifndef __UBIFS_COMMON_H__
+#define __UBIFS_COMMON_H__
+
+#include <unistd.h>
+#include <stdlib.h>
+#include <stdio.h>
+#include <limits.h>
+#include <string.h>
+#include <stdint.h>
+#include <endian.h>
+#include <byteswap.h>
+#include <linux/types.h>
+#include <linux/fs.h>
+
+#include <getopt.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <sys/ioctl.h>
+#include <fcntl.h>
+#include <dirent.h>
+#include <errno.h>
+#include <libgen.h>
+#include <ctype.h>
+#include <uuid/uuid.h>
+#include <sys/file.h>
+
+#include <mtd/ubifs-media.h>
+
+#include "libubi.h"
+#include "defs.h"
+
+extern int verbose;
+extern int debug_level;
+
+#define dbg_msg(lvl, fmt, ...) do {if (debug_level >= lvl)                \
+	printf("ubifs: %s: " fmt "\n", __FUNCTION__, ##__VA_ARGS__); \
+} while(0)
+
+#define err_msg(fmt, ...) ({                                \
+	fprintf(stderr, "Error: " fmt "\n", ##__VA_ARGS__); \
+	-1;                                                 \
+})
+
+#define sys_err_msg(fmt, ...) ({                                         \
+	int err_ = errno;                                                \
+	fprintf(stderr, "Error: " fmt "\n", ##__VA_ARGS__);              \
+	fprintf(stderr, "       %s (error %d)\n", strerror(err_), err_); \
+	-1;                                                              \
+})
+#endif
-- 
1.8.4.2
