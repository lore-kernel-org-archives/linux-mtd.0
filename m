Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OybxJ-0001Kx-V8
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2010 02:54:43 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id D18691B40E7
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Sep 2010 02:54:38 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd-utils: compr: drop unused model argument
Date: Wed, 22 Sep 2010 22:53:47 -0400
Message-Id: <1285210427-13238-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The jffs2 compression framework provides a "model" argument when
compressing and decompressing, but the caller always passes in NULL
and the callees never use it.  So punt this useless overhead.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 compr.c       |    6 +++---
 compr.h       |    4 ++--
 compr_lzo.c   |    4 ++--
 compr_rtime.c |    4 ++--
 compr_zlib.c  |    4 ++--
 5 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/compr.c b/compr.c
index 7028c93..2d3a56b 100644
--- a/compr.c
+++ b/compr.c
@@ -149,7 +149,7 @@ static void jffs2_decompression_test(struct jffs2_compressor *compr,
 		jffs2_error_cnt++;
 		return;
 	}
-	if (compr->decompress(output_buf,jffs2_compression_check_buf,cdatalen,datalen,NULL)) {
+	if (compr->decompress(output_buf,jffs2_compression_check_buf,cdatalen,datalen)) {
 		fprintf(stderr,"JFFS2 compression check: decompression failed at %s.\n", compr->name);
 		jffs2_error_cnt++;
 	}
@@ -243,7 +243,7 @@ uint16_t jffs2_compress( unsigned char *data_in, unsigned char **cpage_out,
 
 				*datalen  = orig_slen;
 				*cdatalen = orig_dlen;
-				compr_ret = this->compress(data_in, output_buf, datalen, cdatalen, NULL);
+				compr_ret = this->compress(data_in, output_buf, datalen, cdatalen);
 				this->usecount--;
 				if (!compr_ret) {
 					ret = this->compr;
@@ -294,7 +294,7 @@ uint16_t jffs2_compress( unsigned char *data_in, unsigned char **cpage_out,
 					jffs2_decompression_test_prepare(this->compr_buf,this->compr_buf_size);
 				*datalen  = orig_slen;
 				*cdatalen = orig_dlen;
-				compr_ret = this->compress(data_in, this->compr_buf, datalen, cdatalen, NULL);
+				compr_ret = this->compress(data_in, this->compr_buf, datalen, cdatalen);
 				this->usecount--;
 				if (!compr_ret) {
 					if (jffs2_compression_check)
diff --git a/compr.h b/compr.h
index 4b79802..a21e935 100644
--- a/compr.h
+++ b/compr.h
@@ -70,9 +70,9 @@ struct jffs2_compressor {
 	const char *name;
 	char compr;               /* JFFS2_COMPR_XXX */
 	int (*compress)(unsigned char *data_in, unsigned char *cpage_out,
-			uint32_t *srclen, uint32_t *destlen, void *model);
+			uint32_t *srclen, uint32_t *destlen);
 	int (*decompress)(unsigned char *cdata_in, unsigned char *data_out,
-			uint32_t cdatalen, uint32_t datalen, void *model);
+			uint32_t cdatalen, uint32_t datalen);
 	int usecount;
 	int disabled;             /* if seted the compressor won't compress */
 	unsigned char *compr_buf; /* used by size compr. mode */
diff --git a/compr_lzo.c b/compr_lzo.c
index 3d7dad7..d0f0ed7 100644
--- a/compr_lzo.c
+++ b/compr_lzo.c
@@ -46,7 +46,7 @@ static void *lzo_compress_buf;
  *
  */
 static int jffs2_lzo_cmpr(unsigned char *data_in, unsigned char *cpage_out,
-			  uint32_t *sourcelen, uint32_t *dstlen, void *model)
+			  uint32_t *sourcelen, uint32_t *dstlen)
 {
 	lzo_uint compress_size;
 	int ret;
@@ -66,7 +66,7 @@ static int jffs2_lzo_cmpr(unsigned char *data_in, unsigned char *cpage_out,
 }
 
 static int jffs2_lzo_decompress(unsigned char *data_in, unsigned char *cpage_out,
-				 uint32_t srclen, uint32_t destlen, void *model)
+				 uint32_t srclen, uint32_t destlen)
 {
 	int ret;
 	lzo_uint dl;
diff --git a/compr_rtime.c b/compr_rtime.c
index 5613963..7818e1b 100644
--- a/compr_rtime.c
+++ b/compr_rtime.c
@@ -24,7 +24,7 @@
 
 /* _compress returns the compressed size, -1 if bigger */
 static int jffs2_rtime_compress(unsigned char *data_in, unsigned char *cpage_out,
-		uint32_t *sourcelen, uint32_t *dstlen, void *model)
+		uint32_t *sourcelen, uint32_t *dstlen)
 {
 	short positions[256];
 	int outpos = 0;
@@ -64,7 +64,7 @@ static int jffs2_rtime_compress(unsigned char *data_in, unsigned char *cpage_out
 
 
 static int jffs2_rtime_decompress(unsigned char *data_in, unsigned char *cpage_out,
-		uint32_t srclen, uint32_t destlen, void *model)
+		uint32_t srclen, uint32_t destlen)
 {
 	short positions[256];
 	int outpos = 0;
diff --git a/compr_zlib.c b/compr_zlib.c
index 03464f9..dda3e40 100644
--- a/compr_zlib.c
+++ b/compr_zlib.c
@@ -53,7 +53,7 @@ Q: Is 12 bytes sufficient?
 #define STREAM_END_SPACE 12
 
 static int jffs2_zlib_compress(unsigned char *data_in, unsigned char *cpage_out,
-		uint32_t *sourcelen, uint32_t *dstlen, void *model)
+		uint32_t *sourcelen, uint32_t *dstlen)
 {
 	z_stream strm;
 	int ret;
@@ -101,7 +101,7 @@ static int jffs2_zlib_compress(unsigned char *data_in, unsigned char *cpage_out,
 }
 
 static int jffs2_zlib_decompress(unsigned char *data_in, unsigned char *cpage_out,
-		uint32_t srclen, uint32_t destlen, void *model)
+		uint32_t srclen, uint32_t destlen)
 {
 	z_stream strm;
 	int ret;
-- 
1.7.3
