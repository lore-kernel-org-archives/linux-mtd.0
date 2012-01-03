Received: from mail-gy0-f177.google.com ([209.85.160.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Ri9D6-0000hy-Ep
 for linux-mtd@lists.infradead.org; Tue, 03 Jan 2012 18:35:44 +0000
Received: by ghrr15 with SMTP id r15so7400641ghr.36
 for <linux-mtd@lists.infradead.org>; Tue, 03 Jan 2012 10:35:37 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] drivers: mtd: Fix dependency for MTD_DOC200x
Date: Tue,  3 Jan 2012 16:35:25 -0200
Message-Id: <1325615725-31089-1-git-send-email-festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 artem.bityutskiy@linux.intel.com, Fabio Estevam <festevam@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix the following build warning:

warning: (MTD_DOC2000 && MTD_DOC2001 && MTD_DOC2001PLUS) selects MTD_NAND_IDS 
which has unmet direct dependencies (MTD && MTD_NAND)

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
 drivers/mtd/devices/Kconfig |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
index 952e956..3560fca 100644
--- a/drivers/mtd/devices/Kconfig
+++ b/drivers/mtd/devices/Kconfig
@@ -191,6 +191,7 @@ comment "Disk-On-Chip Device Drivers"
 
 config MTD_DOC2000
 	tristate "M-Systems Disk-On-Chip 2000 and Millennium (DEPRECATED)"
+	depends on MTD_NAND
 	select MTD_DOCPROBE
 	select MTD_NAND_IDS
 	---help---
@@ -213,6 +214,7 @@ config MTD_DOC2000
 
 config MTD_DOC2001
 	tristate "M-Systems Disk-On-Chip Millennium-only alternative driver (DEPRECATED)"
+	depends on MTD_NAND
 	select MTD_DOCPROBE
 	select MTD_NAND_IDS
 	---help---
@@ -234,6 +236,7 @@ config MTD_DOC2001
 
 config MTD_DOC2001PLUS
 	tristate "M-Systems Disk-On-Chip Millennium Plus"
+	depends on MTD_NAND
 	select MTD_DOCPROBE
 	select MTD_NAND_IDS
 	---help---
-- 
1.7.1
