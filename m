Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LcTL5-0002oi-H4
	for linux-mtd@lists.infradead.org; Wed, 25 Feb 2009 23:38:58 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id F389964EF3
	for <linux-mtd@lists.infradead.org>;
	Wed, 25 Feb 2009 23:38:53 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] add generated binaries to gitignore
Date: Wed, 25 Feb 2009 18:38:53 -0500
Message-Id: <1235605133-2059-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 .gitignore                     |   30 ++++++++++++++++++++++++++++++
 mkfs.ubifs/.gitignore          |    1 +
 ubi-utils/.gitignore           |    9 +++++++++
 ubi-utils/new-utils/.gitignore |   10 ++++++++++
 4 files changed, 50 insertions(+), 0 deletions(-)
 create mode 100644 mkfs.ubifs/.gitignore
 create mode 100644 ubi-utils/.gitignore
 create mode 100644 ubi-utils/new-utils/.gitignore

diff --git a/.gitignore b/.gitignore
index 9bf8ccc..a991a3e 100644
--- a/.gitignore
+++ b/.gitignore
@@ -15,6 +15,35 @@
 *~
 
 #
+# Our programs
+#
+/doc_loadbios
+/docfdisk
+/flash_erase
+/flash_eraseall
+/flash_info
+/flash_lock
+/flash_otp_dump
+/flash_otp_info
+/flash_unlock
+/flashcp
+/ftl_check
+/ftl_format
+/jffs2dump
+/mkfs.jffs2
+/mtd_debug
+/nanddump
+/nandtest
+/nandwrite
+/nftl_format
+/nftldump
+/recv_image
+/rfddump
+/rfdformat
+/serve_image
+/sumtool
+
+#
 # Top-level generic files
 #
 
@@ -24,3 +53,4 @@
 
 # stgit generated dirs
 patches-*
+*.patch
diff --git a/mkfs.ubifs/.gitignore b/mkfs.ubifs/.gitignore
new file mode 100644
index 0000000..6b0e85c
--- /dev/null
+++ b/mkfs.ubifs/.gitignore
@@ -0,0 +1 @@
+/mkfs.ubifs
diff --git a/ubi-utils/.gitignore b/ubi-utils/.gitignore
new file mode 100644
index 0000000..83e8b71
--- /dev/null
+++ b/ubi-utils/.gitignore
@@ -0,0 +1,9 @@
+/bin2nand
+/mkbootenv
+/nand2bin
+/pddcustomize
+/pfi2bin
+/pfiflash
+/ubigen
+/ubimirror
+/unubi
diff --git a/ubi-utils/new-utils/.gitignore b/ubi-utils/new-utils/.gitignore
new file mode 100644
index 0000000..4155cd1
--- /dev/null
+++ b/ubi-utils/new-utils/.gitignore
@@ -0,0 +1,10 @@
+/ubiattach
+/ubicrc32
+/ubidetach
+/ubiformat
+/ubimkvol
+/ubinfo
+/ubinize
+/ubirename
+/ubirmvol
+/ubiupdatevol
-- 
1.6.1.3
