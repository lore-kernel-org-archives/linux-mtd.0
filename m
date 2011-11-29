Received: from smtp.newsguy.com ([74.209.136.69])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RVC8k-00054x-IE
 for linux-mtd@lists.infradead.org; Tue, 29 Nov 2011 01:05:44 +0000
From: Mike Dunn <mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 5/5] backport mtd api change to everything else
Date: Mon, 28 Nov 2011 17:05:05 -0800
Message-Id: <1322528705-19802-1-git-send-email-mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Mike Dunn <mikedunn@newsguy.com>,
 Scott Branden <sbranden@broadcom.com>, Wan ZongShun <mcuos.com@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Sukumar Ghorai <s-ghorai@ti.com>,
 Manuel Lauss <manuel.lauss@googlemail.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Vimal Singh <vimal.newwork@gmail.com>, Ralf Baechle <ralf@linux-mips.org>,
 Jiandong Zheng <jdzheng@broadcom.com>, Andres Salomon <dilinger@queued.net>,
 Olof Johansson <olof@lixom.net>, Jamie Iles <jamie@jamieiles.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Backport of the mtd api change to everything else: devices, chips, partitioning,
translation layers, etc.

Signed-off-by: Mike Dunn <mikedunn@newsguy.com>
---
 drivers/mtd/afs.c                   |    8 ++++++--
 drivers/mtd/ar7part.c               |   10 ++++++----
 drivers/mtd/chips/cfi_cmdset_0001.c |    9 ++++++---
 drivers/mtd/chips/cfi_cmdset_0002.c |    9 ++++++---
 drivers/mtd/chips/cfi_cmdset_0020.c |    9 ++++++---
 drivers/mtd/chips/map_absent.c      |    9 ++++++---
 drivers/mtd/chips/map_ram.c         |    7 +++++--
 drivers/mtd/chips/map_rom.c         |    7 +++++--
 drivers/mtd/devices/block2mtd.c     |    5 ++++-
 drivers/mtd/devices/doc2000.c       |    8 +++++---
 drivers/mtd/devices/doc2001.c       |    8 ++++++--
 drivers/mtd/devices/doc2001plus.c   |    7 +++++--
 drivers/mtd/devices/docg3.c         |    5 ++++-
 drivers/mtd/devices/lart.c          |    4 +++-
 drivers/mtd/devices/m25p80.c        |    4 +++-
 drivers/mtd/devices/ms02-nv.c       |    5 +++--
 drivers/mtd/devices/mtd_dataflash.c |    5 +++--
 drivers/mtd/devices/mtdram.c        |    3 ++-
 drivers/mtd/devices/phram.c         |    4 +++-
 drivers/mtd/devices/pmc551.c        |    5 ++++-
 drivers/mtd/devices/slram.c         |    7 +++++--
 drivers/mtd/devices/sst25l.c        |    5 ++++-
 drivers/mtd/ftl.c                   |   34 +++++++++++++++++++++++-----------
 drivers/mtd/inftlcore.c             |    9 ++++++---
 drivers/mtd/inftlmount.c            |    9 ++++++---
 drivers/mtd/lpddr/lpddr_cmds.c      |    4 ++--
 drivers/mtd/maps/bcm963xx-flash.c   |    7 +++++--
 drivers/mtd/nand/diskonchip.c       |    6 ++++--
 drivers/mtd/nftlcore.c              |    9 ++++++---
 drivers/mtd/nftlmount.c             |    9 ++++++---
 drivers/mtd/redboot.c               |    4 +++-
 drivers/mtd/rfd_ftl.c               |   18 +++++++++++++-----
 drivers/mtd/ssfdc.c                 |    7 +++++--
 include/linux/mtd/pmc551.h          |    3 ++-
 34 files changed, 181 insertions(+), 81 deletions(-)

