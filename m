Received: from db3ehsobe005.messaging.microsoft.com ([213.199.154.143]
	helo=DB3EHSOBE005.bigfish.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1REdbz-000195-Bl
	for linux-mtd@lists.infradead.org; Fri, 14 Oct 2011 08:59:28 +0000
From: Shaohui Xie <Shaohui.Xie@freescale.com>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] mtd: m25p80: don't probe device which has status of 'disabled'
Date: Fri, 14 Oct 2011 15:49:00 +0800
Message-ID: <1318578540-12872-1-git-send-email-Shaohui.Xie@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org, galak@kernel.crashing.org,
	Shaohui Xie <Shaohui.Xie@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On some platforms such as P3060QDS, has multiple spi flashes, but they are
not available at same time, so if their status is 'disabled', which is set
by u-boot, will not be probed.

Signed-off-by: Shaohui Xie <Shaohui.Xie@freescale.com>
---
Disabled nodes should automatically not be probed. But I found this is only
true for spi node, for the flash nodes which embedded in spi node, still got
probed even it has a status of 'disabled'.

 drivers/mtd/devices/m25p80.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 4e20c4d..30d61d5 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -30,6 +30,7 @@
 #include <linux/mtd/cfi.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
+#include <linux/of_platform.h>
 
 #include <linux/spi/spi.h>
 #include <linux/spi/flash.h>
@@ -829,6 +830,11 @@ static int __devinit m25p_probe(struct spi_device *spi)
 	struct mtd_partition		*parts = NULL;
 	int				nr_parts = 0;
 
+#ifdef CONFIG_MTD_OF_PARTS
+	if (!of_device_is_available(spi->dev.of_node))
+		return -ENODEV;
+#endif
+
 	/* Platform data helps sort out which chip type we have, as
 	 * well as how this board partitions it.  If we don't have
 	 * a chip ID, try the JEDEC id commands; they'll work for most
-- 
1.6.4
