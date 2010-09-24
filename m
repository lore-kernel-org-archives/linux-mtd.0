Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OyxRi-00058C-Kf
	for linux-mtd@lists.infradead.org; Fri, 24 Sep 2010 01:51:31 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 8502D1B412F
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Sep 2010 01:51:29 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd-utils: convert to common.h/min
Date: Thu, 23 Sep 2010 21:52:17 -0400
Message-Id: <1285293137-24887-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Kill off duplicated min() defines and convert to the common.h one.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 compr_zlib.c     |    3 +--
 include/common.h |    1 +
 jffs-dump.c      |    4 ++--
 mkfs.jffs2.c     |    3 ++-
 recv_image.c     |    2 +-
 5 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/compr_zlib.c b/compr_zlib.c
index dda3e40..0564f16 100644
--- a/compr_zlib.c
+++ b/compr_zlib.c
@@ -39,10 +39,9 @@
 #include <stdio.h>
 #include <asm/types.h>
 #include <linux/jffs2.h>
+#include "common.h"
 #include "compr.h"
 
-#define min(x,y) ((x)<(y)?(x):(y))
-
 /* Plan: call deflate() with avail_in == *sourcelen,
    avail_out = *dstlen - 12 and flush == Z_FINISH.
    If it doesn't manage to finish,	call it again with
diff --git a/include/common.h b/include/common.h
index 03e6f7c..f2b7b6b 100644
--- a/include/common.h
+++ b/include/common.h
@@ -34,6 +34,7 @@ extern "C" {
 #endif
 
 #define MIN(a ,b) ((a) < (b) ? (a) : (b))
+#define min(a, b) MIN(a, b) /* glue for linux kernel source */
 #define ARRAY_SIZE(a) (sizeof(a) / sizeof((a)[0]))
 
 /* Verbose messages */
diff --git a/jffs-dump.c b/jffs-dump.c
index 31cdad2..3176469 100644
--- a/jffs-dump.c
+++ b/jffs-dump.c
@@ -14,6 +14,8 @@
 #include <linux/types.h>
 #include <asm/byteorder.h>
 
+#include "common.h"
+
 #define BLOCK_SIZE 1024
 #define JFFS_MAGIC 0x34383931 /* "1984" */
 #define JFFS_MAX_NAME_LEN 256
@@ -32,8 +34,6 @@
 #define JFFS_MAGIC_BITMASK 0x34383931
 #define JFFS_DIRTY_BITMASK 0x00000000
 
-#define min(x,y) (x) > (y) ? (y) : (x)
-
 struct jffs_raw_inode
 {
 	uint32_t magic;    /* A constant magic number.  */
diff --git a/mkfs.jffs2.c b/mkfs.jffs2.c
index 5c18eb1..c83b725 100644
--- a/mkfs.jffs2.c
+++ b/mkfs.jffs2.c
@@ -72,13 +72,14 @@
 #include <crc32.h>
 #include "rbtree.h"
 
+#include "common.h"
+
 /* Do not use the weird XPG version of basename */
 #undef basename
 
 //#define DMALLOC
 //#define mkfs_debug_msg    error_msg
 #define mkfs_debug_msg(a...)	{ }
-#define min(x,y) ({ typeof((x)) _x = (x); typeof((y)) _y = (y); (_x>_y)?_y:_x; })
 
 #define PAD(x) (((x)+3)&~3)
 
diff --git a/recv_image.c b/recv_image.c
index 617711c..6d27f3b 100644
--- a/recv_image.c
+++ b/recv_image.c
@@ -20,7 +20,7 @@
 #include "mtd/mtd-user.h"
 #include "mcast_image.h"
 
-#define min(x,y) (  (x)>(y)?(y):(x) )
+#include "common.h"
 
 #define WBUF_SIZE 4096
 struct eraseblock {
-- 
1.7.3
