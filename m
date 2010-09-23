Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OybuY-00017W-KT
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2010 02:51:52 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] jffs2: drop unused model argument
Date: Wed, 22 Sep 2010 22:52:33 -0400
Message-Id: <1285210353-30804-1-git-send-email-vapier@gentoo.org>
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
 fs/jffs2/compr.c       |    6 +++---
 fs/jffs2/compr.h       |    4 ++--
 fs/jffs2/compr_lzo.c   |    4 ++--
 fs/jffs2/compr_rtime.c |    6 ++----
 fs/jffs2/compr_rubin.c |   11 ++++-------
 fs/jffs2/compr_zlib.c  |    6 ++----
 6 files changed, 15 insertions(+), 22 deletions(-)

diff --git a/fs/jffs2/compr.c b/fs/jffs2/compr.c
index 617a1e5..de42470 100644
--- a/fs/jffs2/compr.c
+++ b/fs/jffs2/compr.c
@@ -103,7 +103,7 @@ uint16_t jffs2_compress(struct jffs2_sb_info *c, struct jffs2_inode_info *f,
 			spin_unlock(&jffs2_compressor_list_lock);
 			*datalen  = orig_slen;
 			*cdatalen = orig_dlen;
-			compr_ret = this->compress(data_in, output_buf, datalen, cdatalen, NULL);
+			compr_ret = this->compress(data_in, output_buf, datalen, cdatalen);
 			spin_lock(&jffs2_compressor_list_lock);
 			this->usecount--;
 			if (!compr_ret) {
@@ -152,7 +152,7 @@ uint16_t jffs2_compress(struct jffs2_sb_info *c, struct jffs2_inode_info *f,
 			spin_unlock(&jffs2_compressor_list_lock);
 			*datalen  = orig_slen;
 			*cdatalen = orig_dlen;
-			compr_ret = this->compress(data_in, this->compr_buf, datalen, cdatalen, NULL);
+			compr_ret = this->compress(data_in, this->compr_buf, datalen, cdatalen);
 			spin_lock(&jffs2_compressor_list_lock);
 			this->usecount--;
 			if (!compr_ret) {
@@ -220,7 +220,7 @@ int jffs2_decompress(struct jffs2_sb_info *c, struct jffs2_inode_info *f,
 			if (comprtype == this->compr) {
 				this->usecount++;
 				spin_unlock(&jffs2_compressor_list_lock);
-				ret = this->decompress(cdata_in, data_out, cdatalen, datalen, NULL);
+				ret = this->decompress(cdata_in, data_out, cdatalen, datalen);
 				spin_lock(&jffs2_compressor_list_lock);
 				if (ret) {
 					printk(KERN_WARNING "Decompressor \"%s\" returned %d\n", this->name, ret);
diff --git a/fs/jffs2/compr.h b/fs/jffs2/compr.h
index e471a91..13bb759 100644
--- a/fs/jffs2/compr.h
+++ b/fs/jffs2/compr.h
@@ -49,9 +49,9 @@ struct jffs2_compressor {
 	char *name;
 	char compr;			/* JFFS2_COMPR_XXX */
 	int (*compress)(unsigned char *data_in, unsigned char *cpage_out,
-			uint32_t *srclen, uint32_t *destlen, void *model);
+			uint32_t *srclen, uint32_t *destlen);
 	int (*decompress)(unsigned char *cdata_in, unsigned char *data_out,
-			  uint32_t cdatalen, uint32_t datalen, void *model);
+			  uint32_t cdatalen, uint32_t datalen);
 	int usecount;
 	int disabled;		/* if set the compressor won't compress */
 	unsigned char *compr_buf;	/* used by size compr. mode */
diff --git a/fs/jffs2/compr_lzo.c b/fs/jffs2/compr_lzo.c
index ed25ae7c..af186ee 100644
--- a/fs/jffs2/compr_lzo.c
+++ b/fs/jffs2/compr_lzo.c
@@ -42,7 +42,7 @@ static int __init alloc_workspace(void)
 }
 
 static int jffs2_lzo_compress(unsigned char *data_in, unsigned char *cpage_out,
-			      uint32_t *sourcelen, uint32_t *dstlen, void *model)
+			      uint32_t *sourcelen, uint32_t *dstlen)
 {
 	size_t compress_size;
 	int ret;
@@ -67,7 +67,7 @@ static int jffs2_lzo_compress(unsigned char *data_in, unsigned char *cpage_out,
 }
 
 static int jffs2_lzo_decompress(unsigned char *data_in, unsigned char *cpage_out,
-				 uint32_t srclen, uint32_t destlen, void *model)
+				 uint32_t srclen, uint32_t destlen)
 {
 	size_t dl = destlen;
 	int ret;
diff --git a/fs/jffs2/compr_rtime.c b/fs/jffs2/compr_rtime.c
index 9696ad9..16a5047 100644
--- a/fs/jffs2/compr_rtime.c
+++ b/fs/jffs2/compr_rtime.c
@@ -31,8 +31,7 @@
 /* _compress returns the compressed size, -1 if bigger */
 static int jffs2_rtime_compress(unsigned char *data_in,
 				unsigned char *cpage_out,
-				uint32_t *sourcelen, uint32_t *dstlen,
-				void *model)
+				uint32_t *sourcelen, uint32_t *dstlen)
 {
 	short positions[256];
 	int outpos = 0;
@@ -73,8 +72,7 @@ static int jffs2_rtime_compress(unsigned char *data_in,
 
 static int jffs2_rtime_decompress(unsigned char *data_in,
 				  unsigned char *cpage_out,
-				  uint32_t srclen, uint32_t destlen,
-				  void *model)
+				  uint32_t srclen, uint32_t destlen)
 {
 	short positions[256];
 	int outpos = 0;
diff --git a/fs/jffs2/compr_rubin.c b/fs/jffs2/compr_rubin.c
index a12b4f7..9e7cec8 100644
--- a/fs/jffs2/compr_rubin.c
+++ b/fs/jffs2/compr_rubin.c
@@ -298,7 +298,7 @@ static int rubin_do_compress(int bit_divider, int *bits, unsigned char *data_in,
 #if 0
 /* _compress returns the compressed size, -1 if bigger */
 int jffs2_rubinmips_compress(unsigned char *data_in, unsigned char *cpage_out,
-		   uint32_t *sourcelen, uint32_t *dstlen, void *model)
+		   uint32_t *sourcelen, uint32_t *dstlen)
 {
 	return rubin_do_compress(BIT_DIVIDER_MIPS, bits_mips, data_in,
 				 cpage_out, sourcelen, dstlen);
@@ -306,8 +306,7 @@ int jffs2_rubinmips_compress(unsigned char *data_in, unsigned char *cpage_out,
 #endif
 static int jffs2_dynrubin_compress(unsigned char *data_in,
 				   unsigned char *cpage_out,
-				   uint32_t *sourcelen, uint32_t *dstlen,
-				   void *model)
+				   uint32_t *sourcelen, uint32_t *dstlen)
 {
 	int bits[8];
 	unsigned char histo[256];
@@ -387,8 +386,7 @@ static void rubin_do_decompress(int bit_divider, int *bits,
 
 static int jffs2_rubinmips_decompress(unsigned char *data_in,
 				      unsigned char *cpage_out,
-				      uint32_t sourcelen, uint32_t dstlen,
-				      void *model)
+				      uint32_t sourcelen, uint32_t dstlen)
 {
 	rubin_do_decompress(BIT_DIVIDER_MIPS, bits_mips, data_in,
 			    cpage_out, sourcelen, dstlen);
@@ -397,8 +395,7 @@ static int jffs2_rubinmips_decompress(unsigned char *data_in,
 
 static int jffs2_dynrubin_decompress(unsigned char *data_in,
 				     unsigned char *cpage_out,
-				     uint32_t sourcelen, uint32_t dstlen,
-				     void *model)
+				     uint32_t sourcelen, uint32_t dstlen)
 {
 	int bits[8];
 	int c;
diff --git a/fs/jffs2/compr_zlib.c b/fs/jffs2/compr_zlib.c
index 97fc45d..fd05a0b 100644
--- a/fs/jffs2/compr_zlib.c
+++ b/fs/jffs2/compr_zlib.c
@@ -68,8 +68,7 @@ static void free_workspaces(void)
 
 static int jffs2_zlib_compress(unsigned char *data_in,
 			       unsigned char *cpage_out,
-			       uint32_t *sourcelen, uint32_t *dstlen,
-			       void *model)
+			       uint32_t *sourcelen, uint32_t *dstlen)
 {
 	int ret;
 
@@ -136,8 +135,7 @@ static int jffs2_zlib_compress(unsigned char *data_in,
 
 static int jffs2_zlib_decompress(unsigned char *data_in,
 				 unsigned char *cpage_out,
-				 uint32_t srclen, uint32_t destlen,
-				 void *model)
+				 uint32_t srclen, uint32_t destlen)
 {
 	int ret;
 	int wbits = MAX_WBITS;
-- 
1.7.3
