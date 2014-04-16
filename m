Received: from guitar.tcltek.co.il ([192.115.133.116] helo=mx.tkos.co.il)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WaHqq-0004wF-R8
 for linux-mtd@lists.infradead.org; Wed, 16 Apr 2014 04:53:37 +0000
From: Baruch Siach <baruch@tkos.co.il>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2] include/common.h: fix build against recent 0.9.33 uClibc
Date: Wed, 16 Apr 2014 07:52:48 +0300
Message-Id: <2c54c99957bae293249f9ab2a6077570d8671260.1397623968.git.baruch@tkos.co.il>
Cc: Baruch Siach <baruch@tkos.co.il>, Mike Frysinger <vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

An implementation of rpmatch() was backported to the 0.9.33 branch of uClibc.
So the uClibc version check introduced in commit 50c9e11f7e (include/common.h:
fix build against current uClibc) is not enough. Rename the local rpmatch()
implementation to avoid collision.

Cc: Mike Frysinger <vapier@gentoo.org>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v2:
   #undef rpmatch before redefining it (Mike Frysinger)
---
 include/common.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/common.h b/include/common.h
index 3b1366e..6895e5c 100644
--- a/include/common.h
+++ b/include/common.h
@@ -107,7 +107,9 @@ extern "C" {
 #if __UCLIBC_MAJOR__ == 0 && \
 		(__UCLIBC_MINOR__ < 9 || \
 		(__UCLIBC_MINOR__ == 9 && __UCLIBC_SUBLEVEL__ < 34))
-static inline int rpmatch(const char *resp)
+#undef rpmatch
+#define rpmatch __rpmatch
+static inline int __rpmatch(const char *resp)
 {
     return (resp[0] == 'y' || resp[0] == 'Y') ? 1 :
 	(resp[0] == 'n' || resp[0] == 'N') ? 0 : -1;
-- 
1.9.1
