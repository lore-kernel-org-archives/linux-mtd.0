Received: from www.wytron.com.tw ([211.75.82.101])
	by casper.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PfOwB-0006VT-RQ
	for linux-mtd@lists.infradead.org; Wed, 19 Jan 2011 03:42:24 +0000
From: Thomas Chou <thomas@wytron.com.tw>
To: Artem Bityutskiy <dedekind1@gmail.com>,
	Grant Likely <grant.likely@secretlab.ca>
Subject: [PATCH] mtd/of: allow MTD_OF_PARTS and MTD_PHYSMAP_OF config to others
Date: Wed, 19 Jan 2011 11:43:59 +0800
Message-Id: <1295408639-14742-1-git-send-email-thomas@wytron.com.tw>
Cc: devicetree-discuss@lists.ozlabs.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, Thomas Chou <thomas@wytron.com.tw>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As devicetree support is added to more arch, these config should
be allowed to other arch.

Signed-off-by: Thomas Chou <thomas@wytron.com.tw>
---
 drivers/mtd/Kconfig      |    2 +-
 drivers/mtd/maps/Kconfig |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index 1e2cbf5..b1f7689 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -159,7 +159,7 @@ config MTD_AFS_PARTS
 
 config MTD_OF_PARTS
 	tristate "Flash partition map based on OF description"
-	depends on (MICROBLAZE || PPC_OF) && MTD_PARTITIONS
+	depends on OF && MTD_PARTITIONS
 	help
 	  This provides a partition parsing function which derives
 	  the partition map from the children of the flash node,
diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index a0dd7bb..5d37d31 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -72,7 +72,7 @@ config MTD_PHYSMAP_BANKWIDTH
 
 config MTD_PHYSMAP_OF
 	tristate "Flash device in physical memory map based on OF description"
-	depends on (MICROBLAZE || PPC_OF) && (MTD_CFI || MTD_JEDECPROBE || MTD_ROM)
+	depends on OF && (MTD_CFI || MTD_JEDECPROBE || MTD_ROM)
 	help
 	  This provides a 'mapping' driver which allows the NOR Flash and
 	  ROM driver code to communicate with chips which are mapped
-- 
1.7.3.4
