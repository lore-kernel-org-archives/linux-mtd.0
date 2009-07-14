Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MQi3C-0001Gq-Cp
	for linux-mtd@lists.infradead.org; Tue, 14 Jul 2009 13:28:25 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd/maps: uclinux: depend on MTD_RAM being built into the
	kernel
Date: Tue, 14 Jul 2009 09:28:02 -0400
Message-Id: <1247578082-6474-1-git-send-email-vapier@gentoo.org>
Cc: uclinux-dev@uclinux.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If MTD_RAM is built as a module, the uClinux map does not work since it
can only be built in to the kernel.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 drivers/mtd/maps/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index 0b98654..b98c7f8 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -493,7 +493,7 @@ config MTD_BFIN_ASYNC
 
 config MTD_UCLINUX
 	bool "Generic uClinux RAM/ROM filesystem support"
-	depends on MTD_PARTITIONS && MTD_RAM && !MMU
+	depends on MTD_PARTITIONS && MTD_RAM=y && !MMU
 	help
 	  Map driver to support image based filesystems for uClinux.
 
-- 
1.6.3.3
