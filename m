Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZVMAZ-0001Rx-AF
 for linux-mtd@lists.infradead.org; Fri, 28 Aug 2015 16:06:23 +0000
Received: by pabzx8 with SMTP id zx8so67056244pab.1
 for <linux-mtd@lists.infradead.org>; Fri, 28 Aug 2015 09:06:02 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Mike Frysinger <vapier@gentoo.org>
Subject: [PATCH mtd-utils] don't include system headers in dependency files
Date: Fri, 28 Aug 2015 09:05:43 -0700
Message-Id: <1440777943-29602-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

System library headers are not strictly part of our build. If they are
changing beneath our feet, then we probably have bigger problems.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Suggested-by: Mike Frysinger <vapier@gentoo.org>
---
 common.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/common.mk b/common.mk
index 7c09ab0a46d0..6bfe8de85953 100644
--- a/common.mk
+++ b/common.mk
@@ -80,7 +80,7 @@ ifneq ($(BUILDDIR),$(CURDIR))
 	$(Q)mkdir -p $(dir $@)
 endif
 	$(call BECHO,CC)
-	$(Q)$(CC) $(CPPFLAGS) $(CFLAGS) -c -o $@ $< -g -MD -MF $(BUILDDIR)/.$(<F).dep
+	$(Q)$(CC) $(CPPFLAGS) $(CFLAGS) -c -o $@ $< -g -MMD -MF $(BUILDDIR)/.$(<F).dep
 
 .SUFFIXES:
 
-- 
2.5.0.457.gab17608
