Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SV7Xz-0001Ov-Vj
 for linux-mtd@lists.infradead.org; Thu, 17 May 2012 20:43:44 +0000
Received: by lbbgg6 with SMTP id gg6so2040195lbb.36
 for <linux-mtd@lists.infradead.org>; Thu, 17 May 2012 13:43:40 -0700 (PDT)
From: Frank Svendsboe <frank.svendsboe@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: Fix typo in Kconfig
Date: Thu, 17 May 2012 22:43:09 +0200
Message-Id: <1337287389-28386-1-git-send-email-frank.svendsboe@gmail.com>
Cc: dbaryshkov@gmail.com, randy.dunlap@oracle.com,
 linuxppc-dev@lists.ozlabs.org, Frank Svendsboe <frank.svendsboe@gmail.com>,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

MTD_OF_PARTS and the default setting is not working due to using 'Y'
instead of 'y', introduced in commit
d6137badeff1ef64b4e0092ec249ebdeaeb3ff37. This made our board, and
possibly other boards using DTS defined partitions and not having
CONFIG_MTD_OF_PARTS=y defined in the defconfig, fail to mount root
after v3.1.

Signed-off-by: Frank Svendsboe <frank.svendsboe@gmail.com>
---
 drivers/mtd/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index 5760c1a..27143e0 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -128,7 +128,7 @@ config MTD_AFS_PARTS
 
 config MTD_OF_PARTS
 	tristate "OpenFirmware partitioning information support"
-	default Y
+	default y
 	depends on OF
 	help
 	  This provides a partition parsing function which derives
-- 
1.7.5.4
