Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zwpvk-0006zl-2R
 for linux-mtd@lists.infradead.org; Thu, 12 Nov 2015 11:20:41 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.sigma-star.at (Postfix) with ESMTP id B9C4224E0001
 for <linux-mtd@lists.infradead.org>; Thu, 12 Nov 2015 12:20:16 +0100 (CET)
Received: from dw-book (80-110-110-134.cgn.dynamic.surfer.at [80.110.110.134])
 by mail.sigma-star.at (Postfix) with ESMTPSA id EC80D16B47BA
 for <linux-mtd@lists.infradead.org>; Thu, 12 Nov 2015 12:20:14 +0100 (CET)
Date: Thu, 12 Nov 2015 12:20:14 +0100
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mkfs.ubifs: fix compiler warning for WITHOUT_LZO
Message-ID: <20151112112014.GA22505@dw-nb.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix compiler warning for WITHOUT_LZO builds 

Signed-off-by: Daniel Walter <dwalter@sigma-star.at>
---
 ubifs-utils/mkfs.ubifs/compr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/ubifs-utils/mkfs.ubifs/compr.c b/ubifs-utils/mkfs.ubifs/compr.c
index d534f10..8eff186 100644
--- a/ubifs-utils/mkfs.ubifs/compr.c
+++ b/ubifs-utils/mkfs.ubifs/compr.c
@@ -38,7 +38,9 @@
 
 static void *lzo_mem;
 static unsigned long long errcnt = 0;
+#ifndef WITHOUT_LZO
 static struct ubifs_info *c = &info_;
+#endif
 
 #define DEFLATE_DEF_LEVEL     Z_DEFAULT_COMPRESSION
 #define DEFLATE_DEF_WINBITS   11
-- 
2.6.2
