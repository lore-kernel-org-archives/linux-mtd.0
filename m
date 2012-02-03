Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RtMW0-0000OQ-JF
 for linux-mtd@lists.infradead.org; Fri, 03 Feb 2012 17:01:37 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/4] mtd: return error code from mtd_unpoint
Date: Fri,  3 Feb 2012 19:01:28 +0200
Message-Id: <1328288491-8744-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

The 'mtd_unpoint()' API function should be able to return an error code because
it may fail if you specify incorrect offset. This patch changes this MTD API
function and amends all the drivers correspondingly.

Also return '-EOPNOTSUPP' from 'mtd_unpoint()' when the '->unpoint()' method is
undefined. We do not really need this currently, but this just makes
sense to be consistent with 'mtd_point()'.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/chips/cfi_cmdset_0001.c |   16 ++++++++++------
 drivers/mtd/devices/mtdram.c        |    3 ++-
 drivers/mtd/devices/phram.c         |    3 ++-
 drivers/mtd/devices/pmc551.c        |    2 +-
 drivers/mtd/devices/slram.c         |    5 +++--
 drivers/mtd/lpddr/lpddr_cmds.c      |   12 ++++++++----
 drivers/mtd/mtdpart.c               |    4 ++--
 include/linux/mtd/mtd.h             |    6 ++++--
 8 files changed, 32 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 152accf..4d04551 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -87,7 +87,7 @@ static int cfi_intelext_partition_fixup(struct mtd_info *, struct cfi_private **
 
 static int cfi_intelext_point (struct mtd_info *mtd, loff_t from, size_t len,
 		     size_t *retlen, void **virt, resource_size_t *phys);
-static void cfi_intelext_unpoint(struct mtd_info *mtd, loff_t from, size_t len);
+static int cfi_intelext_unpoint(struct mtd_info *mtd, loff_t from, size_t len);
 
 static int chip_ready (struct map_info *map, struct flchip *chip, unsigned long adr, int mode);
 static int get_chip(struct map_info *map, struct flchip *chip, unsigned long adr, int mode);
@@ -1369,12 +1369,12 @@ static int cfi_intelext_point(struct mtd_info *mtd, loff_t from, size_t len,
 	return 0;
 }
 
-static void cfi_intelext_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
+static int cfi_intelext_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
 {
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
 	unsigned long ofs;
-	int chipnum;
+	int chipnum, err = 0;
 
 	/* Now unlock the chip(s) POINT state */
 
@@ -1382,7 +1382,7 @@ static void cfi_intelext_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
 	chipnum = (from >> cfi->chipshift);
 	ofs = from - (chipnum <<  cfi->chipshift);
 
-	while (len) {
+	while (len && !err) {
 		unsigned long thislen;
 		struct flchip *chip;
 
@@ -1400,8 +1400,10 @@ static void cfi_intelext_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
 			chip->ref_point_counter--;
 			if(chip->ref_point_counter == 0)
 				chip->state = FL_READY;
-		} else
-			printk(KERN_ERR "%s: Warning: unpoint called on non pointed region\n", map->name); /* Should this give an error? */
+		} else {
+			printk(KERN_ERR "%s: Error: unpoint called on non pointed region\n", map->name);
+			err = -EINVAL;
+		}
 
 		put_chip(map, chip, chip->start);
 		mutex_unlock(&chip->mutex);
@@ -1410,6 +1412,8 @@ static void cfi_intelext_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
 		ofs = 0;
 		chipnum++;
 	}
+
+	return err;
 }
 
 static inline int do_read_onechip(struct map_info *map, struct flchip *chip, loff_t adr, size_t len, u_char *buf)
diff --git a/drivers/mtd/devices/mtdram.c b/drivers/mtd/devices/mtdram.c
index 91030cf..e1f017b 100644
--- a/drivers/mtd/devices/mtdram.c
+++ b/drivers/mtd/devices/mtdram.c
@@ -60,8 +60,9 @@ static int ram_point(struct mtd_info *mtd, loff_t from, size_t len,
 	return 0;
 }
 
