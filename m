From: Arnd Bergmann <arnd@arndb.de>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/8] mtd: diskonchip: don't warn about ARM architecture
Date: Tue,  6 Nov 2012 22:55:26 +0100
Message-Id: <1352238933-4886-2-git-send-email-arnd@arndb.de>
In-Reply-To: <1352238933-4886-1-git-send-email-arnd@arndb.de>
References: <1352238933-4886-1-git-send-email-arnd@arndb.de>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Enabling the diskonchip drivers on most architectures results
in a pointless warning "#warning Unknown architecture for
DiskOnChip. No default probe locations defined". The driver
can in fact handle the default location already through the
CONFIG_MTD_DOCPROBE_ADDRESS, which gets set on the platforms
that need it, and we get a run-time error if this is not
set correctly.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/devices/docprobe.c |    2 --
 drivers/mtd/nand/diskonchip.c  |    2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/mtd/devices/docprobe.c b/drivers/mtd/devices/docprobe.c
index 706b847..88b3fd3 100644
--- a/drivers/mtd/devices/docprobe.c
+++ b/drivers/mtd/devices/docprobe.c
@@ -70,8 +70,6 @@ static unsigned long __initdata doc_locations[] = {
 	0xe0000, 0xe2000, 0xe4000, 0xe6000,
 	0xe8000, 0xea000, 0xec000, 0xee000,
 #endif /*  CONFIG_MTD_DOCPROBE_HIGH */
-#else
-#warning Unknown architecture for DiskOnChip. No default probe locations defined
 #endif
 	0xffffffff };
 
diff --git a/drivers/mtd/nand/diskonchip.c b/drivers/mtd/nand/diskonchip.c
index 256eb30..81fa578 100644
--- a/drivers/mtd/nand/diskonchip.c
+++ b/drivers/mtd/nand/diskonchip.c
@@ -53,8 +53,6 @@ static unsigned long __initdata doc_locations[] = {
 	0xe0000, 0xe2000, 0xe4000, 0xe6000,
 	0xe8000, 0xea000, 0xec000, 0xee000,
 #endif /*  CONFIG_MTD_DOCPROBE_HIGH */
-#else
-#warning Unknown architecture for DiskOnChip. No default probe locations defined
 #endif
 	0xffffffff };
 
-- 
1.7.10
