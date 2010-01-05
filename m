Received: from mail.solarflare.com ([216.237.3.220]
	helo=exchange.solarflare.com)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NSBD6-00065g-Sv
	for linux-mtd@lists.infradead.org; Tue, 05 Jan 2010 15:20:45 +0000
Subject: [PATCH 3/6] nandsim: Define CONFIG_NANDSIM_MAX_PARTS and use it
	instead of MAX_MTD_DEVICES
From: Ben Hutchings <bhutchings@solarflare.com>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain
Date: Tue, 05 Jan 2010 15:20:37 +0000
Message-Id: <1262704837.2837.9.camel@achroite.uk.solarflarecom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

MAX_MTD_DEVICES is about to be removed.

Signed-off-by: Ben Hutchings <bhutchings@solarflare.com>
---
 drivers/mtd/nand/nandsim.c |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 7281000..58c255e 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -80,6 +80,9 @@
 #ifndef CONFIG_NANDSIM_DBG
 #define CONFIG_NANDSIM_DBG        0
 #endif
+#ifndef CONFIG_NANDSIM_MAX_PARTS
+#define CONFIG_NANDSIM_MAX_PARTS  32
+#endif
 
 static uint first_id_byte  = CONFIG_NANDSIM_FIRST_ID_BYTE;
 static uint second_id_byte = CONFIG_NANDSIM_SECOND_ID_BYTE;
@@ -94,7 +97,7 @@ static uint bus_width      = CONFIG_NANDSIM_BUS_WIDTH;
 static uint do_delays      = CONFIG_NANDSIM_DO_DELAYS;
 static uint log            = CONFIG_NANDSIM_LOG;
 static uint dbg            = CONFIG_NANDSIM_DBG;
-static unsigned long parts[MAX_MTD_DEVICES];
+static unsigned long parts[CONFIG_NANDSIM_MAX_PARTS];
 static unsigned int parts_num;
 static char *badblocks = NULL;
 static char *weakblocks = NULL;
@@ -288,7 +291,7 @@ union ns_mem {
  * The structure which describes all the internal simulator data.
  */
 struct nandsim {
-	struct mtd_partition partitions[MAX_MTD_DEVICES];
+	struct mtd_partition partitions[CONFIG_NANDSIM_MAX_PARTS];
 	unsigned int nbparts;
 
 	uint busw;              /* flash chip bus width (8 or 16) */
-- 
1.5.5


-- 
Ben Hutchings, Senior Software Engineer, Solarflare Communications
Not speaking for my employer; that's the marketing department's job.
They asked us to note that Solarflare product names are trademarked.
