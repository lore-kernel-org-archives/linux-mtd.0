Received: from pb-smtp2.pobox.com ([64.147.108.71] helo=sasl.smtp.pobox.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e27fZ-0002Lr-0G
 for linux-mtd@lists.infradead.org; Wed, 11 Oct 2017 03:26:58 +0000
From: Nicolas Pitre <nicolas.pitre@linaro.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH 3/5] MTD: chips/map_rom.c: implement point and unpoint methods
Date: Tue, 10 Oct 2017 23:26:19 -0400
Message-Id: <20171011032621.26979-4-nicolas.pitre@linaro.org>
In-Reply-To: <20171011032621.26979-1-nicolas.pitre@linaro.org>
References: <20171011032621.26979-1-nicolas.pitre@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Nicolas Pitre <nico@linaro.org>
---
 drivers/mtd/chips/map_rom.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/mtd/chips/map_rom.c b/drivers/mtd/chips/map_rom.c
index e67f73ab44..722afb1cf4 100644
--- a/drivers/mtd/chips/map_rom.c
+++ b/drivers/mtd/chips/map_rom.c
@@ -22,6 +22,10 @@ static struct mtd_info *map_rom_probe(struct map_info *map);
 static int maprom_erase (struct mtd_info *mtd, struct erase_info *info);
 static unsigned long maprom_unmapped_area(struct mtd_info *, unsigned long,
 					  unsigned long, unsigned long);
+static int maprom_point (struct mtd_info *mtd, loff_t from, size_t len,
+			 size_t *retlen, void **virt, resource_size_t *phys);
+static int maprom_unpoint(struct mtd_info *mtd, loff_t from, size_t len);
+
 
 static struct mtd_chip_driver maprom_chipdrv = {
 	.probe	= map_rom_probe,
@@ -52,6 +56,8 @@ static struct mtd_info *map_rom_probe(struct map_info *map)
 	mtd->type = MTD_ROM;
 	mtd->size = map->size;
 	mtd->_get_unmapped_area = maprom_unmapped_area;
+	mtd->_point = maprom_point;
+	mtd->_unpoint = maprom_unpoint;
 	mtd->_read = maprom_read;
 	mtd->_write = maprom_write;
 	mtd->_sync = maprom_nop;
@@ -78,6 +84,24 @@ static unsigned long maprom_unmapped_area(struct mtd_info *mtd,
 {
 	struct map_info *map = mtd->priv;
 	return (unsigned long) map->virt + offset;
+
+static int maprom_point(struct mtd_info *mtd, loff_t from, size_t len,
+			size_t *retlen, void **virt, resource_size_t *phys)
+{
+	struct map_info *map = mtd->priv;
+
+	if (!map->virt)
+		return -EINVAL;
+	*virt = map->virt + from;
+	if (phys)
+		*phys = map->phys + from;
+	*retlen = len;
+	return 0;
+}
+
+static int maprom_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
+{
+	return 0;
 }
 
 static int maprom_read (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf)
-- 
2.9.5
