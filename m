Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LoVIG-0003Jt-T1
	for linux-mtd@lists.infradead.org; Tue, 31 Mar 2009 04:10:02 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 0671564788
	for <linux-mtd@lists.infradead.org>;
	Tue, 31 Mar 2009 04:09:40 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] ubi-utils: tweak vpath handling
Date: Tue, 31 Mar 2009 00:09:40 -0400
Message-Id: <1238472580-4762-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Building out of tree currently fails with ubi-utils because make gets
confused and can't figure out the vpathed .c files.  Using VPATH rather
than vpath seems to work around it.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 ubi-utils/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/ubi-utils/Makefile b/ubi-utils/Makefile
index 020fe09..dcff7e3 100644
--- a/ubi-utils/Makefile
+++ b/ubi-utils/Makefile
@@ -13,7 +13,7 @@ LIBS = libubi libmtd libubigen libiniparser libscan
 TARGETS = ubiupdatevol ubimkvol ubirmvol ubicrc32 ubinfo ubiattach \
           ubidetach ubinize ubiformat ubirename
 
-vpath %.c src
+VPATH = src
 
 include ../common.mk
 
-- 
1.6.2
