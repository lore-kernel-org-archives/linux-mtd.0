Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OudX0-0005IF-5Z
	for linux-mtd@lists.infradead.org; Sun, 12 Sep 2010 03:47:06 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id E64EA1B4084
	for <linux-mtd@lists.infradead.org>;
	Sun, 12 Sep 2010 03:46:59 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] old ubi-utils: drop -Werror
Date: Sat, 11 Sep 2010 23:48:13 -0400
Message-Id: <1284263293-31064-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Considering this is marked as "old" which is synonymous with "dead",
having the dir cause build failures because of warnings makes no
sense.  So drop the -Werror usage.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 ubi-utils/old-utils/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/ubi-utils/old-utils/Makefile b/ubi-utils/old-utils/Makefile
index acdb31a..6df7c06 100644
--- a/ubi-utils/old-utils/Makefile
+++ b/ubi-utils/old-utils/Makefile
@@ -4,7 +4,7 @@
 
 KERNELHDR := ../../include
 
-CFLAGS ?= -O2 -g -Werror
+CFLAGS ?= -O2 -g
 CPPFLAGS := -I./inc -I./src -I$(KERNELHDR) \
 	-std=gnu99 -DPACKAGE_VERSION=\"1.0\" $(CPPFLAGS)
 
-- 
1.7.2
