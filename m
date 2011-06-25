Received: from smtp.gentoo.org ([140.211.166.183])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QaMNZ-0006AF-1B
	for linux-mtd@lists.infradead.org; Sat, 25 Jun 2011 06:30:05 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 1B3521B4017
	for <linux-mtd@lists.infradead.org>;
	Sat, 25 Jun 2011 06:30:03 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] build: remove old SYMLINKS variable
Date: Sat, 25 Jun 2011 02:30:01 -0400
Message-Id: <1308983401-27015-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is only used to create symlinks to out of tree files.  I doubt it
has any relevance anymore now that jffs2 has been merged into mainline.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 Makefile |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 8bdba8e..d69206a 100644
--- a/Makefile
+++ b/Makefile
@@ -25,8 +25,6 @@ TARGETS = ftl_format flash_erase nanddump doc_loadbios \
 	sumtool #jffs2reader
 SCRIPTS = flash_eraseall
 
-SYMLINKS =
-
 LDLIBS = -L$(BUILDDIR)/lib -lmtd
 LDDEPS = $(BUILDDIR)/lib/libmtd.a
 
@@ -36,7 +34,6 @@ include common.mk
 subdirs_mkfs.ubifs_all: subdirs_ubi-utils_all
 
 clean::
-	-rm -f $(SYMLINKS)
 ifneq ($(BUILDDIR)/.git,)
 ifneq ($(BUILDDIR),.)
 ifneq ($(BUILDDIR),$(CURDIR))
@@ -46,9 +43,6 @@ endif
 endif
 	$(MAKE) -C $(TESTS) clean
 
-$(SYMLINKS):
-	ln -sf ../fs/jffs2/$@ $@
-
 $(BUILDDIR)/mkfs.jffs2: $(addprefix $(BUILDDIR)/,\
 	compr_rtime.o mkfs.jffs2.o compr_zlib.o compr_lzo.o \
 	compr.o rbtree.o)
-- 
1.7.5.3
