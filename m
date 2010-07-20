Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1ObKPM-0004cF-1I
	for linux-mtd@lists.infradead.org; Tue, 20 Jul 2010 21:31:24 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id A0FA61B40FE
	for <linux-mtd@lists.infradead.org>;
	Tue, 20 Jul 2010 21:31:18 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2] fix parallel build between ubi-utils and mkfs.ubifs
Date: Tue, 20 Jul 2010 17:27:50 -0400
Message-Id: <1279661270-15554-1-git-send-email-vapier@gentoo.org>
In-Reply-To: <201007201524.39147.florian@openwrt.org>
References: <201007201524.39147.florian@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
fix target order pointed out by Florian Fainelli

 Makefile |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index b558705..d315f39 100644
--- a/Makefile
+++ b/Makefile
@@ -25,6 +25,9 @@ LDDEPS = $(BUILDDIR)/lib/libmtd.a
 
 include common.mk
 
+# mkfs.ubifs needs -lubi which is in ubi-utils/
+subdirs_mkfs.ubifs_all: subdirs_ubi-utils_all
+
 clean::
 	-rm -f $(SYMLINKS)
 ifneq ($(BUILDDIR)/.git,)
-- 
1.7.1.1
