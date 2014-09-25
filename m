Date: Thu, 25 Sep 2014 12:20:24 -0500 (CDT)
From: Aaron Sierra <asierra@xes-inc.com>
To: linux-mtd@lists.infradead.org
Message-ID: <673100209.65720.1411665624206.JavaMail.zimbra@xes-inc.com>
In-Reply-To: <1683475520.65208.1411665491176.JavaMail.zimbra@xes-inc.com>
Subject: [PATCH 2/2] mtd: map_rom: Support UBI on ROM
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

UBI needs to know the physical erase block size, even on read-only
devices, since it defines the on-device layout. Use a device-tree
provided value to support previously written UBI on read-only NOR.

UBI also needs a non-zero writebufsize, so we set it to one.

Note: This was implemented because hardware write-protected CFI
      NOR cannot be probed for the physical erase block size.

Signed-off-by: Joe Schultz <jschultz@xes-inc.ccom>
Signed-off-by: Aaron Sierra <asierra@xes-inc.ccom>
---
 Documentation/devicetree/bindings/mtd/mtd-physmap.txt |  5 +++++
 drivers/mtd/chips/map_rom.c                           | 13 ++++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/mtd-physmap.txt b/Documentation/devicetree/bindings/mtd/mtd-physmap.txt
index 6b9f680..8ab16df 100644
--- a/Documentation/devicetree/bindings/mtd/mtd-physmap.txt
+++ b/Documentation/devicetree/bindings/mtd/mtd-physmap.txt
@@ -36,6 +36,11 @@ are defined:
  - vendor-id : Contains the flash chip's vendor id (1 byte).
  - device-id : Contains the flash chip's device id (1 byte).
 
+For ROM compatible devices (and ROM fallback from cfi-flash), the following
+additional property is defined:
+
+ - erase-size : The chip's physical erase block size in bytes.
+
 The device tree may optionally contain sub-nodes describing partitions of the
 address space. See partition.txt for more detail.
 
diff --git a/drivers/mtd/chips/map_rom.c b/drivers/mtd/chips/map_rom.c
index 47a43cf..a831265 100644
--- a/drivers/mtd/chips/map_rom.c
+++ b/drivers/mtd/chips/map_rom.c
@@ -11,6 +11,7 @@
 #include <linux/errno.h>
 #include <linux/slab.h>
 #include <linux/init.h>
+#include <linux/of.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/map.h>
 
@@ -28,6 +29,15 @@ static struct mtd_chip_driver maprom_chipdrv = {
 	.module	= THIS_MODULE
 };
 
+static unsigned int default_erasesize(struct map_info *map)
+{
+	const __be32 *erase_size = NULL;
+#ifdef CONFIG_OF
+	erase_size = of_get_property(map->device_node, "erase-size", NULL);
+#endif
+	return !erase_size ? map->size : be32_to_cpu(*erase_size);
+}
+
 static struct mtd_info *map_rom_probe(struct map_info *map)
 {
 	struct mtd_info *mtd;
@@ -47,8 +57,9 @@ static struct mtd_info *map_rom_probe(struct map_info *map)
 	mtd->_sync = maprom_nop;
 	mtd->_erase = maprom_erase;
 	mtd->flags = MTD_CAP_ROM;
-	mtd->erasesize = map->size;
+	mtd->erasesize = default_erasesize(map);
 	mtd->writesize = 1;
+	mtd->writebufsize = 1;
 
 	__module_get(THIS_MODULE);
 	return mtd;
-- 
1.9.1
