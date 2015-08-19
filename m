Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRz0K-0005ja-Em
 for linux-mtd@lists.infradead.org; Wed, 19 Aug 2015 08:45:54 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <dedekind1@gmail.com>, <richard@nod.at>, <computersforpeace@gmail.com>
CC: <linux-mtd@lists.infradead.org>, Dongsheng Yang
 <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH 07/27] ubifs: introduce ubifs-utils/include and ubifs-utils/lib
Date: Wed, 19 Aug 2015 16:39:12 +0800
Message-ID: <1439973572-12489-8-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1439973572-12489-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1439973572-12489-1-git-send-email-yangds.fnst@cn.fujitsu.com>
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

Restructure the ubifs-utils/, introducing ubifs-utils/include
and ubifs-utils/lib to make the ubifs-utils/ better for scalability.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 Makefile                                                          | 7 ++++---
 ubifs-utils/{mkfs.ubifs => }/COPYING                              | 0
 ubifs-utils/{mkfs.ubifs => }/README                               | 0
 ubifs-utils/{mkfs.ubifs => include}/compr.h                       | 0
 ubifs-utils/{mkfs.ubifs => include}/crc16.h                       | 0
 ubifs-utils/{mkfs.ubifs => include}/defs.h                        | 0
 ubifs-utils/{mkfs.ubifs => include}/devtable.h                    | 0
 ubifs-utils/{mkfs.ubifs/hashtable => include}/hashtable.h         | 0
 ubifs-utils/{mkfs.ubifs/hashtable => include}/hashtable_itr.h     | 0
 ubifs-utils/{mkfs.ubifs/hashtable => include}/hashtable_private.h | 0
 ubifs-utils/{mkfs.ubifs => include}/io.h                          | 0
 ubifs-utils/{mkfs.ubifs => include}/key.h                         | 0
 ubifs-utils/{mkfs.ubifs => include}/lpt.h                         | 0
 ubifs-utils/{mkfs.ubifs => include}/ubifs.h                       | 0
 ubifs-utils/{mkfs.ubifs => include}/ubifs_common.h                | 0
 ubifs-utils/{mkfs.ubifs => lib}/compr.c                           | 0
 ubifs-utils/{mkfs.ubifs => lib}/crc16.c                           | 0
 ubifs-utils/{mkfs.ubifs => lib}/devtable.c                        | 4 ++--
 ubifs-utils/{mkfs.ubifs/hashtable => lib}/hashtable.c             | 0
 ubifs-utils/{mkfs.ubifs/hashtable => lib}/hashtable_itr.c         | 0
 ubifs-utils/{mkfs.ubifs => lib}/io.c                              | 0
 ubifs-utils/{mkfs.ubifs => lib}/lpt.c                             | 0
 22 files changed, 6 insertions(+), 5 deletions(-)
 rename ubifs-utils/{mkfs.ubifs => }/COPYING (100%)
 rename ubifs-utils/{mkfs.ubifs => }/README (100%)
 rename ubifs-utils/{mkfs.ubifs => include}/compr.h (100%)
 rename ubifs-utils/{mkfs.ubifs => include}/crc16.h (100%)
 rename ubifs-utils/{mkfs.ubifs => include}/defs.h (100%)
 rename ubifs-utils/{mkfs.ubifs => include}/devtable.h (100%)
 rename ubifs-utils/{mkfs.ubifs/hashtable => include}/hashtable.h (100%)
 rename ubifs-utils/{mkfs.ubifs/hashtable => include}/hashtable_itr.h (100%)
 rename ubifs-utils/{mkfs.ubifs/hashtable => include}/hashtable_private.h (100%)
 rename ubifs-utils/{mkfs.ubifs => include}/io.h (100%)
 rename ubifs-utils/{mkfs.ubifs => include}/key.h (100%)
 rename ubifs-utils/{mkfs.ubifs => include}/lpt.h (100%)
 rename ubifs-utils/{mkfs.ubifs => include}/ubifs.h (100%)
 rename ubifs-utils/{mkfs.ubifs => include}/ubifs_common.h (100%)
 rename ubifs-utils/{mkfs.ubifs => lib}/compr.c (100%)
 rename ubifs-utils/{mkfs.ubifs => lib}/crc16.c (100%)
 rename ubifs-utils/{mkfs.ubifs => lib}/devtable.c (99%)
 rename ubifs-utils/{mkfs.ubifs/hashtable => lib}/hashtable.c (100%)
 rename ubifs-utils/{mkfs.ubifs/hashtable => lib}/hashtable_itr.c (100%)
 rename ubifs-utils/{mkfs.ubifs => lib}/io.c (100%)
 rename ubifs-utils/{mkfs.ubifs => lib}/lpt.c (100%)

