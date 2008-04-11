Received: from naru.obs2.net ([84.20.150.76] helo=narury.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JkFda-000611-KB
	for linux-mtd@lists.infradead.org; Fri, 11 Apr 2008 09:33:38 +0000
Received: from kos.to (localhost.localdomain [127.0.0.1])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by narury.org (Postfix) with ESMTP id 94F873274008
	for <linux-mtd@lists.infradead.org>;
	Fri, 11 Apr 2008 12:33:37 +0300 (EEST)
Date: Fri, 11 Apr 2008 12:33:37 +0300
From: Riku Voipio <riku.voipio@iki.fi>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] compr_lzo.c: allocate enough memory for lzo compressor.
Message-ID: <20080411093337.GA22045@kos.to>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is the same bug as in kernel, pointed out the LZO author
(Markus Oberhumer):

http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commitdiff;h=f2a11b158a24301e9158e9c873fa88e5eb775486
---
 compr_lzo.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/compr_lzo.c b/compr_lzo.c
index fb54600..a0bb362 100644
--- a/compr_lzo.c
+++ b/compr_lzo.c
@@ -97,7 +97,7 @@ int jffs2_lzo_init(void)
 		return -1;
 
 	/* Worse case LZO compression size from their FAQ */
-	lzo_compress_buf = malloc(page_size + (page_size / 64) + 16 + 3);
+	lzo_compress_buf = malloc(page_size + (page_size / 16) + 64 + 3);
 	if (!lzo_compress_buf) {
 		free(lzo_mem);
 		return -1;
-- 
1.5.4.5


-- 
"rm -rf" only sounds scary if you don't have backups
