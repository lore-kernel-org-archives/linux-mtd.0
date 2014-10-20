Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgAZ0-0002az-In
 for linux-mtd@lists.infradead.org; Mon, 20 Oct 2014 10:51:46 +0000
Message-ID: <1413802282.7906.223.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 2/2] mtd-utils:  Remove duplicate macros from
 mkfs.ubifs/def.h
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: hujianyang <hujianyang@huawei.com>
Date: Mon, 20 Oct 2014 13:51:22 +0300
In-Reply-To: <543FB535.10105@huawei.com>
References: <543FB3C1.9050800@huawei.com> <543FB535.10105@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
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

On Thu, 2014-10-16 at 20:08 +0800, hujianyang wrote:
> +#define PROGRAM_NAME "compr"

PROGRAM_NAME is the name of the end program, and there is no 'compre' or
'lpt' program.

Instead of this patch, I've pushed the one below, thanks!

>From dd183c2c8000d42073d19fefc2740dc50bafd287 Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Date: Mon, 20 Oct 2014 13:47:09 +0300
Subject: [PATCH] mkfs.ubifs: start using common code

Several commonly used macros are now defined in 'common.h', let's start using
them in mkfs.ubifs, instead of duplicating them.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 mkfs.ubifs/defs.h       | 15 ---------------
 mkfs.ubifs/mkfs.ubifs.c |  1 -
 mkfs.ubifs/mkfs.ubifs.h |  4 ++++
 3 files changed, 4 insertions(+), 16 deletions(-)

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
diff --git a/mkfs.ubifs/mkfs.ubifs.c b/mkfs.ubifs/mkfs.ubifs.c
index 200c8a5..ca17e2b 100644
--- a/mkfs.ubifs/mkfs.ubifs.c
+++ b/mkfs.ubifs/mkfs.ubifs.c
@@ -21,7 +21,6 @@
  */
 
 #define _XOPEN_SOURCE 500 /* For realpath() */
-#define PROGRAM_NAME "mkfs.ubifs"
 
 #include "mkfs.ubifs.h"
 #include <crc32.h>
diff --git a/mkfs.ubifs/mkfs.ubifs.h b/mkfs.ubifs/mkfs.ubifs.h
index 6030c48..3edb79d 100644
--- a/mkfs.ubifs/mkfs.ubifs.h
+++ b/mkfs.ubifs/mkfs.ubifs.h
@@ -46,6 +46,10 @@
 #include <uuid/uuid.h>
 #include <sys/file.h>
 
+/* common.h requires the PROGRAM_NAME macro */
+#define PROGRAM_NAME "mkfs.ubifs"
+#include "common.h"
+
 #include "libubi.h"
 #include "defs.h"
 #include "crc16.h"
-- 
1.9.3
