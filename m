Received: from mail.ultratronik.de ([82.100.224.114] helo=build.ultratronik.de)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M63XK-0008Su-Om
	for linux-mtd@lists.infradead.org; Mon, 18 May 2009 14:10:00 +0000
From: Matthias Ludwig <mludwig@ultratronik.de>
To: linux-mtd@lists.infradead.org
Subject: [RFC] [PATCH] physmap: support top-aligned flash chips
Date: Mon, 18 May 2009 16:09:44 +0200
Message-Id: <1242655784-21131-1-git-send-email-mludwig@ultratronik.de>
Cc: Matthias Ludwig <mludwig@ultratronik.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some machines (e.g. mips au1x00) map flash chips
on the "upper end" of a memory area. Such a machine
cannot be equiped with different sized flash chips
because only the "lower end" of the memory area is
probed for the device.
This patch allows automatically probing of memory
sub-areas where smaller chips can are found.
---
 drivers/mtd/maps/physmap.c |   21 ++++++++++++++++++---
 1 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index 29a9011..9c892dd 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -88,6 +88,7 @@ static int physmap_flash_probe(struct platform_device *dev)
 	struct physmap_flash_data *physmap_data;
 	struct physmap_flash_info *info;
 	const char **probe_type;
+	void __iomem *virt;
 	int err = 0;
 	int i;
 	int devices_found = 0;
@@ -126,9 +127,9 @@ static int physmap_flash_probe(struct platform_device *dev)
 		info->map[i].set_vpp = physmap_data->set_vpp;
 		info->map[i].pfow_base = physmap_data->pfow_base;
 
-		info->map[i].virt = devm_ioremap(&dev->dev, info->map[i].phys,
+		virt = devm_ioremap(&dev->dev, info->map[i].phys,
 						 info->map[i].size);
-		if (info->map[i].virt == NULL) {
+		if (!virt) {
 			dev_err(&dev->dev, "Failed to ioremap flash region\n");
 			err = EIO;
 			goto err_out;
@@ -137,8 +138,22 @@ static int physmap_flash_probe(struct platform_device *dev)
 		simple_map_init(&info->map[i]);
 
 		probe_type = rom_probe_types;
-		for (; info->mtd[i] == NULL && *probe_type != NULL; probe_type++)
+		for (; info->mtd[i] == NULL && *probe_type != NULL; probe_type++) {
+			info->map[i].phys = dev->resource[i].start;
+			info->map[i].size = dev->resource[i].end -
+					dev->resource[i].start + 1;
+			info->map[i].virt = virt;
+
+			info->mtd[i] = do_map_probe(*probe_type, &info->map[i]);
+
+			while (!info->mtd[i] && physmap_data->top_aligned &&
+					info->map[i].size > 0x40000) {
+				info->map[i].size >>= 1;
+				info->map[i].phys += info->map[i].size;
+				info->map[i].virt += info->map[i].size;
 			info->mtd[i] = do_map_probe(*probe_type, &info->map[i]);
+			}
+		}
 		if (info->mtd[i] == NULL) {
 			dev_err(&dev->dev, "map_probe failed\n");
 			err = -ENXIO;
-- 
1.6.3.9.g6345
