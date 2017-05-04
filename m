Received: from mail-cys01nam02on0064.outbound.protection.outlook.com
 ([104.47.37.64] helo=NAM02-CY1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d6B4d-0000gl-CK
 for linux-mtd@lists.infradead.org; Thu, 04 May 2017 07:21:17 +0000
From: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
To: <linux-mtd@lists.infradead.org>
CC: <dedekind1@gmail.com>, <oss@buserror.net>, Prabhakar Kushwaha
 <prabhakar.kushwaha@nxp.com>
Subject: [PATCH] driver: mtd: update struct map_info's swap as per map
 requirement.
Date: Thu, 4 May 2017 12:50:37 +0530
Message-ID: <1493882437-4541-1-git-send-email-prabhakar.kushwaha@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It is not necessary for all device's maps to be CFI_HOST_ENDIAN. Maps device
can be Bigendian or little endian.

Currently it is being taken care using CONFIG_MTD_CFI_LE_BYTE_SWAP or
CONFIG_MTD_CFI_BE_BYTE_SWAP i.e. compile time.

Now update struct map_info's swap field based on device characteristics
defined in device tree.

Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
---
 drivers/mtd/maps/physmap_of.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index 14e8909..f39607d 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -20,6 +20,7 @@
 #include <linux/mtd/map.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/concat.h>
+#include <linux/mtd/cfi_endian.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
@@ -243,6 +244,9 @@ static int of_flash_probe(struct platform_device *dev)
 		info->list[i].map.bankwidth = be32_to_cpup(width);
 		info->list[i].map.device_node = dp;
 
+		if (of_property_read_bool(dp->parent, "big-endian"))
+			info->list[i].map.swap = CFI_BIG_ENDIAN;
+
 		err = of_flash_probe_gemini(dev, dp, &info->list[i].map);
 		if (err)
 			return err;
-- 
2.7.4
