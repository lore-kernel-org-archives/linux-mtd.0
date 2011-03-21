Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q1gT9-0006B5-11
	for linux-mtd@lists.infradead.org; Mon, 21 Mar 2011 14:52:32 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p2LEqPLw024739
	for <linux-mtd@lists.infradead.org>; Mon, 21 Mar 2011 16:52:26 +0200
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/2] UBIFS: kill CONFIG_UBIFS_FS_DEBUG_CHKS
Date: Mon, 21 Mar 2011 16:55:07 +0200
Message-Id: <1300719307-31169-1-git-send-email-dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Simplify UBIFS configuration menu and kill the option to enable self-check
compile-time. We do not really need this because we can do this run-time
using the module parameters or the corresponding sysfs interfaces. And
there is a value in simplifying the kernel configuration menu which becomes
increasingly large.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/Kconfig |    9 ---------
 1 files changed, 0 insertions(+), 9 deletions(-)

diff --git a/fs/ubifs/Kconfig b/fs/ubifs/Kconfig
index 1d1859d..d744090 100644
--- a/fs/ubifs/Kconfig
+++ b/fs/ubifs/Kconfig
@@ -58,12 +58,3 @@ config UBIFS_FS_DEBUG
 	  down UBIFS. You can then further enable / disable individual  debugging
 	  features using UBIFS module parameters and the corresponding sysfs
 	  interfaces.
-
-config UBIFS_FS_DEBUG_CHKS
-	bool "Enable extra checks"
-	depends on UBIFS_FS_DEBUG
-	help
-	  If extra checks are enabled UBIFS will check the consistency of its
-	  internal data structures during operation. However, UBIFS performance
-	  is dramatically slower when this option is selected especially if the
-	  file system is large.
-- 
1.7.2.3
