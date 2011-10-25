Received: from smtp-out1.tiscali.nl ([195.241.79.176])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RIcs2-00041b-UN
	for linux-mtd@lists.infradead.org; Tue, 25 Oct 2011 09:00:33 +0000
Subject: [PATCH] mtd: clean up usage of MTD_DOCPROBE_ADDRESS
From: Paul Bolle <pebolle@tiscali.nl>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 25 Oct 2011 11:00:07 +0200
Message-ID: <1319533207.2409.68.camel@x61.thuisdomein>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Depending on whether MTD_DOCPROBE_ADVANCED is set or not,
MTD_DOCPROBE_ADDRESS will default to either 0x0000 or 0. That should
lead to (basically) identical code in docprobe.c. The current two
defaults should be merged.

And, while we're at it, if MTD_DOCPROBE is set MTD_DOCPROBE_ADDRESS will
always be set. (MTD_DOCPROBE_ADDRESS depends on MTD_DOCPROBE and it has
a default value.) So the check whether CONFIG_MTD_DOCPROBE_ADDRESS is
defined is unnecessary and should be dropped.

Signed-off-by: Paul Bolle <pebolle@tiscali.nl>
---
Tested only by running "make menuconfig" with different values and by
looking at the preprocessor's output (ie, running "make -C /[...] M=$PWD
EXTRA_CFLAGS=-E docprobe.ko").

 drivers/mtd/devices/Kconfig    |    3 +--
 drivers/mtd/devices/docprobe.c |    5 -----
 2 files changed, 1 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
index 35081ce..4fdc2fe 100644
--- a/drivers/mtd/devices/Kconfig
+++ b/drivers/mtd/devices/Kconfig
@@ -268,8 +268,7 @@ config MTD_DOCPROBE_ADVANCED
 config MTD_DOCPROBE_ADDRESS
 	hex "Physical address of DiskOnChip" if MTD_DOCPROBE_ADVANCED
 	depends on MTD_DOCPROBE
-	default "0x0000" if MTD_DOCPROBE_ADVANCED
-	default "0" if !MTD_DOCPROBE_ADVANCED
+	default "0x0"
 	---help---
 	  By default, the probe for DiskOnChip devices will look for a
 	  DiskOnChip at every multiple of 0x2000 between 0xC8000 and 0xEE000.
diff --git a/drivers/mtd/devices/docprobe.c b/drivers/mtd/devices/docprobe.c
index d374603..45116bb 100644
--- a/drivers/mtd/devices/docprobe.c
+++ b/drivers/mtd/devices/docprobe.c
@@ -50,11 +50,6 @@
 #include <linux/mtd/nand.h>
 #include <linux/mtd/doc2000.h>
 
-/* Where to look for the devices? */
-#ifndef CONFIG_MTD_DOCPROBE_ADDRESS
-#define CONFIG_MTD_DOCPROBE_ADDRESS 0
-#endif
-
 
 static unsigned long doc_config_location = CONFIG_MTD_DOCPROBE_ADDRESS;
 module_param(doc_config_location, ulong, 0);
-- 
1.7.4.4
