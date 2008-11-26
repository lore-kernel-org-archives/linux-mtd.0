Received: from mail.cvg.de ([62.153.82.30])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L5KR8-0001EW-Cv
	for linux-mtd@lists.infradead.org; Wed, 26 Nov 2008 13:28:10 +0000
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH/mtd-utils] Separate '-m' and the mode with a space when
	invoking 'install'
Date: Wed, 26 Nov 2008 14:27:45 +0100
Message-Id: <1227706065-3067-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some 'install' versions (e.g. this of OpenEmbedded) require the mode
to be a separate argument and don't understand the '-m0755' syntax:

  .../staging/x86_64-linux/usr/bin/install-sh: ./-m0755 does not exist.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 Makefile                     |    2 +-
 mkfs.ubifs/Makefile          |    2 +-
 ubi-utils/Makefile           |    2 +-
 ubi-utils/new-utils/Makefile |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 796c31b..8319599 100644
--- a/Makefile
+++ b/Makefile
@@ -96,7 +96,7 @@ $(BUILDDIR)/fectest: $(BUILDDIR)/fectest.o $(BUILDDIR)/crc32.o $(BUILDDIR)/fec.o
 
 install: ${TARGETS}
 	mkdir -p ${DESTDIR}/${SBINDIR}
-	install -m0755 ${TARGETS} ${DESTDIR}/${SBINDIR}/
+	install -m 0755 ${TARGETS} ${DESTDIR}/${SBINDIR}/
 	mkdir -p ${DESTDIR}/${MANDIR}/man1
 	gzip -9c mkfs.jffs2.1 > ${DESTDIR}/${MANDIR}/man1/mkfs.jffs2.1.gz
 	$(MAKE) -C $(BUILDDIR)/ubi-utils install
diff --git a/mkfs.ubifs/Makefile b/mkfs.ubifs/Makefile
index a327eee..f802bff 100644
--- a/mkfs.ubifs/Makefile
+++ b/mkfs.ubifs/Makefile
@@ -20,4 +20,4 @@ cscope:
 
 install: ${TARGETS}
 	mkdir -p ${DESTDIR}/${SBINDIR}
-	install -m0755 ${TARGETS} ${DESTDIR}/${SBINDIR}/
+	install -m 0755 ${TARGETS} ${DESTDIR}/${SBINDIR}/
diff --git a/ubi-utils/Makefile b/ubi-utils/Makefile
index 4cca316..63058e1 100644
--- a/ubi-utils/Makefile
+++ b/ubi-utils/Makefile
@@ -75,7 +75,7 @@ pfi2bin: pfi2bin.o peb.o error.o list.o crc32.o libubigen.o bootenv.o \
 
 install: ${TARGETS}
 	mkdir -p ${DESTDIR}/${SBINDIR}
-	install -m0755 ${TARGETS} ${DESTDIR}/${SBINDIR}/
+	install -m 0755 ${TARGETS} ${DESTDIR}/${SBINDIR}/
 	(cd perl && install ${PERLPROGS} ${DESTDIR}/${SBINDIR}/)
 
 uninstall:
diff --git a/ubi-utils/new-utils/Makefile b/ubi-utils/new-utils/Makefile
index ba4c20f..356fc96 100644
--- a/ubi-utils/new-utils/Makefile
+++ b/ubi-utils/new-utils/Makefile
@@ -66,7 +66,7 @@ clean:
 
 install: ${UTILS}
 	mkdir -p ${DESTDIR}/${SBINDIR}
-	install -m0755 ${UTILS} ${DESTDIR}/${SBINDIR}/
+	install -m 0755 ${UTILS} ${DESTDIR}/${SBINDIR}/
 
 uninstall:
 	for file in ${UTILS}; do \
-- 
1.6.0.4
