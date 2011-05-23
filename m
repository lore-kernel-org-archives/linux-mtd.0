Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QORMi-0002TQ-94
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:23:57 +0000
Received: by wyb28 with SMTP id 28so5098499wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:23:55 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 01/62] mtd: always build partitioning support
Date: Mon, 23 May 2011 10:22:42 +0100
Message-Id: <1306142623-24952-2-git-send-email-jamie@jamieiles.com>
In-Reply-To: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
References: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
Cc: Jamie Iles <jamie@jamieiles.com>, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There are very few situations where MTD partitioning is not required,
and the benefit in code size reduction by making this configurable does
not warrant the level of ifdeffery needed.

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 drivers/mtd/Kconfig |   12 ++----------
 1 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index b4567c3..8b61b0c 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -1,6 +1,7 @@
 menuconfig MTD
 	tristate "Memory Technology Device (MTD) support"
 	depends on HAS_IOMEM
+	select MTD_PARTITIONS
 	help
 	  Memory Technology Devices are flash, RAM and similar chips, often
 	  used for solid state file systems on embedded devices. This option
@@ -34,16 +35,7 @@ config MTD_TESTS
 	  various checks and verifications when loaded.
 
 config MTD_PARTITIONS
-	bool "MTD partitioning support"
-	help
-	  If you have a device which needs to divide its flash chip(s) up
-	  into multiple 'partitions', each of which appears to the user as
-	  a separate MTD device, you require this option to be enabled. If
-	  unsure, say 'Y'.
-
-	  Note, however, that you don't need this option for the DiskOnChip
-	  devices. Partitioning on NFTL 'devices' is a different - that's the
-	  'normal' form of partitioning used on a block device.
+	bool
 
 if MTD_PARTITIONS
 
-- 
1.7.4.4