diff --git a/Makefile b/Makefile
index 843108c..ae02aac 100644
--- a/Makefile
+++ b/Makefile
@@ -3,7 +3,7 @@
 
 VERSION = 1.5.1
 
-CPPFLAGS += -D_GNU_SOURCE -I./include -I$(BUILDDIR)/include -I./ubi-utils/include $(ZLIBCPPFLAGS) $(LZOCPPFLAGS) $(UUIDCPPFLAGS)
+CPPFLAGS += -D_GNU_SOURCE -I./include -I$(BUILDDIR)/include -I./ubi-utils/include -I./ubifs-utils/include $(ZLIBCPPFLAGS) $(LZOCPPFLAGS) $(UUIDCPPFLAGS)
 
 ifeq ($(WITHOUT_XATTR), 1)
   CPPFLAGS += -DWITHOUT_XATTR
@@ -129,8 +129,9 @@ $(foreach v,$(UBI_BINS),$(eval $(call mkdep,ubi-utils/,$(v),libubi.a ubiutils-co
 #
 # Utils in ubifs-utils subdir
 #
-obj-mkfs.ubifs = crc16.o lpt.o compr.o devtable.o io.o\
-	hashtable/hashtable.o hashtable/hashtable_itr.o
+$(foreach v,crc16.o lpt.o compr.o devtable.o io.o hashtable.o hashtable_itr.o,$(eval UBIFS_LIBS += ../lib/$(v)))
+
+obj-mkfs.ubifs = $(UBIFS_LIBS)
 LDFLAGS_mkfs.ubifs = $(ZLIBLDFLAGS) $(LZOLDFLAGS) $(UUIDLDFLAGS)
 LDLIBS_mkfs.ubifs = -lz -llzo2 -lm -luuid
 $(call mkdep,ubifs-utils/mkfs.ubifs/,mkfs.ubifs,,ubi-utils/libubi.a)
diff --git a/ubifs-utils/mkfs.ubifs/COPYING b/ubifs-utils/COPYING
similarity index 100%
rename from ubifs-utils/mkfs.ubifs/COPYING
rename to ubifs-utils/COPYING
diff --git a/ubifs-utils/mkfs.ubifs/README b/ubifs-utils/README
similarity index 100%
rename from ubifs-utils/mkfs.ubifs/README
rename to ubifs-utils/README
diff --git a/ubifs-utils/mkfs.ubifs/compr.h b/ubifs-utils/include/compr.h
similarity index 100%
rename from ubifs-utils/mkfs.ubifs/compr.h
rename to ubifs-utils/include/compr.h
diff --git a/ubifs-utils/mkfs.ubifs/crc16.h b/ubifs-utils/include/crc16.h
similarity index 100%
rename from ubifs-utils/mkfs.ubifs/crc16.h
rename to ubifs-utils/include/crc16.h
diff --git a/ubifs-utils/mkfs.ubifs/defs.h b/ubifs-utils/include/defs.h
similarity index 100%
rename from ubifs-utils/mkfs.ubifs/defs.h
rename to ubifs-utils/include/defs.h
diff --git a/ubifs-utils/mkfs.ubifs/devtable.h b/ubifs-utils/include/devtable.h
similarity index 100%
rename from ubifs-utils/mkfs.ubifs/devtable.h
rename to ubifs-utils/include/devtable.h
diff --git a/ubifs-utils/mkfs.ubifs/hashtable/hashtable.h b/ubifs-utils/include/hashtable.h
similarity index 100%
rename from ubifs-utils/mkfs.ubifs/hashtable/hashtable.h
rename to ubifs-utils/include/hashtable.h
diff --git a/ubifs-utils/mkfs.ubifs/hashtable/hashtable_itr.h b/ubifs-utils/include/hashtable_itr.h
similarity index 100%
rename from ubifs-utils/mkfs.ubifs/hashtable/hashtable_itr.h
rename to ubifs-utils/include/hashtable_itr.h
diff --git a/ubifs-utils/mkfs.ubifs/hashtable/hashtable_private.h b/ubifs-utils/include/hashtable_private.h
similarity index 100%
rename from ubifs-utils/mkfs.ubifs/hashtable/hashtable_private.h
rename to ubifs-utils/include/hashtable_private.h
diff --git a/ubifs-utils/mkfs.ubifs/io.h b/ubifs-utils/include/io.h
similarity index 100%
rename from ubifs-utils/mkfs.ubifs/io.h
rename to ubifs-utils/include/io.h
diff --git a/ubifs-utils/mkfs.ubifs/key.h b/ubifs-utils/include/key.h
similarity index 100%
rename from ubifs-utils/mkfs.ubifs/key.h
rename to ubifs-utils/include/key.h
diff --git a/ubifs-utils/mkfs.ubifs/lpt.h b/ubifs-utils/include/lpt.h
similarity index 100%
rename from ubifs-utils/mkfs.ubifs/lpt.h
rename to ubifs-utils/include/lpt.h
diff --git a/ubifs-utils/mkfs.ubifs/ubifs.h b/ubifs-utils/include/ubifs.h
similarity index 100%
rename from ubifs-utils/mkfs.ubifs/ubifs.h
rename to ubifs-utils/include/ubifs.h
diff --git a/ubifs-utils/mkfs.ubifs/ubifs_common.h b/ubifs-utils/include/ubifs_common.h
similarity index 100%
rename from ubifs-utils/mkfs.ubifs/ubifs_common.h
rename to ubifs-utils/include/ubifs_common.h
diff --git a/ubifs-utils/mkfs.ubifs/compr.c b/ubifs-utils/lib/compr.c
similarity index 100%
rename from ubifs-utils/mkfs.ubifs/compr.c
rename to ubifs-utils/lib/compr.c
diff --git a/ubifs-utils/mkfs.ubifs/crc16.c b/ubifs-utils/lib/crc16.c
similarity index 100%
rename from ubifs-utils/mkfs.ubifs/crc16.c
rename to ubifs-utils/lib/crc16.c
diff --git a/ubifs-utils/mkfs.ubifs/devtable.c b/ubifs-utils/lib/devtable.c
similarity index 99%
rename from ubifs-utils/mkfs.ubifs/devtable.c
rename to ubifs-utils/lib/devtable.c
index 1fc0256..e6ec319 100644
--- a/ubifs-utils/mkfs.ubifs/devtable.c
+++ b/ubifs-utils/lib/devtable.c
@@ -46,8 +46,8 @@
 
 #include "ubifs_common.h"
 #include "devtable.h"
-#include "hashtable/hashtable.h"
-#include "hashtable/hashtable_itr.h"
+#include "hashtable.h"
+#include "hashtable_itr.h"
 
 /*
  * The hash table which contains paths to files/directories/device nodes
diff --git a/ubifs-utils/mkfs.ubifs/hashtable/hashtable.c b/ubifs-utils/lib/hashtable.c
similarity index 100%
rename from ubifs-utils/mkfs.ubifs/hashtable/hashtable.c
rename to ubifs-utils/lib/hashtable.c
diff --git a/ubifs-utils/mkfs.ubifs/hashtable/hashtable_itr.c b/ubifs-utils/lib/hashtable_itr.c
similarity index 100%
rename from ubifs-utils/mkfs.ubifs/hashtable/hashtable_itr.c
rename to ubifs-utils/lib/hashtable_itr.c
diff --git a/ubifs-utils/mkfs.ubifs/io.c b/ubifs-utils/lib/io.c
similarity index 100%
rename from ubifs-utils/mkfs.ubifs/io.c
rename to ubifs-utils/lib/io.c
diff --git a/ubifs-utils/mkfs.ubifs/lpt.c b/ubifs-utils/lib/lpt.c
similarity index 100%
rename from ubifs-utils/mkfs.ubifs/lpt.c
rename to ubifs-utils/lib/lpt.c
-- 
1.8.4.2