-static void ram_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
+static int ram_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
 {
+	return 0;
 }
 
 /*
diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index eff2b69..3803555 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -70,8 +70,9 @@ static int phram_point(struct mtd_info *mtd, loff_t from, size_t len,
 	return 0;
 }
 
-static void phram_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
+static int phram_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
 {
+	return 0;
 }
 
 static int phram_read(struct mtd_info *mtd, loff_t from, size_t len,
diff --git a/drivers/mtd/devices/pmc551.c b/drivers/mtd/devices/pmc551.c
index 67d22e1..40a96c7 100644
--- a/drivers/mtd/devices/pmc551.c
+++ b/drivers/mtd/devices/pmc551.c
@@ -206,7 +206,7 @@ static int pmc551_point(struct mtd_info *mtd, loff_t from, size_t len,
 	return 0;
 }
 
-static void pmc551_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
+static int pmc551_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
 {
 #ifdef CONFIG_MTD_PMC551_DEBUG
 	printk(KERN_DEBUG "pmc551_unpoint()\n");
diff --git a/drivers/mtd/devices/slram.c b/drivers/mtd/devices/slram.c
index cbeb195..9431ffc 100644
--- a/drivers/mtd/devices/slram.c
+++ b/drivers/mtd/devices/slram.c
@@ -76,7 +76,7 @@ static slram_mtd_list_t *slram_mtdlist = NULL;
 static int slram_erase(struct mtd_info *, struct erase_info *);
 static int slram_point(struct mtd_info *, loff_t, size_t, size_t *, void **,
 		resource_size_t *);
-static void slram_unpoint(struct mtd_info *, loff_t, size_t);
+static int slram_unpoint(struct mtd_info *, loff_t, size_t);
 static int slram_read(struct mtd_info *, loff_t, size_t, size_t *, u_char *);
 static int slram_write(struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
 
@@ -119,8 +119,9 @@ static int slram_point(struct mtd_info *mtd, loff_t from, size_t len,
 	return(0);
 }
 
-static void slram_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
+static int slram_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
 {
+	return 0;
 }
 
 static int slram_read(struct mtd_info *mtd, loff_t from, size_t len,
diff --git a/drivers/mtd/lpddr/lpddr_cmds.c b/drivers/mtd/lpddr/lpddr_cmds.c
index fd19d3b..de960b1 100644
--- a/drivers/mtd/lpddr/lpddr_cmds.c
+++ b/drivers/mtd/lpddr/lpddr_cmds.c
@@ -40,7 +40,7 @@ static int lpddr_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
 static int lpddr_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
 static int lpddr_point(struct mtd_info *mtd, loff_t adr, size_t len,
 			size_t *retlen, void **mtdbuf, resource_size_t *phys);
-static void lpddr_unpoint(struct mtd_info *mtd, loff_t adr, size_t len);
+static int lpddr_unpoint(struct mtd_info *mtd, loff_t adr, size_t len);
 static int get_chip(struct map_info *map, struct flchip *chip, int mode);
 static int chip_ready(struct map_info *map, struct flchip *chip, int mode);
 static void put_chip(struct map_info *map, struct flchip *chip);
@@ -575,11 +575,11 @@ static int lpddr_point(struct mtd_info *mtd, loff_t adr, size_t len,
 	return 0;
 }
 
-static void lpddr_unpoint (struct mtd_info *mtd, loff_t adr, size_t len)
+static int lpddr_unpoint (struct mtd_info *mtd, loff_t adr, size_t len)
 {
 	struct map_info *map = mtd->priv;
 	struct lpddr_private *lpddr = map->fldrv_priv;
-	int chipnum = adr >> lpddr->chipshift;
+	int chipnum = adr >> lpddr->chipshift, err = 0;
 	unsigned long ofs;
 
 	/* ofs: offset within the first chip that the first read should start */
@@ -603,9 +603,11 @@ static void lpddr_unpoint (struct mtd_info *mtd, loff_t adr, size_t len)
 			chip->ref_point_counter--;
 			if (chip->ref_point_counter == 0)
 				chip->state = FL_READY;
-		} else
+		} else {
 			printk(KERN_WARNING "%s: Warning: unpoint called on non"
 					"pointed region\n", map->name);
+			err = -EINVAL;
+		}
 
 		put_chip(map, chip);
 		mutex_unlock(&chip->mutex);
@@ -614,6 +616,8 @@ static void lpddr_unpoint (struct mtd_info *mtd, loff_t adr, size_t len)
 		ofs = 0;
 		chipnum++;
 	}
+
+	return err;
 }
 
 static int lpddr_write_buffers(struct mtd_info *mtd, loff_t to, size_t len,
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 4f01079..da8a0b2 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -92,11 +92,11 @@ static int part_point(struct mtd_info *mtd, loff_t from, size_t len,
 			 virt, phys);
 }
 
-static void part_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
+static int part_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
 {
 	struct mtd_part *part = PART(mtd);
 
-	mtd_unpoint(part->master, from + part->offset, len);
+	return mtd_unpoint(part->master, from + part->offset, len);
 }
 
 static unsigned long part_get_unmapped_area(struct mtd_info *mtd,
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index e2e5456..8c24311 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -177,7 +177,7 @@ struct mtd_info {
 	int (*_erase) (struct mtd_info *mtd, struct erase_info *instr);
 	int (*_point) (struct mtd_info *mtd, loff_t from, size_t len,
 		       size_t *retlen, void **virt, resource_size_t *phys);
-	void (*_unpoint) (struct mtd_info *mtd, loff_t from, size_t len);
+	int (*_unpoint) (struct mtd_info *mtd, loff_t from, size_t len);
 	unsigned long (*_get_unmapped_area) (struct mtd_info *mtd,
 					     unsigned long len,
 					     unsigned long offset,
@@ -265,8 +265,10 @@ static inline int mtd_point(struct mtd_info *mtd, loff_t from, size_t len,
 }
 
 /* We probably shouldn't allow XIP if the unpoint isn't a NULL */
-static inline void mtd_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
+static inline int mtd_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
 {
+	if (!mtd->_point)
+		return -EOPNOTSUPP;
 	return mtd->_unpoint(mtd, from, len);
 }
 
-- 
1.7.9
