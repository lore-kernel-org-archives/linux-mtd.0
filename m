Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OycBP-0003tL-Qg
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2010 03:09:16 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 6040E641C6
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Sep 2010 03:09:04 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] libfec: fix up pointer warnings in fec magic computation
Date: Wed, 22 Sep 2010 23:08:03 -0400
Message-Id: <1285211283-17618-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The current fec code casts a pointer to an int which causes warnings on
64bit systems.  So create a macro for the duplicate/complicated magic
computation, and add an unsigned long cast in it to fix the original
problem.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 lib/libfec.c |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/lib/libfec.c b/lib/libfec.c
index 924701f..b19ed6e 100644
--- a/lib/libfec.c
+++ b/lib/libfec.c
@@ -629,12 +629,13 @@ struct fec_parms {
     int k, n ;		/* parameters of the code */
     gf *enc_matrix ;
 } ;
+#define COMP_FEC_MAGIC(fec) \
+	(((FEC_MAGIC ^ (fec)->k) ^ (fec)->n) ^ (unsigned long)((fec)->enc_matrix))
 
 void
 fec_free(struct fec_parms *p)
 {
-    if (p==NULL ||
-       p->magic != ( ( (FEC_MAGIC ^ p->k) ^ p->n) ^ (int)(p->enc_matrix)) ) {
+    if (p==NULL || p->magic != COMP_FEC_MAGIC(p)) {
 	fprintf(stderr, "bad parameters to fec_free\n");
 	return ;
     }
@@ -666,7 +667,7 @@ fec_new(int k, int n)
     retval->k = k ;
     retval->n = n ;
     retval->enc_matrix = NEW_GF_MATRIX(n, k);
-    retval->magic = ( ( FEC_MAGIC ^ k) ^ n) ^ (int)(retval->enc_matrix) ;
+    retval->magic = COMP_FEC_MAGIC(retval);
     tmp_m = NEW_GF_MATRIX(n, k);
     /*
      * fill the matrix with powers of field elements, starting from 0.
-- 
1.7.3
