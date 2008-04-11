Received: from naru.obs2.net ([84.20.150.76] helo=narury.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JkFXq-0004QN-5W
	for linux-mtd@lists.infradead.org; Fri, 11 Apr 2008 09:27:42 +0000
Received: from kos.to (localhost.localdomain [127.0.0.1])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by narury.org (Postfix) with ESMTP id E2B933274008
	for <linux-mtd@lists.infradead.org>;
	Fri, 11 Apr 2008 12:27:38 +0300 (EEST)
Date: Fri, 11 Apr 2008 12:27:38 +0300
From: Riku Voipio <riku.voipio@iki.fi>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] Use LSB locations for manpages
Message-ID: <20080411092738.GA21208@kos.to>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

LSB says manpages belong to /usr/share/man, adjust makefile
defaults accordingly.

Signed-off-by: Riku Voipio <riku.voipio@iki.fi>
---
 Makefile           |    4 ++--
 ubi-utils/Makefile |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 5f0cef6..9f5ef6c 100644
--- a/Makefile
+++ b/Makefile
@@ -3,7 +3,7 @@
 
 OPTFLAGS := -O2 -Wall
 SBINDIR=/usr/sbin
-MANDIR=/usr/man
+MANDIR=/usr/share/man
 INCLUDEDIR=/usr/include
 #CROSS=arm-linux-
 CC := $(CROSS)gcc
@@ -92,5 +92,5 @@ install: ${TARGETS}
 	mkdir -p ${DESTDIR}/${SBINDIR}
 	install -m0755 ${TARGETS} ${DESTDIR}/${SBINDIR}/
 	mkdir -p ${DESTDIR}/${MANDIR}/man1
-	gzip -c mkfs.jffs2.1 > ${DESTDIR}/${MANDIR}/man1/mkfs.jffs2.1.gz
+	gzip -9c mkfs.jffs2.1 > ${DESTDIR}/${MANDIR}/man1/mkfs.jffs2.1.gz
 	make -C $(BUILDDIR)/ubi-utils install
diff --git a/ubi-utils/Makefile b/ubi-utils/Makefile
index 8c1994c..e86738b 100644
--- a/ubi-utils/Makefile
+++ b/ubi-utils/Makefile
@@ -6,7 +6,7 @@ OPTFLAGS := -O2 -g -Wall
 KERNELHDR := ../include
 DESTDIR := /usr/local
 SBINDIR=/usr/sbin
-MANDIR=/usr/man
+MANDIR=/usr/share/man
 INCLUDEDIR=/usr/include
 
 CC := $(CROSS)gcc
-- 
1.5.4.5


-- 
"rm -rf" only sounds scary if you don't have backups
