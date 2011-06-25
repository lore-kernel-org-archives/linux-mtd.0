Received: from smtp.gentoo.org ([140.211.166.183])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QaMje-0006Pb-Ds
	for linux-mtd@lists.infradead.org; Sat, 25 Jun 2011 06:52:55 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 032F71B4014
	for <linux-mtd@lists.infradead.org>;
	Sat, 25 Jun 2011 06:52:51 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] autogenerate version.h from build system
Date: Sat, 25 Jun 2011 02:52:50 -0400
Message-Id: <1308984770-6594-2-git-send-email-vapier@gentoo.org>
In-Reply-To: <1308984770-6594-1-git-send-email-vapier@gentoo.org>
References: <1308983405-27064-1-git-send-email-vapier@gentoo.org>
	<1308984770-6594-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 .gitignore       |    1 +
 Makefile         |    8 ++++++++
 common.mk        |    2 +-
 flash_erase.c    |    1 -
 include/common.h |    1 +
 nanddump.c       |    1 -
 nandwrite.c      |    1 -
 7 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/.gitignore b/.gitignore
index 849265d..86aee63 100644
--- a/.gitignore
+++ b/.gitignore
@@ -50,6 +50,7 @@
 #
 # Generated include files
 #
+/include/version.h
 
 # stgit generated dirs
 patches-*
diff --git a/Makefile b/Makefile
index bd5ada3..381b59f 100644
--- a/Makefile
+++ b/Makefile
@@ -1,6 +1,8 @@
 
 # -*- sh -*-
 
+VERSION = 1.4.5
+
 CPPFLAGS += -I./include -I./ubi-utils/include $(ZLIBCPPFLAGS) $(LZOCPPFLAGS)
 
 ifeq ($(WITHOUT_XATTR), 1)
@@ -49,6 +51,7 @@ endif
 	find $(BUILDDIR)/ -xdev \
 		'(' -name '*.[ao]' -o -name '.*.c.dep' ')' \
 		-exec rm -f {} +
+	rm -f $(BUILDDIR)/include/version.h
 	$(MAKE) -C $(TESTS) clean
 
 install:: ${BINS} ${SCRIPTS}
@@ -63,6 +66,11 @@ tests::
 cscope:
 	cscope -bR
 
+$(BUILDDIR)/include/version.h: $(BUILDDIR)/include/version.h.tmp
+	$(Q)cmp -s $@ $@.tmp && rm -f $@.tmp || mv $@.tmp $@
+$(BUILDDIR)/include/version.h.tmp:
+	$(Q)echo '#define VERSION "$(VERSION)"' > $@
+
 #
 # Utils in top level
 #
diff --git a/common.mk b/common.mk
index d0e207d..63cbf04 100644
--- a/common.mk
+++ b/common.mk
@@ -75,7 +75,7 @@ $(BUILDDIR)/%.a:
 	$(Q)$(AR) cr $@ $^
 	$(Q)$(RANLIB) $@
 
-$(BUILDDIR)/%.o: %.c
+$(BUILDDIR)/%.o: %.c $(BUILDDIR)/include/version.h
 ifneq ($(BUILDDIR),$(CURDIR))
 	$(Q)mkdir -p $(dir $@)
 endif
diff --git a/flash_erase.c b/flash_erase.c
index e0d2d4c..220f85a 100644
--- a/flash_erase.c
+++ b/flash_erase.c
@@ -19,7 +19,6 @@
  */
 
 #define PROGRAM_NAME "flash_erase"
-#define VERSION "2.1.0"
 
 #include <inttypes.h>
 #include <stdio.h>
diff --git a/include/common.h b/include/common.h
index 7ea282c..65ec086 100644
--- a/include/common.h
+++ b/include/common.h
@@ -25,6 +25,7 @@
 #include <string.h>
 #include <fcntl.h>
 #include <errno.h>
+#include "version.h"
 
 #ifndef PROGRAM_NAME
 # error "You must define PROGRAM_NAME before including this header"
diff --git a/nanddump.c b/nanddump.c
index 0367d83..edbcb78 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -14,7 +14,6 @@
  */
 
 #define PROGRAM_NAME "nanddump"
-#define VERSION "1.31"
 
 #define _GNU_SOURCE
 #include <ctype.h>
diff --git a/nandwrite.c b/nandwrite.c
index 6e986c5..1700d61 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -20,7 +20,6 @@
  */
 
 #define PROGRAM_NAME "nandwrite"
-#define VERSION "$Revision: 1.32 $"
 
 #define _GNU_SOURCE
 #include <ctype.h>
-- 
1.7.5.3
