Received: from chamillionaire.breakpoint.cc ([85.10.199.196])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LbiVs-0007Gb-0Z
	for linux-mtd@lists.infradead.org; Mon, 23 Feb 2009 21:38:58 +0000
Received: id: bigeasy by Chamillionaire.breakpoint.cc with local
	(easymta 1.00 BETA 1) id 1LbiVq-0004M4-Nu
	for linux-mtd@lists.infradead.org; Mon, 23 Feb 2009 22:38:54 +0100
Date: Mon, 23 Feb 2009 22:38:54 +0100
From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] fix lzo usage on 64bit systems
Message-ID: <20090223213854.GB15989@Chamillionaire.breakpoint.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

the compress size parameter in lzo is defined in the header file as lzo_uint.
This looks very much like uint32_t, I know, but is defined as unsigned long.
So on 64bit LE systems we zero some bytes near by and on BE systems we
get a size of zero.

Signed-off-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
---
 compr_lzo.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/compr_lzo.c b/compr_lzo.c
index a0bb362..3d7dad7 100644
--- a/compr_lzo.c
+++ b/compr_lzo.c
@@ -48,7 +48,7 @@ static void *lzo_compress_buf;
 static int jffs2_lzo_cmpr(unsigned char *data_in, unsigned char *cpage_out,
 			  uint32_t *sourcelen, uint32_t *dstlen, void *model)
 {
-	uint32_t compress_size;
+	lzo_uint compress_size;
 	int ret;
 
 	ret = lzo1x_999_compress(data_in, *sourcelen, lzo_compress_buf, &compress_size, lzo_mem);
@@ -69,7 +69,7 @@ static int jffs2_lzo_decompress(unsigned char *data_in, unsigned char *cpage_out
 				 uint32_t srclen, uint32_t destlen, void *model)
 {
 	int ret;
-	uint32_t dl;
+	lzo_uint dl;
 
 	ret = lzo1x_decompress_safe(data_in,srclen,cpage_out,&dl,NULL);
 
-- 
1.6.1.3
