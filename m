Received: from [222.73.24.84] (helo=song.cn.fujitsu.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V05h9-0000QO-PQ
 for linux-mtd@lists.infradead.org; Fri, 19 Jul 2013 08:05:44 +0000
Message-ID: <51E8F258.7020102@cn.fujitsu.com>
Date: Fri, 19 Jul 2013 16:01:28 +0800
From: Gu Zheng <guz.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: dwmw2@infradead.org
Subject: [PATCH RESEND] fs/jffs2: remove the unused paramters of function
 jffs2_{compress,decompress}
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Remove the unused paramters of function jffs2_{compress,decompress}.


Signed-off-by: Gu Zheng <guz.fnst@cn.fujitsu.com>
---
 fs/jffs2/compr.c |   12 ++++++------
 fs/jffs2/compr.h |   12 ++++++------
 fs/jffs2/gc.c    |    2 +-
 fs/jffs2/read.c  |    4 +++-
 fs/jffs2/write.c |    2 +-
 5 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/fs/jffs2/compr.c b/fs/jffs2/compr.c
index 4849a4c..6fcb426 100644
--- a/fs/jffs2/compr.c
+++ b/fs/jffs2/compr.c
@@ -145,9 +145,9 @@ static int jffs2_selected_compress(u8 compr, unsigned char *data_in,
  * jffs2_compress should compress as much as will fit, and should set
  * *datalen accordingly to show the amount of data which were compressed.
  */
-uint16_t jffs2_compress(struct jffs2_sb_info *c, struct jffs2_inode_info *f,
-			unsigned char *data_in, unsigned char **cpage_out,
-			uint32_t *datalen, uint32_t *cdatalen)
+uint16_t jffs2_compress(struct jffs2_sb_info *c, unsigned char *data_in,
+			unsigned char **cpage_out, uint32_t *datalen,
+			uint32_t *cdatalen)
 {
 	int ret = JFFS2_COMPR_NONE;
 	int mode, compr_ret;
@@ -250,9 +250,9 @@ uint16_t jffs2_compress(struct jffs2_sb_info *c, struct jffs2_inode_info *f,
 	return ret;
 }
 
-int jffs2_decompress(struct jffs2_sb_info *c, struct jffs2_inode_info *f,
-		     uint16_t comprtype, unsigned char *cdata_in,
-		     unsigned char *data_out, uint32_t cdatalen, uint32_t datalen)
+int jffs2_decompress(uint16_t comprtype, unsigned char *cdata_in,
+		     unsigned char *data_out, uint32_t cdatalen,
+		     uint32_t datalen)
 {
 	struct jffs2_compressor *this;
 	int ret;
diff --git a/fs/jffs2/compr.h b/fs/jffs2/compr.h
index 5e91d57..092089a 100644
--- a/fs/jffs2/compr.h
+++ b/fs/jffs2/compr.h
@@ -70,13 +70,13 @@ int jffs2_unregister_compressor(struct jffs2_compressor *comp);
 int jffs2_compressors_init(void);
 int jffs2_compressors_exit(void);
 
-uint16_t jffs2_compress(struct jffs2_sb_info *c, struct jffs2_inode_info *f,
-			unsigned char *data_in, unsigned char **cpage_out,
-			uint32_t *datalen, uint32_t *cdatalen);
+uint16_t jffs2_compress(struct jffs2_sb_info *c, unsigned char *data_in,
+			unsigned char **cpage_out, uint32_t *datalen,
+			uint32_t *cdatalen);
 
-int jffs2_decompress(struct jffs2_sb_info *c, struct jffs2_inode_info *f,
-		     uint16_t comprtype, unsigned char *cdata_in,
-		     unsigned char *data_out, uint32_t cdatalen, uint32_t datalen);
+int jffs2_decompress(uint16_t comprtype, unsigned char *cdata_in,
+		     unsigned char *data_out, uint32_t cdatalen,
+		     uint32_t datalen);
 
 void jffs2_free_comprbuf(unsigned char *comprbuf, unsigned char *orig);
 
diff --git a/fs/jffs2/gc.c b/fs/jffs2/gc.c
index 5a2dec2..8dc85aa 100644
--- a/fs/jffs2/gc.c
+++ b/fs/jffs2/gc.c
@@ -1330,7 +1330,7 @@ static int jffs2_garbage_collect_dnode(struct jffs2_sb_info *c, struct jffs2_era
 
 		writebuf = pg_ptr + (offset & (PAGE_CACHE_SIZE -1));
 
-		comprtype = jffs2_compress(c, f, writebuf, &comprbuf, &datalen, &cdatalen);
+		comprtype = jffs2_compress(c, writebuf, &comprbuf, &datalen, &cdatalen);
 
 		ri.magic = cpu_to_je16(JFFS2_MAGIC_BITMASK);
 		ri.nodetype = cpu_to_je16(JFFS2_NODETYPE_INODE);
diff --git a/fs/jffs2/read.c b/fs/jffs2/read.c
index 0b042b1..aed9183 100644
--- a/fs/jffs2/read.c
+++ b/fs/jffs2/read.c
@@ -132,7 +132,9 @@ int jffs2_read_dnode(struct jffs2_sb_info *c, struct jffs2_inode_info *f,
 		jffs2_dbg(2, "Decompress %d bytes from %p to %d bytes at %p\n",
 			  je32_to_cpu(ri->csize), readbuf,
 			  je32_to_cpu(ri->dsize), decomprbuf);
-		ret = jffs2_decompress(c, f, ri->compr | (ri->usercompr << 8), readbuf, decomprbuf, je32_to_cpu(ri->csize), je32_to_cpu(ri->dsize));
+		ret = jffs2_decompress(ri->compr | (ri->usercompr << 8),
+				readbuf, decomprbuf, je32_to_cpu(ri->csize),
+				je32_to_cpu(ri->dsize));
 		if (ret) {
 			pr_warn("Error: jffs2_decompress returned %d\n", ret);
 			goto out_decomprbuf;
diff --git a/fs/jffs2/write.c b/fs/jffs2/write.c
index b634de4..dbc26de 100644
--- a/fs/jffs2/write.c
+++ b/fs/jffs2/write.c
@@ -369,7 +369,7 @@ int jffs2_write_inode_range(struct jffs2_sb_info *c, struct jffs2_inode_info *f,
 		datalen = min_t(uint32_t, writelen, PAGE_CACHE_SIZE - (offset & (PAGE_CACHE_SIZE-1)));
 		cdatalen = min_t(uint32_t, alloclen - sizeof(*ri), datalen);
 
-		comprtype = jffs2_compress(c, f, buf, &comprbuf, &datalen, &cdatalen);
+		comprtype = jffs2_compress(c, buf, &comprbuf, &datalen, &cdatalen);
 
 		ri->magic = cpu_to_je16(JFFS2_MAGIC_BITMASK);
 		ri->nodetype = cpu_to_je16(JFFS2_NODETYPE_INODE);
-- 
1.7.7
