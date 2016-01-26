Received: from mail-pa0-x22c.google.com ([2607:f8b0:400e:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aOBIk-00020U-4W
 for linux-mtd@lists.infradead.org; Tue, 26 Jan 2016 21:37:26 +0000
Received: by mail-pa0-x22c.google.com with SMTP id ho8so103578399pac.2
 for <linux-mtd@lists.infradead.org>; Tue, 26 Jan 2016 13:37:05 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [mtd-utils PATCH] Makefile: install: don't look for scripts in
 BUILDDIR
Date: Tue, 26 Jan 2016 13:36:56 -0800
Message-Id: <1453844216-133634-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Our ${SCRIPTS} (e.g., flash_eraseall) are not found in the build
directory; they should be found in their original location.

This fixes a typo in the Makefile refactoring, which caused 'make
install' to fail with messages like:

  make: *** No rule to make target '[...my source-build directory...]/armv7a-cros-linux-gnueabi/misc-utils/flash_eraseall'. Stop.

because the install target is looking in the wrong place for
flash_eraseall.

Fixes: 7d81790ced34 ("mtd-utils: Restructure the mtd-utils source.")
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index bd9504ae72f0..977c9c5056ed 100644
--- a/Makefile
+++ b/Makefile
@@ -67,7 +67,7 @@ endif
 	rm -f $(BUILDDIR)/include/version.h
 	$(MAKE) -C $(TESTS) clean
 
-install:: $(addprefix $(BUILDDIR)/,${BINS} ${SCRIPTS})
+install:: $(addprefix $(BUILDDIR)/,${BINS}) ${SCRIPTS}
 	mkdir -p ${DESTDIR}/${SBINDIR}
 	install -m 0755 $^ ${DESTDIR}/${SBINDIR}/
 	mkdir -p ${DESTDIR}/${MANDIR}/man1
-- 
2.7.0.rc3.207.g0ac5344
