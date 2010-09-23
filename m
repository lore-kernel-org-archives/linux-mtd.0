Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OybeS-0006JF-7H
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2010 02:35:12 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 2409B1B4049
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Sep 2010 02:35:11 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] compr_zlib: mark local functions as static
Date: Wed, 22 Sep 2010 22:34:24 -0400
Message-Id: <1285209264-3936-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 compr_zlib.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/compr_zlib.c b/compr_zlib.c
index db4811d..03464f9 100644
--- a/compr_zlib.c
+++ b/compr_zlib.c
@@ -52,7 +52,7 @@ Q: Is 12 bytes sufficient?
  */
 #define STREAM_END_SPACE 12
 
-int jffs2_zlib_compress(unsigned char *data_in, unsigned char *cpage_out,
+static int jffs2_zlib_compress(unsigned char *data_in, unsigned char *cpage_out,
 		uint32_t *sourcelen, uint32_t *dstlen, void *model)
 {
 	z_stream strm;
@@ -100,7 +100,7 @@ int jffs2_zlib_compress(unsigned char *data_in, unsigned char *cpage_out,
 	return 0;
 }
 
-int jffs2_zlib_decompress(unsigned char *data_in, unsigned char *cpage_out,
+static int jffs2_zlib_decompress(unsigned char *data_in, unsigned char *cpage_out,
 		uint32_t srclen, uint32_t destlen, void *model)
 {
 	z_stream strm;
-- 
1.7.3