diff --git a/drivers/mtd/afs.c b/drivers/mtd/afs.c
index 89a02f6..435d98d 100644
--- a/drivers/mtd/afs.c
+++ b/drivers/mtd/afs.c
@@ -74,8 +74,10 @@ afs_read_footer(struct mtd_info *mtd, u_int *img_start, u_int *iis_start,
 	u_int ptr = off + mtd->erasesize - sizeof(fs);
 	size_t sz;
 	int ret;
+	unsigned int max_bitflips;
 
-	ret = mtd->read(mtd, ptr, sizeof(fs), &sz, (u_char *) &fs);
+	ret = mtd->read(mtd, ptr, sizeof(fs), &sz, (u_char *) &fs,
+			&max_bitflips);
 	if (ret >= 0 && sz != sizeof(fs))
 		ret = -EINVAL;
 
@@ -130,9 +132,11 @@ afs_read_iis(struct mtd_info *mtd, struct image_info_struct *iis, u_int ptr)
 {
 	size_t sz;
 	int ret, i;
+	unsigned int max_bitflips;
 
 	memset(iis, 0, sizeof(*iis));
-	ret = mtd->read(mtd, ptr, sizeof(*iis), &sz, (u_char *) iis);
+	ret = mtd->read(mtd, ptr, sizeof(*iis), &sz, (u_char *) iis,
+			&max_bitflips);
 	if (ret < 0)
 		goto failed;
 
diff --git a/drivers/mtd/ar7part.c b/drivers/mtd/ar7part.c
index f40ea45..95fb208 100644
--- a/drivers/mtd/ar7part.c
+++ b/drivers/mtd/ar7part.c
@@ -52,6 +52,7 @@ static int create_mtd_partitions(struct mtd_info *master,
 	struct ar7_bin_rec header;
 	unsigned int offset;
 	size_t len;
+	unsigned int max_bitflips;
 	unsigned int pre_size = master->erasesize, post_size = 0;
 	unsigned int root_offset = ROOT_OFFSET;
 
@@ -74,7 +75,8 @@ static int create_mtd_partitions(struct mtd_info *master,
 	do { /* Try 10 blocks starting from master->erasesize */
 		offset = pre_size;
 		master->read(master, offset,
-			     sizeof(header), &len, (uint8_t *)&header);
+			     sizeof(header), &len, (uint8_t *)&header,
+			     &max_bitflips);
 		if (!strncmp((char *)&header, "TIENV0.8", 8))
 			ar7_parts[1].offset = pre_size;
 		if (header.checksum == LOADER_MAGIC1)
@@ -96,7 +98,7 @@ static int create_mtd_partitions(struct mtd_info *master,
 		while (header.length) {
 			offset += sizeof(header) + header.length;
 			master->read(master, offset, sizeof(header),
-				     &len, (uint8_t *)&header);
+				     &len, (uint8_t *)&header, &max_bitflips);
 		}
 		root_offset = offset + sizeof(header) + 4;
 		break;
@@ -104,7 +106,7 @@ static int create_mtd_partitions(struct mtd_info *master,
 		while (header.length) {
 			offset += sizeof(header) + header.length;
 			master->read(master, offset, sizeof(header),
-				     &len, (uint8_t *)&header);
+				     &len, (uint8_t *)&header, &max_bitflips);
 		}
 		root_offset = offset + sizeof(header) + 4 + 0xff;
 		root_offset &= ~(uint32_t)0xff;
@@ -115,7 +117,7 @@ static int create_mtd_partitions(struct mtd_info *master,
 	}
 
 	master->read(master, root_offset,
-		sizeof(header), &len, (u8 *)&header);
+		sizeof(header), &len, (u8 *)&header, &max_bitflips);
 	if (header.checksum != SQUASHFS_MAGIC) {
 		root_offset += master->erasesize - 1;
 		root_offset &= ~(master->erasesize - 1);
diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index e1e122f..9107acf 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -54,7 +54,8 @@
 #define AT49BV640D	0x02de
 #define AT49BV640DT	0x02db
 
-static int cfi_intelext_read (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
+static int cfi_intelext_read(struct mtd_info *, loff_t, size_t, size_t *,
+			      u_char *, unsigned int *);
 static int cfi_intelext_write_words(struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
 static int cfi_intelext_write_buffers(struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
 static int cfi_intelext_writev(struct mtd_info *, const struct kvec *, unsigned long, loff_t, size_t *);
@@ -1444,7 +1445,9 @@ static inline int do_read_onechip(struct map_info *map, struct flchip *chip, lof
 	return 0;
 }
 
-static int cfi_intelext_read (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf)
+static int cfi_intelext_read(struct mtd_info *mtd, loff_t from, size_t len,
+			     size_t *retlen, u_char *buf,
+			     unsigned int *max_bitflips)
 {
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
@@ -1456,7 +1459,7 @@ static int cfi_intelext_read (struct mtd_info *mtd, loff_t from, size_t len, siz
 	chipnum = (from >> cfi->chipshift);
 	ofs = from - (chipnum <<  cfi->chipshift);
 
-	*retlen = 0;
+	*retlen = *max_bitflips = 0;
 
 	while (len) {
 		unsigned long thislen;
diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 8d70895..75b8236 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -48,7 +48,8 @@
 #define SST49LF008A		0x005a
 #define AT49BV6416		0x00d6
 
-static int cfi_amdstd_read (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
+static int cfi_amdstd_read(struct mtd_info *, loff_t, size_t, size_t *,
+			   u_char *, unsigned int *);
 static int cfi_amdstd_write_words(struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
 static int cfi_amdstd_write_buffers(struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
 static int cfi_amdstd_erase_chip(struct mtd_info *, struct erase_info *);
@@ -1004,7 +1005,9 @@ static inline int do_read_onechip(struct map_info *map, struct flchip *chip, lof
 }
 
 
-static int cfi_amdstd_read (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf)
+static int cfi_amdstd_read(struct mtd_info *mtd, loff_t from, size_t len,
+			   size_t *retlen, u_char *buf,
+			   unsigned int *max_bitflips)
 {
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
@@ -1018,7 +1021,7 @@ static int cfi_amdstd_read (struct mtd_info *mtd, loff_t from, size_t len, size_
 	ofs = from - (chipnum <<  cfi->chipshift);
 
 
-	*retlen = 0;
+	*retlen = *max_bitflips = 0;
 
 	while (len) {
 		unsigned long thislen;
diff --git a/drivers/mtd/chips/cfi_cmdset_0020.c b/drivers/mtd/chips/cfi_cmdset_0020.c
index 666c52f..d174dde 100644
--- a/drivers/mtd/chips/cfi_cmdset_0020.c
+++ b/drivers/mtd/chips/cfi_cmdset_0020.c
@@ -35,7 +35,8 @@
 #include <linux/mtd/mtd.h>
 
 
-static int cfi_staa_read(struct mtd_info *, loff_t, size_t, size_t *, u_char *);
+static int cfi_staa_read(struct mtd_info *, loff_t, size_t, size_t *, u_char *,
+			 unsigned int *);
 static int cfi_staa_write_buffers(struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
 static int cfi_staa_writev(struct mtd_info *mtd, const struct kvec *vecs,
 		unsigned long count, loff_t to, size_t *retlen);
@@ -382,7 +383,9 @@ static inline int do_read_onechip(struct map_info *map, struct flchip *chip, lof
 	return 0;
 }
 
-static int cfi_staa_read (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf)
+static int cfi_staa_read(struct mtd_info *mtd, loff_t from, size_t len,
+			 size_t *retlen, u_char *buf,
+			 unsigned int *max_bitflips)
 {
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
@@ -394,7 +397,7 @@ static int cfi_staa_read (struct mtd_info *mtd, loff_t from, size_t len, size_t
 	chipnum = (from >> cfi->chipshift);
 	ofs = from - (chipnum <<  cfi->chipshift);
 
-	*retlen = 0;
+	*retlen = *max_bitflips = 0;
 
 	while (len) {
 		unsigned long thislen;
diff --git a/drivers/mtd/chips/map_absent.c b/drivers/mtd/chips/map_absent.c
index f2b8729..14854fa 100644
--- a/drivers/mtd/chips/map_absent.c
+++ b/drivers/mtd/chips/map_absent.c
@@ -26,7 +26,8 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/map.h>
 
-static int map_absent_read (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
+static int map_absent_read(struct mtd_info *, loff_t, size_t, size_t *,
+			   u_char *, unsigned int *);
 static int map_absent_write (struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
 static int map_absent_erase (struct mtd_info *, struct erase_info *);
 static void map_absent_sync (struct mtd_info *);
@@ -68,9 +69,11 @@ static struct mtd_info *map_absent_probe(struct map_info *map)
 }
 
 
-static int map_absent_read(struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf)
+static int map_absent_read(struct mtd_info *mtd, loff_t from, size_t len,
+			   size_t *retlen, u_char *buf,
+			   unsigned int *max_bitflips)
 {
-	*retlen = 0;
+	*retlen = *max_bitflips = 0;
 	return -ENODEV;
 }
 
diff --git a/drivers/mtd/chips/map_ram.c b/drivers/mtd/chips/map_ram.c
index 67640cc..b2c9729 100644
--- a/drivers/mtd/chips/map_ram.c
+++ b/drivers/mtd/chips/map_ram.c
@@ -15,7 +15,8 @@
 #include <linux/mtd/map.h>
 
 
-static int mapram_read (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
+static int mapram_read(struct mtd_info *, loff_t, size_t, size_t *, u_char *,
+		       unsigned int *);
 static int mapram_write (struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
 static int mapram_erase (struct mtd_info *, struct erase_info *);
 static void mapram_nop (struct mtd_info *);
@@ -95,12 +96,14 @@ static unsigned long mapram_unmapped_area(struct mtd_info *mtd,
 	return (unsigned long) map->virt + offset;
 }
 
-static int mapram_read (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf)
+static int mapram_read(struct mtd_info *mtd, loff_t from, size_t len,
+		       size_t *retlen, u_char *buf, unsigned int *max_bitflips)
 {
 	struct map_info *map = mtd->priv;
 
 	map_copy_from(map, buf, from, len);
 	*retlen = len;
+	*max_bitflips = 0;
 	return 0;
 }
 
diff --git a/drivers/mtd/chips/map_rom.c b/drivers/mtd/chips/map_rom.c
index 593f73d..1b23a6d 100644
--- a/drivers/mtd/chips/map_rom.c
+++ b/drivers/mtd/chips/map_rom.c
@@ -14,7 +14,8 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/map.h>
 
-static int maprom_read (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
+static int maprom_read(struct mtd_info *, loff_t, size_t, size_t *, u_char *,
+		       unsigned int *);
 static int maprom_write (struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
 static void maprom_nop (struct mtd_info *);
 static struct mtd_info *map_rom_probe(struct map_info *map);
@@ -69,12 +70,14 @@ static unsigned long maprom_unmapped_area(struct mtd_info *mtd,
 	return (unsigned long) map->virt + offset;
 }
 
-static int maprom_read (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf)
+static int maprom_read(struct mtd_info *mtd, loff_t from, size_t len,
+		       size_t *retlen, u_char *buf, unsigned int *max_bitflips)
 {
 	struct map_info *map = mtd->priv;
 
 	map_copy_from(map, buf, from, len);
 	*retlen = len;
+	*max_bitflips = 0;
 	return 0;
 }
 
diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index b78f231..0f5c295 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -97,7 +97,8 @@ static int block2mtd_erase(struct mtd_info *mtd, struct erase_info *instr)
 
 
 static int block2mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
-		size_t *retlen, u_char *buf)
+			  size_t *retlen, u_char *buf,
+			  unsigned int *max_bitflips)
 {
 	struct block2mtd_dev *dev = mtd->priv;
 	struct page *page;
@@ -105,6 +106,8 @@ static int block2mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
 	int offset = from & (PAGE_SIZE-1);
 	int cpylen;
 
+	*max_bitflips = 0;
+
 	if (from > mtd->size)
 		return -EINVAL;
 	if (from + len > mtd->size)
diff --git a/drivers/mtd/devices/doc2000.c b/drivers/mtd/devices/doc2000.c
index e9fad91..f1b777d 100644
--- a/drivers/mtd/devices/doc2000.c
+++ b/drivers/mtd/devices/doc2000.c
@@ -48,7 +48,7 @@
 */
 
 static int doc_read(struct mtd_info *mtd, loff_t from, size_t len,
-		    size_t *retlen, u_char *buf);
+		    size_t *retlen, u_char *buf, unsigned int *max_bitflips);
 static int doc_write(struct mtd_info *mtd, loff_t to, size_t len,
 		     size_t *retlen, const u_char *buf);
 static int doc_read_oob(struct mtd_info *mtd, loff_t ofs,
@@ -601,7 +601,7 @@ void DoC2k_init(struct mtd_info *mtd)
 EXPORT_SYMBOL_GPL(DoC2k_init);
 
 static int doc_read(struct mtd_info *mtd, loff_t from, size_t len,
-		    size_t * retlen, u_char * buf)
+		    size_t *retlen, u_char *buf, unsigned int *max_bitflips)
 {
 	struct DiskOnChip *this = mtd->priv;
 	void __iomem *docptr = this->virtadr;
@@ -617,7 +617,7 @@ static int doc_read(struct mtd_info *mtd, loff_t from, size_t len,
 
 	mutex_lock(&this->lock);
 
-	*retlen = 0;
+	*retlen = *max_bitflips = 0;
 	while (left) {
 		len = left;
 
@@ -716,6 +716,7 @@ static int doc_read(struct mtd_info *mtd, loff_t from, size_t len,
 				   checking *retlen */
 				ret = -EIO;
 			}
+			*max_bitflips = max(*max_bitflips, (unsigned)nb_errors);
 		}
 
 #ifdef PSYCHO_DEBUG
@@ -970,6 +971,7 @@ static int doc_read_oob(struct mtd_info *mtd, loff_t ofs,
 
 	DoC_ReadBuf(this, &buf[len256], len - len256);
 
+	ops->max_bitflips = 0;
 	ops->retlen = len;
 	/* Reading the full OOB data drops us off of the end of the page,
          * causing the flash device to go into busy mode, so we need
diff --git a/drivers/mtd/devices/doc2001.c b/drivers/mtd/devices/doc2001.c
index a3f7a27..39afb76 100644
--- a/drivers/mtd/devices/doc2001.c
+++ b/drivers/mtd/devices/doc2001.c
@@ -29,7 +29,7 @@
 #undef USE_MEMCPY
 
 static int doc_read(struct mtd_info *mtd, loff_t from, size_t len,
-		    size_t *retlen, u_char *buf);
+		    size_t *retlen, u_char *buf, unsigned int *max_bitflips);
 static int doc_write(struct mtd_info *mtd, loff_t to, size_t len,
 		     size_t *retlen, const u_char *buf);
 static int doc_read_oob(struct mtd_info *mtd, loff_t ofs,
@@ -382,7 +382,7 @@ void DoCMil_init(struct mtd_info *mtd)
 EXPORT_SYMBOL_GPL(DoCMil_init);
 
 static int doc_read (struct mtd_info *mtd, loff_t from, size_t len,
-		     size_t *retlen, u_char *buf)
+		     size_t *retlen, u_char *buf, unsigned int *max_bitflips)
 {
 	int i, ret;
 	volatile char dummy;
@@ -399,6 +399,8 @@ static int doc_read (struct mtd_info *mtd, loff_t from, size_t len,
 	if (from + len > ((from | 0x1ff) + 1))
 		len = ((from | 0x1ff) + 1) - from;
 
+	*max_bitflips = 0;
+
 	/* Find the chip which is to be used and select it */
 	if (this->curfloor != mychip->floor) {
 		DoC_SelectFloor(docptr, mychip->floor);
@@ -478,6 +480,7 @@ static int doc_read (struct mtd_info *mtd, loff_t from, size_t len,
 			   MTD-aware stuff can know about it by checking *retlen */
 			ret = -EIO;
 		}
+		*max_bitflips = (unsigned)nb_errors;
 	}
 
 #ifdef PSYCHO_DEBUG
@@ -671,6 +674,7 @@ static int doc_read_oob(struct mtd_info *mtd, loff_t ofs,
 	buf[len - 1] = ReadDOC(docptr, LastDataRead);
 
 	ops->retlen = len;
+	ops->max_bitflips = 0;
 
 	return 0;
 }
diff --git a/drivers/mtd/devices/doc2001plus.c b/drivers/mtd/devices/doc2001plus.c
index 99351bc..faaa67c 100644
--- a/drivers/mtd/devices/doc2001plus.c
+++ b/drivers/mtd/devices/doc2001plus.c
@@ -33,7 +33,7 @@
 #undef USE_MEMCPY
 
 static int doc_read(struct mtd_info *mtd, loff_t from, size_t len,
-		size_t *retlen, u_char *buf);
+		size_t *retlen, u_char *buf, unsigned int *max_bitflips);
 static int doc_write(struct mtd_info *mtd, loff_t to, size_t len,
 		size_t *retlen, const u_char *buf);
 static int doc_read_oob(struct mtd_info *mtd, loff_t ofs,
@@ -580,7 +580,7 @@ static int doc_dumpblk(struct mtd_info *mtd, loff_t from)
 #endif
 
 static int doc_read(struct mtd_info *mtd, loff_t from, size_t len,
-		    size_t *retlen, u_char *buf)
+		    size_t *retlen, u_char *buf, unsigned int *max_bitflips)
 {
 	int ret, i;
 	volatile char dummy;
@@ -598,6 +598,8 @@ static int doc_read(struct mtd_info *mtd, loff_t from, size_t len,
 	if (from + len > ((from | 0x1ff) + 1))
 		len = ((from | 0x1ff) + 1) - from;
 
+	*max_bitflips = 0;
+
 	DoC_CheckASIC(docptr);
 
 	/* Find the chip which is to be used and select it */
@@ -682,6 +684,7 @@ static int doc_read(struct mtd_info *mtd, loff_t from, size_t len,
 #endif
 				ret = -EIO;
 		}
+		*max_bitflips = (unsigned)nb_errors;
 	}
 
 #ifdef PSYCHO_DEBUG
diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index d7df311..2d35ea4 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -938,6 +938,8 @@ static int doc_read_oob(struct mtd_info *mtd, loff_t from,
 			}
 			if (ret > 0) {
 				mtd->ecc_stats.corrected += ret;
+				ops->max_bitflips = max(ops->max_bitflips,
+							(unsigned int)ret);
 				ret = -EUCLEAN;
 			}
 		}
@@ -974,7 +976,7 @@ err:
  * Returns 0 if read successfull, of -EIO, -EINVAL if an error occured
  */
 static int doc_read(struct mtd_info *mtd, loff_t from, size_t len,
-	     size_t *retlen, u_char *buf)
+		    size_t *retlen, u_char *buf, unsigned int *max_bitflips)
 {
 	struct mtd_oob_ops ops;
 	size_t ret;
@@ -986,6 +988,7 @@ static int doc_read(struct mtd_info *mtd, loff_t from, size_t len,
 
 	ret = doc_read_oob(mtd, from, &ops);
 	*retlen = ops.retlen;
+	*max_bitflips = ops.max_bitflips;
 	return ret;
 }
 
diff --git a/drivers/mtd/devices/lart.c b/drivers/mtd/devices/lart.c
index 3a11ea6..a81f8b0 100644
--- a/drivers/mtd/devices/lart.c
+++ b/drivers/mtd/devices/lart.c
@@ -434,7 +434,8 @@ static int flash_erase (struct mtd_info *mtd,struct erase_info *instr)
    return (0);
 }
 
-static int flash_read (struct mtd_info *mtd,loff_t from,size_t len,size_t *retlen,u_char *buf)
+static int flash_read(struct mtd_info *mtd, loff_t from, size_t len,
+		      size_t *retlen, u_char *buf, unsigned int *max_bitflips)
 {
 #ifdef LART_DEBUG
    printk (KERN_DEBUG "%s(from = 0x%.8x, len = %d)\n", __func__, (__u32)from, len);
@@ -469,6 +470,7 @@ static int flash_read (struct mtd_info *mtd,loff_t from,size_t len,size_t *retle
    if (len & (BUSWIDTH - 1))
 	 while (len--) *buf++ = read8 (from++);
 
+	*max_bitflips = 0;
    return (0);
 }
 
diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 884904d..5d6d1b9 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -340,7 +340,7 @@ static int m25p80_erase(struct mtd_info *mtd, struct erase_info *instr)
  * may be any size provided it is within the physical boundaries.
  */
 static int m25p80_read(struct mtd_info *mtd, loff_t from, size_t len,
-	size_t *retlen, u_char *buf)
+	size_t *retlen, u_char *buf, unsigned int *max_bitflips)
 {
 	struct m25p *flash = mtd_to_m25p(mtd);
 	struct spi_transfer t[2];
@@ -356,6 +356,8 @@ static int m25p80_read(struct mtd_info *mtd, loff_t from, size_t len,
 	if (from + len > flash->mtd.size)
 		return -EINVAL;
 
+	*max_bitflips = 0;
+
 	spi_message_init(&m);
 	memset(t, 0, (sizeof t));
 
diff --git a/drivers/mtd/devices/ms02-nv.c b/drivers/mtd/devices/ms02-nv.c
index 8423fb6..6430ce0 100644
--- a/drivers/mtd/devices/ms02-nv.c
+++ b/drivers/mtd/devices/ms02-nv.c
@@ -55,7 +55,8 @@ static struct mtd_info *root_ms02nv_mtd;
 
 
 static int ms02nv_read(struct mtd_info *mtd, loff_t from,
-			size_t len, size_t *retlen, u_char *buf)
+		       size_t len, size_t *retlen, u_char *buf,
+		       unsigned int *max_bitflips)
 {
 	struct ms02nv_private *mp = mtd->priv;
 
@@ -64,7 +65,7 @@ static int ms02nv_read(struct mtd_info *mtd, loff_t from,
 
 	memcpy(buf, mp->uaddr + from, len);
 	*retlen = len;
-
+	*max_bitflips = 0;
 	return 0;
 }
 
diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index d75c7af..dab5370 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -240,7 +240,8 @@ static int dataflash_erase(struct mtd_info *mtd, struct erase_info *instr)
  *   buf    : Buffer containing the data
  */
 static int dataflash_read(struct mtd_info *mtd, loff_t from, size_t len,
-			       size_t *retlen, u_char *buf)
+			  size_t *retlen, u_char *buf,
+			  unsigned int *max_bitflips)
 {
 	struct dataflash	*priv = mtd->priv;
 	struct spi_transfer	x[2] = { { .tx_dma = 0, }, };
@@ -252,7 +253,7 @@ static int dataflash_read(struct mtd_info *mtd, loff_t from, size_t len,
 	pr_debug("%s: read 0x%x..0x%x\n", dev_name(&priv->spi->dev),
 			(unsigned)from, (unsigned)(from + len));
 
-	*retlen = 0;
+	*retlen = *max_bitflips = 0;
 
 	/* Sanity checks */
 	if (!len)
diff --git a/drivers/mtd/devices/mtdram.c b/drivers/mtd/devices/mtdram.c
index 2562689..886c0c0 100644
--- a/drivers/mtd/devices/mtdram.c
+++ b/drivers/mtd/devices/mtdram.c
@@ -78,13 +78,14 @@ static unsigned long ram_get_unmapped_area(struct mtd_info *mtd,
 }
 
 static int ram_read(struct mtd_info *mtd, loff_t from, size_t len,
-		size_t *retlen, u_char *buf)
+		    size_t *retlen, u_char *buf, unsigned int *max_bitflips)
 {
 	if (from + len > mtd->size)
 		return -EINVAL;
 
 	memcpy(buf, mtd->priv + from, len);
 
+	*max_bitflips = 0;
 	*retlen = len;
 	return 0;
 }
diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index 23423bd..c8fd74f 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -75,13 +75,15 @@ static void phram_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
 }
 
 static int phram_read(struct mtd_info *mtd, loff_t from, size_t len,
-		size_t *retlen, u_char *buf)
+		size_t *retlen, u_char *buf, unsigned int *max_bitflips)
 {
 	u_char *start = mtd->priv;
 
 	if (from >= mtd->size)
 		return -EINVAL;
 
+	*max_bitflips = 0;
+
 	if (len > mtd->size - from)
 		len = mtd->size - from;
 
diff --git a/drivers/mtd/devices/pmc551.c b/drivers/mtd/devices/pmc551.c
index ecff765..acfc752 100644
--- a/drivers/mtd/devices/pmc551.c
+++ b/drivers/mtd/devices/pmc551.c
@@ -214,7 +214,8 @@ static void pmc551_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
 }
 
 static int pmc551_read(struct mtd_info *mtd, loff_t from, size_t len,
-			size_t * retlen, u_char * buf)
+		       size_t *retlen, u_char *buf,
+		       unsigned int *max_bitflips)
 {
 	struct mypriv *priv = mtd->priv;
 	u32 soff_hi, soff_lo;	/* start address offset hi/lo */
@@ -239,6 +240,8 @@ static int pmc551_read(struct mtd_info *mtd, loff_t from, size_t len,
 		return -EINVAL;
 	}
 
+	*max_bitflips = 0;
+
 	soff_hi = from & ~(priv->asize - 1);
 	eoff_hi = end & ~(priv->asize - 1);
 	soff_lo = from & (priv->asize - 1);
diff --git a/drivers/mtd/devices/slram.c b/drivers/mtd/devices/slram.c
index e585263..538941d 100644
--- a/drivers/mtd/devices/slram.c
+++ b/drivers/mtd/devices/slram.c
@@ -77,7 +77,8 @@ static int slram_erase(struct mtd_info *, struct erase_info *);
 static int slram_point(struct mtd_info *, loff_t, size_t, size_t *, void **,
 		resource_size_t *);
 static void slram_unpoint(struct mtd_info *, loff_t, size_t);
-static int slram_read(struct mtd_info *, loff_t, size_t, size_t *, u_char *);
+static int slram_read(struct mtd_info *, loff_t, size_t, size_t *, u_char *,
+		      unsigned int *);
 static int slram_write(struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
 
 static int slram_erase(struct mtd_info *mtd, struct erase_info *instr)
@@ -124,13 +125,15 @@ static void slram_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
 }
 
 static int slram_read(struct mtd_info *mtd, loff_t from, size_t len,
-		size_t *retlen, u_char *buf)
+		size_t *retlen, u_char *buf, unsigned int *max_bitflips)
 {
 	slram_priv_t *priv = mtd->priv;
 
 	if (from > mtd->size)
 		return -EINVAL;
 
+	*max_bitflips = 0;
+
 	if (from + len > mtd->size)
 		len = mtd->size - from;
 
diff --git a/drivers/mtd/devices/sst25l.c b/drivers/mtd/devices/sst25l.c
index d38ef3b..910ba91 100644
--- a/drivers/mtd/devices/sst25l.c
+++ b/drivers/mtd/devices/sst25l.c
@@ -215,7 +215,8 @@ static int sst25l_erase(struct mtd_info *mtd, struct erase_info *instr)
 }
 
 static int sst25l_read(struct mtd_info *mtd, loff_t from, size_t len,
-		       size_t *retlen, unsigned char *buf)
+		       size_t *retlen, unsigned char *buf,
+		       unsigned int *max_bitflips)
 {
 	struct sst25l_flash *flash = to_sst25l_flash(mtd);
 	struct spi_transfer transfer[2];
@@ -223,6 +224,8 @@ static int sst25l_read(struct mtd_info *mtd, loff_t from, size_t len,
 	unsigned char command[4];
 	int ret;
 
+	*max_bitflips = 0;
+
 	/* Sanity checking */
 	if (len == 0)
 		return 0;
diff --git a/drivers/mtd/ftl.c b/drivers/mtd/ftl.c
index c7382bb..2766315 100644
--- a/drivers/mtd/ftl.c
+++ b/drivers/mtd/ftl.c
@@ -161,6 +161,8 @@ static int scan_header(partition_t *part)
     loff_t offset, max_offset;
     size_t ret;
     int err;
+	unsigned int max_bitflips;
+
     part->header.FormattedSize = 0;
     max_offset = (0x100000<part->mbd.mtd->size)?0x100000:part->mbd.mtd->size;
     /* Search first megabyte for a valid FTL header */
@@ -169,7 +171,7 @@ static int scan_header(partition_t *part)
 	 offset += part->mbd.mtd->erasesize ? : 0x2000) {
 
 	err = part->mbd.mtd->read(part->mbd.mtd, offset, sizeof(header), &ret,
-			      (unsigned char *)&header);
+				  (unsigned char *)&header, &max_bitflips);
 
 	if (err)
 	    return err;
@@ -222,10 +224,11 @@ static int build_maps(partition_t *part)
 
     xvalid = xtrans = 0;
     for (i = 0; i < le16_to_cpu(part->header.NumEraseUnits); i++) {
+	unsigned int max_bitflips;
 	offset = ((i + le16_to_cpu(part->header.FirstPhysicalEUN))
 		      << part->header.EraseUnitSize);
 	ret = part->mbd.mtd->read(part->mbd.mtd, offset, sizeof(header), &retval,
-			      (unsigned char *)&header);
+			      (unsigned char *)&header, &max_bitflips);
 
 	if (ret)
 	    goto out_XferInfo;
@@ -285,13 +288,14 @@ static int build_maps(partition_t *part)
     part->FreeTotal = 0;
 
     for (i = 0; i < part->DataUnits; i++) {
+	unsigned int max_bitflips;
 	part->EUNInfo[i].Free = 0;
 	part->EUNInfo[i].Deleted = 0;
 	offset = part->EUNInfo[i].Offset + le32_to_cpu(header.BAMOffset);
 
 	ret = part->mbd.mtd->read(part->mbd.mtd, offset,
 			      part->BlocksPerUnit * sizeof(uint32_t), &retval,
-			      (unsigned char *)part->bam_cache);
+			      (unsigned char *)part->bam_cache, &max_bitflips);
 
 	if (ret)
 		goto out_bam_cache;
@@ -482,12 +486,14 @@ static int copy_erase_unit(partition_t *part, uint16_t srcunit,
 
     /* Read current BAM */
     if (part->bam_index != srcunit) {
+	unsigned int max_bitflips;
 
 	offset = eun->Offset + le32_to_cpu(part->header.BAMOffset);
 
 	ret = part->mbd.mtd->read(part->mbd.mtd, offset,
-			      part->BlocksPerUnit * sizeof(uint32_t),
-			      &retlen, (u_char *) (part->bam_cache));
+				  part->BlocksPerUnit * sizeof(uint32_t),
+				  &retlen, (u_char *) (part->bam_cache),
+				  &max_bitflips);
 
 	/* mark the cache bad, in case we get an error later */
 	part->bam_index = 0xffff;
@@ -517,14 +523,16 @@ static int copy_erase_unit(partition_t *part, uint16_t srcunit,
     free = 0;
     ret = 0;
     for (i = 0; i < part->BlocksPerUnit; i++) {
+	unsigned int max_bitflips;
 	switch (BLOCK_TYPE(le32_to_cpu(part->bam_cache[i]))) {
 	case BLOCK_CONTROL:
 	    /* This gets updated later */
 	    break;
 	case BLOCK_DATA:
 	case BLOCK_REPLACEMENT:
-	    ret = part->mbd.mtd->read(part->mbd.mtd, src, SECTOR_SIZE,
-                        &retlen, (u_char *) buf);
+		ret = part->mbd.mtd->read(part->mbd.mtd, src, SECTOR_SIZE,
+					  &retlen, (u_char *) buf,
+					  &max_bitflips);
 	    if (ret) {
 		printk(KERN_WARNING "ftl: Error reading old xfer unit in copy_erase_unit\n");
 		return ret;
@@ -744,13 +752,15 @@ static uint32_t find_free(partition_t *part)
 
     /* Is this unit's BAM cached? */
     if (eun != part->bam_index) {
+	unsigned int max_bitflips;
+
 	/* Invalidate cache */
 	part->bam_index = 0xffff;
 
 	ret = part->mbd.mtd->read(part->mbd.mtd,
 		       part->EUNInfo[eun].Offset + le32_to_cpu(part->header.BAMOffset),
 		       part->BlocksPerUnit * sizeof(uint32_t),
-		       &retlen, (u_char *) (part->bam_cache));
+		       &retlen, (u_char *) (part->bam_cache), &max_bitflips);
 
 	if (ret) {
 	    printk(KERN_WARNING"ftl: Error reading BAM in find_free\n");
@@ -808,10 +818,11 @@ static int ftl_read(partition_t *part, caddr_t buffer,
 	if (log_addr == 0xffffffff)
 	    memset(buffer, 0, SECTOR_SIZE);
 	else {
+	    unsigned int max_bitflips;
 	    offset = (part->EUNInfo[log_addr / bsize].Offset
 			  + (log_addr % bsize));
 	    ret = part->mbd.mtd->read(part->mbd.mtd, offset, SECTOR_SIZE,
-			   &retlen, (u_char *) buffer);
+			   &retlen, (u_char *) buffer, &max_bitflips);
 
 	    if (ret) {
 		printk(KERN_WARNING "Error reading MTD device in ftl_read()\n");
@@ -835,6 +846,7 @@ static int set_bam_entry(partition_t *part, uint32_t log_addr,
     uint32_t bsize, blk, le_virt_addr;
 #ifdef PSYCHO_DEBUG
     uint32_t old_addr;
+	unsigned int max_bitflips;
 #endif
     uint16_t eun;
     int ret;
@@ -849,8 +861,8 @@ static int set_bam_entry(partition_t *part, uint32_t log_addr,
 		  le32_to_cpu(part->header.BAMOffset));
 
 #ifdef PSYCHO_DEBUG
-    ret = part->mbd.mtd->read(part->mbd.mtd, offset, sizeof(uint32_t),
-                        &retlen, (u_char *)&old_addr);
+	ret = part->mbd.mtd->read(part->mbd.mtd, offset, sizeof(uint32_t),
+				  &retlen, (u_char *)&old_addr, &max_bitflips);
     if (ret) {
 	printk(KERN_WARNING"ftl: Error reading old_addr in set_bam_entry: %d\n",ret);
 	return ret;
diff --git a/drivers/mtd/inftlcore.c b/drivers/mtd/inftlcore.c
index dd034ef..284d3d3 100644
--- a/drivers/mtd/inftlcore.c
+++ b/drivers/mtd/inftlcore.c
@@ -326,6 +326,7 @@ static u16 INFTL_foldchain(struct INFTLrecord *inftl, unsigned thisVUC, unsigned
 	for (block = 0; block < inftl->EraseSize/SECTORSIZE ; block++) {
 		unsigned char movebuf[SECTORSIZE];
 		int ret;
+		unsigned int max_bitflips;
 
 		/*
 		 * If it's in the target EUN already, or if it's pending write,
@@ -345,12 +346,12 @@ static u16 INFTL_foldchain(struct INFTLrecord *inftl, unsigned thisVUC, unsigned
 
 		ret = mtd->read(mtd, (inftl->EraseSize * BlockMap[block]) +
 				(block * SECTORSIZE), SECTORSIZE, &retlen,
-				movebuf);
+				movebuf, &max_bitflips);
 		if (ret < 0 && !mtd_is_bitflip(ret)) {
 			ret = mtd->read(mtd,
 					(inftl->EraseSize * BlockMap[block]) +
 					(block * SECTORSIZE), SECTORSIZE,
-					&retlen, movebuf);
+					&retlen, movebuf, &max_bitflips);
 			if (ret != -EIO)
 				pr_debug("INFTL: error went away on retry?\n");
 		}
@@ -913,8 +914,10 @@ foundit:
 		memset(buffer, 0, SECTORSIZE);
 	} else {
 		size_t retlen;
+		unsigned int max_bitflips;
 		loff_t ptr = (thisEUN * inftl->EraseSize) + blockofs;
-		int ret = mtd->read(mtd, ptr, SECTORSIZE, &retlen, buffer);
+		int ret = mtd->read(mtd, ptr, SECTORSIZE, &retlen, buffer,
+				    &max_bitflips);
 
 		/* Handle corrected bit flips gracefully */
 		if (ret < 0 && !mtd_is_bitflip(ret))
diff --git a/drivers/mtd/inftlmount.c b/drivers/mtd/inftlmount.c
index 2ff601f..d049393 100644
--- a/drivers/mtd/inftlmount.c
+++ b/drivers/mtd/inftlmount.c
@@ -68,13 +68,14 @@ static int find_boot_record(struct INFTLrecord *inftl)
 	/* Search for a valid boot record */
 	for (block = 0; block < inftl->nb_blocks; block++) {
 		int ret;
+		unsigned int max_bitflips;
 
 		/*
 		 * Check for BNAND header first. Then whinge if it's found
 		 * but later checks fail.
 		 */
 		ret = mtd->read(mtd, block * inftl->EraseSize,
-				SECTORSIZE, &retlen, buf);
+				SECTORSIZE, &retlen, buf, &max_bitflips);
 		/* We ignore ret in case the ECC of the MediaHeader is invalid
 		   (which is apparently acceptable) */
 		if (retlen != SECTORSIZE) {
@@ -119,7 +120,7 @@ static int find_boot_record(struct INFTLrecord *inftl)
 
 		/* Read the spare media header at offset 4096 */
 		mtd->read(mtd, block * inftl->EraseSize + 4096,
-			  SECTORSIZE, &retlen, buf);
+			  SECTORSIZE, &retlen, buf, &max_bitflips);
 		if (retlen != SECTORSIZE) {
 			printk(KERN_WARNING "INFTL: Unable to read spare "
 			       "Media Header\n");
@@ -342,7 +343,9 @@ static int check_free_sectors(struct INFTLrecord *inftl, unsigned int address,
 	int i;
 
 	for (i = 0; i < len; i += SECTORSIZE) {
-		if (mtd->read(mtd, address, SECTORSIZE, &retlen, buf))
+		unsigned int max_bitflips;
+		if (mtd->read(mtd, address, SECTORSIZE, &retlen, buf,
+			      &max_bitflips))
 			return -1;
 		if (memcmpb(buf, 0xff, SECTORSIZE) != 0)
 			return -1;
diff --git a/drivers/mtd/lpddr/lpddr_cmds.c b/drivers/mtd/lpddr/lpddr_cmds.c
index 1dca31d..61d46e9 100644
--- a/drivers/mtd/lpddr/lpddr_cmds.c
+++ b/drivers/mtd/lpddr/lpddr_cmds.c
@@ -30,7 +30,7 @@
 #include <linux/module.h>
 
 static int lpddr_read(struct mtd_info *mtd, loff_t adr, size_t len,
-					size_t *retlen, u_char *buf);
+		      size_t *retlen, u_char *buf, unsigned int *max_bitflips);
 static int lpddr_write_buffers(struct mtd_info *mtd, loff_t to,
 				size_t len, size_t *retlen, const u_char *buf);
 static int lpddr_writev(struct mtd_info *mtd, const struct kvec *vecs,
@@ -504,7 +504,7 @@ int do_erase_oneblock(struct mtd_info *mtd, loff_t adr)
 }
 
 static int lpddr_read(struct mtd_info *mtd, loff_t adr, size_t len,
-			size_t *retlen, u_char *buf)
+		      size_t *retlen, u_char *buf, unsigned int *max_bitflips)
 {
 	struct map_info *map = mtd->priv;
 	struct lpddr_private *lpddr = map->fldrv_priv;
diff --git a/drivers/mtd/maps/bcm963xx-flash.c b/drivers/mtd/maps/bcm963xx-flash.c
index 608967f..87c68cb 100644
--- a/drivers/mtd/maps/bcm963xx-flash.c
+++ b/drivers/mtd/maps/bcm963xx-flash.c
@@ -59,6 +59,7 @@ static int parse_cfe_partitions(struct mtd_info *master,
 	int i;
 	char *boardid;
 	char *tagversion;
+	unsigned int max_bitflips;
 
 	/* Allocate memory for buffer */
 	buf = vmalloc(sizeof(struct bcm_tag));
@@ -67,7 +68,7 @@ static int parse_cfe_partitions(struct mtd_info *master,
 
 	/* Get the tag */
 	ret = master->read(master, master->erasesize, sizeof(struct bcm_tag),
-							&retlen, (void *)buf);
+			   &retlen, (void *)buf, &max_bitflips);
 	if (retlen != sizeof(struct bcm_tag)) {
 		vfree(buf);
 		return -EIO;
@@ -159,8 +160,10 @@ static int bcm963xx_detect_cfe(struct mtd_info *master)
 	char buf[9];
 	int ret;
 	size_t retlen;
+	unsigned int max_bitflips;
 
-	ret = master->read(master, idoffset, 8, &retlen, (void *)buf);
+	ret = master->read(master, idoffset, 8, &retlen, (void *)buf,
+			   &max_bitflips);
 	buf[retlen] = 0;
 	printk(KERN_INFO PFX "Read Signature value of %s\n", buf);
 
diff --git a/drivers/mtd/nand/diskonchip.c b/drivers/mtd/nand/diskonchip.c
index 5780dba..f9db18f 100644
--- a/drivers/mtd/nand/diskonchip.c
+++ b/drivers/mtd/nand/diskonchip.c
@@ -1070,9 +1070,11 @@ static int __init find_media_headers(struct mtd_info *mtd, u_char *buf, const ch
 	unsigned offs;
 	int ret;
 	size_t retlen;
+	unsigned int max_bitflips;
 
 	for (offs = 0; offs < mtd->size; offs += mtd->erasesize) {
-		ret = mtd->read(mtd, offs, mtd->writesize, &retlen, buf);
+		ret = mtd->read(mtd, offs, mtd->writesize, &retlen, buf,
+				&max_bitflips);
 		if (retlen != mtd->writesize)
 			continue;
 		if (ret) {
@@ -1097,7 +1099,7 @@ static int __init find_media_headers(struct mtd_info *mtd, u_char *buf, const ch
 	/* Only one mediaheader was found.  We want buf to contain a
 	   mediaheader on return, so we'll have to re-read the one we found. */
 	offs = doc->mh0_page << this->page_shift;
-	ret = mtd->read(mtd, offs, mtd->writesize, &retlen, buf);
+	ret = mtd->read(mtd, offs, mtd->writesize, &retlen, buf, &max_bitflips);
 	if (retlen != mtd->writesize) {
 		/* Insanity.  Give up. */
 		printk(KERN_ERR "Read DiskOnChip Media Header once, but can't reread it???\n");
diff --git a/drivers/mtd/nftlcore.c b/drivers/mtd/nftlcore.c
index cda77b5..1888c46 100644
--- a/drivers/mtd/nftlcore.c
+++ b/drivers/mtd/nftlcore.c
@@ -411,6 +411,7 @@ static u16 NFTL_foldchain (struct NFTLrecord *nftl, unsigned thisVUC, unsigned p
 	for (block = 0; block < nftl->EraseSize / 512 ; block++) {
 		unsigned char movebuf[512];
 		int ret;
+		unsigned int max_bitflips;
 
 		/* If it's in the target EUN already, or if it's pending write, do nothing */
 		if (BlockMap[block] == targetEUN ||
@@ -424,11 +425,11 @@ static u16 NFTL_foldchain (struct NFTLrecord *nftl, unsigned thisVUC, unsigned p
 			continue;
 
 		ret = mtd->read(mtd, (nftl->EraseSize * BlockMap[block]) + (block * 512),
-				512, &retlen, movebuf);
+				512, &retlen, movebuf, &max_bitflips);
 		if (ret < 0 && !mtd_is_bitflip(ret)) {
 			ret = mtd->read(mtd, (nftl->EraseSize * BlockMap[block])
 					+ (block * 512), 512, &retlen,
-					movebuf);
+					movebuf, &max_bitflips);
 			if (ret != -EIO)
 				printk("Error went away on retry.\n");
 		}
@@ -771,7 +772,9 @@ static int nftl_readblock(struct mtd_blktrans_dev *mbd, unsigned long block,
 	} else {
 		loff_t ptr = (lastgoodEUN * nftl->EraseSize) + blockofs;
 		size_t retlen;
-		int res = mtd->read(mtd, ptr, 512, &retlen, buffer);
+		unsigned int max_bitflips;
+		int res = mtd->read(mtd, ptr, 512, &retlen, buffer,
+				    &max_bitflips);
 
 		if (res < 0 && !mtd_is_bitflip(res))
 			return -EIO;
diff --git a/drivers/mtd/nftlmount.c b/drivers/mtd/nftlmount.c
index ac40925..17f1852 100644
--- a/drivers/mtd/nftlmount.c
+++ b/drivers/mtd/nftlmount.c
@@ -60,11 +60,12 @@ static int find_boot_record(struct NFTLrecord *nftl)
 	/* search for a valid boot record */
 	for (block = 0; block < nftl->nb_blocks; block++) {
 		int ret;
+		unsigned int max_bitflips;
 
 		/* Check for ANAND header first. Then can whinge if it's found but later
 		   checks fail */
 		ret = mtd->read(mtd, block * nftl->EraseSize, SECTORSIZE,
-				&retlen, buf);
+				&retlen, buf, &max_bitflips);
 		/* We ignore ret in case the ECC of the MediaHeader is invalid
 		   (which is apparently acceptable) */
 		if (retlen != SECTORSIZE) {
@@ -110,7 +111,7 @@ static int find_boot_record(struct NFTLrecord *nftl)
 
 		/* Finally reread to check ECC */
 		if ((ret = mtd->read(mtd, block * nftl->EraseSize, SECTORSIZE,
-				     &retlen, buf) < 0)) {
+				     &retlen, buf, &max_bitflips) < 0)) {
 			printk(KERN_NOTICE "ANAND header found at 0x%x in mtd%d, but ECC read failed (err %d)\n",
 			       block * nftl->EraseSize, nftl->mbd.mtd->index, ret);
 			continue;
@@ -272,9 +273,11 @@ static int check_free_sectors(struct NFTLrecord *nftl, unsigned int address, int
 	struct mtd_info *mtd = nftl->mbd.mtd;
 	size_t retlen;
 	int i;
+	unsigned int max_bitflips;
 
 	for (i = 0; i < len; i += SECTORSIZE) {
-		if (mtd->read(mtd, address, SECTORSIZE, &retlen, buf))
+		if (mtd->read(mtd, address, SECTORSIZE, &retlen, buf,
+			      &max_bitflips))
 			return -1;
 		if (memcmpb(buf, 0xff, SECTORSIZE) != 0)
 			return -1;
diff --git a/drivers/mtd/redboot.c b/drivers/mtd/redboot.c
index e366b1d..9a62362 100644
--- a/drivers/mtd/redboot.c
+++ b/drivers/mtd/redboot.c
@@ -72,6 +72,7 @@ static int parse_redboot_partitions(struct mtd_info *master,
 	int nulllen = 0;
 	int numslots;
 	unsigned long offset;
+	unsigned int max_bitflips;
 #ifdef CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED
 	static char nullstring[] = "unallocated";
 #endif
@@ -105,7 +106,8 @@ static int parse_redboot_partitions(struct mtd_info *master,
 	       master->name, offset);
 
 	ret = master->read(master, offset,
-			   master->erasesize, &retlen, (void *)buf);
+			   master->erasesize, &retlen, (void *)buf,
+			   &max_bitflips);
 
 	if (ret)
 		goto out;
diff --git a/drivers/mtd/rfd_ftl.c b/drivers/mtd/rfd_ftl.c
index 73ae217..0f3c00d 100644
--- a/drivers/mtd/rfd_ftl.c
+++ b/drivers/mtd/rfd_ftl.c
@@ -153,6 +153,7 @@ static int scan_header(struct partition *part)
 	int i, rc = -ENOMEM;
 	int blocks_found;
 	size_t retlen;
+	unsigned int max_bitflips;
 
 	sectors_per_block = part->block_size / SECTOR_SIZE;
 	part->total_blocks = (u32)part->mbd.mtd->size / part->block_size;
@@ -202,7 +203,8 @@ static int scan_header(struct partition *part)
 	for (i=0, blocks_found=0; i<part->total_blocks; i++) {
 		rc = part->mbd.mtd->read(part->mbd.mtd,
 				i * part->block_size, part->header_size,
-				&retlen, (u_char*)part->header_cache);
+				&retlen, (u_char *)part->header_cache,
+				&max_bitflips);
 
 		if (!rc && retlen != part->header_size)
 			rc = -EIO;
@@ -244,6 +246,7 @@ static int rfd_ftl_readsect(struct mtd_blktrans_dev *dev, u_long sector, char *b
 	u_long addr;
 	size_t retlen;
 	int rc;
+	unsigned int max_bitflips;
 
 	if (sector >= part->sector_count)
 		return -EIO;
@@ -251,7 +254,8 @@ static int rfd_ftl_readsect(struct mtd_blktrans_dev *dev, u_long sector, char *b
 	addr = part->sector_map[sector];
 	if (addr != -1) {
 		rc = part->mbd.mtd->read(part->mbd.mtd, addr, SECTOR_SIZE,
-						&retlen, (u_char*)buf);
+					 &retlen, (u_char *)buf,
+					 &max_bitflips);
 		if (!rc && retlen != SECTOR_SIZE)
 			rc = -EIO;
 
@@ -361,6 +365,7 @@ static int move_block_contents(struct partition *part, int block_no, u_long *old
 	u16 *map;
 	size_t retlen;
 	int i, rc = -ENOMEM;
+	unsigned int max_bitflips;
 
 	part->is_reclaiming = 1;
 
@@ -374,7 +379,7 @@ static int move_block_contents(struct partition *part, int block_no, u_long *old
 
 	rc = part->mbd.mtd->read(part->mbd.mtd,
 		part->blocks[block_no].offset, part->header_size,
-		&retlen, (u_char*)map);
+		&retlen, (u_char *)map, &max_bitflips);
 
 	if (!rc && retlen != part->header_size)
 		rc = -EIO;
@@ -390,6 +395,7 @@ static int move_block_contents(struct partition *part, int block_no, u_long *old
 	for (i=0; i<part->data_sectors_per_block; i++) {
 		u16 entry = le16_to_cpu(map[HEADER_MAP_OFFSET + i]);
 		u_long addr;
+		unsigned int max_bitflips;
 
 
 		if (entry == SECTOR_FREE || entry == SECTOR_DELETED)
@@ -414,7 +420,7 @@ static int move_block_contents(struct partition *part, int block_no, u_long *old
 			continue;
 		}
 		rc = part->mbd.mtd->read(part->mbd.mtd, addr,
-			SECTOR_SIZE, &retlen, sector_data);
+			SECTOR_SIZE, &retlen, sector_data, &max_bitflips);
 
 		if (!rc && retlen != SECTOR_SIZE)
 			rc = -EIO;
@@ -545,6 +551,7 @@ static int find_writable_block(struct partition *part, u_long *old_sector)
 {
 	int rc, block;
 	size_t retlen;
+	unsigned int max_bitflips;
 
 	block = find_free_block(part);
 
@@ -564,7 +571,8 @@ static int find_writable_block(struct partition *part, u_long *old_sector)
 	}
 
 	rc = part->mbd.mtd->read(part->mbd.mtd, part->blocks[block].offset,
-		part->header_size, &retlen, (u_char*)part->header_cache);
+				 part->header_size, &retlen,
+				 (u_char *)part->header_cache, &max_bitflips);
 
 	if (!rc && retlen != part->header_size)
 		rc = -EIO;
diff --git a/drivers/mtd/ssfdc.c b/drivers/mtd/ssfdc.c
index 976e3d2..c7bbd78 100644
--- a/drivers/mtd/ssfdc.c
+++ b/drivers/mtd/ssfdc.c
@@ -123,8 +123,9 @@ static int get_valid_cis_sector(struct mtd_info *mtd)
 	 */
 	for (k = 0, offset = 0; k < 4; k++, offset += mtd->erasesize) {
 		if (!mtd->block_isbad(mtd, offset)) {
+			unsigned int max_bitflips;
 			ret = mtd->read(mtd, offset, SECTOR_SIZE, &retlen,
-				sect_buf);
+					sect_buf, &max_bitflips);
 
 			/* CIS pattern match on the sector buffer */
 			if (ret < 0 || retlen != SECTOR_SIZE) {
@@ -154,9 +155,11 @@ static int read_physical_sector(struct mtd_info *mtd, uint8_t *sect_buf,
 {
 	int ret;
 	size_t retlen;
+	unsigned int max_bitflips;
 	loff_t offset = (loff_t)sect_no << SECTOR_SHIFT;
 
-	ret = mtd->read(mtd, offset, SECTOR_SIZE, &retlen, sect_buf);
+	ret = mtd->read(mtd, offset, SECTOR_SIZE, &retlen, sect_buf,
+			&max_bitflips);
 	if (ret < 0 || retlen != SECTOR_SIZE)
 		return -1;
 
diff --git a/include/linux/mtd/pmc551.h b/include/linux/mtd/pmc551.h
index 27ad40a..55a3e06 100644
--- a/include/linux/mtd/pmc551.h
+++ b/include/linux/mtd/pmc551.h
@@ -37,7 +37,8 @@ static int pmc551_erase(struct mtd_info *, struct erase_info *);
 static void pmc551_unpoint(struct mtd_info *, loff_t, size_t);
 static int pmc551_point(struct mtd_info *mtd, loff_t from, size_t len,
 		size_t *retlen, void **virt, resource_size_t *phys);
-static int pmc551_read(struct mtd_info *, loff_t, size_t, size_t *, u_char *);
+static int pmc551_read(struct mtd_info *, loff_t, size_t, size_t *, u_char *,
+		       unsigned int *);
 static int pmc551_write(struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
 
 
-- 
1.7.3.4
