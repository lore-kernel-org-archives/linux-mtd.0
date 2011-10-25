Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RId1V-0004Cy-8e
	for linux-mtd@lists.infradead.org; Tue, 25 Oct 2011 09:10:20 +0000
From: Wolfram Sang <w.sang@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] mtd: mark tests EXPERIMENTAL
Date: Tue, 25 Oct 2011 11:09:51 +0200
Message-Id: <1319533791-32605-2-git-send-email-w.sang@pengutronix.de>
In-Reply-To: <1319533791-32605-1-git-send-email-w.sang@pengutronix.de>
References: <1319533791-32605-1-git-send-email-w.sang@pengutronix.de>
Cc: Roland Kletzing <devzero@web.de>, Wolfram Sang <w.sang@pengutronix.de>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The tests may erase mtd devices, so mark them EXPERIMENTAL and emphasize
this fact in the Kconfig entry, so users will think twice before running
them.

Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
---
 drivers/mtd/Kconfig |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index 4be8373..81d9b92 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -27,12 +27,15 @@ config MTD_DEBUG_VERBOSE
 
 config MTD_TESTS
 	tristate "MTD tests support"
-	depends on m
+	depends on m && EXPERIMENTAL
 	help
 	  This option includes various MTD tests into compilation. The tests
 	  should normally be compiled as kernel modules. The modules perform
 	  various checks and verifications when loaded.
 
+	  WARNING: Some of the tests will ERASE THE CONTENT of mtd devices!
+	  Do not use these tests unless you are sure you really need to.
+
 config MTD_REDBOOT_PARTS
 	tristate "RedBoot partition table parsing"
 	---help---
-- 
1.7.6.3
