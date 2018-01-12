Received: from [45.249.212.35] (helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eZvV5-0004t2-Bi
 for linux-mtd@lists.infradead.org; Fri, 12 Jan 2018 09:19:49 +0000
From: Yufen Yu <yuyufen@huawei.com>
To: <richard@nod.at>, <dedekind1@gmail.com>, <adrian.hunter@intel.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>, Yufen Yu
 <yuyufen@huawei.com>
Subject: [RFC PATCH] ubifs: Add zstd support
Date: Fri, 12 Jan 2018 17:24:21 +0800
Message-ID: <20180112092421.22095-1-yuyufen@huawei.com>
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

Add zstd compression and decompression support to ubifs. zstd at its
fastest level compresses almost as well as zlib, while offering much
faster compression and decompression, approaching lzo speeds.

This patch is based on the patch:
	https://patchwork.kernel.org/patch/9892631/

zstd source repository: https://github.com/facebook/zstd

Signed-off-by: Yufen Yu <yuyufen@huawei.com>
---
 fs/ubifs/Kconfig       | 10 ++++++++++
 fs/ubifs/compress.c    | 25 +++++++++++++++++++++++++
 fs/ubifs/ubifs-media.h |  2 ++
 3 files changed, 37 insertions(+)

diff --git a/fs/ubifs/Kconfig b/fs/ubifs/Kconfig
index 83a961b..056a81b 100644
--- a/fs/ubifs/Kconfig
+++ b/fs/ubifs/Kconfig
@@ -5,8 +5,10 @@ config UBIFS_FS
 	select CRYPTO if UBIFS_FS_ADVANCED_COMPR
 	select CRYPTO if UBIFS_FS_LZO
 	select CRYPTO if UBIFS_FS_ZLIB
+	select CRYPTO if UBIFS_FS_ZSTD
 	select CRYPTO_LZO if UBIFS_FS_LZO
 	select CRYPTO_DEFLATE if UBIFS_FS_ZLIB
+	select CRYPTO_ZSTD if UBIFS_FS_XZ
 	depends on MTD_UBI
 	help
 	  UBIFS is a file system for flash devices which works on top of UBI.
@@ -36,6 +38,14 @@ config UBIFS_FS_ZLIB
 	help
 	  Zlib compresses better than LZO but it is slower. Say 'Y' if unsure.
 
+config UBIFS_FS_ZSTD
+	bool "ZSTD compression support" if UBIFS_FS_ADVANCED_COMPR
+	depends on UBIFS_FS
+	default y
+	help
+	  ZSTD compresses is a big win in speed over Zlib and
+	  in compression ratio over LZO. Say 'Y' if unsure.
+
 config UBIFS_ATIME_SUPPORT
 	bool "Access time support" if UBIFS_FS
 	depends on UBIFS_FS
diff --git a/fs/ubifs/compress.c b/fs/ubifs/compress.c
index 565cb56..b310d6f 100644
--- a/fs/ubifs/compress.c
+++ b/fs/ubifs/compress.c
@@ -71,6 +71,24 @@ static struct ubifs_compressor zlib_compr = {
 };
 #endif
 
+#ifdef CONFIG_UBIFS_FS_ZSTD
+static DEFINE_MUTEX(zstd_enc_mutex);
+static DEFINE_MUTEX(zstd_dec_mutex);
+
+static struct ubifs_compressor zstd_compr = {
+	.compr_type = UBIFS_COMPR_ZSTD,
+	.comp_mutex = &zstd_enc_mutex,
+	.decomp_mutex = &zstd_dec_mutex,
+	.name = "zstd",
+	.capi_name = "zstd",
+};
+#else
+static struct ubifs_compressor zstd_compr = {
+	.compr_type = UBIFS_COMPR_ZSTD,
+	.name = "zstd",
+};
+#endif
+
 /* All UBIFS compressors */
 struct ubifs_compressor *ubifs_compressors[UBIFS_COMPR_TYPES_CNT];
 
@@ -228,6 +246,10 @@ int __init ubifs_compressors_init(void)
 	if (err)
 		return err;
 
+	err = compr_init(&zstd_compr);
+	if (err)
+		goto out_zstd;
+
 	err = compr_init(&zlib_compr);
 	if (err)
 		goto out_lzo;
@@ -235,6 +257,8 @@ int __init ubifs_compressors_init(void)
 	ubifs_compressors[UBIFS_COMPR_NONE] = &none_compr;
 	return 0;
 
+out_zstd:
+	compr_exit(&zstd_compr);
 out_lzo:
 	compr_exit(&lzo_compr);
 	return err;
@@ -247,4 +271,5 @@ void ubifs_compressors_exit(void)
 {
 	compr_exit(&lzo_compr);
 	compr_exit(&zlib_compr);
+	compr_exit(&zstd_compr);
 }
diff --git a/fs/ubifs/ubifs-media.h b/fs/ubifs/ubifs-media.h
index e8c23c9..9f869c7 100644
--- a/fs/ubifs/ubifs-media.h
+++ b/fs/ubifs/ubifs-media.h
@@ -341,12 +341,14 @@ enum {
  * UBIFS_COMPR_NONE: no compression
  * UBIFS_COMPR_LZO: LZO compression
  * UBIFS_COMPR_ZLIB: ZLIB compression
+ * UBIFS_COMPR_ZSTD: ZSTD compression
  * UBIFS_COMPR_TYPES_CNT: count of supported compression types
  */
 enum {
 	UBIFS_COMPR_NONE,
 	UBIFS_COMPR_LZO,
 	UBIFS_COMPR_ZLIB,
+	UBIFS_COMPR_ZSTD,
 	UBIFS_COMPR_TYPES_CNT,
 };
 
-- 
2.9.5
