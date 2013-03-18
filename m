Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UHTsK-0002jN-6E
 for linux-mtd@lists.infradead.org; Mon, 18 Mar 2013 06:48:57 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 7/7] arch: cris: amend Kconfig after mtdchar merge
Date: Mon, 18 Mar 2013 08:50:22 +0200
Message-Id: <1363589422-1378-8-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1363589422-1378-1-git-send-email-dedekind1@gmail.com>
References: <1363260463-10609-1-git-send-email-dedekind1@gmail.com>
 <1363589422-1378-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

The mtdchar module was merged with the mtdcore module, which means that the
MTD_CHAR Kconfig symbol does not exist any more.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 arch/cris/Kconfig                  |    1 -
 arch/cris/arch-v32/drivers/Kconfig |    1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/cris/Kconfig b/arch/cris/Kconfig
index bb0ac66..2d15a46 100644
--- a/arch/cris/Kconfig
+++ b/arch/cris/Kconfig
@@ -264,7 +264,6 @@ config ETRAX_AXISFLASHMAP
 	select MTD_CFI
 	select MTD_CFI_AMDSTD
 	select MTD_JEDECPROBE if ETRAX_ARCH_V32
-	select MTD_CHAR
 	select MTD_BLOCK
 	select MTD_COMPLEX_MAPPINGS
 	help
diff --git a/arch/cris/arch-v32/drivers/Kconfig b/arch/cris/arch-v32/drivers/Kconfig
index af4a486..c55971a 100644
--- a/arch/cris/arch-v32/drivers/Kconfig
+++ b/arch/cris/arch-v32/drivers/Kconfig
@@ -404,7 +404,6 @@ config ETRAX_AXISFLASHMAP
 	select MTD_CFI
 	select MTD_CFI_AMDSTD
 	select MTD_JEDECPROBE
-	select MTD_CHAR
 	select MTD_BLOCK
 	select MTD_COMPLEX_MAPPINGS
 	help
-- 
1.7.10.4
