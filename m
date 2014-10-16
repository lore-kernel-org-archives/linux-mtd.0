Received: from szxga02-in.huawei.com ([119.145.14.65])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xejrw-0008Qp-E1
 for linux-mtd@lists.infradead.org; Thu, 16 Oct 2014 12:09:26 +0000
Message-ID: <543FB535.10105@huawei.com>
Date: Thu, 16 Oct 2014 20:08:21 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 2/2] mtd-utils: Remove duplicate macros from mkfs.ubifs/def.h
References: <543FB3C1.9050800@huawei.com>
In-Reply-To: <543FB3C1.9050800@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These macros have been moved to include/common.h. This patch removes
duplicate macros from mkfs.ubifs/def.h and include these macros from
common.h

As each file which include common.h must define a PROGRAM_NAME, this
patch also adds PROGRAM_NAME for every c file in mkfs.ubifs/


Signed-off-by: hujianyang <hujianyang@huawei.com>
---
 mkfs.ubifs/compr.c      |    2 ++
 mkfs.ubifs/defs.h       |   15 ---------------
 mkfs.ubifs/devtable.c   |    2 ++
 mkfs.ubifs/lpt.c        |    2 ++
 mkfs.ubifs/mkfs.ubifs.h |    1 +
 5 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/mkfs.ubifs/compr.c b/mkfs.ubifs/compr.c
index 4152b6a..6d62033 100644
--- a/mkfs.ubifs/compr.c
+++ b/mkfs.ubifs/compr.c
@@ -20,6 +20,8 @@
  *          Zoltan Sogor
  */

+#define PROGRAM_NAME "compr"
+
 #include <stdlib.h>
 #include <stdio.h>
 #include <stdint.h>
diff --git a/mkfs.ubifs/defs.h b/mkfs.ubifs/defs.h
index 06cf9e5..1fa3316 100644
--- a/mkfs.ubifs/defs.h
+++ b/mkfs.ubifs/defs.h
@@ -29,21 +29,6 @@
 #define le32_to_cpu(x) (t32((x)))
 #define le64_to_cpu(x) (t64((x)))

-#define ALIGN(x,a) __ALIGN_MASK(x,(typeof(x))(a)-1)
-#define __ALIGN_MASK(x,mask) (((x)+(mask))&~(mask))
-
-#define min_t(t,x,y) ({ \
-	typeof((x)) _x = (x); \
-	typeof((y)) _y = (y); \
-	(_x < _y) ? _x : _y; \
-})
-
-#define max_t(t,x,y) ({ \
-	typeof((x)) _x = (x); \
-	typeof((y)) _y = (y); \
-	(_x > _y) ? _x : _y; \
-})
-
 #define unlikely(x) (x)

 #define ubifs_assert(x) ({})
diff --git a/mkfs.ubifs/devtable.c b/mkfs.ubifs/devtable.c
index dee035d..2358197 100644
--- a/mkfs.ubifs/devtable.c
+++ b/mkfs.ubifs/devtable.c
@@ -44,6 +44,8 @@
  * for more information about what the device table is.
  */

+#define PROGRAM_NAME "devtable"
+
 #include "mkfs.ubifs.h"
 #include "hashtable/hashtable.h"
 #include "hashtable/hashtable_itr.h"
diff --git a/mkfs.ubifs/lpt.c b/mkfs.ubifs/lpt.c
index f6d4352..94e8f9d 100644
--- a/mkfs.ubifs/lpt.c
+++ b/mkfs.ubifs/lpt.c
@@ -20,6 +20,8 @@
  *          Artem Bityutskiy
  */

+#define PROGRAM_NAME "lpt"
+
 #include "mkfs.ubifs.h"

 /**
diff --git a/mkfs.ubifs/mkfs.ubifs.h b/mkfs.ubifs/mkfs.ubifs.h
index 6030c48..6f6feb8 100644
--- a/mkfs.ubifs/mkfs.ubifs.h
+++ b/mkfs.ubifs/mkfs.ubifs.h
@@ -51,6 +51,7 @@
 #include "crc16.h"
 #include "ubifs-media.h"
 #include "ubifs.h"
+#include "common.h"
 #include "key.h"
 #include "lpt.h"
 #include "compr.h"
-- 
1.6.0.2
