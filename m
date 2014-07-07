Received: from szxga02-in.huawei.com ([119.145.14.65])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X43GT-0007xi-DB
 for linux-mtd@lists.infradead.org; Mon, 07 Jul 2014 07:23:06 +0000
Message-ID: <53BA4AA0.7040905@huawei.com>
Date: Mon, 7 Jul 2014 15:22:08 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: [PATCH 4/7] Add libubifs.h
References: <53BA491E.8060502@huawei.com>
In-Reply-To: <53BA491E.8060502@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Header file of libubifs.c.

Could I have other ways to get 'ALIGN' and 'min_t' instead
of define them in this file?


Signed-off-by: hujianyang <hujianyang@huawei.com>
---
 ubi-utils/include/libubifs.h | 87 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 ubi-utils/include/libubifs.h

diff --git a/ubi-utils/include/libubifs.h b/ubi-utils/include/libubifs.h
new file mode 100644
index 0000000..94d259f
--- /dev/null
+++ b/ubi-utils/include/libubifs.h
@@ -0,0 +1,87 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * Author: Hu Jianyang <hujianyang@huawei.com>
+ *
+ * UBIFS library.
+ */
+
+#ifndef __LIBUBIFS_H__
+#define __LIBUBIFS_H__
+
+#include <mtd/ubifs-media.h>
+
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+#define ALIGN(x,a) __ALIGN_MASK(x,(typeof(x))(a)-1)
+#define __ALIGN_MASK(x,mask) (((x)+(mask))&~(mask))
+
+#define min_t(t,x,y) ({ \
+	typeof((x)) _x = (x); \
+	typeof((y)) _y = (y); \
+	(_x < _y) ? _x : _y; \
+})
+
+/*
+ * 'ubifs_scan_a_node()' return values.
+ *
+ * SCANNED_GARBAGE:  scanned garbage
+ * SCANNED_EMPTY_SPACE: scanned empty space
+ * SCANNED_A_NODE: scanned a valid node
+ * SCANNED_A_CORRUPT_NODE: scanned a corrupted node
+ * SCANNED_A_BAD_PAD_NODE: scanned a padding node with invalid pad length
+ *
+ * Greater than zero means: 'scanned that number of padding bytes'
+ */
+enum {
+	SCANNED_GARBAGE        = 0,
+	SCANNED_EMPTY_SPACE    = -1,
+	SCANNED_A_NODE         = -2,
+	SCANNED_A_CORRUPT_NODE = -3,
+	SCANNED_A_BAD_PAD_NODE = -4,
+};
+
+void ubifs_dump_node(const void *node);
+
+/**
+ * ubifs_scan_a_node - scan for a node or padding.
+ * @buf: buffer to scan
+ * @size: logical eraseblock size
+ * @len: length of buffer
+ * @lnum: logical eraseblock number
+ * @offs: offset within the logical eraseblock
+ *
+ * This function returns a scanning code to indicate what was scanned.
+ */
+int ubifs_scan_a_node(void *buf, int leb_size, int len, int lnum, int offs);
+
+/**
+ * ubifs_scan - scan a logical eraseblock.
+ * @lnum: logical eraseblock number
+ * @sbuf: scan buffer
+ * @size: size of @buf in bytes
+ * @offs: offset to start at (usually zero)
+ * @detailed: print NODEs detailed info
+ *
+ * This function scans LEB and prints complete information about
+ * its contents.
+ */
+void ubifs_scan(int lnum, void *buf, int leb_size, int offs, int detailed);
+
+#ifdef __cplusplus
+}
+#endif
+
+#endif /*!__LIBUBIFS_H__ */
-- 
1.8.1.4
