Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Ob3Dz-0002oe-63
	for linux-mtd@lists.infradead.org; Tue, 20 Jul 2010 03:10:31 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id D5316677DD
	for <linux-mtd@lists.infradead.org>;
	Tue, 20 Jul 2010 03:10:07 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] fix parallel build between ubi-utils and mkfs.ubifs
Date: Mon, 19 Jul 2010 23:06:41 -0400
Message-Id: <1279595201-16520-1-git-send-email-vapier@gentoo.org>
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
 Makefile |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index b558705..8457654 100644
--- a/Makefile
+++ b/Makefile
@@ -9,6 +9,9 @@ endif
 
 SUBDIRS = lib ubi-utils mkfs.ubifs
 
+# mkfs.ubifs needs -lubi which is in ubi-utils/
+subdirs_mkfs.ubifs_all: subdirs_ubi-utils_all
+
 TARGETS = ftl_format flash_erase flash_eraseall nanddump doc_loadbios \
 	ftl_check mkfs.jffs2 flash_lock flash_unlock flash_info \
 	flash_otp_info flash_otp_dump mtd_debug flashcp nandwrite nandtest \
-- 
1.7.1.1
