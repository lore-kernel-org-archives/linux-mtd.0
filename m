Received: from szxga02-in.huawei.com ([119.145.14.65])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xc3Cg-0002FO-1b
 for linux-mtd@lists.infradead.org; Thu, 09 Oct 2014 02:11:43 +0000
Message-ID: <5435EE9B.8040403@huawei.com>
Date: Thu, 9 Oct 2014 10:10:35 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH v4 2/4] ubi-utils: ubidump: add libdump
References: <542A2C57.3090401@huawei.com> <542A2CBE.1050304@huawei.com>
 <1412348025.3795.73.camel@sauron.fi.intel.com>
In-Reply-To: <1412348025.3795.73.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Bill Pringlemeir <bpringlemeir@nbsps.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> 
> These ones do not look like they are in any way specific to the UBI
> dumping library.
> 
> In fact, we already have these in mkfs.ubifs/defs.h, which is also not
> very good.
> 
> Would you please instead use "include/common.h". Put the ALIGN and min_t
> definitions there, and include that file from "libdump.h"?
> 
> As a completely independent patch, you could also clean things up by
> removing the definitions from 'mkfs.ubifs/defs.h' and using
> 'include/common.h' in mkfs.ubifs too.
> 

Hi Artem,

I met a problem when I was doing this moving. The macros define in
mkfs.ubifs/defs.h are used in mkfs.ubifs/key.h and both of them are
included in mkfs.ubifs.h which is widely included by .c files in the
directory "mkfs.ubifs/". If these macros upon are moved into
include/common.h, I have to include "common.h" before "key.h" in
mkfs.ubifs/mkfs.ubifs.h. Then here comes a problem, each file includes
common.h must define a PROGRAM_NAME. So I have to add PROGRAM_NAME
for the file which includes "mkfs.ubifs.h" and get a patch below.

I don't think it's quite good, What's your opinion? Or can we put
these macros in libubi.h? But I think "common.h" is a suitable place
to locate these macros.


Signed-off-by: hujianyang <hujianyang@huawei.com>
---
 include/common.h        |   15 +++++++++++++++
 mkfs.ubifs/compr.c      |    2 ++
 mkfs.ubifs/defs.h       |   15 ---------------
 mkfs.ubifs/devtable.c   |    2 ++
 mkfs.ubifs/lpt.c        |    2 ++
 mkfs.ubifs/mkfs.ubifs.h |    1 +
 6 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/include/common.h b/include/common.h
index 6895e5c..9b8804a 100644
--- a/include/common.h
+++ b/include/common.h
@@ -47,6 +47,21 @@ extern "C" {
 #define min(a, b) MIN(a, b) /* glue for linux kernel source */
 #define ARRAY_SIZE(a) (sizeof(a) / sizeof((a)[0]))

+#define ALIGN(x,a) __ALIGN_MASK(x,(typeof(x))(a)-1)
+#define __ALIGN_MASK(x,mask) (((x)+(mask))&~(mask))
+
+#define min_t(t,x,y) ({ \
+	typeof((x)) _x = (x); \
+	typeof((y)) _y = (y); \
+	(_x < _y) ? _x : _y; \
+})
+
+#define max_t(t,x,y) ({ \
+	typeof((x)) _x = (x); \
+	typeof((y)) _y = (y); \
+	(_x > _y) ? _x : _y; \
+})
+
 #ifndef O_CLOEXEC
 #define O_CLOEXEC 0
 #endif
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
