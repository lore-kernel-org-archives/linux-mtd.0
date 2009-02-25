Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LcTL2-0002oQ-HP
	for linux-mtd@lists.infradead.org; Wed, 25 Feb 2009 23:38:55 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 46BEC64F8B
	for <linux-mtd@lists.infradead.org>;
	Wed, 25 Feb 2009 23:38:48 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] make sure compiler supports warning flags
Date: Wed, 25 Feb 2009 18:38:47 -0500
Message-Id: <1235605127-2024-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some compilers (like gcc-3.3) don't support all the newer -W flags that we
are using.  So import the compiler check found in the kernel and test each
flag we add.  The := is important so we only do the compiler tests once
per `make` rather than every time we compile a file.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 common.mk |   12 +++++++++++-
 1 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/common.mk b/common.mk
index 0e8c62b..3ff5cad 100644
--- a/common.mk
+++ b/common.mk
@@ -1,8 +1,18 @@
 CC := $(CROSS)gcc
 AR := $(CROSS)ar
 RANLIB := $(CROSS)ranlib
+
+# Stolen from Linux build system
+try-run = $(shell set -e; ($(1)) >/dev/null 2>&1 && echo "$(2)" || echo "$(3)"; echo CHECK $(2) >/dev/stderr)
+cc-option = $(call try-run, $(CC) $(1) -c -xc /dev/null -o /dev/null,$(1),$(2))
+
 CFLAGS ?= -O2 -g
-CFLAGS += -Wall -Wextra -Wwrite-strings -Wno-sign-compare -D_FILE_OFFSET_BITS=64
+WFLAGS := -Wall \
+	$(call cc-option,-Wextra) \
+	$(call cc-option,-Wwrite-strings) \
+	$(call cc-option,-Wno-sign-compare)
+CFLAGS += $(WFLAGS)
+CPPFLAGS += -D_FILE_OFFSET_BITS=64
 
 DESTDIR ?= /usr/local
 PREFIX=/usr
-- 
1.6.1.3
