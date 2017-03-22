Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cqdQm-0007CQ-K9
 for linux-mtd@lists.infradead.org; Wed, 22 Mar 2017 10:23:55 +0000
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: Yuanjie.Huang@windriver.com, raj.khem@gmail.com,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH 2/5] Replace rpmatch() usage with checking first character of
 line
Date: Wed, 22 Mar 2017 11:22:54 +0100
Message-Id: <20170322102257.7605-3-david.oberhollenzer@sigma-star.at>
In-Reply-To: <20170322102257.7605-1-david.oberhollenzer@sigma-star.at>
References: <20170322102257.7605-1-david.oberhollenzer@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is based on the patch from Khem Raj used by openembedded. In
addition to the original patch, this also removes the fallback
implementation that was provided for C libraries that don't implement
rpmatch.

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
---
 include/common.h | 25 ++++++-------------------
 1 file changed, 6 insertions(+), 19 deletions(-)

diff --git a/include/common.h b/include/common.h
index d0c706d..d609257 100644
--- a/include/common.h
+++ b/include/common.h
@@ -129,21 +129,6 @@ extern "C" {
 	fprintf(stderr, "%s: warning!: " fmt "\n", PROGRAM_NAME, ##__VA_ARGS__); \
 } while(0)
 
-/* uClibc versions before 0.9.34 and musl don't have rpmatch() */
-#if defined(__UCLIBC__) && \
-		(__UCLIBC_MAJOR__ == 0 && \
-		(__UCLIBC_MINOR__ < 9 || \
-		(__UCLIBC_MINOR__ == 9 && __UCLIBC_SUBLEVEL__ < 34))) || \
-	!defined(__GLIBC__)
-#undef rpmatch
-#define rpmatch __rpmatch
-static inline int __rpmatch(const char *resp)
-{
-    return (resp[0] == 'y' || resp[0] == 'Y') ? 1 :
-	(resp[0] == 'n' || resp[0] == 'N') ? 0 : -1;
-}
-#endif
-
 /**
  * prompt the user for confirmation
  */
@@ -164,10 +149,12 @@ static inline bool prompt(const char *msg, bool def)
 		}
 
 		if (strcmp("\n", line) != 0) {
-			switch (rpmatch(line)) {
-			case 0: ret = false; break;
-			case 1: ret = true; break;
-			case -1:
+			switch (line[0]) {
+			case 'N':
+			case 'n': ret = false; break;
+			case 'Y':
+			case 'y': ret = true; break;
+			default:
 				puts("unknown response; please try again");
 				continue;
 			}
-- 
2.10.2
