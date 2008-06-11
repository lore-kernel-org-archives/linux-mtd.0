Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K6YBu-0004JN-Kr
	for linux-mtd@lists.infradead.org; Wed, 11 Jun 2008 21:49:14 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 69C6D67400
	for <linux-mtd@lists.infradead.org>;
	Wed, 11 Jun 2008 21:49:09 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] respect CFLAGS/CPPFLAGS from build environment
Date: Wed, 11 Jun 2008 17:49:08 -0400
Message-Id: <1213220948-30156-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 Makefile           |   10 ++++++----
 ubi-utils/Makefile |    9 +++++----
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index 9f5ef6c..6c13a5a 100644
--- a/Makefile
+++ b/Makefile
@@ -1,13 +1,15 @@
 
 # -*- sh -*-
 
-OPTFLAGS := -O2 -Wall
 SBINDIR=/usr/sbin
 MANDIR=/usr/share/man
 INCLUDEDIR=/usr/include
+
 #CROSS=arm-linux-
 CC := $(CROSS)gcc
-CFLAGS := -I./include $(OPTFLAGS)
+CFLAGS ?= -O2
+CFLAGS += -Wall
+CPPFLAGS += -I./include
 
 ifeq ($(origin CROSS),undefined)
   BUILDDIR := .
@@ -17,7 +19,7 @@ else
 endif
 
 ifeq ($(WITHOUT_XATTR), 1)
-  CFLAGS += -DWITHOUT_XATTR
+  CPPFLAGS += -DWITHOUT_XATTR
 endif
 
 RAWTARGETS = ftl_format flash_erase flash_eraseall nanddump doc_loadbios \
@@ -38,7 +40,7 @@ SYMLINKS =
 
 $(BUILDDIR)/%.o: %.c
 	mkdir -p $(BUILDDIR)
-	$(CC) $(CFLAGS) -g -c -o $@ $< -g -Wp,-MD,$(BUILDDIR)/.$(<F).dep
+	$(CC) $(CPPFLAGS) $(CFLAGS) -g -c -o $@ $< -g -Wp,-MD,$(BUILDDIR)/.$(<F).dep
 
 .SUFFIXES:
 
diff --git a/ubi-utils/Makefile b/ubi-utils/Makefile
index 0394eee..062cc32 100644
--- a/ubi-utils/Makefile
+++ b/ubi-utils/Makefile
@@ -2,7 +2,6 @@
 # Makefile for ubi-utils
 #
 
-OPTFLAGS := -O2 -g -Wall
 KERNELHDR := ../include
 DESTDIR := /usr/local
 SBINDIR=/usr/sbin
@@ -10,8 +9,10 @@ MANDIR=/usr/share/man
 INCLUDEDIR=/usr/include
 
 CC := $(CROSS)gcc
-CFLAGS := -I./inc -I./src -I$(KERNELHDR) $(OPTFLAGS) -Werror \
-	-Wwrite-strings -W -std=gnu99 -DPACKAGE_VERSION=\"1.0\"
+CFLAGS ?= -O2 -g -Werror
+CFLAGS += -Wall -Wwrite-strings -W
+CPPFLAGS += -I./inc -I./src -I$(KERNELHDR) \
+	-std=gnu99 -DPACKAGE_VERSION=\"1.0\"
 
 PERLPROGS = mkpfi ubicrc32.pl
 
@@ -26,7 +27,7 @@ vpath   %.c ./src
 	$(CC) $(LDFLAGS) -g -o $@ $^
 
 %.o: %.c
-	$(CC) $(CFLAGS) -g -c -o $@ $< -g -Wp,-MD,.$(shell basename $<).dep
+	$(CC) $(CPPFLAGS) $(CFLAGS) -g -c -o $@ $< -g -Wp,-MD,.$(shell basename $<).dep
 
 all: $(TARGETS)
 	make -C new-utils
-- 
1.5.5.3
