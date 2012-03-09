Received: from mga14.intel.com ([143.182.124.37])
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S5y6x-00011R-Vq
 for linux-mtd@lists.infradead.org; Fri, 09 Mar 2012 11:35:53 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ralf Baechle <ralf@linux-mips.org>
Subject: [PATCH] MIPS: Kbuild: remove -Werror
Date: Fri,  9 Mar 2012 13:35:47 +0200
Message-Id: <1331292947-14913-1-git-send-email-dedekind1@gmail.com>
Cc: linux-mips@linux-mips.org, MTD Maling List <linux-mtd@lists.infradead.org>,
 John Crispin <blogic@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

MIPS does not build with the standard W=1 Kbuild switch with - tested with
gcc-4.6 by me and gcc-4.5 by John Crispin. The reason is that MIPS adds
-Werror build option.

This patch removes the option to make W=1 work. I do compile-tests for various
architecture before accepting MTD patches and I have scripts which build before
applying the patch, then after, and then compare 2 build logs and report about
new warnings. I use W=1 to see more warnings in the logs diff. And from my
perspective all platforms should build with W=1.

The other way would be to fix all warnings, but there are false positives, and
it is too difficult to maintain the code warning-free, so it is easier to just
remove -Werror.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 arch/mips/Kbuild |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/arch/mips/Kbuild b/arch/mips/Kbuild
index 7dd65cf..0d37730 100644
--- a/arch/mips/Kbuild
+++ b/arch/mips/Kbuild
@@ -1,8 +1,3 @@
-# Fail on warnings - also for files referenced in subdirs
-# -Werror can be disabled for specific files using:
-# CFLAGS_<file.o> := -Wno-error
-subdir-ccflags-y := -Werror
-
 # platform specific definitions
 include arch/mips/Kbuild.platforms
 obj-y := $(platform-y)
-- 
1.7.9.1
