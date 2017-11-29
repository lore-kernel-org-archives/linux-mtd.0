Received: from mail-by2nam01on0048.outbound.protection.outlook.com
 ([104.47.34.48] helo=NAM01-BY2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eK0XW-0003hE-9y
 for linux-mtd@lists.infradead.org; Wed, 29 Nov 2017 11:28:32 +0000
From: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
To: <linux-mtd@lists.infradead.org>
CC: <dedekind1@gmail.com>, <oss@buserror.net>, <computersforpeace@gmail.com>,
 Jagdish Gediya <jagdish.gediya@nxp.com>, Prabhakar Kushwaha
 <prabhakar.kushwaha@nxp.com>
Subject: [PATCH][v2] driver: mtd: update struct map_info's swap as per map
 requirement.
Date: Wed, 29 Nov 2017 16:56:52 +0530
Message-ID: <1511954812-8533-1-git-send-email-prabhakar.kushwaha@nxp.com>
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

From: Jagdish Gediya <jagdish.gediya@nxp.com>

It is not necessary for all device's maps to be CFI_HOST_ENDIAN.
Maps device can be Big endian or little endian.

Currently it is being taken care using CONFIG_MTD_CFI_LE_BYTE_SWAP or
CONFIG_MTD_CFI_BE_BYTE_SWAP i.e. compile time.

Now update struct map_info's swap field based on device characteristics
defined in device tree.

Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
Signed-off-by: Jagdish Gediya <jagdish.gediya@nxp.com>
---
Changes for v2: Incorporated review comments from Boris Brezillon
http://patchwork.ozlabs.org/patch/758381/

 drivers/mtd/maps/physmap_of_core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mtd/maps/physmap_of_core.c b/drivers/mtd/maps/physmap_of_core.c
index b1bd4fa..27f44a0 100644
--- a/drivers/mtd/maps/physmap_of_core.c
+++ b/drivers/mtd/maps/physmap_of_core.c
@@ -20,6 +20,7 @@
 #include <linux/mtd/map.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/concat.h>
+#include <linux/mtd/cfi_endian.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
@@ -233,6 +234,13 @@ static int of_flash_probe(struct platform_device *dev)
 		info->list[i].map.bankwidth = be32_to_cpup(width);
 		info->list[i].map.device_node = dp;
 
+		if (of_property_read_bool(dp->parent, "big-endian"))
+			info->list[i].map.swap = CFI_BIG_ENDIAN;
+		else if (of_property_read_bool(dp->parent, "little-endian"))
+			info->list[i].map.swap = CFI_LITTLE_ENDIAN;
+		else if (of_property_read_bool(dp->parent, "host-endian"))
+			info->list[i].map.swap = CFI_HOST_ENDIAN;
+
 		err = of_flash_probe_gemini(dev, dp, &info->list[i].map);
 		if (err)
 			goto err_out;
-- 
1.9.1
