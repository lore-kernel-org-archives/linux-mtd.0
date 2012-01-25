From: "Manjunathappa, Prakash" <prakash.pm@ti.com>
To: <linux-arm-kernel@lists.infradead.org>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/3] arm:davinci: prepare to move aemif driver to
 drivers/mfd
Date: Wed, 25 Jan 2012 15:55:54 +0530
Message-ID: <1327487156-10238-1-git-send-email-prakash.pm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: davinci-linux-open-source@linux.davincidsp.com,
 Russell King <linux@arm.linux.org.uk>, Samuel Ortiz <sameo@linux.intel.com>,
 Sekhar Nori <nsekhar@ti.com>, "Manjunathappa, Prakash" <prakash.pm@ti.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Patch moves emif header file appropriately as a part preparation to move emif
driver from arch/arm/mach-davinci/ to drivers/mfd folder.
There by it isolates modifications in emif interface depicting as platform code
change.

Patch series are based on the discussion and concerns expressed in
davinci-linux-open-source community. Here is the link for the same:
http://davinci-linux-open-source.1494791.n2.nabble.com/PATCH-arm-davinci-configure-davinci-aemif-chipselects-through-OF-tt7059739.html#none

Signed-off-by: Manjunathappa, Prakash <prakash.pm@ti.com>
---
Since v1:
Patch is generated using -M option.

 arch/arm/mach-davinci/aemif.c                      |    2 +-
 arch/arm/mach-davinci/board-da830-evm.c            |    2 +-
 arch/arm/mach-davinci/board-da850-evm.c            |    2 +-
 drivers/mtd/nand/davinci_nand.c                    |    2 +-
 .../aemif.h => include/linux/mfd/davinci_aemif.h   |    0
 5 files changed, 4 insertions(+), 4 deletions(-)
 rename arch/arm/mach-davinci/include/mach/aemif.h => include/linux/mfd/davinci_aemif.h (100%)

diff --git a/arch/arm/mach-davinci/aemif.c b/arch/arm/mach-davinci/aemif.c
index 1ce70a9..b67c115 100644
--- a/arch/arm/mach-davinci/aemif.c
+++ b/arch/arm/mach-davinci/aemif.c
@@ -15,7 +15,7 @@
 #include <linux/module.h>
 #include <linux/time.h>
 
-#include <mach/aemif.h>
+#include <linux/mfd/davinci_aemif.h>
 
 /* Timing value configuration */
 
diff --git a/arch/arm/mach-davinci/board-da830-evm.c b/arch/arm/mach-davinci/board-da830-evm.c
index dc1afe5..0b43554 100644
--- a/arch/arm/mach-davinci/board-da830-evm.c
+++ b/arch/arm/mach-davinci/board-da830-evm.c
@@ -31,7 +31,7 @@
 #include <mach/nand.h>
 #include <mach/da8xx.h>
 #include <mach/usb.h>
-#include <mach/aemif.h>
+#include <linux/mfd/davinci_aemif.h>
 #include <mach/spi.h>
 
 #define DA830_EVM_PHY_ID		""
diff --git a/arch/arm/mach-davinci/board-da850-evm.c b/arch/arm/mach-davinci/board-da850-evm.c
index 6b22b54..6dda013 100644
--- a/arch/arm/mach-davinci/board-da850-evm.c
+++ b/arch/arm/mach-davinci/board-da850-evm.c
@@ -41,7 +41,7 @@
 #include <mach/da8xx.h>
 #include <mach/nand.h>
 #include <mach/mux.h>
-#include <mach/aemif.h>
+#include <linux/mfd/davinci_aemif.h>
 #include <mach/spi.h>
 
 #define DA850_EVM_PHY_ID		"0:00"
diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index 6e56615..f19151b 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -35,7 +35,7 @@
 #include <linux/slab.h>
 
 #include <mach/nand.h>
-#include <mach/aemif.h>
+#include <linux/mfd/davinci_aemif.h>
 
 /*
  * This is a device driver for the NAND flash controller found on the
diff --git a/arch/arm/mach-davinci/include/mach/aemif.h b/include/linux/mfd/davinci_aemif.h
similarity index 100%
rename from arch/arm/mach-davinci/include/mach/aemif.h
rename to include/linux/mfd/davinci_aemif.h
-- 
1.7.1
