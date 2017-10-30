Received: from pb-smtp2.pobox.com ([64.147.108.71] helo=sasl.smtp.pobox.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e9F7M-0000MZ-DK
 for linux-mtd@lists.infradead.org; Mon, 30 Oct 2017 18:49:05 +0000
From: Nicolas Pitre <nicolas.pitre@linaro.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
Cc: Chris Brandt <chris.brandt@renesas.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH v3 2/5] MTD: chips/map_ram.c: implement point and unpoint
 methods
Date: Mon, 30 Oct 2017 14:48:30 -0400
Message-Id: <20171030184833.20709-3-nicolas.pitre@linaro.org>
In-Reply-To: <20171030184833.20709-1-nicolas.pitre@linaro.org>
References: <20171030184833.20709-1-nicolas.pitre@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This will allow for the removal of the get_unmapped_area method later.

Signed-off-by: Nicolas Pitre <nico@linaro.org>
Reviewed-by: Richard Weinberger <richard@nod.at>
Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/chips/map_ram.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/mtd/chips/map_ram.c b/drivers/mtd/chips/map_ram.c
index afb43d5e17..c3939dd230 100644
--- a/drivers/mtd/chips/map_ram.c
+++ b/drivers/mtd/chips/map_ram.c
@@ -22,6 +22,9 @@ static void mapram_nop (struct mtd_info *);
 static struct mtd_info *map_ram_probe(struct map_info *map);
 static unsigned long mapram_unmapped_area(struct mtd_info *, unsigned long,
 					  unsigned long, unsigned long);
+static int mapram_point (struct mtd_info *mtd, loff_t from, size_t len,
+			 size_t *retlen, void **virt, resource_size_t *phys);
+static int mapram_unpoint(struct mtd_info *mtd, loff_t from, size_t len);
 
 
 static struct mtd_chip_driver mapram_chipdrv = {
@@ -69,7 +72,9 @@ static struct mtd_info *map_ram_probe(struct map_info *map)
 	mtd->_read = mapram_read;
 	mtd->_write = mapram_write;
 	mtd->_panic_write = mapram_write;
+	mtd->_point = mapram_point;
 	mtd->_sync = mapram_nop;
+	mtd->_unpoint = mapram_unpoint;
 	mtd->flags = MTD_CAP_RAM;
 	mtd->writesize = 1;
 
@@ -96,6 +101,25 @@ static unsigned long mapram_unmapped_area(struct mtd_info *mtd,
 	return (unsigned long) map->virt + offset;
 }
 
+static int mapram_point(struct mtd_info *mtd, loff_t from, size_t len,
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
+static int mapram_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
+{
+	return 0;
+}
+
 static int mapram_read (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf)
 {
 	struct map_info *map = mtd->priv;
-- 
2.9.5
