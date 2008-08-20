Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KVrqz-00030V-9h
	for linux-mtd@lists.infradead.org; Wed, 20 Aug 2008 17:52:17 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id CA85B67830
	for <linux-mtd@lists.infradead.org>;
	Wed, 20 Aug 2008 17:52:06 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] use $(MAKE) rather than make
Date: Wed, 20 Aug 2008 13:52:05 -0400
Message-Id: <1219254725-21918-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If you execute straight `make`, this prevents the active make env from
being passed on to sub children.  This prevents parallel building as well
as build flag passing.

I also dropped the recursive make in ubi-utils/Makefile for the all target
as this causes problems when building in parallel.  All of the targets
that we actually care about are handled by the $(NTARGETS) target anyways.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 Makefile           |   12 ++++++------
 ubi-utils/Makefile |    5 ++---
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/Makefile b/Makefile
index 2000b17..796c31b 100644
--- a/Makefile
+++ b/Makefile
@@ -47,8 +47,8 @@ $(BUILDDIR)/%.o: %.c
 .SUFFIXES:
 
 all: $(TARGETS)
-	make -C $(BUILDDIR)/ubi-utils
-	make -C $(BUILDDIR)/mkfs.ubifs
+	$(MAKE) -C $(BUILDDIR)/ubi-utils
+	$(MAKE) -C $(BUILDDIR)/mkfs.ubifs
 
 IGNORE=${wildcard $(BUILDDIR)/.*.c.dep}
 -include ${IGNORE}
@@ -56,8 +56,8 @@ IGNORE=${wildcard $(BUILDDIR)/.*.c.dep}
 clean:
 	rm -f $(BUILDDIR)/*.o $(TARGETS) $(BUILDDIR)/.*.c.dep $(SYMLINKS)
 	if [ "$(BUILDDIR)x" != ".x" ]; then rm -rf $(BUILDDIR); fi
-	make -C $(BUILDDIR)/ubi-utils clean
-	make -C $(BUILDDIR)/mkfs.ubifs clean
+	$(MAKE) -C $(BUILDDIR)/ubi-utils clean
+	$(MAKE) -C $(BUILDDIR)/mkfs.ubifs clean
 
 $(SYMLINKS):
 	ln -sf ../fs/jffs2/$@ $@
@@ -99,5 +99,5 @@ install: ${TARGETS}
 	install -m0755 ${TARGETS} ${DESTDIR}/${SBINDIR}/
 	mkdir -p ${DESTDIR}/${MANDIR}/man1
 	gzip -9c mkfs.jffs2.1 > ${DESTDIR}/${MANDIR}/man1/mkfs.jffs2.1.gz
-	make -C $(BUILDDIR)/ubi-utils install
-	make -C $(BUILDDIR)/mkfs.ubifs install
+	$(MAKE) -C $(BUILDDIR)/ubi-utils install
+	$(MAKE) -C $(BUILDDIR)/mkfs.ubifs install
diff --git a/ubi-utils/Makefile b/ubi-utils/Makefile
index 3e6203f..4cca316 100644
--- a/ubi-utils/Makefile
+++ b/ubi-utils/Makefile
@@ -30,18 +30,17 @@ vpath   %.c ./src
 	$(CC) $(CPPFLAGS) $(CFLAGS) -c -o $@ $< -g -Wp,-MD,.$(shell basename $<).dep
 
 all: $(TARGETS)
-	make -C new-utils
 
 IGNORE=${wildcard .*.c.dep}
 -include ${IGNORE}
 
 $(NTARGETS):
-	make -C new-utils $@
+	$(MAKE) -C new-utils $@
 	mv new-utils/$@ $@
 
 clean:
 	rm -rf *.o $(TARGETS) .*.c.dep
-	make -C new-utils clean
+	$(MAKE) -C new-utils clean
 
 pddcustomize: pddcustomize.o error.o libubimirror.o bootenv.o hashmap.o \
 		libubi.o crc32.o
-- 
1.5.6.5
