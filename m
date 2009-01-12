Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LMPKg-00089I-Lf
	for linux-mtd@lists.infradead.org; Mon, 12 Jan 2009 16:08:09 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 968BA64AC8
	for <linux-mtd@lists.infradead.org>;
	Mon, 12 Jan 2009 16:08:03 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] common.mk: tweak rules to workaround make-3.80 bugs
Date: Mon, 12 Jan 2009 11:08:03 -0500
Message-Id: <1231776483-21207-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I got some reports from people who use make-3.80 that mtd-utils wasn't
building correctly the first time.  Turns out that older versions of make
misbehave with pattern rules and full paths.  So I've tweaked the code a
little to work with make-3.80 and make-3.81 (the latest release).

Also, I added a small optimization to avoid running `mkdir` when building
in-tree.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 common.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/common.mk b/common.mk
index 5dd21ab..77d28bf 100644
--- a/common.mk
+++ b/common.mk
@@ -19,6 +19,7 @@ else
   BUILDDIR := $(PWD)/$(CROSS:-=)
 endif
 endif
+override BUILDDIR := $(patsubst %/,%,$(BUILDDIR))
 
 override TARGETS := $(addprefix $(BUILDDIR)/,$(TARGETS))
 
@@ -33,7 +34,7 @@ clean:: $(SUBDIRS_CLEAN)
 
 install:: $(TARGETS) $(SUBDIRS_INSTALL)
 
-$(BUILDDIR)/%: $(BUILDDIR)/%.o
+%: %.o
 	$(CC) $(CFLAGS) $(LDFLAGS) $(LDFLAGS_$(notdir $@)) -g -o $@ $^ $(LDLIBS) $(LDLIBS_$(notdir $@))
 
 $(BUILDDIR)/%.a:
@@ -41,7 +42,9 @@ $(BUILDDIR)/%.a:
 	$(RANLIB) $@
 
 $(BUILDDIR)/%.o: %.c
+ifneq ($(BUILDDIR),$(CURDIR))
 	mkdir -p $(dir $@)
+endif
 	$(CC) $(CPPFLAGS) $(CFLAGS) -c -o $@ $< -g -Wp,-MD,$(BUILDDIR)/.$(<F).dep
 
 subdirs_%:
-- 
1.6.1
