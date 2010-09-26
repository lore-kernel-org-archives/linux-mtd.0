Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OzymG-0004fH-Gf
	for linux-mtd@lists.infradead.org; Sun, 26 Sep 2010 21:28:57 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 0BAFB1B400B
	for <linux-mtd@lists.infradead.org>;
	Sun, 26 Sep 2010 21:28:52 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] compr_rtime: fix unused warning
Date: Sun, 26 Sep 2010 17:29:47 -0400
Message-Id: <1285536587-5265-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The rtime logic causes gcc to emit an unused warning about srclen, so
mark it with an unused attribute to shut it up.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 compr_rtime.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/compr_rtime.c b/compr_rtime.c
index 7818e1b..f24379d 100644
--- a/compr_rtime.c
+++ b/compr_rtime.c
@@ -64,7 +64,7 @@ static int jffs2_rtime_compress(unsigned char *data_in, unsigned char *cpage_out
 
 
 static int jffs2_rtime_decompress(unsigned char *data_in, unsigned char *cpage_out,
-		uint32_t srclen, uint32_t destlen)
+		__attribute__((unused)) uint32_t srclen, uint32_t destlen)
 {
 	short positions[256];
 	int outpos = 0;
-- 
1.7.2.3
