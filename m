Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RWw5o-0007nt-V9
 for linux-mtd@lists.infradead.org; Sat, 03 Dec 2011 20:21:56 +0000
From: Mike Dunn <mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2] MTD: modify mtd api to return bitflip info on read
 operations
Date: Sat,  3 Dec 2011 12:20:40 -0800
Message-Id: <1322943640-11728-1-git-send-email-mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Mike Dunn <mikedunn@newsguy.com>,
 Scott Branden <sbranden@broadcom.com>, Wan ZongShun <mcuos.com@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
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

Hi,

This patch proposes a change to the mtd API for the purpose of returning to
the caller information on the number of bit errors corrected by the ecc
facilities of the device during read operations.  The affected functions are
read() and read_oob().

Currently, the -EUCLEAN value returned by read() and read_oob() is the only
information available to the caller regarding bit error corrections.  This
return value indicates simply that one or more bit errors were corrected.  To
make matters worse, this applies to the entire read operation, which can
potentially span the entire device.  Some NAND flash chips are error prone, and
compensate for that by using strong ecc algorithms capable of correcting
multiple errors in a single page.  In order for higher level code (e.g. UBI) to
effectively detect degradation of erase blocks on these devices, more detailed
information is needed.

For the read() method, an unsigned int * argument is added, which the driver
uses to return to the caller the maximum number of bitflips that were corrected
on any single page.  If NULL is passed in this argument, the driver ignores it.
For read_oob(), an element is added to the mtd_oob_ops structure for the same
purpose.  Devices without ecc capabilities (NOR flash, etc) would simply set the
value to 0.

This v2 includes the review comments from Artem Bityutskiy and Thomas Petazzoni,
mainly adding the option to pass max_bitflips = NULL (yes, of course! <smacks
forehead>), as well as some minor changes requested by Artem.  It has been
tested on mtdram, nandsim, onenandsim, and the diskonchip G4 flash (nand driver
currently out-of-tree), on partitioned and unpartitioned devices.  Drivers for
other devices have been compile-tested only, but the changes are trivial in most
cases.  Comments, criticisms, objections, gratefully received.

Thanks,
Mike


Signed-off-by: Mike Dunn <mikedunn@newsguy.com>
---
 drivers/mtd/afs.c                   |    4 ++--
 drivers/mtd/ar7part.c               |    8 ++++----
 drivers/mtd/chips/cfi_cmdset_0001.c |   10 ++++++++--
 drivers/mtd/chips/cfi_cmdset_0002.c |   10 ++++++++--
 drivers/mtd/chips/cfi_cmdset_0020.c |   10 ++++++++--
 drivers/mtd/chips/map_absent.c      |    7 +++++--
 drivers/mtd/chips/map_ram.c         |    8 ++++++--
 drivers/mtd/chips/map_rom.c         |    8 ++++++--
 drivers/mtd/devices/block2mtd.c     |    6 +++++-
 drivers/mtd/devices/doc2000.c       |   11 +++++++++--
 drivers/mtd/devices/doc2001.c       |    7 +++++--
 drivers/mtd/devices/doc2001plus.c   |    6 ++++--
 drivers/mtd/devices/docg3.c         |    6 +++++-
 drivers/mtd/devices/lart.c          |    5 ++++-
 drivers/mtd/devices/m25p80.c        |    5 ++++-
 drivers/mtd/devices/ms02-nv.c       |    6 ++++--
 drivers/mtd/devices/mtd_dataflash.c |    5 ++++-
 drivers/mtd/devices/mtdram.c        |    4 +++-
 drivers/mtd/devices/phram.c         |    5 ++++-
 drivers/mtd/devices/pmc551.c        |    6 +++++-
 drivers/mtd/devices/slram.c         |    8 ++++++--
 drivers/mtd/devices/sst25l.c        |    6 +++++-
 drivers/mtd/ftl.c                   |   24 +++++++++++++-----------
 drivers/mtd/inftlcore.c             |    7 ++++---
 drivers/mtd/inftlmount.c            |    6 +++---
 drivers/mtd/lpddr/lpddr_cmds.c      |    8 ++++++--
 drivers/mtd/maps/bcm963xx-flash.c   |    4 ++--
 drivers/mtd/mtdblock.c              |    7 ++++---
 drivers/mtd/mtdblock_ro.c           |    2 +-
 drivers/mtd/mtdchar.c               |    2 +-
 drivers/mtd/mtdconcat.c             |   16 ++++++++++++----
 drivers/mtd/mtdoops.c               |    3 ++-
 drivers/mtd/mtdpart.c               |    4 ++--
 drivers/mtd/mtdswap.c               |    4 ++--
 drivers/mtd/nand/diskonchip.c       |    4 ++--
 drivers/mtd/nand/nand_base.c        |   21 ++++++++++++++++++---
 drivers/mtd/nand/nand_bbt.c         |    7 ++++---
 drivers/mtd/nftlcore.c              |    6 +++---
 drivers/mtd/nftlmount.c             |    6 +++---
 drivers/mtd/onenand/onenand_base.c  |    6 +++++-
 drivers/mtd/redboot.c               |    2 +-
 drivers/mtd/rfd_ftl.c               |   12 +++++++-----
 drivers/mtd/ssfdc.c                 |    4 ++--
 drivers/mtd/tests/mtd_pagetest.c    |   30 ++++++++++++++++--------------
 drivers/mtd/tests/mtd_readtest.c    |    2 +-
 drivers/mtd/tests/mtd_speedtest.c   |    8 ++++----
 drivers/mtd/tests/mtd_stresstest.c  |    2 +-
 drivers/mtd/tests/mtd_subpagetest.c |    9 +++++----
 drivers/mtd/tests/mtd_torturetest.c |    2 +-
 drivers/mtd/ubi/io.c                |    6 +++---
 include/linux/mtd/mtd.h             |   11 ++++++++++-
 include/linux/mtd/pmc551.h          |    3 ++-
 52 files changed, 254 insertions(+), 125 deletions(-)

