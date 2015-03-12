Received: from pegase1.c-s.fr ([93.17.236.30] helo=mailhub1.si.c-s.fr)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YW5ZC-0006ak-0V
 for linux-mtd@lists.infradead.org; Thu, 12 Mar 2015 16:02:36 +0000
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>
Subject: [PATCH 2/8] um: replace CONFIG_8xx by CONFIG_PPC_8xx
Message-Id: <20150312152344.83BA31A241D@localhost.localdomain>
Date: Thu, 12 Mar 2015 16:23:44 +0100 (CET)
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
 arch/um/sys-ppc/misc.S | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/um/sys-ppc/misc.S b/arch/um/sys-ppc/misc.S
index 1364b7d..163e0b2 100644
--- a/arch/um/sys-ppc/misc.S
+++ b/arch/um/sys-ppc/misc.S
@@ -18,7 +18,7 @@
 #include <asm/processor.h>
 #include "ppc_asm.h"
 
-#if defined(CONFIG_4xx) || defined(CONFIG_8xx)
+#if defined(CONFIG_4xx) || defined(CONFIG_PPC_8xx)
 #define CACHE_LINE_SIZE		16
 #define LG_CACHE_LINE_SIZE	4
 #define MAX_COPY_PREFETCH	1
@@ -26,7 +26,7 @@
 #define CACHE_LINE_SIZE		32
 #define LG_CACHE_LINE_SIZE	5
 #define MAX_COPY_PREFETCH	4
-#endif /* CONFIG_4xx || CONFIG_8xx */
+#endif /* CONFIG_4xx || CONFIG_PPC_8xx */
 
 	.text
 
@@ -38,7 +38,7 @@
 _GLOBAL(clear_page)
 	li	r0,4096/CACHE_LINE_SIZE
 	mtctr	r0
-#ifdef CONFIG_8xx
+#ifdef CONFIG_PPC_8xx
 	li	r4, 0
 1:	stw	r4, 0(r3)
 	stw	r4, 4(r3)
@@ -72,7 +72,7 @@ _GLOBAL(copy_page)
 	addi	r4,r4,-4
 	li	r5,4
 
-#ifndef CONFIG_8xx
+#ifndef CONFIG_PPC_8xx
 #if MAX_COPY_PREFETCH > 1
 	li	r0,MAX_COPY_PREFETCH
 	li	r11,4
@@ -84,12 +84,12 @@ _GLOBAL(copy_page)
 	dcbt	r5,r4
 	li	r11,CACHE_LINE_SIZE+4
 #endif /* MAX_COPY_PREFETCH */
-#endif /* CONFIG_8xx */
+#endif /* CONFIG_PPC_8xx */
 
 	li	r0,4096/CACHE_LINE_SIZE
 	mtctr	r0
 1:
-#ifndef CONFIG_8xx
+#ifndef CONFIG_PPC_8xx
 	dcbt	r11,r4
 	dcbz	r5,r3
 #endif
-- 
2.1.0
