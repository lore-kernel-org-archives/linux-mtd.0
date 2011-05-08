Received: from [69.28.251.93] (helo=b32.net)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QJ8LZ-0005lQ-Um
	for linux-mtd@lists.infradead.org; Sun, 08 May 2011 18:04:50 +0000
From: Kevin Cernekee <cernekee@gmail.com>
To: <dedekind@infradead.org>, <dwmw2@infradead.org>
Subject: [PATCH 2/4] mtd: m25p80: Clean up JEDEC manufacturer checks
Date: Sun, 08 May 2011 10:48:00 -0700
Message-Id: <1b2bafd0a0d3cdc8d3f050da07aa8952@localhost>
In-Reply-To: <657440bd74a74686279e691d39337f21@localhost>
References: <657440bd74a74686279e691d39337f21@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use the manufacturer ID names from cfi.h instead of hard-coding
hex constants.  Introduce a JEDEC_MFR macro for clarity.

Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
---
 drivers/mtd/devices/m25p80.c |   11 +++++++----
 1 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 09c342d..10a84ce 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -27,6 +27,7 @@
 #include <linux/sched.h>
 #include <linux/mod_devicetable.h>
 
+#include <linux/mtd/cfi.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
 
@@ -76,6 +77,8 @@
 #define FAST_READ_DUMMY_BYTE 0
 #endif
 
+#define JEDEC_MFR(_jedec_id)	((_jedec_id) >> 16)
+
 /****************************************************************************/
 
 struct m25p {
@@ -871,9 +874,9 @@ static int __devinit m25p_probe(struct spi_device *spi)
 	 * up with the software protection bits set
 	 */
 
-	if (info->jedec_id >> 16 == 0x1f ||
-	    info->jedec_id >> 16 == 0x89 ||
-	    info->jedec_id >> 16 == 0xbf) {
+	if (JEDEC_MFR(info->jedec_id) == CFI_MFR_ATMEL ||
+	    JEDEC_MFR(info->jedec_id) == CFI_MFR_INTEL ||
+	    JEDEC_MFR(info->jedec_id) == CFI_MFR_SST) {
 		write_enable(flash);
 		write_sr(flash, 0);
 	}
@@ -891,7 +894,7 @@ static int __devinit m25p_probe(struct spi_device *spi)
 	flash->mtd.read = m25p80_read;
 
 	/* sst flash chips use AAI word program */
-	if (info->jedec_id >> 16 == 0xbf)
+	if (JEDEC_MFR(info->jedec_id) == CFI_MFR_SST)
 		flash->mtd.write = sst_write;
 	else
 		flash->mtd.write = m25p80_write;
-- 
1.7.5
