Received: from pegase1.c-s.fr ([93.17.236.30] helo=mailhub1.si.c-s.fr)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YW5ZC-0006ab-0d
 for linux-mtd@lists.infradead.org; Thu, 12 Mar 2015 16:02:36 +0000
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH 3/8] video: replace CONFIG_8xx by CONFIG_PPC_8xx
Message-Id: <20150312152349.943F91A241E@localhost.localdomain>
Date: Thu, 12 Mar 2015 16:23:49 +0100 (CET)
Cc: linux-fbdev@vger.kernel.org, linux-serial@vger.kernel.org,
 user-mode-linux-devel@lists.sourceforge.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 user-mode-linux-user@lists.sourceforge.net, linuxppc-dev@lists.ozlabs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Two config options exist to define powerpc MPC8xx:
* CONFIG_PPC_8xx
* CONFIG_8xx
In addition, CONFIG_PPC_8xx also defines CONFIG_CPM1 as
communication co-processor

arch/powerpc/platforms/Kconfig.cputype has contained the following
comment about CONFIG_8xx item for some years:
"# this is temp to handle compat with arch=ppc"

It looks like not many places still have that old CONFIG_8xx used,
so it is likely to be a good time to get rid of it completely ?

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

---
 drivers/video/console/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/console/Kconfig b/drivers/video/console/Kconfig
index ba97efc..6ee84c3 100644
--- a/drivers/video/console/Kconfig
+++ b/drivers/video/console/Kconfig
@@ -6,7 +6,7 @@ menu "Console display driver support"
 
 config VGA_CONSOLE
 	bool "VGA text console" if EXPERT || !X86
-	depends on !4xx && !8xx && !SPARC && !M68K && !PARISC && !FRV && \
+	depends on !4xx && !PPC_8xx && !SPARC && !M68K && !PARISC && !FRV && \
 		!SUPERH && !BLACKFIN && !AVR32 && !MN10300 && !CRIS && \
 		(!ARM || ARCH_FOOTBRIDGE || ARCH_INTEGRATOR || ARCH_NETWINDER) && \
 		!ARM64
-- 
2.1.0
