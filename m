Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SD2m9-0001r1-GV
 for linux-mtd@lists.infradead.org; Wed, 28 Mar 2012 23:59:38 +0000
Received: by pbcun4 with SMTP id un4so2760717pbc.36
 for <linux-mtd@lists.infradead.org>; Wed, 28 Mar 2012 16:59:34 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH (mtd-utils)] Makefile: fixup previous 'make clean' fix
Date: Wed, 28 Mar 2012 16:59:06 -0700
Message-Id: <1332979146-8866-1-git-send-email-computersforpeace@gmail.com>
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

Apparently, Makefile comments need to be made without indentation. Otherwise,
they are printed out as shell commands. This fix prevents seeing this in your
shell during 'make clean':

  $ make clean
  ...
  # findutils v4.1.x (RHEL 4) do not have '+' syntax
  ...

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---

Artem, can you please just merge this into my last Makefile fix?

 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 7506ed4..40cb676 100644
--- a/Makefile
+++ b/Makefile
@@ -52,7 +52,7 @@ ifneq ($(BUILDDIR),$(CURDIR))
 endif
 endif
 endif
-	# findutils v4.1.x (RHEL 4) do not have '+' syntax
+# findutils v4.1.x (RHEL 4) do not have '+' syntax
 	@if test -d "$(BUILDDIR)/"; then \
 		$(CLEAN_FIND) -exec rm -f {} + 2> /dev/null || \
 		$(CLEAN_FIND) -exec rm -f {} \; ; \
