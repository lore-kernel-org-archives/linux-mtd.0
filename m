Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aAwAp-0001wk-KY
 for linux-mtd@lists.infradead.org; Mon, 21 Dec 2015 08:50:37 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <computersforpeace@gmail.com>, <richard@nod.at>, <david@sigma-star.at>
CC: <linux-mtd@lists.infradead.org>, Dongsheng Yang
 <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH 04/38] ubifs: cut off the dependence from compr.o to mkfs.ubifs
Date: Mon, 21 Dec 2015 16:41:27 +0800
Message-ID: <1450687321-12381-5-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1450687321-12381-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1450687321-12381-1-git-send-email-yangds.fnst@cn.fujitsu.com>
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

remove the including of mkfs.ubifs.h in compr lib and
drop the reference of globle variable info_ from compr to mkfs.ubifs.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 ubifs-utils/mkfs.ubifs/compr.c      | 22 +++++++---------------
 ubifs-utils/mkfs.ubifs/compr.h      |  3 +--
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c |  8 ++++++--
 3 files changed, 14 insertions(+), 19 deletions(-)

diff --git a/ubifs-utils/mkfs.ubifs/compr.c b/ubifs-utils/mkfs.ubifs/compr.c
index 8eff186..54604d4 100644
--- a/ubifs-utils/mkfs.ubifs/compr.c
+++ b/ubifs-utils/mkfs.ubifs/compr.c
@@ -20,27 +20,19 @@
  *          Zoltan Sogor
  */
 
-#include <stdlib.h>
-#include <stdio.h>
-#include <stdint.h>
-#include <string.h>
+#include "ubifs_common.h"
 #ifndef WITHOUT_LZO
 #include <lzo/lzo1x.h>
 #endif
-#include <linux/types.h>
 
 #define crc32 __zlib_crc32
 #include <zlib.h>
 #undef crc32
 
 #include "compr.h"
-#include "mkfs.ubifs.h"
 
 static void *lzo_mem;
 static unsigned long long errcnt = 0;
-#ifndef WITHOUT_LZO
-static struct ubifs_info *c = &info_;
-#endif
 
 #define DEFLATE_DEF_LEVEL     Z_DEFAULT_COMPRESSION
 #define DEFLATE_DEF_WINBITS   11
@@ -121,7 +113,7 @@ static char *zlib_buf;
 
 #ifndef WITHOUT_LZO
 static int favor_lzo_compress(void *in_buf, size_t in_len, void *out_buf,
-			       size_t *out_len, int *type)
+				size_t *out_len, int *type, int lzo_percent)
 {
 	int lzo_ret, zlib_ret;
 	size_t lzo_len, zlib_len;
@@ -143,7 +135,7 @@ static int favor_lzo_compress(void *in_buf, size_t in_len, void *out_buf,
 
 		percent = (double)zlib_len / (double)lzo_len;
 		percent *= 100;
-		if (percent > 100 - c->favor_percent)
+		if (percent > 100 - lzo_percent)
 			goto select_lzo;
 		goto select_zlib;
 	}
@@ -167,8 +159,8 @@ select_zlib:
 }
 #endif
 
-int compress_data(void *in_buf, size_t in_len, void *out_buf, size_t *out_len,
-		  int type)
+int compress_data(void *in_buf, size_t in_len, void *out_buf,
+		size_t *out_len, int type, int lzo_percent)
 {
 	int ret;
 
@@ -181,8 +173,8 @@ int compress_data(void *in_buf, size_t in_len, void *out_buf, size_t *out_len,
 	{
 		switch (type) {
 #else
-	if (c->favor_lzo)
-		ret = favor_lzo_compress(in_buf, in_len, out_buf, out_len, &type);
+	if (lzo_percent)
+		ret = favor_lzo_compress(in_buf, in_len, out_buf, out_len, &type, lzo_percent);
 	else {
 		switch (type) {
 		case MKFS_UBIFS_COMPR_LZO:
diff --git a/ubifs-utils/mkfs.ubifs/compr.h b/ubifs-utils/mkfs.ubifs/compr.h
index e3dd95c..d44a2ba 100644
--- a/ubifs-utils/mkfs.ubifs/compr.h
+++ b/ubifs-utils/mkfs.ubifs/compr.h
@@ -38,8 +38,7 @@ enum compression_type
 	MKFS_UBIFS_COMPR_ZLIB,
 };
 
-int compress_data(void *in_buf, size_t in_len, void *out_buf, size_t *out_len,
-		  int type);
+int compress_data(void *in_buf, size_t in_len, void *out_buf, size_t *out_len, int type, int lzo_percent);
 int init_compression(void);
 void destroy_compression(void);
 
diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
index 47f4025..b2df5b1 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -1455,8 +1455,12 @@ static int add_file(const char *path_name, struct stat *st, ino_t inum,
 #endif
 		else
 			use_compr = c->default_compr;
-		compr_type = compress_data(buf, bytes_read, &dn->data,
-					   &out_len, use_compr);
+		if (c->favor_lzo)
+			compr_type = compress_data(buf, bytes_read, &dn->data,
+					   &out_len, use_compr, c->favor_percent);
+		else
+			compr_type = compress_data(buf, bytes_read, &dn->data,
+					   &out_len, use_compr, 0);
 		dn->compr_type = cpu_to_le16(compr_type);
 		dn_len = UBIFS_DATA_NODE_SZ + out_len;
 		/* Add data node to file system */
-- 
1.8.4.2
