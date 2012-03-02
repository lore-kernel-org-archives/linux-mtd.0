Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S3ane-0008OM-Gq
 for linux-mtd@lists.infradead.org; Fri, 02 Mar 2012 22:18:07 +0000
Received: by dakp5 with SMTP id p5so2956060dak.36
 for <linux-mtd@lists.infradead.org>; Fri, 02 Mar 2012 14:18:04 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH (mtd-utils)] Makefile: fix "make clean" for old GNU find
Date: Fri,  2 Mar 2012 14:17:53 -0800
Message-Id: <1330726673-9860-1-git-send-email-computersforpeace@gmail.com>
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
`rm' processes...

RHEL 4 still uses findutils 4.1.20 and gets errors like this:

  $ make clean
  rm -f /XXX/mtd-utils/*.o /XXX/mtd-utils/ftl_format  ...
  find: missing argument to `-exec'
  make: *** [clean] Error 1

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 17a1216..0cbbecc 100644
--- a/Makefile
+++ b/Makefile
@@ -53,7 +53,7 @@ endif
 	@if test -d "$(BUILDDIR)/"; then \
 		find $(BUILDDIR)/ -xdev \
 			'(' -name '*.[ao]' -o -name '.*.c.dep' ')' \
-			-exec rm -f {} + ; \
+			-exec rm -f {} \; ; \
 	fi
 	rm -f $(BUILDDIR)/include/version.h
 	$(MAKE) -C $(TESTS) clean