diff --git a/drivers/mtd/afs.c b/drivers/mtd/afs.c
index 89a02f6..a85c7b1 100644
--- a/drivers/mtd/afs.c
+++ b/drivers/mtd/afs.c
@@ -75,7 +75,7 @@ afs_read_footer(struct mtd_info *mtd, u_int *img_start, u_int *iis_start,
 	size_t sz;
 	int ret;
 
-	ret = mtd->read(mtd, ptr, sizeof(fs), &sz, (u_char *) &fs);
+	ret = mtd->read(mtd, ptr, sizeof(fs), &sz, (u_char *) &fs, NULL);
 	if (ret >= 0 && sz != sizeof(fs))
 		ret = -EINVAL;
 
@@ -132,7 +132,7 @@ afs_read_iis(struct mtd_info *mtd, struct image_info_struct *iis, u_int ptr)
 	int ret, i;
 
 	memset(iis, 0, sizeof(*iis));
-	ret = mtd->read(mtd, ptr, sizeof(*iis), &sz, (u_char *) iis);
+	ret = mtd->read(mtd, ptr, sizeof(*iis), &sz, (u_char *) iis, NULL);
 	if (ret < 0)
 		goto failed;
 
diff --git a/drivers/mtd/ar7part.c b/drivers/mtd/ar7part.c
index f40ea45..9c8e10a 100644
--- a/drivers/mtd/ar7part.c
+++ b/drivers/mtd/ar7part.c
@@ -74,7 +74,7 @@ static int create_mtd_partitions(struct mtd_info *master,
 	do { /* Try 10 blocks starting from master->erasesize */
 		offset = pre_size;
 		master->read(master, offset,
-			     sizeof(header), &len, (uint8_t *)&header);
+			     sizeof(header), &len, (uint8_t *)&header, NULL);
 		if (!strncmp((char *)&header, "TIENV0.8", 8))
 			ar7_parts[1].offset = pre_size;
 		if (header.checksum == LOADER_MAGIC1)
@@ -96,7 +96,7 @@ static int create_mtd_partitions(struct mtd_info *master,
 		while (header.length) {
 			offset += sizeof(header) + header.length;
 			master->read(master, offset, sizeof(header),
-				     &len, (uint8_t *)&header);
+				     &len, (uint8_t *)&header, NULL);
 		}
 		root_offset = offset + sizeof(header) + 4;
 		break;
@@ -104,7 +104,7 @@ static int create_mtd_partitions(struct mtd_info *master,
 		while (header.length) {
 			offset += sizeof(header) + header.length;
 			master->read(master, offset, sizeof(header),
-				     &len, (uint8_t *)&header);
+				     &len, (uint8_t *)&header, NULL);
 		}
 		root_offset = offset + sizeof(header) + 4 + 0xff;
 		root_offset &= ~(uint32_t)0xff;
@@ -115,7 +115,7 @@ static int create_mtd_partitions(struct mtd_info *master,
 	}
 
 	master->read(master, root_offset,
-		sizeof(header), &len, (u8 *)&header);
+		     sizeof(header), &len, (u8 *)&header, NULL);
 	if (header.checksum != SQUASHFS_MAGIC) {
 		root_offset += master->erasesize - 1;
 		root_offset &= ~(master->erasesize - 1);
diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index e1e122f..128ad70 100644
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
@@ -1458,6 +1461,9 @@ static int cfi_intelext_read (struct mtd_info *mtd, loff_t from, size_t len, siz
 
 	*retlen = 0;
 
+	if (max_bitflips != NULL)
+		*max_bitflips = 0;
+
 	while (len) {
 		unsigned long thislen;
 
diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 8d70895..1c7ac7a 100644
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
@@ -1020,6 +1023,9 @@ static int cfi_amdstd_read (struct mtd_info *mtd, loff_t from, size_t len, size_
 
 	*retlen = 0;
 
+	if (max_bitflips != NULL)
+		*max_bitflips = 0;
+
 	while (len) {
 		unsigned long thislen;
 
diff --git a/drivers/mtd/chips/cfi_cmdset_0020.c b/drivers/mtd/chips/cfi_cmdset_0020.c
index 666c52f..f91af48 100644
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
@@ -396,6 +399,9 @@ static int cfi_staa_read (struct mtd_info *mtd, loff_t from, size_t len, size_t
 
 	*retlen = 0;
 
+	if (max_bitflips != NULL)
+		*max_bitflips = 0;
+
 	while (len) {
 		unsigned long thislen;
 
diff --git a/drivers/mtd/chips/map_absent.c b/drivers/mtd/chips/map_absent.c
index f2b8729..3649fbf 100644
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
@@ -68,7 +69,9 @@ static struct mtd_info *map_absent_probe(struct map_info *map)
 }
 
 
-static int map_absent_read(struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf)
+static int map_absent_read(struct mtd_info *mtd, loff_t from, size_t len,
+			   size_t *retlen, u_char *buf,
+			   unsigned int *max_bitflips)
 {
 	*retlen = 0;
 	return -ENODEV;
diff --git a/drivers/mtd/chips/map_ram.c b/drivers/mtd/chips/map_ram.c
index 67640cc..2dd7c63 100644
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
@@ -95,12 +96,15 @@ static unsigned long mapram_unmapped_area(struct mtd_info *mtd,
 	return (unsigned long) map->virt + offset;
 }
 
-static int mapram_read (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf)
+static int mapram_read(struct mtd_info *mtd, loff_t from, size_t len,
+		       size_t *retlen, u_char *buf, unsigned int *max_bitflips)
 {
 	struct map_info *map = mtd->priv;
 
 	map_copy_from(map, buf, from, len);
 	*retlen = len;
+	if (max_bitflips != NULL)
+		*max_bitflips = 0;
 	return 0;
 }
 
diff --git a/drivers/mtd/chips/map_rom.c b/drivers/mtd/chips/map_rom.c
index 593f73d..b802c13 100644
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
@@ -69,12 +70,15 @@ static unsigned long maprom_unmapped_area(struct mtd_info *mtd,
 	return (unsigned long) map->virt + offset;
 }
 
-static int maprom_read (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf)
+static int maprom_read(struct mtd_info *mtd, loff_t from, size_t len,
+		       size_t *retlen, u_char *buf, unsigned int *max_bitflips)
 {
 	struct map_info *map = mtd->priv;
 
 	map_copy_from(map, buf, from, len);
 	*retlen = len;
+	if (max_bitflips != NULL)
+		*max_bitflips = 0;
 	return 0;
 }
 
diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index b78f231..8e989c6 100644
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
@@ -105,6 +106,9 @@ static int block2mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
 	int offset = from & (PAGE_SIZE-1);
 	int cpylen;
 
+	if (max_bitflips != NULL)
+		*max_bitflips = 0;
+
 	if (from > mtd->size)
 		return -EINVAL;
 	if (from + len > mtd->size)
diff --git a/drivers/mtd/devices/doc2000.c b/drivers/mtd/devices/doc2000.c
index e9fad91..c3413f4 100644
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
@@ -610,6 +610,7 @@ static int doc_read(struct mtd_info *mtd, loff_t from, size_t len,
 	volatile char dummy;
 	int i, len256 = 0, ret=0;
 	size_t left = len;
+	unsigned int bitflips = 0;
 
 	/* Don't allow read past end of device */
 	if (from >= this->totlen)
@@ -716,6 +717,8 @@ static int doc_read(struct mtd_info *mtd, loff_t from, size_t len,
 				   checking *retlen */
 				ret = -EIO;
 			}
+			bitflips = max_t(unsigned int, bitflips,
+					 (unsigned)nb_errors);
 		}
 
 #ifdef PSYCHO_DEBUG
@@ -739,6 +742,9 @@ static int doc_read(struct mtd_info *mtd, loff_t from, size_t len,
 		buf += len;
 	}
 
+	if (max_bitflips != NULL)
+		*max_bitflips = bitflips;
+
 	mutex_unlock(&this->lock);
 
 	return ret;
@@ -970,6 +976,7 @@ static int doc_read_oob(struct mtd_info *mtd, loff_t ofs,
 
 	DoC_ReadBuf(this, &buf[len256], len - len256);
 
+	ops->max_bitflips = 0;
 	ops->retlen = len;
 	/* Reading the full OOB data drops us off of the end of the page,
          * causing the flash device to go into busy mode, so we need
diff --git a/drivers/mtd/devices/doc2001.c b/drivers/mtd/devices/doc2001.c
index a3f7a27..58fa69f 100644
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
@@ -478,6 +478,8 @@ static int doc_read (struct mtd_info *mtd, loff_t from, size_t len,
 			   MTD-aware stuff can know about it by checking *retlen */
 			ret = -EIO;
 		}
+		if (max_bitflips != NULL)
+			*max_bitflips = (unsigned)nb_errors;
 	}
 
 #ifdef PSYCHO_DEBUG
@@ -671,6 +673,7 @@ static int doc_read_oob(struct mtd_info *mtd, loff_t ofs,
 	buf[len - 1] = ReadDOC(docptr, LastDataRead);
 
 	ops->retlen = len;
+	ops->max_bitflips = 0;
 
 	return 0;
 }
diff --git a/drivers/mtd/devices/doc2001plus.c b/drivers/mtd/devices/doc2001plus.c
index 99351bc..df62fce 100644
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
@@ -682,6 +682,8 @@ static int doc_read(struct mtd_info *mtd, loff_t from, size_t len,
 #endif
 				ret = -EIO;
 		}
+		if (max_bitflips != NULL)
+			*max_bitflips = (unsigned)nb_errors;
 	}
 
 #ifdef PSYCHO_DEBUG
diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index f7490a014..266a893 100644
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
@@ -986,6 +988,8 @@ static int doc_read(struct mtd_info *mtd, loff_t from, size_t len,
 
 	ret = doc_read_oob(mtd, from, &ops);
 	*retlen = ops.retlen;
+	if (max_bitflips != NULL)
+		*max_bitflips = ops.max_bitflips;
 	return ret;
 }
 
diff --git a/drivers/mtd/devices/lart.c b/drivers/mtd/devices/lart.c
index 3a11ea6..09f37b0 100644
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
@@ -469,6 +470,8 @@ static int flash_read (struct mtd_info *mtd,loff_t from,size_t len,size_t *retle
    if (len & (BUSWIDTH - 1))
 	 while (len--) *buf++ = read8 (from++);
 
+	if (max_bitflips != NULL)
+		*max_bitflips = 0;
    return (0);
 }
 
diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 7c60ddd..c42f5dd 100644
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
@@ -356,6 +356,9 @@ static int m25p80_read(struct mtd_info *mtd, loff_t from, size_t len,
 	if (from + len > flash->mtd.size)
 		return -EINVAL;
 
+	if (max_bitflips != NULL)
+		*max_bitflips = 0;
+
 	spi_message_init(&m);
 	memset(t, 0, (sizeof t));
 
diff --git a/drivers/mtd/devices/ms02-nv.c b/drivers/mtd/devices/ms02-nv.c
index 8423fb6..0a478fd 100644
--- a/drivers/mtd/devices/ms02-nv.c
+++ b/drivers/mtd/devices/ms02-nv.c
@@ -55,7 +55,8 @@ static struct mtd_info *root_ms02nv_mtd;
 
 
 static int ms02nv_read(struct mtd_info *mtd, loff_t from,
-			size_t len, size_t *retlen, u_char *buf)
+		       size_t len, size_t *retlen, u_char *buf,
+		       unsigned int *max_bitflips)
 {
 	struct ms02nv_private *mp = mtd->priv;
 
@@ -64,7 +65,8 @@ static int ms02nv_read(struct mtd_info *mtd, loff_t from,
 
 	memcpy(buf, mp->uaddr + from, len);
 	*retlen = len;
-
+	if (max_bitflips != NULL)
+		*max_bitflips = 0;
 	return 0;
 }
 
diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index 236057e..825a5f6 100644
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
@@ -253,6 +254,8 @@ static int dataflash_read(struct mtd_info *mtd, loff_t from, size_t len,
 			(unsigned)from, (unsigned)(from + len));
 
 	*retlen = 0;
+	if (max_bitflips != NULL)
+		*max_bitflips = 0;
 
 	/* Sanity checks */
 	if (!len)
diff --git a/drivers/mtd/devices/mtdram.c b/drivers/mtd/devices/mtdram.c
index 2562689..7e36b65 100644
--- a/drivers/mtd/devices/mtdram.c
+++ b/drivers/mtd/devices/mtdram.c
@@ -78,13 +78,15 @@ static unsigned long ram_get_unmapped_area(struct mtd_info *mtd,
 }
 
 static int ram_read(struct mtd_info *mtd, loff_t from, size_t len,
-		size_t *retlen, u_char *buf)
+		    size_t *retlen, u_char *buf, unsigned int *max_bitflips)
 {
 	if (from + len > mtd->size)
 		return -EINVAL;
 
 	memcpy(buf, mtd->priv + from, len);
 
+	if (max_bitflips != NULL)
+		*max_bitflips = 0;
 	*retlen = len;
 	return 0;
 }
diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index 23423bd..f1175d2 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -75,13 +75,16 @@ static void phram_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
 }
 
 static int phram_read(struct mtd_info *mtd, loff_t from, size_t len,
-		size_t *retlen, u_char *buf)
+		size_t *retlen, u_char *buf, unsigned int *max_bitflips)
 {
 	u_char *start = mtd->priv;
 
 	if (from >= mtd->size)
 		return -EINVAL;
 
+	if (max_bitflips != NULL)
+		*max_bitflips = 0;
+
 	if (len > mtd->size - from)
 		len = mtd->size - from;
 
diff --git a/drivers/mtd/devices/pmc551.c b/drivers/mtd/devices/pmc551.c
index ecff765..72d1b47 100644
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
@@ -239,6 +240,9 @@ static int pmc551_read(struct mtd_info *mtd, loff_t from, size_t len,
 		return -EINVAL;
 	}
 
+	if (max_bitflips != NULL)
+		*max_bitflips = 0;
+
 	soff_hi = from & ~(priv->asize - 1);
 	eoff_hi = end & ~(priv->asize - 1);
 	soff_lo = from & (priv->asize - 1);
diff --git a/drivers/mtd/devices/slram.c b/drivers/mtd/devices/slram.c
index e585263..4b56578 100644
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
@@ -124,13 +125,16 @@ static void slram_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
 }
 
 static int slram_read(struct mtd_info *mtd, loff_t from, size_t len,
-		size_t *retlen, u_char *buf)
+		size_t *retlen, u_char *buf, unsigned int *max_bitflips)
 {
 	slram_priv_t *priv = mtd->priv;
 
 	if (from > mtd->size)
 		return -EINVAL;
 
+	if (max_bitflips != NULL)
+		*max_bitflips = 0;
+
 	if (from + len > mtd->size)
 		len = mtd->size - from;
 
diff --git a/drivers/mtd/devices/sst25l.c b/drivers/mtd/devices/sst25l.c
index e45f62e..95bb989 100644
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
@@ -223,6 +224,9 @@ static int sst25l_read(struct mtd_info *mtd, loff_t from, size_t len,
 	unsigned char command[4];
 	int ret;
 
+	if (max_bitflips != NULL)
+		*max_bitflips = 0;
+
 	/* Sanity checking */
 	if (len == 0)
 		return 0;
diff --git a/drivers/mtd/ftl.c b/drivers/mtd/ftl.c
index c7382bb..c2d3b7e 100644
--- a/drivers/mtd/ftl.c
+++ b/drivers/mtd/ftl.c
@@ -161,6 +161,7 @@ static int scan_header(partition_t *part)
     loff_t offset, max_offset;
     size_t ret;
     int err;
+
     part->header.FormattedSize = 0;
     max_offset = (0x100000<part->mbd.mtd->size)?0x100000:part->mbd.mtd->size;
     /* Search first megabyte for a valid FTL header */
@@ -169,7 +170,7 @@ static int scan_header(partition_t *part)
 	 offset += part->mbd.mtd->erasesize ? : 0x2000) {
 
 	err = part->mbd.mtd->read(part->mbd.mtd, offset, sizeof(header), &ret,
-			      (unsigned char *)&header);
+				  (unsigned char *)&header, NULL);
 
 	if (err)
 	    return err;
@@ -225,7 +226,7 @@ static int build_maps(partition_t *part)
 	offset = ((i + le16_to_cpu(part->header.FirstPhysicalEUN))
 		      << part->header.EraseUnitSize);
 	ret = part->mbd.mtd->read(part->mbd.mtd, offset, sizeof(header), &retval,
-			      (unsigned char *)&header);
+				  (unsigned char *)&header, NULL);
 
 	if (ret)
 	    goto out_XferInfo;
@@ -291,7 +292,7 @@ static int build_maps(partition_t *part)
 
 	ret = part->mbd.mtd->read(part->mbd.mtd, offset,
 			      part->BlocksPerUnit * sizeof(uint32_t), &retval,
-			      (unsigned char *)part->bam_cache);
+			      (unsigned char *)part->bam_cache, NULL);
 
 	if (ret)
 		goto out_bam_cache;
@@ -486,8 +487,8 @@ static int copy_erase_unit(partition_t *part, uint16_t srcunit,
 	offset = eun->Offset + le32_to_cpu(part->header.BAMOffset);
 
 	ret = part->mbd.mtd->read(part->mbd.mtd, offset,
-			      part->BlocksPerUnit * sizeof(uint32_t),
-			      &retlen, (u_char *) (part->bam_cache));
+				  part->BlocksPerUnit * sizeof(uint32_t),
+				  &retlen, (u_char *) (part->bam_cache), NULL);
 
 	/* mark the cache bad, in case we get an error later */
 	part->bam_index = 0xffff;
@@ -523,8 +524,8 @@ static int copy_erase_unit(partition_t *part, uint16_t srcunit,
 	    break;
 	case BLOCK_DATA:
 	case BLOCK_REPLACEMENT:
-	    ret = part->mbd.mtd->read(part->mbd.mtd, src, SECTOR_SIZE,
-                        &retlen, (u_char *) buf);
+		ret = part->mbd.mtd->read(part->mbd.mtd, src, SECTOR_SIZE,
+					  &retlen, (u_char *) buf, NULL);
 	    if (ret) {
 		printk(KERN_WARNING "ftl: Error reading old xfer unit in copy_erase_unit\n");
 		return ret;
@@ -744,13 +745,14 @@ static uint32_t find_free(partition_t *part)
 
     /* Is this unit's BAM cached? */
     if (eun != part->bam_index) {
+
 	/* Invalidate cache */
 	part->bam_index = 0xffff;
 
 	ret = part->mbd.mtd->read(part->mbd.mtd,
 		       part->EUNInfo[eun].Offset + le32_to_cpu(part->header.BAMOffset),
 		       part->BlocksPerUnit * sizeof(uint32_t),
-		       &retlen, (u_char *) (part->bam_cache));
+		       &retlen, (u_char *) (part->bam_cache), NULL);
 
 	if (ret) {
 	    printk(KERN_WARNING"ftl: Error reading BAM in find_free\n");
@@ -811,7 +813,7 @@ static int ftl_read(partition_t *part, caddr_t buffer,
 	    offset = (part->EUNInfo[log_addr / bsize].Offset
 			  + (log_addr % bsize));
 	    ret = part->mbd.mtd->read(part->mbd.mtd, offset, SECTOR_SIZE,
-			   &retlen, (u_char *) buffer);
+				      &retlen, (u_char *) buffer, NULL);
 
 	    if (ret) {
 		printk(KERN_WARNING "Error reading MTD device in ftl_read()\n");
@@ -849,8 +851,8 @@ static int set_bam_entry(partition_t *part, uint32_t log_addr,
 		  le32_to_cpu(part->header.BAMOffset));
 
 #ifdef PSYCHO_DEBUG
-    ret = part->mbd.mtd->read(part->mbd.mtd, offset, sizeof(uint32_t),
-                        &retlen, (u_char *)&old_addr);
+	ret = part->mbd.mtd->read(part->mbd.mtd, offset, sizeof(uint32_t),
+				  &retlen, (u_char *)&old_addr, NULL);
     if (ret) {
 	printk(KERN_WARNING"ftl: Error reading old_addr in set_bam_entry: %d\n",ret);
 	return ret;
diff --git a/drivers/mtd/inftlcore.c b/drivers/mtd/inftlcore.c
index dd034ef..4f5e301 100644
--- a/drivers/mtd/inftlcore.c
+++ b/drivers/mtd/inftlcore.c
@@ -345,12 +345,12 @@ static u16 INFTL_foldchain(struct INFTLrecord *inftl, unsigned thisVUC, unsigned
 
 		ret = mtd->read(mtd, (inftl->EraseSize * BlockMap[block]) +
 				(block * SECTORSIZE), SECTORSIZE, &retlen,
-				movebuf);
+				movebuf, NULL);
 		if (ret < 0 && !mtd_is_bitflip(ret)) {
 			ret = mtd->read(mtd,
 					(inftl->EraseSize * BlockMap[block]) +
 					(block * SECTORSIZE), SECTORSIZE,
-					&retlen, movebuf);
+					&retlen, movebuf, NULL);
 			if (ret != -EIO)
 				pr_debug("INFTL: error went away on retry?\n");
 		}
@@ -914,7 +914,8 @@ foundit:
 	} else {
 		size_t retlen;
 		loff_t ptr = (thisEUN * inftl->EraseSize) + blockofs;
-		int ret = mtd->read(mtd, ptr, SECTORSIZE, &retlen, buffer);
+		int ret = mtd->read(mtd, ptr, SECTORSIZE, &retlen, buffer,
+				    NULL);
 
 		/* Handle corrected bit flips gracefully */
 		if (ret < 0 && !mtd_is_bitflip(ret))
diff --git a/drivers/mtd/inftlmount.c b/drivers/mtd/inftlmount.c
index 2ff601f..5eff38b 100644
--- a/drivers/mtd/inftlmount.c
+++ b/drivers/mtd/inftlmount.c
@@ -74,7 +74,7 @@ static int find_boot_record(struct INFTLrecord *inftl)
 		 * but later checks fail.
 		 */
 		ret = mtd->read(mtd, block * inftl->EraseSize,
-				SECTORSIZE, &retlen, buf);
+				SECTORSIZE, &retlen, buf, NULL);
 		/* We ignore ret in case the ECC of the MediaHeader is invalid
 		   (which is apparently acceptable) */
 		if (retlen != SECTORSIZE) {
@@ -119,7 +119,7 @@ static int find_boot_record(struct INFTLrecord *inftl)
 
 		/* Read the spare media header at offset 4096 */
 		mtd->read(mtd, block * inftl->EraseSize + 4096,
-			  SECTORSIZE, &retlen, buf);
+			  SECTORSIZE, &retlen, buf, NULL);
 		if (retlen != SECTORSIZE) {
 			printk(KERN_WARNING "INFTL: Unable to read spare "
 			       "Media Header\n");
@@ -342,7 +342,7 @@ static int check_free_sectors(struct INFTLrecord *inftl, unsigned int address,
 	int i;
 
 	for (i = 0; i < len; i += SECTORSIZE) {
-		if (mtd->read(mtd, address, SECTORSIZE, &retlen, buf))
+		if (mtd->read(mtd, address, SECTORSIZE, &retlen, buf, NULL))
 			return -1;
 		if (memcmpb(buf, 0xff, SECTORSIZE) != 0)
 			return -1;
diff --git a/drivers/mtd/lpddr/lpddr_cmds.c b/drivers/mtd/lpddr/lpddr_cmds.c
index 1dca31d..7960cbf 100644
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
@@ -513,6 +513,7 @@ static int lpddr_read(struct mtd_info *mtd, loff_t adr, size_t len,
 	int ret = 0;
 
 	mutex_lock(&chip->mutex);
+
 	ret = get_chip(map, chip, FL_READY);
 	if (ret) {
 		mutex_unlock(&chip->mutex);
@@ -522,6 +523,9 @@ static int lpddr_read(struct mtd_info *mtd, loff_t adr, size_t len,
 	map_copy_from(map, buf, adr, len);
 	*retlen = len;
 
+	if (max_bitflips != NULL)
+		*max_bitflips = 0;
+
 	put_chip(map, chip);
 	mutex_unlock(&chip->mutex);
 	return ret;
diff --git a/drivers/mtd/maps/bcm963xx-flash.c b/drivers/mtd/maps/bcm963xx-flash.c
index c7d3949..03645bd 100644
--- a/drivers/mtd/maps/bcm963xx-flash.c
+++ b/drivers/mtd/maps/bcm963xx-flash.c
@@ -67,7 +67,7 @@ static int parse_cfe_partitions(struct mtd_info *master,
 
 	/* Get the tag */
 	ret = master->read(master, master->erasesize, sizeof(struct bcm_tag),
-							&retlen, (void *)buf);
+			   &retlen, (void *)buf, NULL);
 	if (retlen != sizeof(struct bcm_tag)) {
 		vfree(buf);
 		return -EIO;
@@ -160,7 +160,7 @@ static int bcm963xx_detect_cfe(struct mtd_info *master)
 	int ret;
 	size_t retlen;
 
-	ret = master->read(master, idoffset, 8, &retlen, (void *)buf);
+	ret = master->read(master, idoffset, 8, &retlen, (void *)buf, NULL);
 	buf[retlen] = 0;
 	printk(KERN_INFO PFX "Read Signature value of %s\n", buf);
 
diff --git a/drivers/mtd/mtdblock.c b/drivers/mtd/mtdblock.c
index 7c1dc90..f45a46a 100644
--- a/drivers/mtd/mtdblock.c
+++ b/drivers/mtd/mtdblock.c
@@ -185,7 +185,8 @@ static int do_cached_write (struct mtdblk_dev *mtdblk, unsigned long pos,
 				/* fill the cache with the current sector */
 				mtdblk->cache_state = STATE_EMPTY;
 				ret = mtd->read(mtd, sect_start, sect_size,
-						&retlen, mtdblk->cache_data);
+						&retlen, mtdblk->cache_data,
+						NULL);
 				if (ret)
 					return ret;
 				if (retlen != sect_size)
@@ -222,7 +223,7 @@ static int do_cached_read (struct mtdblk_dev *mtdblk, unsigned long pos,
 			mtd->name, pos, len);
 
 	if (!sect_size)
-		return mtd->read(mtd, pos, len, &retlen, buf);
+		return mtd->read(mtd, pos, len, &retlen, buf, NULL);
 
 	while (len > 0) {
 		unsigned long sect_start = (pos/sect_size)*sect_size;
@@ -241,7 +242,7 @@ static int do_cached_read (struct mtdblk_dev *mtdblk, unsigned long pos,
 		    mtdblk->cache_offset == sect_start) {
 			memcpy (buf, mtdblk->cache_data + offset, size);
 		} else {
-			ret = mtd->read(mtd, pos, size, &retlen, buf);
+			ret = mtd->read(mtd, pos, size, &retlen, buf, NULL);
 			if (ret)
 				return ret;
 			if (retlen != size)
diff --git a/drivers/mtd/mtdblock_ro.c b/drivers/mtd/mtdblock_ro.c
index 0470a6e..33b4e22 100644
--- a/drivers/mtd/mtdblock_ro.c
+++ b/drivers/mtd/mtdblock_ro.c
@@ -30,7 +30,7 @@ static int mtdblock_readsect(struct mtd_blktrans_dev *dev,
 {
 	size_t retlen;
 
-	if (dev->mtd->read(dev->mtd, (block * 512), 512, &retlen, buf))
+	if (dev->mtd->read(dev->mtd, (block * 512), 512, &retlen, buf, NULL))
 		return 1;
 	return 0;
 }
diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index e7dc732..bb70d80 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -231,7 +231,7 @@ static ssize_t mtd_read(struct file *file, char __user *buf, size_t count,loff_t
 			break;
 		}
 		default:
-			ret = mtd->read(mtd, *ppos, len, &retlen, kbuf);
+			ret = mtd->read(mtd, *ppos, len, &retlen, kbuf, NULL);
 		}
 		/* Nand returns -EBADMSG on ECC errors, but it returns
 		 * the data. For our userspace tools it is important
diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index 6df4d4d..5102ba4 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -66,17 +66,19 @@ struct mtd_concat {
 
 static int
 concat_read(struct mtd_info *mtd, loff_t from, size_t len,
-	    size_t * retlen, u_char * buf)
+	    size_t *retlen, u_char *buf, unsigned int *max_bitflips)
 {
 	struct mtd_concat *concat = CONCAT(mtd);
 	int ret = 0, err;
 	int i;
+	unsigned int bitflips = 0;
 
 	*retlen = 0;
 
 	for (i = 0; i < concat->num_subdev; i++) {
 		struct mtd_info *subdev = concat->subdev[i];
 		size_t size, retsize;
+		unsigned int dev_bitflips;
 
 		if (from >= subdev->size) {
 			/* Not destined for this subdev */
@@ -91,7 +93,9 @@ concat_read(struct mtd_info *mtd, loff_t from, size_t len,
 			/* Entire transaction goes into this subdev */
 			size = len;
 
-		err = subdev->read(subdev, from, size, &retsize, buf);
+		err = subdev->read(subdev, from, size, &retsize, buf,
+				   &dev_bitflips);
+		bitflips = max(bitflips, dev_bitflips);
 
 		/* Save information about bitflips! */
 		if (unlikely(err)) {
@@ -109,8 +113,11 @@ concat_read(struct mtd_info *mtd, loff_t from, size_t len,
 
 		*retlen += retsize;
 		len -= size;
-		if (len == 0)
+		if (len == 0) {
+			if (max_bitflips != NULL)
+				*max_bitflips = bitflips;
 			return ret;
+		}
 
 		buf += size;
 		from = 0;
@@ -259,7 +266,7 @@ concat_read_oob(struct mtd_info *mtd, loff_t from, struct mtd_oob_ops *ops)
 	struct mtd_oob_ops devops = *ops;
 	int i, err, ret = 0;
 
-	ops->retlen = ops->oobretlen = 0;
+	ops->retlen = ops->oobretlen = ops->max_bitflips = 0;
 
 	for (i = 0; i < concat->num_subdev; i++) {
 		struct mtd_info *subdev = concat->subdev[i];
@@ -276,6 +283,7 @@ concat_read_oob(struct mtd_info *mtd, loff_t from, struct mtd_oob_ops *ops)
 		err = subdev->read_oob(subdev, from, &devops);
 		ops->retlen += devops.retlen;
 		ops->oobretlen += devops.oobretlen;
+		ops->max_bitflips = max(ops->max_bitflips, devops.max_bitflips);
 
 		/* Save information about bitflips! */
 		if (unlikely(err)) {
diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 1e2fa62..a29cb34 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -253,10 +253,11 @@ static void find_next_position(struct mtdoops_context *cxt)
 	size_t retlen;
 
 	for (page = 0; page < cxt->oops_pages; page++) {
+
 		/* Assume the page is used */
 		mark_page_used(cxt, page);
 		ret = mtd->read(mtd, page * record_size, MTDOOPS_HEADER_SIZE,
-				&retlen, (u_char *) &count[0]);
+				&retlen, (u_char *) &count[0], NULL);
 		if (retlen != MTDOOPS_HEADER_SIZE ||
 				(ret < 0 && !mtd_is_bitflip(ret))) {
 			printk(KERN_ERR "mtdoops: read failure at %ld (%td of %d read), err %d\n",
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index a0bd2de..68eac92 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -58,7 +58,7 @@ struct mtd_part {
  */
 
 static int part_read(struct mtd_info *mtd, loff_t from, size_t len,
-		size_t *retlen, u_char *buf)
+		     size_t *retlen, u_char *buf, unsigned int *max_bitflips)
 {
 	struct mtd_part *part = PART(mtd);
 	struct mtd_ecc_stats stats;
@@ -71,7 +71,7 @@ static int part_read(struct mtd_info *mtd, loff_t from, size_t len,
 	else if (from + len > mtd->size)
 		len = mtd->size - from;
 	res = part->master->read(part->master, from + part->offset,
-				   len, retlen, buf);
+				 len, retlen, buf, max_bitflips);
 	if (unlikely(res)) {
 		if (mtd_is_bitflip(res))
 			mtd->ecc_stats.corrected += part->master->ecc_stats.corrected - stats.corrected;
diff --git a/drivers/mtd/mtdswap.c b/drivers/mtd/mtdswap.c
index bd9590c..1249fe5 100644
--- a/drivers/mtd/mtdswap.c
+++ b/drivers/mtd/mtdswap.c
@@ -736,7 +736,7 @@ static int mtdswap_move_block(struct mtdswap_dev *d, unsigned int oldblock,
 	retries = 0;
 
 retry:
-	ret = mtd->read(mtd, readpos, PAGE_SIZE, &retlen, d->page_buf);
+	ret = mtd->read(mtd, readpos, PAGE_SIZE, &retlen, d->page_buf, NULL);
 
 	if (ret < 0 && !mtd_is_bitflip(ret)) {
 		oldeb = d->eb_data + oldblock / d->pages_per_eblk;
@@ -1161,7 +1161,7 @@ static int mtdswap_readsect(struct mtd_blktrans_dev *dev,
 	retries = 0;
 
 retry:
-	ret = mtd->read(mtd, readpos, PAGE_SIZE, &retlen, buf);
+	ret = mtd->read(mtd, readpos, PAGE_SIZE, &retlen, buf, NULL);
 
 	d->mtd_read_count++;
 	if (mtd_is_bitflip(ret)) {
diff --git a/drivers/mtd/nand/diskonchip.c b/drivers/mtd/nand/diskonchip.c
index 5780dba..5929e56 100644
--- a/drivers/mtd/nand/diskonchip.c
+++ b/drivers/mtd/nand/diskonchip.c
@@ -1072,7 +1072,7 @@ static int __init find_media_headers(struct mtd_info *mtd, u_char *buf, const ch
 	size_t retlen;
 
 	for (offs = 0; offs < mtd->size; offs += mtd->erasesize) {
-		ret = mtd->read(mtd, offs, mtd->writesize, &retlen, buf);
+		ret = mtd->read(mtd, offs, mtd->writesize, &retlen, buf, NULL);
 		if (retlen != mtd->writesize)
 			continue;
 		if (ret) {
@@ -1097,7 +1097,7 @@ static int __init find_media_headers(struct mtd_info *mtd, u_char *buf, const ch
 	/* Only one mediaheader was found.  We want buf to contain a
 	   mediaheader on return, so we'll have to re-read the one we found. */
 	offs = doc->mh0_page << this->page_shift;
-	ret = mtd->read(mtd, offs, mtd->writesize, &retlen, buf);
+	ret = mtd->read(mtd, offs, mtd->writesize, &retlen, buf, NULL);
 	if (retlen != mtd->writesize) {
 		/* Insanity.  Give up. */
 		printk(KERN_ERR "Read DiskOnChip Media Header once, but can't reread it???\n");
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 35b4565..b146a4d 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1458,6 +1458,8 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 	oob = ops->oobbuf;
 
 	while (1) {
+		__u32 prior_corrected = mtd->ecc_stats.corrected;
+
 		bytes = min(mtd->writesize - col, readlen);
 		aligned = (bytes == mtd->writesize);
 
@@ -1530,8 +1532,11 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 			buf += bytes;
 		}
 
-		readlen -= bytes;
+		ops->max_bitflips =
+			max(ops->max_bitflips,
+			    mtd->ecc_stats.corrected - prior_corrected);
 
+		readlen -= bytes;
 		if (!readlen)
 			break;
 
@@ -1580,7 +1585,7 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
  * Get hold of the chip and call nand_do_read.
  */
 static int nand_read(struct mtd_info *mtd, loff_t from, size_t len,
-		     size_t *retlen, uint8_t *buf)
+		     size_t *retlen, uint8_t *buf, unsigned int *max_bitflips)
 {
 	struct nand_chip *chip = mtd->priv;
 	struct mtd_oob_ops ops;
@@ -1598,11 +1603,15 @@ static int nand_read(struct mtd_info *mtd, loff_t from, size_t len,
 	ops.datbuf = buf;
 	ops.oobbuf = NULL;
 	ops.mode = 0;
+	ops.max_bitflips = 0;
 
 	ret = nand_do_read_ops(mtd, from, &ops);
 
 	*retlen = ops.retlen;
 
+	if (max_bitflips != NULL)
+		*max_bitflips = ops.max_bitflips;
+
 	nand_release_device(mtd);
 
 	return ret;
@@ -1799,6 +1808,8 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
 	page = realpage & chip->pagemask;
 
 	while (1) {
+		__u32 prior_corrected = mtd->ecc_stats.corrected;
+
 		if (ops->mode == MTD_OPS_RAW)
 			sndcmd = chip->ecc.read_oob_raw(mtd, chip, page, sndcmd);
 		else
@@ -1820,6 +1831,10 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
 				nand_wait_ready(mtd);
 		}
 
+		ops->max_bitflips =
+			max(ops->max_bitflips,
+			    mtd->ecc_stats.corrected - prior_corrected);
+
 		readlen -= len;
 		if (!readlen)
 			break;
@@ -1865,7 +1880,7 @@ static int nand_read_oob(struct mtd_info *mtd, loff_t from,
 	struct nand_chip *chip = mtd->priv;
 	int ret = -ENOTSUPP;
 
-	ops->retlen = 0;
+	ops->retlen = ops->max_bitflips = 0;
 
 	/* Do not allow reads past end of device */
 	if (ops->datbuf && (from + ops->len) > mtd->size) {
diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 69148ae..6730690 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -201,7 +201,7 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
 			from += marker_len;
 			marker_len = 0;
 		}
-		res = mtd->read(mtd, from, len, &retlen, buf);
+		res = mtd->read(mtd, from, len, &retlen, buf, NULL);
 		if (res < 0) {
 			if (mtd_is_eccerr(res)) {
 				pr_info("nand_bbt: ECC error in BBT at "
@@ -298,7 +298,7 @@ static int scan_read_raw_data(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
 	if (td->options & NAND_BBT_VERSION)
 		len++;
 
-	return mtd->read(mtd, offs, len, &retlen, buf);
+	return mtd->read(mtd, offs, len, &retlen, buf, NULL);
 }
 
 /* Scan read raw data from flash */
@@ -753,10 +753,11 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 
 		/* Must we save the block contents? */
 		if (td->options & NAND_BBT_SAVECONTENT) {
+
 			/* Make it block aligned */
 			to &= ~((loff_t)((1 << this->bbt_erase_shift) - 1));
 			len = 1 << this->bbt_erase_shift;
-			res = mtd->read(mtd, to, len, &retlen, buf);
+			res = mtd->read(mtd, to, len, &retlen, buf, NULL);
 			if (res < 0) {
 				if (retlen != len) {
 					pr_info("nand_bbt: error reading block "
diff --git a/drivers/mtd/nftlcore.c b/drivers/mtd/nftlcore.c
index cda77b5..afc4292 100644
--- a/drivers/mtd/nftlcore.c
+++ b/drivers/mtd/nftlcore.c
@@ -424,11 +424,11 @@ static u16 NFTL_foldchain (struct NFTLrecord *nftl, unsigned thisVUC, unsigned p
 			continue;
 
 		ret = mtd->read(mtd, (nftl->EraseSize * BlockMap[block]) + (block * 512),
-				512, &retlen, movebuf);
+				512, &retlen, movebuf, NULL);
 		if (ret < 0 && !mtd_is_bitflip(ret)) {
 			ret = mtd->read(mtd, (nftl->EraseSize * BlockMap[block])
 					+ (block * 512), 512, &retlen,
-					movebuf);
+					movebuf, NULL);
 			if (ret != -EIO)
 				printk("Error went away on retry.\n");
 		}
@@ -771,7 +771,7 @@ static int nftl_readblock(struct mtd_blktrans_dev *mbd, unsigned long block,
 	} else {
 		loff_t ptr = (lastgoodEUN * nftl->EraseSize) + blockofs;
 		size_t retlen;
-		int res = mtd->read(mtd, ptr, 512, &retlen, buffer);
+		int res = mtd->read(mtd, ptr, 512, &retlen, buffer, NULL);
 
 		if (res < 0 && !mtd_is_bitflip(res))
 			return -EIO;
diff --git a/drivers/mtd/nftlmount.c b/drivers/mtd/nftlmount.c
index ac40925..b1e6663 100644
--- a/drivers/mtd/nftlmount.c
+++ b/drivers/mtd/nftlmount.c
@@ -64,7 +64,7 @@ static int find_boot_record(struct NFTLrecord *nftl)
 		/* Check for ANAND header first. Then can whinge if it's found but later
 		   checks fail */
 		ret = mtd->read(mtd, block * nftl->EraseSize, SECTORSIZE,
-				&retlen, buf);
+				&retlen, buf, NULL);
 		/* We ignore ret in case the ECC of the MediaHeader is invalid
 		   (which is apparently acceptable) */
 		if (retlen != SECTORSIZE) {
@@ -110,7 +110,7 @@ static int find_boot_record(struct NFTLrecord *nftl)
 
 		/* Finally reread to check ECC */
 		if ((ret = mtd->read(mtd, block * nftl->EraseSize, SECTORSIZE,
-				     &retlen, buf) < 0)) {
+				     &retlen, buf, NULL) < 0)) {
 			printk(KERN_NOTICE "ANAND header found at 0x%x in mtd%d, but ECC read failed (err %d)\n",
 			       block * nftl->EraseSize, nftl->mbd.mtd->index, ret);
 			continue;
@@ -274,7 +274,7 @@ static int check_free_sectors(struct NFTLrecord *nftl, unsigned int address, int
 	int i;
 
 	for (i = 0; i < len; i += SECTORSIZE) {
-		if (mtd->read(mtd, address, SECTORSIZE, &retlen, buf))
+		if (mtd->read(mtd, address, SECTORSIZE, &retlen, buf, NULL))
 			return -1;
 		if (memcmpb(buf, 0xff, SECTORSIZE) != 0)
 			return -1;
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index a839473..d2c5ff7 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -1451,7 +1451,7 @@ static int onenand_read_oob_nolock(struct mtd_info *mtd, loff_t from,
  * Read with ecc
 */
 static int onenand_read(struct mtd_info *mtd, loff_t from, size_t len,
-	size_t *retlen, u_char *buf)
+			size_t *retlen, u_char *buf, unsigned int *max_bitflips)
 {
 	struct onenand_chip *this = mtd->priv;
 	struct mtd_oob_ops ops = {
@@ -1469,6 +1469,8 @@ static int onenand_read(struct mtd_info *mtd, loff_t from, size_t len,
 	onenand_release_device(mtd);
 
 	*retlen = ops.retlen;
+	if (max_bitflips != NULL)
+		*max_bitflips = mtd_is_bitflip(ret) ? 1 : 0;
 	return ret;
 }
 
@@ -1505,6 +1507,8 @@ static int onenand_read_oob(struct mtd_info *mtd, loff_t from,
 		ret = onenand_read_oob_nolock(mtd, from, ops);
 	onenand_release_device(mtd);
 
+	ops->max_bitflips = mtd_is_bitflip(ret) ? 1 : 0;
+
 	return ret;
 }
 
diff --git a/drivers/mtd/redboot.c b/drivers/mtd/redboot.c
index e366b1d..63e3167 100644
--- a/drivers/mtd/redboot.c
+++ b/drivers/mtd/redboot.c
@@ -105,7 +105,7 @@ static int parse_redboot_partitions(struct mtd_info *master,
 	       master->name, offset);
 
 	ret = master->read(master, offset,
-			   master->erasesize, &retlen, (void *)buf);
+			   master->erasesize, &retlen, (void *)buf, NULL);
 
 	if (ret)
 		goto out;
diff --git a/drivers/mtd/rfd_ftl.c b/drivers/mtd/rfd_ftl.c
index 73ae217..ab797c7 100644
--- a/drivers/mtd/rfd_ftl.c
+++ b/drivers/mtd/rfd_ftl.c
@@ -202,7 +202,8 @@ static int scan_header(struct partition *part)
 	for (i=0, blocks_found=0; i<part->total_blocks; i++) {
 		rc = part->mbd.mtd->read(part->mbd.mtd,
 				i * part->block_size, part->header_size,
-				&retlen, (u_char*)part->header_cache);
+					 &retlen, (u_char *)part->header_cache,
+					 NULL);
 
 		if (!rc && retlen != part->header_size)
 			rc = -EIO;
@@ -251,7 +252,7 @@ static int rfd_ftl_readsect(struct mtd_blktrans_dev *dev, u_long sector, char *b
 	addr = part->sector_map[sector];
 	if (addr != -1) {
 		rc = part->mbd.mtd->read(part->mbd.mtd, addr, SECTOR_SIZE,
-						&retlen, (u_char*)buf);
+					 &retlen, (u_char *)buf, NULL);
 		if (!rc && retlen != SECTOR_SIZE)
 			rc = -EIO;
 
@@ -374,7 +375,7 @@ static int move_block_contents(struct partition *part, int block_no, u_long *old
 
 	rc = part->mbd.mtd->read(part->mbd.mtd,
 		part->blocks[block_no].offset, part->header_size,
-		&retlen, (u_char*)map);
+		&retlen, (u_char *)map, NULL);
 
 	if (!rc && retlen != part->header_size)
 		rc = -EIO;
@@ -414,7 +415,7 @@ static int move_block_contents(struct partition *part, int block_no, u_long *old
 			continue;
 		}
 		rc = part->mbd.mtd->read(part->mbd.mtd, addr,
-			SECTOR_SIZE, &retlen, sector_data);
+			SECTOR_SIZE, &retlen, sector_data, NULL);
 
 		if (!rc && retlen != SECTOR_SIZE)
 			rc = -EIO;
@@ -564,7 +565,8 @@ static int find_writable_block(struct partition *part, u_long *old_sector)
 	}
 
 	rc = part->mbd.mtd->read(part->mbd.mtd, part->blocks[block].offset,
-		part->header_size, &retlen, (u_char*)part->header_cache);
+				 part->header_size, &retlen,
+				 (u_char *)part->header_cache, NULL);
 
 	if (!rc && retlen != part->header_size)
 		rc = -EIO;
diff --git a/drivers/mtd/ssfdc.c b/drivers/mtd/ssfdc.c
index 976e3d2..1d0d8d9 100644
--- a/drivers/mtd/ssfdc.c
+++ b/drivers/mtd/ssfdc.c
@@ -124,7 +124,7 @@ static int get_valid_cis_sector(struct mtd_info *mtd)
 	for (k = 0, offset = 0; k < 4; k++, offset += mtd->erasesize) {
 		if (!mtd->block_isbad(mtd, offset)) {
 			ret = mtd->read(mtd, offset, SECTOR_SIZE, &retlen,
-				sect_buf);
+					sect_buf, NULL);
 
 			/* CIS pattern match on the sector buffer */
 			if (ret < 0 || retlen != SECTOR_SIZE) {
@@ -156,7 +156,7 @@ static int read_physical_sector(struct mtd_info *mtd, uint8_t *sect_buf,
 	size_t retlen;
 	loff_t offset = (loff_t)sect_no << SECTOR_SHIFT;
 
-	ret = mtd->read(mtd, offset, SECTOR_SIZE, &retlen, sect_buf);
+	ret = mtd->read(mtd, offset, SECTOR_SIZE, &retlen, sect_buf, NULL);
 	if (ret < 0 || retlen != SECTOR_SIZE)
 		return -1;
 
diff --git a/drivers/mtd/tests/mtd_pagetest.c b/drivers/mtd/tests/mtd_pagetest.c
index afafb69..3677ec7 100644
--- a/drivers/mtd/tests/mtd_pagetest.c
+++ b/drivers/mtd/tests/mtd_pagetest.c
@@ -127,7 +127,7 @@ static int verify_eraseblock(int ebnum)
 	set_random_data(writebuf, mtd->erasesize);
 	for (j = 0; j < pgcnt - 1; ++j, addr += pgsize) {
 		/* Do a read to set the internal dataRAMs to different data */
-		err = mtd->read(mtd, addr0, bufsize, &read, twopages);
+		err = mtd->read(mtd, addr0, bufsize, &read, twopages, NULL);
 		if (mtd_is_bitflip(err))
 			err = 0;
 		if (err || read != bufsize) {
@@ -135,7 +135,8 @@ static int verify_eraseblock(int ebnum)
 			       (long long)addr0);
 			return err;
 		}
-		err = mtd->read(mtd, addrn - bufsize, bufsize, &read, twopages);
+		err = mtd->read(mtd, addrn - bufsize, bufsize, &read, twopages,
+				NULL);
 		if (mtd_is_bitflip(err))
 			err = 0;
 		if (err || read != bufsize) {
@@ -145,7 +146,7 @@ static int verify_eraseblock(int ebnum)
 		}
 		memset(twopages, 0, bufsize);
 		read = 0;
-		err = mtd->read(mtd, addr, bufsize, &read, twopages);
+		err = mtd->read(mtd, addr, bufsize, &read, twopages, NULL);
 		if (mtd_is_bitflip(err))
 			err = 0;
 		if (err || read != bufsize) {
@@ -163,7 +164,7 @@ static int verify_eraseblock(int ebnum)
 	if (addr <= addrn - pgsize - pgsize && !bbt[ebnum + 1]) {
 		unsigned long oldnext = next;
 		/* Do a read to set the internal dataRAMs to different data */
-		err = mtd->read(mtd, addr0, bufsize, &read, twopages);
+		err = mtd->read(mtd, addr0, bufsize, &read, twopages, NULL);
 		if (mtd_is_bitflip(err))
 			err = 0;
 		if (err || read != bufsize) {
@@ -171,7 +172,8 @@ static int verify_eraseblock(int ebnum)
 			       (long long)addr0);
 			return err;
 		}
-		err = mtd->read(mtd, addrn - bufsize, bufsize, &read, twopages);
+		err = mtd->read(mtd, addrn - bufsize, bufsize, &read, twopages,
+				NULL);
 		if (mtd_is_bitflip(err))
 			err = 0;
 		if (err || read != bufsize) {
@@ -181,7 +183,7 @@ static int verify_eraseblock(int ebnum)
 		}
 		memset(twopages, 0, bufsize);
 		read = 0;
-		err = mtd->read(mtd, addr, bufsize, &read, twopages);
+		err = mtd->read(mtd, addr, bufsize, &read, twopages, NULL);
 		if (mtd_is_bitflip(err))
 			err = 0;
 		if (err || read != bufsize) {
@@ -230,7 +232,7 @@ static int crosstest(void)
 	/* Read 2nd-to-last page to pp1 */
 	read = 0;
 	addr = addrn - pgsize - pgsize;
-	err = mtd->read(mtd, addr, pgsize, &read, pp1);
+	err = mtd->read(mtd, addr, pgsize, &read, pp1, NULL);
 	if (mtd_is_bitflip(err))
 		err = 0;
 	if (err || read != pgsize) {
@@ -243,7 +245,7 @@ static int crosstest(void)
 	/* Read 3rd-to-last page to pp1 */
 	read = 0;
 	addr = addrn - pgsize - pgsize - pgsize;
-	err = mtd->read(mtd, addr, pgsize, &read, pp1);
+	err = mtd->read(mtd, addr, pgsize, &read, pp1, NULL);
 	if (mtd_is_bitflip(err))
 		err = 0;
 	if (err || read != pgsize) {
@@ -257,7 +259,7 @@ static int crosstest(void)
 	read = 0;
 	addr = addr0;
 	printk(PRINT_PREF "reading page at %#llx\n", (long long)addr);
-	err = mtd->read(mtd, addr, pgsize, &read, pp2);
+	err = mtd->read(mtd, addr, pgsize, &read, pp2, NULL);
 	if (mtd_is_bitflip(err))
 		err = 0;
 	if (err || read != pgsize) {
@@ -271,7 +273,7 @@ static int crosstest(void)
 	read = 0;
 	addr = addrn - pgsize;
 	printk(PRINT_PREF "reading page at %#llx\n", (long long)addr);
-	err = mtd->read(mtd, addr, pgsize, &read, pp3);
+	err = mtd->read(mtd, addr, pgsize, &read, pp3, NULL);
 	if (mtd_is_bitflip(err))
 		err = 0;
 	if (err || read != pgsize) {
@@ -285,7 +287,7 @@ static int crosstest(void)
 	read = 0;
 	addr = addr0;
 	printk(PRINT_PREF "reading page at %#llx\n", (long long)addr);
-	err = mtd->read(mtd, addr, pgsize, &read, pp4);
+	err = mtd->read(mtd, addr, pgsize, &read, pp4, NULL);
 	if (mtd_is_bitflip(err))
 		err = 0;
 	if (err || read != pgsize) {
@@ -344,7 +346,7 @@ static int erasecrosstest(void)
 
 	printk(PRINT_PREF "reading 1st page of block %d\n", ebnum);
 	memset(readbuf, 0, pgsize);
-	err = mtd->read(mtd, addr0, pgsize, &read, readbuf);
+	err = mtd->read(mtd, addr0, pgsize, &read, readbuf, NULL);
 	if (mtd_is_bitflip(err))
 		err = 0;
 	if (err || read != pgsize) {
@@ -382,7 +384,7 @@ static int erasecrosstest(void)
 
 	printk(PRINT_PREF "reading 1st page of block %d\n", ebnum);
 	memset(readbuf, 0, pgsize);
-	err = mtd->read(mtd, addr0, pgsize, &read, readbuf);
+	err = mtd->read(mtd, addr0, pgsize, &read, readbuf, NULL);
 	if (mtd_is_bitflip(err))
 		err = 0;
 	if (err || read != pgsize) {
@@ -438,7 +440,7 @@ static int erasetest(void)
 		return err;
 
 	printk(PRINT_PREF "reading 1st page of block %d\n", ebnum);
-	err = mtd->read(mtd, addr0, pgsize, &read, twopages);
+	err = mtd->read(mtd, addr0, pgsize, &read, twopages, NULL);
 	if (mtd_is_bitflip(err))
 		err = 0;
 	if (err || read != pgsize) {
diff --git a/drivers/mtd/tests/mtd_readtest.c b/drivers/mtd/tests/mtd_readtest.c
index 550fe51..e11fdfd 100644
--- a/drivers/mtd/tests/mtd_readtest.c
+++ b/drivers/mtd/tests/mtd_readtest.c
@@ -52,7 +52,7 @@ static int read_eraseblock_by_page(int ebnum)
 
 	for (i = 0; i < pgcnt; i++) {
 		memset(buf, 0 , pgcnt);
-		ret = mtd->read(mtd, addr, pgsize, &read, buf);
+		ret = mtd->read(mtd, addr, pgsize, &read, buf, NULL);
 		if (ret == -EUCLEAN)
 			ret = 0;
 		if (ret || read != pgsize) {
diff --git a/drivers/mtd/tests/mtd_speedtest.c b/drivers/mtd/tests/mtd_speedtest.c
index 493b367..951c80a 100644
--- a/drivers/mtd/tests/mtd_speedtest.c
+++ b/drivers/mtd/tests/mtd_speedtest.c
@@ -214,7 +214,7 @@ static int read_eraseblock(int ebnum)
 	int err = 0;
 	loff_t addr = ebnum * mtd->erasesize;
 
-	err = mtd->read(mtd, addr, mtd->erasesize, &read, iobuf);
+	err = mtd->read(mtd, addr, mtd->erasesize, &read, iobuf, NULL);
 	/* Ignore corrected ECC errors */
 	if (mtd_is_bitflip(err))
 		err = 0;
@@ -235,7 +235,7 @@ static int read_eraseblock_by_page(int ebnum)
 	void *buf = iobuf;
 
 	for (i = 0; i < pgcnt; i++) {
-		err = mtd->read(mtd, addr, pgsize, &read, buf);
+		err = mtd->read(mtd, addr, pgsize, &read, buf, NULL);
 		/* Ignore corrected ECC errors */
 		if (mtd_is_bitflip(err))
 			err = 0;
@@ -261,7 +261,7 @@ static int read_eraseblock_by_2pages(int ebnum)
 	void *buf = iobuf;
 
 	for (i = 0; i < n; i++) {
-		err = mtd->read(mtd, addr, sz, &read, buf);
+		err = mtd->read(mtd, addr, sz, &read, buf, NULL);
 		/* Ignore corrected ECC errors */
 		if (mtd_is_bitflip(err))
 			err = 0;
@@ -276,7 +276,7 @@ static int read_eraseblock_by_2pages(int ebnum)
 		buf += sz;
 	}
 	if (pgcnt % 2) {
-		err = mtd->read(mtd, addr, pgsize, &read, buf);
+		err = mtd->read(mtd, addr, pgsize, &read, buf, NULL);
 		/* Ignore corrected ECC errors */
 		if (mtd_is_bitflip(err))
 			err = 0;
diff --git a/drivers/mtd/tests/mtd_stresstest.c b/drivers/mtd/tests/mtd_stresstest.c
index 52ffd91..9dadf4a 100644
--- a/drivers/mtd/tests/mtd_stresstest.c
+++ b/drivers/mtd/tests/mtd_stresstest.c
@@ -153,7 +153,7 @@ static int do_read(void)
 			len = mtd->erasesize - offs;
 	}
 	addr = eb * mtd->erasesize + offs;
-	err = mtd->read(mtd, addr, len, &read, readbuf);
+	err = mtd->read(mtd, addr, len, &read, readbuf, NULL);
 	if (mtd_is_bitflip(err))
 		err = 0;
 	if (unlikely(err || read != len)) {
diff --git a/drivers/mtd/tests/mtd_subpagetest.c b/drivers/mtd/tests/mtd_subpagetest.c
index 1a05bfa..cc782d4 100644
--- a/drivers/mtd/tests/mtd_subpagetest.c
+++ b/drivers/mtd/tests/mtd_subpagetest.c
@@ -196,7 +196,7 @@ static int verify_eraseblock(int ebnum)
 	set_random_data(writebuf, subpgsize);
 	clear_data(readbuf, subpgsize);
 	read = 0;
-	err = mtd->read(mtd, addr, subpgsize, &read, readbuf);
+	err = mtd->read(mtd, addr, subpgsize, &read, readbuf, NULL);
 	if (unlikely(err || read != subpgsize)) {
 		if (mtd_is_bitflip(err) && read == subpgsize) {
 			printk(PRINT_PREF "ECC correction at %#llx\n",
@@ -224,7 +224,7 @@ static int verify_eraseblock(int ebnum)
 	set_random_data(writebuf, subpgsize);
 	clear_data(readbuf, subpgsize);
 	read = 0;
-	err = mtd->read(mtd, addr, subpgsize, &read, readbuf);
+	err = mtd->read(mtd, addr, subpgsize, &read, readbuf, NULL);
 	if (unlikely(err || read != subpgsize)) {
 		if (mtd_is_bitflip(err) && read == subpgsize) {
 			printk(PRINT_PREF "ECC correction at %#llx\n",
@@ -262,7 +262,8 @@ static int verify_eraseblock2(int ebnum)
 		set_random_data(writebuf, subpgsize * k);
 		clear_data(readbuf, subpgsize * k);
 		read = 0;
-		err = mtd->read(mtd, addr, subpgsize * k, &read, readbuf);
+		err = mtd->read(mtd, addr, subpgsize * k, &read, readbuf,
+				NULL);
 		if (unlikely(err || read != subpgsize * k)) {
 			if (mtd_is_bitflip(err) && read == subpgsize * k) {
 				printk(PRINT_PREF "ECC correction at %#llx\n",
@@ -296,7 +297,7 @@ static int verify_eraseblock_ff(int ebnum)
 	for (j = 0; j < mtd->erasesize / subpgsize; ++j) {
 		clear_data(readbuf, subpgsize);
 		read = 0;
-		err = mtd->read(mtd, addr, subpgsize, &read, readbuf);
+		err = mtd->read(mtd, addr, subpgsize, &read, readbuf, NULL);
 		if (unlikely(err || read != subpgsize)) {
 			if (mtd_is_bitflip(err) && read == subpgsize) {
 				printk(PRINT_PREF "ECC correction at %#llx\n",
diff --git a/drivers/mtd/tests/mtd_torturetest.c b/drivers/mtd/tests/mtd_torturetest.c
index 03ab649..36e0ae9 100644
--- a/drivers/mtd/tests/mtd_torturetest.c
+++ b/drivers/mtd/tests/mtd_torturetest.c
@@ -137,7 +137,7 @@ static inline int check_eraseblock(int ebnum, unsigned char *buf)
 	}
 
 retry:
-	err = mtd->read(mtd, addr, len, &read, check_buf);
+	err = mtd->read(mtd, addr, len, &read, check_buf, NULL);
 	if (mtd_is_bitflip(err))
 		printk(PRINT_PREF "single bit flip occurred at EB %d "
 		       "MTD reported that it was fixed.\n", ebnum);
diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index f20b6f2..13f6b18 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -170,7 +170,7 @@ int ubi_io_read(const struct ubi_device *ubi, void *buf, int pnum, int offset,
 
 	addr = (loff_t)pnum * ubi->peb_size + offset;
 retry:
-	err = ubi->mtd->read(ubi->mtd, addr, len, &read, buf);
+	err = ubi->mtd->read(ubi->mtd, addr, len, &read, buf, NULL);
 	if (err) {
 		const char *errstr = mtd_is_eccerr(err) ? " (ECC error)" : "";
 
@@ -1357,7 +1357,7 @@ int ubi_dbg_check_write(struct ubi_device *ubi, const void *buf, int pnum,
 		return 0;
 	}
 
-	err = ubi->mtd->read(ubi->mtd, addr, len, &read, buf1);
+	err = ubi->mtd->read(ubi->mtd, addr, len, &read, buf1, NULL);
 	if (err && !mtd_is_bitflip(err))
 		goto out_free;
 
@@ -1421,7 +1421,7 @@ int ubi_dbg_check_all_ff(struct ubi_device *ubi, int pnum, int offset, int len)
 		return 0;
 	}
 
-	err = ubi->mtd->read(ubi->mtd, addr, len, &read, buf);
+	err = ubi->mtd->read(ubi->mtd, addr, len, &read, buf, NULL);
 	if (err && !mtd_is_bitflip(err)) {
 		ubi_err("error %d while reading %d bytes from PEB %d:%d, "
 			"read %zd bytes", err, len, pnum, offset, read);
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 9f5b312..a1be9a2 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -81,6 +81,9 @@ struct mtd_erase_region_info {
  *		mode = MTD_OPS_PLACE_OOB or MTD_OPS_RAW)
  * @datbuf:	data buffer - if NULL only oob data are read/written
  * @oobbuf:	oob data buffer
+ * @max_bitflips: for read operations, maximum number of bit errors corrected
+ *                on any one minimum i/o unit (e.g., nand page)
+ *                (value returned to caller by the driver)
  *
  * Note, it is allowed to read more than one OOB area at one go, but not write.
  * The interface assumes that the OOB write requests program only one page's
@@ -95,6 +98,7 @@ struct mtd_oob_ops {
 	uint32_t	ooboffs;
 	uint8_t		*datbuf;
 	uint8_t		*oobbuf;
+	unsigned int	max_bitflips;
 };
 
 #define MTD_MAX_OOBFREE_ENTRIES_LARGE	32
@@ -201,8 +205,13 @@ struct mtd_info {
 	 */
 	struct backing_dev_info *backing_dev_info;
 
+	/*
+	 * If not NULL, max_bitflips returns to caller the maximum number of bit
+	 * errors corrected on any one minimum i/o unit (e.g., nand page).
+	 */
+	int (*read) (struct mtd_info *mtd, loff_t from, size_t len,
+		     size_t *retlen, u_char *buf, unsigned int *max_bitflips);
 
-	int (*read) (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf);
 	int (*write) (struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen, const u_char *buf);
 
 	/* In blackbox flight recorder like scenarios we want to make successful
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
