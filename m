Received: from smtp.gentoo.org ([140.211.166.183])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RRs33-0000o7-Cn
 for linux-mtd@lists.infradead.org; Sat, 19 Nov 2011 21:02:05 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
 by smtp.gentoo.org (Postfix) with ESMTP id 292AE1B4007
 for <linux-mtd@lists.infradead.org>; Sat, 19 Nov 2011 21:02:03 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] Makefile: separate man page install and compression steps
Date: Sat, 19 Nov 2011 16:02:03 -0500
Message-Id: <1321736523-8979-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If the system doesn't have gzip installed, we should still be able
to install the man pages.  So install the file in one step, and then
compress it in another (and ignore failures from that).

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 Makefile |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 4b71b8f..f4f97e5 100644
--- a/Makefile
+++ b/Makefile
@@ -62,7 +62,8 @@ install:: $(addprefix $(BUILDDIR)/,${BINS}) ${SCRIPTS}
 	mkdir -p ${DESTDIR}/${SBINDIR}
 	install -m 0755 $^ ${DESTDIR}/${SBINDIR}/
 	mkdir -p ${DESTDIR}/${MANDIR}/man1
-	gzip -9c mkfs.jffs2.1 > ${DESTDIR}/${MANDIR}/man1/mkfs.jffs2.1.gz
+	install -m 0644 mkfs.jffs2.1 ${DESTDIR}/${MANDIR}/man1/
+	-gzip -9f ${DESTDIR}/${MANDIR}/man1/*.1
 
 tests::
 	$(MAKE) -C $(TESTS)
-- 
1.7.6.1
