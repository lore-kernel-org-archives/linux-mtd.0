Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KVrvn-0003YA-Ui
	for linux-mtd@lists.infradead.org; Wed, 20 Aug 2008 17:57:16 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id C8B3166658
	for <linux-mtd@lists.infradead.org>;
	Wed, 20 Aug 2008 17:57:11 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mkfs.ubifs: set CFLAGS/LDLIBS properly
Date: Wed, 20 Aug 2008 13:57:09 -0400
Message-Id: <1219255029-22308-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

CFLAGS should only be set as a default instead of overriding the user's
choices.  LDLIBS is for adding libraries, not LDFLAGS.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 mkfs.ubifs/Makefile |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/mkfs.ubifs/Makefile b/mkfs.ubifs/Makefile
index 9487c14..467ae1a 100644
--- a/mkfs.ubifs/Makefile
+++ b/mkfs.ubifs/Makefile
@@ -1,8 +1,9 @@
 DESTDIR := /usr/local
 SBINDIR=/usr/sbin
 ALL_SOURCES=*.[ch] hashtable/*.[ch]
-CFLAGS := $(CFLAGS) -Wall -O0 -ggdb
-LDFLAGS := $(LDFLAGS) -lz -llzo2 -lm -luuid
+CFLAGS ?= -O0 -ggdb
+CFLAGS += -Wall
+LDLIBS += -lz -llzo2 -lm -luuid
 TARGETS = mkfs.ubifs
 
 all: $(TARGETS)
-- 
1.5.6.5
