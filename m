Received: from bgl-iport-2.cisco.com ([72.163.197.26])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bwB8S-0004ig-Bj
 for linux-mtd@lists.infradead.org; Mon, 17 Oct 2016 16:51:37 +0000
From: David Singleton <davsingl@cisco.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Steve Shih <sshih@cisco.com>, xe-kernel@external.cisco.com,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: chips: cfi_cmdset_0001: Disable erase and write suspend
 for Intel flash.
Date: Mon, 17 Oct 2016 09:51:04 -0700
Message-Id: <20161017165108.29718-1-davsingl@cisco.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Steve Shih <sshih@cisco.com>

Some revisions of the P30, P33, and J3 Flash memory devices can hang
when an ERASE SUSPEND command is issued following an ERASE RESUME
without waiting for the minimum delay time to elapse. The result
is that when the ERASE appears to be complete (no bits are toggling),
the contents of the Flash memory block on which the ERASE was executing
could be inconsstent with the expected values (typically, the array
value is stuck to the 0xC0, 0xC4, 0x80, or 0x84 values). This cause
ERASE operation to fail.

Please refer to Micron Technical Note TN-12-06:
Adapting the Linux Kernel for P30, P33, and J3 Flash

Cc: xe-kernel@external.cisco.com
Signed-off-by: Steve Shih <sshih@cisco.com>
Signed-off-by: David Singleton <davsingl@cisco.com>
---
 drivers/mtd/chips/Kconfig           | 17 +++++++++++++++++
 drivers/mtd/chips/cfi_cmdset_0001.c |  6 ++++--
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/chips/Kconfig b/drivers/mtd/chips/Kconfig
index bbfa1f1..b25545c 100644
--- a/drivers/mtd/chips/Kconfig
+++ b/drivers/mtd/chips/Kconfig
@@ -184,6 +184,23 @@ config MTD_CFI_INTELEXT
 	  provides support for command set 0001, used on Intel StrataFlash
 	  and other parts.
 
+config MTD_CFI_INTELEXT_NO_SUSPEND
+	bool "Disable erase and write suspends for Intel/Sharp flash"
+	depends on MTD_CFI_INTELEXT
+	default n
+	help
+	  Some revisions of the P30, P33, and J3 Flash memory devices can hang
+	  when an ERASE SUSPEND command is issued following an ERASE RESUME
+	  without waiting for the minimum delay time to elapse. The result
+	  is that when the ERASE appears to be complete (no bits are toggling),
+	  the contents of the Flash memory block on which the ERASE was
+	  executing could be inconsstent with the expected values (typically,
+	  the array value is stuck to the 0xC0, 0xC4, 0x80, or 0x84 values).
+	  This cause ERASE operation to fail.
+
+	  Please refer to Micron Technical Note TN-12-06:
+		Adapting the Linux Kernel for P30, P33, and J3 Flash
+
 config MTD_CFI_AMDSTD
 	tristate "Support for CFI command set 0002 (AMD/Fujitsu/Spansion chips)"
 	depends on MTD_GEN_PROBE
diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 5e1b68c..23dde4e 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -35,8 +35,10 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/cfi.h>
 
-/* #define CMDSET0001_DISABLE_ERASE_SUSPEND_ON_WRITE */
-/* #define CMDSET0001_DISABLE_WRITE_SUSPEND */
+#ifdef CONFIG_MTD_CFI_INTELEXT_NO_SUSPEND
+#define CMDSET0001_DISABLE_ERASE_SUSPEND_ON_WRITE
+#define CMDSET0001_DISABLE_WRITE_SUSPEND
+#endif
 
 // debugging, turns off buffer write mode if set to 1
 #define FORCE_WORD_WRITE 0
-- 
2.9.3
