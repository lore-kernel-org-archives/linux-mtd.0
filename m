Received: from smtp.gentoo.org ([140.211.166.183])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RRs1E-0000eh-3J
 for linux-mtd@lists.infradead.org; Sat, 19 Nov 2011 21:00:13 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
 by smtp.gentoo.org (Postfix) with ESMTP id D31A41B4025
 for <linux-mtd@lists.infradead.org>; Sat, 19 Nov 2011 21:00:07 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] Makefile: fix install target with out-of-tree builds
Date: Sat, 19 Nov 2011 16:00:07 -0500
Message-Id: <1321736407-8801-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The install target always looks for the compiled binaries in the working
directory which breaks when doing something like `make CHOST=... install`.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 Makefile |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index d0bc3d6..4b71b8f 100644
--- a/Makefile
+++ b/Makefile
@@ -58,9 +58,9 @@ endif
 	rm -f $(BUILDDIR)/include/version.h
 	$(MAKE) -C $(TESTS) clean
 
-install:: ${BINS} ${SCRIPTS}
+install:: $(addprefix $(BUILDDIR)/,${BINS}) ${SCRIPTS}
 	mkdir -p ${DESTDIR}/${SBINDIR}
-	install -m 0755 ${BINS} ${SCRIPTS} ${DESTDIR}/${SBINDIR}/
+	install -m 0755 $^ ${DESTDIR}/${SBINDIR}/
 	mkdir -p ${DESTDIR}/${MANDIR}/man1
 	gzip -9c mkfs.jffs2.1 > ${DESTDIR}/${MANDIR}/man1/mkfs.jffs2.1.gz
 
-- 
1.7.6.1
