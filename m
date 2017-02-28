Received: from lgeamrelo11.lge.com ([156.147.23.51])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cia9y-00067U-Qq
 for linux-mtd@lists.infradead.org; Tue, 28 Feb 2017 05:17:24 +0000
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Richard Weinberger <richard@nod.at>
CC: Artem Bityutskiy <dedekind1@gmail.com>, <linux-mtd@lists.infradead.org>,
 Brent Taylor <motobud@gmail.com>, Hyunchul Lee <cheol.lee@lge.com>
Subject: [PATCH 1/3] ubifs: add lz4hc compressor
Date: Tue, 28 Feb 2017 14:16:47 +0900
Message-ID: <1488259008-12510-2-git-send-email-hyc.lee@gmail.com>
In-Reply-To: <1488259008-12510-1-git-send-email-hyc.lee@gmail.com>
References: <1488259008-12510-1-git-send-email-hyc.lee@gmail.com>
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

From: Brent Taylor <motobud@gmail.com>

This patch adds lz4hc compressor into ubifs. with "compr=lz4hc" mount
option, default compression type is changed to "lz4hc"

This was submited by Brent Taylor[1] and not merged.

[1] http://lists.infradead.org/pipermail/linux-mtd/2013-October/048993.html

Signed-off-by: Brent Taylor <motobud@gmail.com>
Signed-off-by: Hyunchul Lee <cheol.lee@lge.com>
---
 fs/ubifs/Kconfig       | 10 ++++++++++
 fs/ubifs/compress.c    | 25 ++++++++++++++++++++++++-
 fs/ubifs/super.c       |  2 ++
 fs/ubifs/ubifs-media.h |  2 ++
 4 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/fs/ubifs/Kconfig b/fs/ubifs/Kconfig
index b0d0623..e038123 100644
--- a/fs/ubifs/Kconfig
+++ b/fs/ubifs/Kconfig
@@ -29,6 +29,16 @@ config UBIFS_FS_LZO
 	   LZO compressor is generally faster than zlib but compresses worse.
 	   Say 'Y' if unsure.
 
+config UBIFS_FS_LZ4HC
+       bool "LZ4HC compression support" if UBIFS_FS_ADVANCED_COMPR
+       depends on UBIFS_FS && CRYPTO_LZ4HC
+       default y
+       help
+          LZ4HC generally beats LZO on decompression speed while provides a lot
+	  better compression ratio (comparable to zlib). Compression speed is
+	  generally slower compared to LZO, but faster compared to zlib.
+	  Say 'Y' if unsure.
+
 config UBIFS_FS_ZLIB
 	bool "ZLIB compression support" if UBIFS_FS_ADVANCED_COMPR
 	depends on UBIFS_FS
diff --git a/fs/ubifs/compress.c b/fs/ubifs/compress.c
index 565cb56..00f62f8 100644
--- a/fs/ubifs/compress.c
+++ b/fs/ubifs/compress.c
@@ -71,6 +71,22 @@
 };
 #endif
 
+#ifdef CONFIG_UBIFS_FS_LZ4HC
+static DEFINE_MUTEX(lz4hc_mutex);
+
+static struct ubifs_compressor lz4hc_compr = {
+	.compr_type = UBIFS_COMPR_LZ4HC,
+	.comp_mutex = &lz4hc_mutex,
+	.name = "lz4hc",
+	.capi_name = "lz4hc",
+};
+#else
+static struct ubifs_compressor lz4hc_compr = {
+	.compr_type = UBIFS_COMPR_LZ4HC,
+	.name = "lz4hc",
+};
+#endif
+
 /* All UBIFS compressors */
 struct ubifs_compressor *ubifs_compressors[UBIFS_COMPR_TYPES_CNT];
 
@@ -224,10 +240,14 @@ int __init ubifs_compressors_init(void)
 {
 	int err;
 
-	err = compr_init(&lzo_compr);
+	err = compr_init(&lz4hc_compr);
 	if (err)
 		return err;
 
+	err = compr_init(&lzo_compr);
+	if (err)
+		goto out_lz4hc;
+
 	err = compr_init(&zlib_compr);
 	if (err)
 		goto out_lzo;
@@ -237,6 +257,8 @@ int __init ubifs_compressors_init(void)
 
 out_lzo:
 	compr_exit(&lzo_compr);
+out_lz4hc:
+	compr_exit(&lz4hc_compr);
 	return err;
 }
 
@@ -245,6 +267,7 @@ int __init ubifs_compressors_init(void)
  */
 void ubifs_compressors_exit(void)
 {
+	compr_exit(&lz4hc_compr);
 	compr_exit(&lzo_compr);
 	compr_exit(&zlib_compr);
 }
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index e08aa04..6615985 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1028,6 +1028,8 @@ static int ubifs_parse_options(struct ubifs_info *c, char *options,
 				return -ENOMEM;
 			if (!strcmp(name, "none"))
 				c->mount_opts.compr_type = UBIFS_COMPR_NONE;
+			else if (!strcmp(name, "lz4hc"))
+				c->mount_opts.compr_type = UBIFS_COMPR_LZ4HC;
 			else if (!strcmp(name, "lzo"))
 				c->mount_opts.compr_type = UBIFS_COMPR_LZO;
 			else if (!strcmp(name, "zlib"))
diff --git a/fs/ubifs/ubifs-media.h b/fs/ubifs/ubifs-media.h
index e8c23c9..2f2fe45 100644
--- a/fs/ubifs/ubifs-media.h
+++ b/fs/ubifs/ubifs-media.h
@@ -341,12 +341,14 @@ enum {
  * UBIFS_COMPR_NONE: no compression
  * UBIFS_COMPR_LZO: LZO compression
  * UBIFS_COMPR_ZLIB: ZLIB compression
+ * UBIFS_COMPR_LZ4HC: LZ4HC compression
  * UBIFS_COMPR_TYPES_CNT: count of supported compression types
  */
 enum {
 	UBIFS_COMPR_NONE,
 	UBIFS_COMPR_LZO,
 	UBIFS_COMPR_ZLIB,
+	UBIFS_COMPR_LZ4HC,
 	UBIFS_COMPR_TYPES_CNT,
 };
 
-- 
1.9.1
