Received: from arrakis.dune.hu ([78.24.191.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YpGZY-0000wi-PA
 for linux-mtd@lists.infradead.org; Mon, 04 May 2015 13:38:13 +0000
Received: from localhost (localhost [127.0.0.1])
 by arrakis.dune.hu (Postfix) with ESMTP id 4486F2808F2
 for <linux-mtd@lists.infradead.org>; Mon,  4 May 2015 15:36:36 +0200 (CEST)
From: Imre Kaloz <kaloz@openwrt.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd-utils: libfec: use standard C type instead of u_long
Date: Mon,  4 May 2015 15:36:34 +0200
Message-Id: <1430746594-5867-1-git-send-email-kaloz@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fixes compilation on hosts with the musl C library.
Also drops the unused u_short typedef.

Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
---
 lib/libfec.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/lib/libfec.c b/lib/libfec.c
index ff5a127..bf68381 100644
--- a/lib/libfec.c
+++ b/lib/libfec.c
@@ -61,8 +61,6 @@ struct timeval {
 };
 #define gettimeofday(x, dummy) { (x)->ticks = clock() ; }
 #define DIFF_T(a,b) (1+ 1000000*(a.ticks - b.ticks) / CLOCKS_PER_SEC )
-typedef unsigned long u_long ;
-typedef unsigned short u_short ;
 #else /* typically, unix systems */
 #include <sys/time.h>
 #define DIFF_T(a,b) \
@@ -75,12 +73,12 @@ typedef unsigned short u_short ;
 	t = x.tv_usec + 1000000* (x.tv_sec & 0xff ) ; \
 	}
 #define TOCK(t) \
-	{ u_long t1 ; TICK(t1) ; \
+	{ unsigned long t1 ; TICK(t1) ; \
 	  if (t1 < t) t = 256000000 + t1 - t ; \
 	  else t = t1 - t ; \
 	  if (t == 0) t = 1 ;}
 
-u_long ticks[10];	/* vars for timekeeping */
+unsigned long ticks[10];	/* vars for timekeeping */
 #else
 #define DEB(x)
 #define DDB(x)
@@ -625,7 +623,7 @@ init_fec(void)
 #define FEC_MAGIC	0xFECC0DEC
 
 struct fec_parms {
-    u_long magic ;
+    unsigned long magic ;
     int k, n ;		/* parameters of the code */
     gf *enc_matrix ;
 } ;
-- 
2.1.0
