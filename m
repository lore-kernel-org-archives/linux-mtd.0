Received: from guitar.tcltek.co.il ([192.115.133.116] helo=mx.tkos.co.il)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WZJVH-0007sH-Bq
 for linux-mtd@lists.infradead.org; Sun, 13 Apr 2014 12:27:20 +0000
From: Baruch Siach <baruch@tkos.co.il>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] include/common.h: fix build against current uClibc
Date: Sun, 13 Apr 2014 15:26:46 +0300
Message-Id: <98c2959992086acd792ef9850c90cc9da8a2a063.1397392006.git.baruch@tkos.co.il>
Cc: Baruch Siach <baruch@tkos.co.il>, Mike Frysinger <vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit dbe0fd17f2 (mtd-utils: new prompt() helper for talking to the user)
introduced a rpmatch() call. However, uClibc versions older than (not yet
released) 0.9.34 don't have rpmatch() implementation. Add one.

Cc: Mike Frysinger <vapier@gentoo.org>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 include/common.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/common.h b/include/common.h
index 4ffccea17213..3b1366e927c4 100644
--- a/include/common.h
+++ b/include/common.h
@@ -102,6 +102,19 @@ extern "C" {
 	fprintf(stderr, "%s: warning!: " fmt "\n", PROGRAM_NAME, ##__VA_ARGS__); \
 } while(0)
 
+#if defined(__UCLIBC__)
+/* uClibc versions before 0.9.34 don't have rpmatch() */
+#if __UCLIBC_MAJOR__ == 0 && \
+		(__UCLIBC_MINOR__ < 9 || \
+		(__UCLIBC_MINOR__ == 9 && __UCLIBC_SUBLEVEL__ < 34))
+static inline int rpmatch(const char *resp)
+{
+    return (resp[0] == 'y' || resp[0] == 'Y') ? 1 :
+	(resp[0] == 'n' || resp[0] == 'N') ? 0 : -1;
+}
+#endif
+#endif
+
 /**
  * prompt the user for confirmation
  */
-- 
1.9.1
