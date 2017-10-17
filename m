Received: from pb-smtp2.pobox.com ([64.147.108.71] helo=sasl.smtp.pobox.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e4Tnc-0004Bg-L4
 for linux-mtd@lists.infradead.org; Tue, 17 Oct 2017 15:29:07 +0000
From: Nicolas Pitre <nicolas.pitre@linaro.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
Cc: Chris Brandt <chris.brandt@renesas.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH v2 5/5] MTD: remove the get_unmapped_area method
Date: Tue, 17 Oct 2017 11:28:26 -0400
Message-Id: <20171017152826.11658-6-nicolas.pitre@linaro.org>
In-Reply-To: <20171017152826.11658-1-nicolas.pitre@linaro.org>
References: <20171017152826.11658-1-nicolas.pitre@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It is now unused.

Signed-off-by: Nicolas Pitre <nico@linaro.org>
Reviewed-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/chips/map_ram.c  | 18 ------------------
 drivers/mtd/chips/map_rom.c  | 16 ----------------
 drivers/mtd/devices/mtdram.c | 14 --------------
 drivers/mtd/mtdconcat.c      | 27 ---------------------------
 drivers/mtd/mtdpart.c        | 14 --------------
 include/linux/mtd/mtd.h      |  4 ----
 6 files changed, 93 deletions(-)

diff --git a/drivers/mtd/chips/map_ram.c b/drivers/mtd/chips/map_ram.c
index c3939dd230..1cd0fff0e9 100644
--- a/drivers/mtd/chips/map_ram.c
+++ b/drivers/mtd/chips/map_ram.c
@@ -20,8 +20,6 @@ static int mapram_write (struct mtd_info *, loff_t, size_t, size_t *, const u_ch
 static int mapram_erase (struct mtd_info *, struct erase_info *);
 static void mapram_nop (struct mtd_info *);
 static struct mtd_info *map_ram_probe(struct map_info *map);
-static unsigned long mapram_unmapped_area(struct mtd_info *, unsigned long,
-					  unsigned long, unsigned long);
 static int mapram_point (struct mtd_info *mtd, loff_t from, size_t len,
 			 size_t *retlen, void **virt, resource_size_t *phys);
 static int mapram_unpoint(struct mtd_info *mtd, loff_t from, size_t len);
@@ -68,7 +66,6 @@ static struct mtd_info *map_ram_probe(struct map_info *map)
 	mtd->type = MTD_RAM;
 	mtd->size = map->size;
 	mtd->_erase = mapram_erase;
-	mtd->_get_unmapped_area = mapram_unmapped_area;
 	mtd->_read = mapram_read;
 	mtd->_write = mapram_write;
 	mtd->_panic_write = mapram_write;
@@ -86,21 +83,6 @@ static struct mtd_info *map_ram_probe(struct map_info *map)
 	return mtd;
 }
 
