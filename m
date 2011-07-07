Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QevRH-0004WS-4F
	for linux-mtd@lists.infradead.org; Thu, 07 Jul 2011 20:44:48 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 1/3] Makefile: fix "version.h" build for cross-compiling
Date: Thu, 7 Jul 2011 13:44:25 -0700
Message-ID: <1310071467-9017-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When using "make CROSS=mipsel-linux-", I get the following errors:

/bin/sh: /home/norris/git/mtd-utils/mipsel-linux/include/version.h.tmp: No such file or directory
make: *** [/home/norris/git/mtd-utils/mipsel-linux/include/version.h.tmp] Error 1

So instead of "building" our version.h within $(BUILDIR), we should
just build it in the main source directory, as it isn't architecture-
specific or anything. Hopefully that doesn't "break the rules" of our
cross-compilation setup...

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 Makefile |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index afbe201..7c20ea5 100644
--- a/Makefile
+++ b/Makefile
@@ -38,7 +38,7 @@ TARGETS = $(BINS)
 TARGETS += lib/libmtd.a
 TARGETS += ubi-utils/libubi.a
 
-OBJDEPS = $(BUILDDIR)/include/version.h
+OBJDEPS = include/version.h
 
 include common.mk
 
@@ -53,7 +53,7 @@ endif
 	find $(BUILDDIR)/ -xdev \
 		'(' -name '*.[ao]' -o -name '.*.c.dep' ')' \
 		-exec rm -f {} +
-	rm -f $(BUILDDIR)/include/version.h
+	rm -f include/version.h
 	$(MAKE) -C $(TESTS) clean
 
 install:: ${BINS} ${SCRIPTS}
@@ -68,9 +68,9 @@ tests::
 cscope:
 	cscope -bR
 
-$(BUILDDIR)/include/version.h: $(BUILDDIR)/include/version.h.tmp
+include/version.h: include/version.h.tmp
 	$(Q)cmp -s $@ $@.tmp && rm -f $@.tmp || mv $@.tmp $@
-$(BUILDDIR)/include/version.h.tmp:
+include/version.h.tmp:
 	$(Q)echo '#define VERSION "$(VERSION)"' > $@
 
 #
-- 
1.7.0.4
