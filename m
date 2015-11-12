Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwqQc-0003Ys-7f
 for linux-mtd@lists.infradead.org; Thu, 12 Nov 2015 11:52:35 +0000
Date: Thu, 12 Nov 2015 12:52:09 +0100
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: richard@nod.at
Subject: [PATCH v2] mkfs.ubifs: fix compiler warning for WITHOUT_LZO
Message-ID: <20151112115209.GA2876@dw-nb.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix compiler warning about an unused variable.

ubifs-utils/mkfs.ubifs/compr.c:41:27: warning: ‘c’ defined but not used [-Wunused-variable]
 static struct ubifs_info *c = &info_;


Signed-off-by: Daniel Walter <dwalter@sigma-star.at>
---
Changes since v1:
   * added exact compiler warning to commit message as requested
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