-
-/*
- * Allow NOMMU mmap() to directly map the device (if not NULL)
- * - return the address to which the offset maps
- * - return -ENOSYS to indicate refusal to do the mapping
- */
-static unsigned long mapram_unmapped_area(struct mtd_info *mtd,
-					  unsigned long len,
-					  unsigned long offset,
-					  unsigned long flags)
-{
-	struct map_info *map = mtd->priv;
-	return (unsigned long) map->virt + offset;
-}
-
 static int mapram_point(struct mtd_info *mtd, loff_t from, size_t len,
 			size_t *retlen, void **virt, resource_size_t *phys)
 {
diff --git a/drivers/mtd/chips/map_rom.c b/drivers/mtd/chips/map_rom.c
index 722afb1cf4..20e3604b4d 100644
--- a/drivers/mtd/chips/map_rom.c
+++ b/drivers/mtd/chips/map_rom.c
@@ -20,8 +20,6 @@ static int maprom_write (struct mtd_info *, loff_t, size_t, size_t *, const u_ch
 static void maprom_nop (struct mtd_info *);
 static struct mtd_info *map_rom_probe(struct map_info *map);
 static int maprom_erase (struct mtd_info *mtd, struct erase_info *info);
-static unsigned long maprom_unmapped_area(struct mtd_info *, unsigned long,
-					  unsigned long, unsigned long);
 static int maprom_point (struct mtd_info *mtd, loff_t from, size_t len,
 			 size_t *retlen, void **virt, resource_size_t *phys);
 static int maprom_unpoint(struct mtd_info *mtd, loff_t from, size_t len);
@@ -55,7 +53,6 @@ static struct mtd_info *map_rom_probe(struct map_info *map)
 	mtd->name = map->name;
 	mtd->type = MTD_ROM;
 	mtd->size = map->size;
-	mtd->_get_unmapped_area = maprom_unmapped_area;
 	mtd->_point = maprom_point;
 	mtd->_unpoint = maprom_unpoint;
 	mtd->_read = maprom_read;
@@ -72,19 +69,6 @@ static struct mtd_info *map_rom_probe(struct map_info *map)
 }
 
 
-/*
- * Allow NOMMU mmap() to directly map the device (if not NULL)
- * - return the address to which the offset maps
- * - return -ENOSYS to indicate refusal to do the mapping
- */
-static unsigned long maprom_unmapped_area(struct mtd_info *mtd,
-					  unsigned long len,
-					  unsigned long offset,
-					  unsigned long flags)
-{
-	struct map_info *map = mtd->priv;
-	return (unsigned long) map->virt + offset;
-
 static int maprom_point(struct mtd_info *mtd, loff_t from, size_t len,
 			size_t *retlen, void **virt, resource_size_t *phys)
 {
diff --git a/drivers/mtd/devices/mtdram.c b/drivers/mtd/devices/mtdram.c
index 4418629e8d..0bf4aeaf0c 100644
--- a/drivers/mtd/devices/mtdram.c
+++ b/drivers/mtd/devices/mtdram.c
@@ -99,19 +99,6 @@ static int ram_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
 	return 0;
 }
 
-/*
- * Allow NOMMU mmap() to directly map the device (if not NULL)
- * - return the address to which the offset maps
- * - return -ENOSYS to indicate refusal to do the mapping
- */
-static unsigned long ram_get_unmapped_area(struct mtd_info *mtd,
-					   unsigned long len,
-					   unsigned long offset,
-					   unsigned long flags)
-{
-	return (unsigned long) mtd->priv + offset;
-}
-
 static int ram_read(struct mtd_info *mtd, loff_t from, size_t len,
 		size_t *retlen, u_char *buf)
 {
@@ -156,7 +143,6 @@ int mtdram_init_device(struct mtd_info *mtd, void *mapped_address,
 	mtd->_erase = ram_erase;
 	mtd->_point = ram_point;
 	mtd->_unpoint = ram_unpoint;
-	mtd->_get_unmapped_area = ram_get_unmapped_area;
 	mtd->_read = ram_read;
 	mtd->_write = ram_write;
 
diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index d573606b91..60bf53df54 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -644,32 +644,6 @@ static int concat_block_markbad(struct mtd_info *mtd, loff_t ofs)
 }
 
 /*
- * try to support NOMMU mmaps on concatenated devices
- * - we don't support subdev spanning as we can't guarantee it'll work
- */
-static unsigned long concat_get_unmapped_area(struct mtd_info *mtd,
-					      unsigned long len,
-					      unsigned long offset,
-					      unsigned long flags)
-{
-	struct mtd_concat *concat = CONCAT(mtd);
-	int i;
-
-	for (i = 0; i < concat->num_subdev; i++) {
-		struct mtd_info *subdev = concat->subdev[i];
-
-		if (offset >= subdev->size) {
-			offset -= subdev->size;
-			continue;
-		}
-
-		return mtd_get_unmapped_area(subdev, len, offset, flags);
-	}
-
-	return (unsigned long) -ENOSYS;
-}
-
-/*
  * This function constructs a virtual MTD device by concatenating
  * num_devs MTD devices. A pointer to the new device object is
  * stored to *new_dev upon success. This function does _not_
@@ -790,7 +764,6 @@ struct mtd_info *mtd_concat_create(struct mtd_info *subdev[],	/* subdevices to c
 	concat->mtd._unlock = concat_unlock;
 	concat->mtd._suspend = concat_suspend;
 	concat->mtd._resume = concat_resume;
-	concat->mtd._get_unmapped_area = concat_get_unmapped_area;
 
 	/*
 	 * Combine the erase block size info of the subdevices:
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index a308e70739..be088bccd5 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -101,18 +101,6 @@ static int part_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
 	return part->parent->_unpoint(part->parent, from + part->offset, len);
 }
 
-static unsigned long part_get_unmapped_area(struct mtd_info *mtd,
-					    unsigned long len,
-					    unsigned long offset,
-					    unsigned long flags)
-{
-	struct mtd_part *part = mtd_to_part(mtd);
-
-	offset += part->offset;
-	return part->parent->_get_unmapped_area(part->parent, len, offset,
-						flags);
-}
-
 static int part_read_oob(struct mtd_info *mtd, loff_t from,
 		struct mtd_oob_ops *ops)
 {
@@ -458,8 +446,6 @@ static struct mtd_part *allocate_partition(struct mtd_info *parent,
 		slave->mtd._unpoint = part_unpoint;
 	}
 
-	if (parent->_get_unmapped_area)
-		slave->mtd._get_unmapped_area = part_get_unmapped_area;
 	if (parent->_read_oob)
 		slave->mtd._read_oob = part_read_oob;
 	if (parent->_write_oob)
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 6cd0f6b765..0a0678a5e6 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -297,10 +297,6 @@ struct mtd_info {
 	int (*_point) (struct mtd_info *mtd, loff_t from, size_t len,
 		       size_t *retlen, void **virt, resource_size_t *phys);
 	int (*_unpoint) (struct mtd_info *mtd, loff_t from, size_t len);
-	unsigned long (*_get_unmapped_area) (struct mtd_info *mtd,
-					     unsigned long len,
-					     unsigned long offset,
-					     unsigned long flags);
 	int (*_read) (struct mtd_info *mtd, loff_t from, size_t len,
 		      size_t *retlen, u_char *buf);
 	int (*_write) (struct mtd_info *mtd, loff_t to, size_t len,
-- 
2.9.5
