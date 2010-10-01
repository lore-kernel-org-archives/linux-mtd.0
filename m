Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P1YIR-0004SB-8O
	for linux-mtd@lists.infradead.org; Fri, 01 Oct 2010 05:36:39 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 7C1F41B403B
	for <linux-mtd@lists.infradead.org>;
	Fri,  1 Oct 2010 05:36:31 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd-utils: enable garbage collection of unused function/data
	sections
Date: Fri,  1 Oct 2010 01:37:14 -0400
Message-Id: <1285911434-9186-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On my default build, this cumulatively shaves off ~100KiB of unused
code and data from the mtd-utils programs.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 common.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/common.mk b/common.mk
index 0444ad9..a55c548 100644
--- a/common.mk
+++ b/common.mk
@@ -3,6 +3,7 @@ AR := $(CROSS)ar
 RANLIB := $(CROSS)ranlib
 
 # Stolen from Linux build system
+comma = ,
 try-run = $(shell set -e; ($(1)) >/dev/null 2>&1 && echo "$(2)" || echo "$(3)")
 cc-option = $(call try-run, $(CC) $(1) -c -xc /dev/null -o /dev/null,$(1),$(2))
 
@@ -12,6 +13,8 @@ WFLAGS := -Wall \
 	$(call cc-option,-Wwrite-strings) \
 	$(call cc-option,-Wno-sign-compare)
 CFLAGS += $(WFLAGS)
+SECTION_CFLAGS := $(call cc-option,-ffunction-sections -fdata-sections -Wl$(comma)--gc-sections)
+CFLAGS += $(SECTION_CFLAGS)
 
 ifneq ($(WITHOUT_LARGEFILE), 1)
   CPPFLAGS += -D_FILE_OFFSET_BITS=64
-- 
1.7.3.1
