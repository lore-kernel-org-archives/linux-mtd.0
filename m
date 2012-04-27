Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SNlWQ-0002Hu-Jt
 for linux-mtd@lists.infradead.org; Fri, 27 Apr 2012 13:47:44 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ralf Baechle <ralf@linux-mips.org>
Subject: [PATCH 2/2] MIPS: bcm63xx: kbuild: remove -Werror
Date: Fri, 27 Apr 2012 16:48:30 +0300
Message-Id: <1335534510-12573-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1335534510-12573-1-git-send-email-dedekind1@gmail.com>
References: <1335534510-12573-1-git-send-email-dedekind1@gmail.com>
Cc: MIPS Mailing List <linux-mips@linux-mips.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>

I cannot build bcm963xx with the standard Kbuild W=1 switch:

arch/mips/bcm63xx/boards/board_bcm963xx.c: At top level:
arch/mips/bcm63xx/boards/board_bcm963xx.c:647:5: error: no previous prototype for 'bcm63xx_get_fallback_sprom' [-Werror=missing-prototypes]
cc1: all warnings being treated as errors

This patch removes the gcc switch to make W=1 work. Mips is the only
architecture I know which does not build with W=1 and this upsets my aiaiai
scripts. And in general, you never know which warnings newer versions of gcc
will start emiting so having -Werror by default is not the best idea.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 arch/mips/bcm63xx/boards/Makefile |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/arch/mips/bcm63xx/boards/Makefile b/arch/mips/bcm63xx/boards/Makefile
index 9f64fb4..af07c1a 100644
--- a/arch/mips/bcm63xx/boards/Makefile
+++ b/arch/mips/bcm63xx/boards/Makefile
@@ -1,3 +1 @@
 obj-$(CONFIG_BOARD_BCM963XX)		+= board_bcm963xx.o
-
-ccflags-y := -Werror
-- 
1.7.9.1
