Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RKYFq-0004Od-Vd
	for linux-mtd@lists.infradead.org; Sun, 30 Oct 2011 16:29:03 +0000
From: Wolfram Sang <w.sang@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH V2 2/2] mtd: tests: annotate as DANGEROUS in Kconfig
Date: Sun, 30 Oct 2011 17:28:49 +0100
Message-Id: <1319992129-13588-1-git-send-email-w.sang@pengutronix.de>
In-Reply-To: <1319977792.2126.30.camel@koala>
References: <1319977792.2126.30.camel@koala>
Cc: Wolfram Sang <w.sang@pengutronix.de>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The tests may erase mtd devices, so annotate them as suggested per
coding style and add a paragraph to the help text as well.

Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
---

Thanks to Artem for letting me know of this coding style suggestion.

 drivers/mtd/Kconfig |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index 4be8373..cb1821b 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -26,13 +26,16 @@ config MTD_DEBUG_VERBOSE
 	  Determines the verbosity level of the MTD debugging messages.
 
 config MTD_TESTS
-	tristate "MTD tests support"
+	tristate "MTD tests support (DANGEROUS)"
 	depends on m
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
