Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S63vs-0004zO-TN
 for linux-mtd@lists.infradead.org; Fri, 09 Mar 2012 17:48:49 +0000
Received: by dakp5 with SMTP id p5so1868160dak.36
 for <linux-mtd@lists.infradead.org>; Fri, 09 Mar 2012 09:48:45 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH v2] Makefile: fix "make clean" for old GNU find
Date: Fri,  9 Mar 2012 09:49:09 -0800
Message-Id: <1331315349-8541-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

findutils v4.1.x does not have the `-exec CMD {} +' syntax. We can just as
easily use the `-exec CMD {} \;' syntax. However, it will launch a lot more
`rm' processes, so we only use it if the first form fails with an error.
This isn't a perfect solution (`find -exec +' can fail for other reasons)
but it works well enough.

This problem manifests itself in RHEL 4, findutils 4.1.20:

  $ make clean
  rm -f /XXX/mtd-utils/*.o /XXX/mtd-utils/ftl_format  ...
  find: missing argument to `-exec'
  make: *** [clean] Error 1

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Mike Frysinger <vapier.adi@gmail.com>
---
v2: try '+' syntax, then fall back to old format

 Makefile |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 17a1216..7506ed4 100644
--- a/Makefile
+++ b/Makefile
@@ -42,6 +42,8 @@ OBJDEPS = $(BUILDDIR)/include/version.h
 
 include common.mk
 
+CLEAN_FIND = find "$(BUILDDIR)/" -xdev '(' -name '*.[ao]' -o -name '.*.c.dep' ')'
+
 clean::
 ifneq ($(BUILDDIR)/.git,)
 ifneq ($(BUILDDIR),.)
@@ -50,10 +52,10 @@ ifneq ($(BUILDDIR),$(CURDIR))
 endif
 endif
 endif
+	# findutils v4.1.x (RHEL 4) do not have '+' syntax
 	@if test -d "$(BUILDDIR)/"; then \
-		find $(BUILDDIR)/ -xdev \
-			'(' -name '*.[ao]' -o -name '.*.c.dep' ')' \
-			-exec rm -f {} + ; \
+		$(CLEAN_FIND) -exec rm -f {} + 2> /dev/null || \
+		$(CLEAN_FIND) -exec rm -f {} \; ; \
 	fi
 	rm -f $(BUILDDIR)/include/version.h
 	$(MAKE) -C $(TESTS) clean
-- 
1.7.5.4.2.g519b1
