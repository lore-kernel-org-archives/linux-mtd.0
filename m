Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UHTsG-0002lN-1n
 for linux-mtd@lists.infradead.org; Mon, 18 Mar 2013 06:48:55 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 6/7] arm: mach-pxa: amend Kconfig after mtdchar merge
Date: Mon, 18 Mar 2013 08:50:21 +0200
Message-Id: <1363589422-1378-7-git-send-email-dedekind1@gmail.com>
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
 arch/arm/mach-pxa/Kconfig |    1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-pxa/Kconfig b/arch/arm/mach-pxa/Kconfig
index 86eec41..0e74ba0 100644
--- a/arch/arm/mach-pxa/Kconfig
+++ b/arch/arm/mach-pxa/Kconfig
@@ -160,7 +160,6 @@ config MACH_XCEP
 	select MTD
 	select MTD_CFI
 	select MTD_CFI_INTELEXT
-	select MTD_CHAR
 	select MTD_PHYSMAP
 	select PXA25x
 	select SMC91X
-- 
1.7.10.4
