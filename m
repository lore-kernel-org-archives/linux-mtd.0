Message-ID: <491D7CCE.4030402@nokia.com>
Date: Fri, 14 Nov 2008 15:27:42 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: dedekind@infradead.org
Subject: Re: [RFC] [PATCH] [MTD] Update internal API to support 64-bit	device
	size
References: <4912EE49.4070202@nokia.com> <1226663673.16925.88.camel@sauron>
In-Reply-To: <1226663673.16925.88.camel@sauron>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

MTD internal API presently uses 32-bit values to represent
device size.  This patch updates them to 64-bits but leaves
the external API unchanged.  Extending the external API
is a separate issue for several reasons.  First, no one
needs it at the moment.  Secondly, whether the implementation
is done with IOCTLs, sysfs or both is still debated.  Thirdly
external API changes require the internal API to be accepted
first.

Note that although the MTD API will be able to support 64-bit
device sizes, existing drivers do not and are not required
to do so, although NAND base has been updated.

In general, changing from 32-bit to 64-bit values cause little
or no changes to the majority of the code with the following
exceptions:
	- printk message formats
	- division and modulus of 64-bit values
	- NAND base support
	- 32-bit local variables used by mtdpart and mtdconcat
	- naughtily assuming one structure maps to another
	in MEMERASE ioctl

Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
---

Updated in response to Artem's comments


 drivers/mtd/chips/cfi_cmdset_0001.c |   12 ++++----
 drivers/mtd/chips/cfi_cmdset_0002.c |    8 ++--
 drivers/mtd/chips/cfi_cmdset_0020.c |   14 ++++----
 drivers/mtd/chips/fwh_lock.h        |    4 +-
 drivers/mtd/inftlcore.c             |    2 +-
 drivers/mtd/inftlmount.c            |    4 +-
 drivers/mtd/maps/amd76xrom.c        |    4 +-
 drivers/mtd/maps/ck804xrom.c        |    4 +-
 drivers/mtd/maps/esb2rom.c          |    4 +-
 drivers/mtd/maps/ichxrom.c          |    4 +-
 drivers/mtd/maps/nettel.c           |    2 +-
 drivers/mtd/maps/scb2_flash.c       |    8 +++--
 drivers/mtd/mtdchar.c               |    6 +++-
 drivers/mtd/mtdconcat.c             |   33 +++++++++++--------
 drivers/mtd/mtdcore.c               |   16 +++++++++-
 drivers/mtd/mtdoops.c               |    9 ++++--
 drivers/mtd/mtdpart.c               |   34 ++++++++++----------
 drivers/mtd/nand/nand_base.c        |   24 +++++++++-----
 drivers/mtd/nand/nand_bbt.c         |   31 +++++++++----------
 drivers/mtd/nftlcore.c              |    2 +-
 drivers/mtd/nftlmount.c             |    4 +-
 drivers/mtd/onenand/onenand_base.c  |    8 ++--
 drivers/mtd/rfd_ftl.c               |   23 +++++++-------
 drivers/mtd/ssfdc.c                 |    7 ++--
 drivers/mtd/ubi/build.c             |    2 +-
 drivers/mtd/ubi/gluebi.c            |   17 +++++-----
 fs/jffs2/erase.c                    |    5 ++-
 include/linux/mtd/mtd.h             |   57 ++++++++++++++++++++++++++++++-----
 include/linux/mtd/nand.h            |    2 +-
 include/linux/mtd/partitions.h      |    4 +-
 30 files changed, 216 insertions(+), 138 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index c93a8be..13330fb 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -58,8 +58,8 @@ static int cfi_intelext_write_buffers(struct mtd_info *, loff_t, size_t, size_t
 static int cfi_intelext_writev(struct mtd_info *, const struct kvec *, unsigned long, loff_t, size_t *);
 static int cfi_intelext_erase_varsize(struct mtd_info *, struct erase_info *);
 static void cfi_intelext_sync (struct mtd_info *);
-static int cfi_intelext_lock(struct mtd_info *mtd, loff_t ofs, size_t len);
-static int cfi_intelext_unlock(struct mtd_info *mtd, loff_t ofs, size_t len);
+static int cfi_intelext_lock(struct mtd_info *mtd, loff_t ofs, u_int64_t len);
+static int cfi_intelext_unlock(struct mtd_info *mtd, loff_t ofs, u_int64_t len);
 #ifdef CONFIG_MTD_OTP
 static int cfi_intelext_read_fact_prot_reg (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
 static int cfi_intelext_read_user_prot_reg (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
@@ -558,8 +558,8 @@ static struct mtd_info *cfi_intelext_setup(struct mtd_info *mtd)
 	}
 
 	for (i=0; i<mtd->numeraseregions;i++){
-		printk(KERN_DEBUG "erase region %d: offset=0x%x,size=0x%x,blocks=%d\n",
-		       i,mtd->eraseregions[i].offset,
+		printk(KERN_DEBUG "erase region %d: offset=0x%llx,size=0x%x,blocks=%d\n",
+		       i,(unsigned long long)mtd->eraseregions[i].offset,
 		       mtd->eraseregions[i].erasesize,
 		       mtd->eraseregions[i].numblocks);
 	}
@@ -2058,7 +2058,7 @@ out:	put_chip(map, chip, adr);
 	return ret;
 }
 
-static int cfi_intelext_lock(struct mtd_info *mtd, loff_t ofs, size_t len)
+static int cfi_intelext_lock(struct mtd_info *mtd, loff_t ofs, u_int64_t len)
 {
 	int ret;
 
@@ -2082,7 +2082,7 @@ static int cfi_intelext_lock(struct mtd_info *mtd, loff_t ofs, size_t len)
 	return ret;
 }
 
-static int cfi_intelext_unlock(struct mtd_info *mtd, loff_t ofs, size_t len)
+static int cfi_intelext_unlock(struct mtd_info *mtd, loff_t ofs, u_int64_t len)
 {
 	int ret;
 
diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index d74ec46..850c74e 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -71,8 +71,8 @@ static int get_chip(struct map_info *map, struct flchip *chip, unsigned long adr
 static void put_chip(struct map_info *map, struct flchip *chip, unsigned long adr);
 #include "fwh_lock.h"
 
-static int cfi_atmel_lock(struct mtd_info *mtd, loff_t ofs, size_t len);
-static int cfi_atmel_unlock(struct mtd_info *mtd, loff_t ofs, size_t len);
+static int cfi_atmel_lock(struct mtd_info *mtd, loff_t ofs, u_int64_t len);
+static int cfi_atmel_unlock(struct mtd_info *mtd, loff_t ofs, u_int64_t len);
 
 static struct mtd_chip_driver cfi_amdstd_chipdrv = {
 	.probe		= NULL, /* Not usable directly */
@@ -1774,12 +1774,12 @@ out_unlock:
 	return ret;
 }
 
-static int cfi_atmel_lock(struct mtd_info *mtd, loff_t ofs, size_t len)
+static int cfi_atmel_lock(struct mtd_info *mtd, loff_t ofs, u_int64_t len)
 {
 	return cfi_varsize_frob(mtd, do_atmel_lock, ofs, len, NULL);
 }
 
-static int cfi_atmel_unlock(struct mtd_info *mtd, loff_t ofs, size_t len)
+static int cfi_atmel_unlock(struct mtd_info *mtd, loff_t ofs, u_int64_t len)
 {
 	return cfi_varsize_frob(mtd, do_atmel_unlock, ofs, len, NULL);
 }
diff --git a/drivers/mtd/chips/cfi_cmdset_0020.c b/drivers/mtd/chips/cfi_cmdset_0020.c
index d4714dd..7e0be9e 100644
--- a/drivers/mtd/chips/cfi_cmdset_0020.c
+++ b/drivers/mtd/chips/cfi_cmdset_0020.c
@@ -42,8 +42,8 @@ static int cfi_staa_writev(struct mtd_info *mtd, const struct kvec *vecs,
 		unsigned long count, loff_t to, size_t *retlen);
 static int cfi_staa_erase_varsize(struct mtd_info *, struct erase_info *);
 static void cfi_staa_sync (struct mtd_info *);
-static int cfi_staa_lock(struct mtd_info *mtd, loff_t ofs, size_t len);
-static int cfi_staa_unlock(struct mtd_info *mtd, loff_t ofs, size_t len);
+static int cfi_staa_lock(struct mtd_info *mtd, loff_t ofs, u_int64_t len);
+static int cfi_staa_unlock(struct mtd_info *mtd, loff_t ofs, u_int64_t len);
 static int cfi_staa_suspend (struct mtd_info *);
 static void cfi_staa_resume (struct mtd_info *);
 
@@ -221,8 +221,8 @@ static struct mtd_info *cfi_staa_setup(struct map_info *map)
 		}
 
 		for (i=0; i<mtd->numeraseregions;i++){
-			printk(KERN_DEBUG "%d: offset=0x%x,size=0x%x,blocks=%d\n",
-			       i,mtd->eraseregions[i].offset,
+			printk(KERN_DEBUG "%d: offset=0x%llx,size=0x%x,blocks=%d\n",
+			       i, (unsigned long long)mtd->eraseregions[i].offset,
 			       mtd->eraseregions[i].erasesize,
 			       mtd->eraseregions[i].numblocks);
 		}
@@ -964,7 +964,7 @@ static int cfi_staa_erase_varsize(struct mtd_info *mtd,
 		adr += regions[i].erasesize;
 		len -= regions[i].erasesize;
 
-		if (adr % (1<< cfi->chipshift) == ((regions[i].offset + (regions[i].erasesize * regions[i].numblocks)) %( 1<< cfi->chipshift)))
+		if (adr % (1<< cfi->chipshift) == (((unsigned long)regions[i].offset + (regions[i].erasesize * regions[i].numblocks)) %( 1<< cfi->chipshift)))
 			i++;
 
 		if (adr >> cfi->chipshift) {
@@ -1135,7 +1135,7 @@ retry:
 	spin_unlock_bh(chip->mutex);
 	return 0;
 }
-static int cfi_staa_lock(struct mtd_info *mtd, loff_t ofs, size_t len)
+static int cfi_staa_lock(struct mtd_info *mtd, loff_t ofs, u_int64_t len)
 {
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
@@ -1284,7 +1284,7 @@ retry:
 	spin_unlock_bh(chip->mutex);
 	return 0;
 }
-static int cfi_staa_unlock(struct mtd_info *mtd, loff_t ofs, size_t len)
+static int cfi_staa_unlock(struct mtd_info *mtd, loff_t ofs, u_int64_t len)
 {
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
diff --git a/drivers/mtd/chips/fwh_lock.h b/drivers/mtd/chips/fwh_lock.h
index ab44f2b..4d585f5 100644
--- a/drivers/mtd/chips/fwh_lock.h
+++ b/drivers/mtd/chips/fwh_lock.h
@@ -77,7 +77,7 @@ static int fwh_xxlock_oneblock(struct map_info *map, struct flchip *chip,
 }
 
 
-static int fwh_lock_varsize(struct mtd_info *mtd, loff_t ofs, size_t len)
+static int fwh_lock_varsize(struct mtd_info *mtd, loff_t ofs, u_int64_t len)
 {
 	int ret;
 
@@ -88,7 +88,7 @@ static int fwh_lock_varsize(struct mtd_info *mtd, loff_t ofs, size_t len)
 }
 
 
-static int fwh_unlock_varsize(struct mtd_info *mtd, loff_t ofs, size_t len)
+static int fwh_unlock_varsize(struct mtd_info *mtd, loff_t ofs, u_int64_t len)
 {
 	int ret;
 
diff --git a/drivers/mtd/inftlcore.c b/drivers/mtd/inftlcore.c
index 50ce138..73f0522 100644
--- a/drivers/mtd/inftlcore.c
+++ b/drivers/mtd/inftlcore.c
@@ -50,7 +50,7 @@ static void inftl_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 	struct INFTLrecord *inftl;
 	unsigned long temp;
 
-	if (mtd->type != MTD_NANDFLASH)
+	if (mtd->type != MTD_NANDFLASH || mtd->size > UINT_MAX)
 		return;
 	/* OK, this is moderately ugly.  But probably safe.  Alternatives? */
 	if (memcmp(mtd->name, "DiskOnChip", 10))
diff --git a/drivers/mtd/inftlmount.c b/drivers/mtd/inftlmount.c
index 9113628..f751dd9 100644
--- a/drivers/mtd/inftlmount.c
+++ b/drivers/mtd/inftlmount.c
@@ -63,7 +63,7 @@ static int find_boot_record(struct INFTLrecord *inftl)
 	 * otherwise.
 	 */
 	inftl->EraseSize = inftl->mbd.mtd->erasesize;
-        inftl->nb_blocks = inftl->mbd.mtd->size / inftl->EraseSize;
+        inftl->nb_blocks = (u32)inftl->mbd.mtd->size / inftl->EraseSize;
 
 	inftl->MediaUnit = BLOCK_NIL;
 
@@ -187,7 +187,7 @@ static int find_boot_record(struct INFTLrecord *inftl)
 				mh->BlockMultiplierBits);
 			inftl->EraseSize = inftl->mbd.mtd->erasesize <<
 				mh->BlockMultiplierBits;
-			inftl->nb_blocks = inftl->mbd.mtd->size / inftl->EraseSize;
+			inftl->nb_blocks = (u32)inftl->mbd.mtd->size / inftl->EraseSize;
 			block >>= mh->BlockMultiplierBits;
 		}
 
diff --git a/drivers/mtd/maps/amd76xrom.c b/drivers/mtd/maps/amd76xrom.c
index d1eec7d..237733d 100644
--- a/drivers/mtd/maps/amd76xrom.c
+++ b/drivers/mtd/maps/amd76xrom.c
@@ -232,8 +232,8 @@ static int __devinit amd76xrom_init_one (struct pci_dev *pdev,
 		/* Trim the size if we are larger than the map */
 		if (map->mtd->size > map->map.size) {
 			printk(KERN_WARNING MOD_NAME
-				" rom(%u) larger than window(%lu). fixing...\n",
-				map->mtd->size, map->map.size);
+				" rom(%llu) larger than window(%lu). fixing...\n",
+				(unsigned long long)map->mtd->size, map->map.size);
 			map->mtd->size = map->map.size;
 		}
 		if (window->rsrc.parent) {
diff --git a/drivers/mtd/maps/ck804xrom.c b/drivers/mtd/maps/ck804xrom.c
index 1a6feb4..5f7a245 100644
--- a/drivers/mtd/maps/ck804xrom.c
+++ b/drivers/mtd/maps/ck804xrom.c
@@ -263,8 +263,8 @@ static int __devinit ck804xrom_init_one (struct pci_dev *pdev,
 		/* Trim the size if we are larger than the map */
 		if (map->mtd->size > map->map.size) {
 			printk(KERN_WARNING MOD_NAME
-				" rom(%u) larger than window(%lu). fixing...\n",
-				map->mtd->size, map->map.size);
+				" rom(%llu) larger than window(%lu). fixing...\n",
+				(unsigned long long)map->mtd->size, map->map.size);
 			map->mtd->size = map->map.size;
 		}
 		if (window->rsrc.parent) {
diff --git a/drivers/mtd/maps/esb2rom.c b/drivers/mtd/maps/esb2rom.c
index bbbcdd4..11a2f57 100644
--- a/drivers/mtd/maps/esb2rom.c
+++ b/drivers/mtd/maps/esb2rom.c
@@ -324,8 +324,8 @@ static int __devinit esb2rom_init_one(struct pci_dev *pdev,
 		/* Trim the size if we are larger than the map */
 		if (map->mtd->size > map->map.size) {
 			printk(KERN_WARNING MOD_NAME
-				" rom(%u) larger than window(%lu). fixing...\n",
-				map->mtd->size, map->map.size);
+				" rom(%llu) larger than window(%lu). fixing...\n",
+				(unsigned long long)map->mtd->size, map->map.size);
 			map->mtd->size = map->map.size;
 		}
 		if (window->rsrc.parent) {
diff --git a/drivers/mtd/maps/ichxrom.c b/drivers/mtd/maps/ichxrom.c
index aeb6c91..c32bc28 100644
--- a/drivers/mtd/maps/ichxrom.c
+++ b/drivers/mtd/maps/ichxrom.c
@@ -258,8 +258,8 @@ static int __devinit ichxrom_init_one (struct pci_dev *pdev,
 		/* Trim the size if we are larger than the map */
 		if (map->mtd->size > map->map.size) {
 			printk(KERN_WARNING MOD_NAME
-				" rom(%u) larger than window(%lu). fixing...\n",
-				map->mtd->size, map->map.size);
+				" rom(%llu) larger than window(%lu). fixing...\n",
+				(unsigned long long)map->mtd->size, map->map.size);
 			map->mtd->size = map->map.size;
 		}
 		if (window->rsrc.parent) {
diff --git a/drivers/mtd/maps/nettel.c b/drivers/mtd/maps/nettel.c
index 965e6c6..a8723a6 100644
--- a/drivers/mtd/maps/nettel.c
+++ b/drivers/mtd/maps/nettel.c
@@ -226,7 +226,7 @@ static int __init nettel_init(void)
 
 	if ((amd_mtd = do_map_probe("jedec_probe", &nettel_amd_map))) {
 		printk(KERN_NOTICE "SNAPGEAR: AMD flash device size = %dK\n",
-			amd_mtd->size>>10);
+			(int)(amd_mtd->size>>10));
 
 		amd_mtd->owner = THIS_MODULE;
 
diff --git a/drivers/mtd/maps/scb2_flash.c b/drivers/mtd/maps/scb2_flash.c
index 21169e6..7e329f0 100644
--- a/drivers/mtd/maps/scb2_flash.c
+++ b/drivers/mtd/maps/scb2_flash.c
@@ -118,7 +118,8 @@ scb2_fixup_mtd(struct mtd_info *mtd)
 		struct mtd_erase_region_info *region = &mtd->eraseregions[i];
 
 		if (region->numblocks * region->erasesize > mtd->size) {
-			region->numblocks = (mtd->size / region->erasesize);
+			region->numblocks = ((unsigned long)mtd->size /
+						region->erasesize);
 			done = 1;
 		} else {
 			region->numblocks = 0;
@@ -187,8 +188,9 @@ scb2_flash_probe(struct pci_dev *dev, const struct pci_device_id *ent)
 		return -ENODEV;
 	}
 
-	printk(KERN_NOTICE MODNAME ": chip size 0x%x at offset 0x%x\n",
-	       scb2_mtd->size, SCB2_WINDOW - scb2_mtd->size);
+	printk(KERN_NOTICE MODNAME ": chip size 0x%llx at offset 0x%llx\n",
+	       (unsigned long long)scb2_mtd->size,
+	       (unsigned long long)(SCB2_WINDOW - scb2_mtd->size));
 
 	add_mtd_device(scb2_mtd);
 
diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 963840e..9f4da6e 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -450,16 +450,20 @@ static int mtd_ioctl(struct inode *inode, struct file *file,
 		if (!erase)
 			ret = -ENOMEM;
 		else {
+			struct erase_info_user einfo;
+
 			wait_queue_head_t waitq;
 			DECLARE_WAITQUEUE(wait, current);
 
 			init_waitqueue_head(&waitq);
 
-			if (copy_from_user(&erase->addr, argp,
+			if (copy_from_user(&einfo, argp,
 				    sizeof(struct erase_info_user))) {
 				kfree(erase);
 				return -EFAULT;
 			}
+			erase->addr = einfo.start;
+			erase->len = einfo.length;
 			erase->mtd = mtd;
 			erase->callback = mtdchar_erase_callback;
 			erase->priv = (unsigned long)&waitq;
diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index 789842d..e459189 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -197,7 +197,7 @@ concat_writev(struct mtd_info *mtd, const struct kvec *vecs,
 			continue;
 		}
 
-		size = min(total_len, (size_t)(subdev->size - to));
+		size = min_t(uint64_t, total_len, subdev->size - to);
 		wsize = size; /* store for future use */
 
 		entry_high = entry_low;
@@ -385,7 +385,7 @@ static int concat_erase(struct mtd_info *mtd, struct erase_info *instr)
 	struct mtd_concat *concat = CONCAT(mtd);
 	struct mtd_info *subdev;
 	int i, err;
-	u_int32_t length, offset = 0;
+	u_int64_t length, offset = 0;
 	struct erase_info *erase;
 
 	if (!(mtd->flags & MTD_WRITEABLE))
@@ -518,7 +518,7 @@ static int concat_erase(struct mtd_info *mtd, struct erase_info *instr)
 	return 0;
 }
 
-static int concat_lock(struct mtd_info *mtd, loff_t ofs, size_t len)
+static int concat_lock(struct mtd_info *mtd, loff_t ofs, u_int64_t len)
 {
 	struct mtd_concat *concat = CONCAT(mtd);
 	int i, err = -EINVAL;
@@ -528,7 +528,7 @@ static int concat_lock(struct mtd_info *mtd, loff_t ofs, size_t len)
 
 	for (i = 0; i < concat->num_subdev; i++) {
 		struct mtd_info *subdev = concat->subdev[i];
-		size_t size;
+		u_int64_t size;
 
 		if (ofs >= subdev->size) {
 			size = 0;
@@ -556,7 +556,7 @@ static int concat_lock(struct mtd_info *mtd, loff_t ofs, size_t len)
 	return err;
 }
 
-static int concat_unlock(struct mtd_info *mtd, loff_t ofs, size_t len)
+static int concat_unlock(struct mtd_info *mtd, loff_t ofs, u_int64_t len)
 {
 	struct mtd_concat *concat = CONCAT(mtd);
 	int i, err = 0;
@@ -566,7 +566,7 @@ static int concat_unlock(struct mtd_info *mtd, loff_t ofs, size_t len)
 
 	for (i = 0; i < concat->num_subdev; i++) {
 		struct mtd_info *subdev = concat->subdev[i];
-		size_t size;
+		u_int64_t size;
 
 		if (ofs >= subdev->size) {
 			size = 0;
@@ -842,12 +842,14 @@ struct mtd_info *mtd_concat_create(struct mtd_info *subdev[],	/* subdevices to c
 		concat->mtd.erasesize = curr_erasesize;
 		concat->mtd.numeraseregions = 0;
 	} else {
+		u_int64_t tmp64;
+
 		/*
 		 * erase block size varies across the subdevices: allocate
 		 * space to store the data describing the variable erase regions
 		 */
 		struct mtd_erase_region_info *erase_region_p;
-		u_int32_t begin, position;
+		u_int64_t begin, position;
 
 		concat->mtd.erasesize = max_erasesize;
 		concat->mtd.numeraseregions = num_erase_region;
@@ -879,8 +881,9 @@ struct mtd_info *mtd_concat_create(struct mtd_info *subdev[],	/* subdevices to c
 					erase_region_p->offset = begin;
 					erase_region_p->erasesize =
 					    curr_erasesize;
-					erase_region_p->numblocks =
-					    (position - begin) / curr_erasesize;
+					tmp64 = position - begin;
+					do_div(tmp64, curr_erasesize);
+					erase_region_p->numblocks = tmp64;
 					begin = position;
 
 					curr_erasesize = subdev[i]->erasesize;
@@ -897,9 +900,9 @@ struct mtd_info *mtd_concat_create(struct mtd_info *subdev[],	/* subdevices to c
 						erase_region_p->offset = begin;
 						erase_region_p->erasesize =
 						    curr_erasesize;
-						erase_region_p->numblocks =
-						    (position -
-						     begin) / curr_erasesize;
+						tmp64 = position - begin;
+						do_div(tmp64, curr_erasesize);
+						erase_region_p->numblocks = tmp64;
 						begin = position;
 
 						curr_erasesize =
@@ -909,14 +912,16 @@ struct mtd_info *mtd_concat_create(struct mtd_info *subdev[],	/* subdevices to c
 					}
 					position +=
 					    subdev[i]->eraseregions[j].
-					    numblocks * curr_erasesize;
+					    numblocks * (u_int64_t)curr_erasesize;
 				}
 			}
 		}
 		/* Now write the final entry */
 		erase_region_p->offset = begin;
 		erase_region_p->erasesize = curr_erasesize;
-		erase_region_p->numblocks = (position - begin) / curr_erasesize;
+		tmp64 = position - begin;
+		do_div(tmp64, curr_erasesize);
+		erase_region_p->numblocks = tmp64;
 	}
 
 	return &concat->mtd;
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index a9d2469..76fe0a1 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -57,6 +57,19 @@ int add_mtd_device(struct mtd_info *mtd)
 			mtd->index = i;
 			mtd->usecount = 0;
 
+			if (is_power_of_2(mtd->erasesize))
+				mtd->erasesize_shift = ffs(mtd->erasesize) - 1;
+			else
+				mtd->erasesize_shift = 0;
+
+			if (is_power_of_2(mtd->writesize))
+				mtd->writesize_shift = ffs(mtd->writesize) - 1;
+			else
+				mtd->writesize_shift = 0;
+
+			mtd->erasesize_mask = (1 << mtd->erasesize_shift) - 1;
+			mtd->writesize_mask = (1 << mtd->writesize_shift) - 1;
+
 			/* Some chips always power up locked. Unlock them now */
 			if ((mtd->flags & MTD_WRITEABLE)
 			    && (mtd->flags & MTD_POWERUP_LOCK) && mtd->unlock) {
@@ -344,7 +357,8 @@ static inline int mtd_proc_info (char *buf, int i)
 	if (!this)
 		return 0;
 
-	return sprintf(buf, "mtd%d: %8.8x %8.8x \"%s\"\n", i, this->size,
+	return sprintf(buf, "mtd%d: %8.8llx %8.8x \"%s\"\n", i,
+		       (unsigned long long)this->size,
 		       this->erasesize, this->name);
 }
 
diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index aebb3b2..1a6b3be 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -80,9 +80,9 @@ static int mtdoops_erase_block(struct mtd_info *mtd, int offset)
 	if (ret) {
 		set_current_state(TASK_RUNNING);
 		remove_wait_queue(&wait_q, &wait);
-		printk (KERN_WARNING "mtdoops: erase of region [0x%x, 0x%x] "
+		printk (KERN_WARNING "mtdoops: erase of region [0x%llx, 0x%llx] "
 				     "on \"%s\" failed\n",
-			erase.addr, erase.len, mtd->name);
+			(unsigned long long)erase.addr, (unsigned long long)erase.len, mtd->name);
 		return ret;
 	}
 
@@ -289,7 +289,10 @@ static void mtdoops_notify_add(struct mtd_info *mtd)
 	}
 
 	cxt->mtd = mtd;
-	cxt->oops_pages = mtd->size / OOPS_PAGE_SIZE;
+	if (mtd->size > INT_MAX)
+		cxt->oops_pages = INT_MAX / OOPS_PAGE_SIZE;
+	else
+		cxt->oops_pages = (int)mtd->size / OOPS_PAGE_SIZE;
 
 	find_next_position(cxt);
 
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 3728913..b379a60 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -26,7 +26,7 @@ static LIST_HEAD(mtd_partitions);
 struct mtd_part {
 	struct mtd_info mtd;
 	struct mtd_info *master;
-	u_int32_t offset;
+	uint64_t offset;
 	int index;
 	struct list_head list;
 	int registered;
@@ -235,7 +235,7 @@ void mtd_erase_callback(struct erase_info *instr)
 }
 EXPORT_SYMBOL_GPL(mtd_erase_callback);
 
-static int part_lock(struct mtd_info *mtd, loff_t ofs, size_t len)
+static int part_lock(struct mtd_info *mtd, loff_t ofs, u_int64_t len)
 {
 	struct mtd_part *part = PART(mtd);
 	if ((len + ofs) > mtd->size)
@@ -243,7 +243,7 @@ static int part_lock(struct mtd_info *mtd, loff_t ofs, size_t len)
 	return part->master->lock(part->master, ofs + part->offset, len);
 }
 
-static int part_unlock(struct mtd_info *mtd, loff_t ofs, size_t len)
+static int part_unlock(struct mtd_info *mtd, loff_t ofs, u_int64_t len)
 {
 	struct mtd_part *part = PART(mtd);
 	if ((len + ofs) > mtd->size)
@@ -317,7 +317,7 @@ EXPORT_SYMBOL(del_mtd_partitions);
 
 static struct mtd_part *add_one_partition(struct mtd_info *master,
 		const struct mtd_partition *part, int partno,
-		u_int32_t cur_offset)
+		u_int64_t cur_offset)
 {
 	struct mtd_part *slave;
 
@@ -395,19 +395,19 @@ static struct mtd_part *add_one_partition(struct mtd_info *master,
 		slave->offset = cur_offset;
 	if (slave->offset == MTDPART_OFS_NXTBLK) {
 		slave->offset = cur_offset;
-		if ((cur_offset % master->erasesize) != 0) {
+		if (mtd_mod_by_eb(cur_offset, master) != 0) {
 			/* Round up to next erasesize */
-			slave->offset = ((cur_offset / master->erasesize) + 1) * master->erasesize;
+			slave->offset = (mtd_div_by_eb(cur_offset, master) + 1) * master->erasesize;
 			printk(KERN_NOTICE "Moving partition %d: "
-			       "0x%08x -> 0x%08x\n", partno,
-			       cur_offset, slave->offset);
+			       "0x%012llx -> 0x%012llx\n", partno,
+			       (unsigned long long)cur_offset, (unsigned long long)slave->offset);
 		}
 	}
 	if (slave->mtd.size == MTDPART_SIZ_FULL)
 		slave->mtd.size = master->size - slave->offset;
 
-	printk(KERN_NOTICE "0x%08x-0x%08x : \"%s\"\n", slave->offset,
-		slave->offset + slave->mtd.size, slave->mtd.name);
+	printk(KERN_NOTICE "0x%012llx-0x%012llx : \"%s\"\n", (unsigned long long)slave->offset,
+		(unsigned long long)(slave->offset + slave->mtd.size), slave->mtd.name);
 
 	/* let's do some sanity checks */
 	if (slave->offset >= master->size) {
@@ -420,13 +420,13 @@ static struct mtd_part *add_one_partition(struct mtd_info *master,
 	}
 	if (slave->offset + slave->mtd.size > master->size) {
 		slave->mtd.size = master->size - slave->offset;
-		printk(KERN_WARNING"mtd: partition \"%s\" extends beyond the end of device \"%s\" -- size truncated to %#x\n",
-			part->name, master->name, slave->mtd.size);
+		printk(KERN_WARNING"mtd: partition \"%s\" extends beyond the end of device \"%s\" -- size truncated to %#llx\n",
+			part->name, master->name, (unsigned long long)slave->mtd.size);
 	}
 	if (master->numeraseregions > 1) {
 		/* Deal with variable erase size stuff */
 		int i, max = master->numeraseregions;
-		u32 end = slave->offset + slave->mtd.size;
+		u64 end = slave->offset + slave->mtd.size;
 		struct mtd_erase_region_info *regions = master->eraseregions;
 
 		/* Find the first erase regions which is part of this
@@ -449,7 +449,7 @@ static struct mtd_part *add_one_partition(struct mtd_info *master,
 	}
 
 	if ((slave->mtd.flags & MTD_WRITEABLE) &&
-	    (slave->offset % slave->mtd.erasesize)) {
+	    mtd_mod_by_eb(slave->offset, &slave->mtd)) {
 		/* Doesn't start on a boundary of major erase size */
 		/* FIXME: Let it be writable if it is on a boundary of
 		 * _minor_ erase size though */
@@ -458,7 +458,7 @@ static struct mtd_part *add_one_partition(struct mtd_info *master,
 			part->name);
 	}
 	if ((slave->mtd.flags & MTD_WRITEABLE) &&
-	    (slave->mtd.size % slave->mtd.erasesize)) {
+	    mtd_mod_by_eb(slave->mtd.size, &slave->mtd)) {
 		slave->mtd.flags &= ~MTD_WRITEABLE;
 		printk(KERN_WARNING"mtd: partition \"%s\" doesn't end on an erase block -- force read-only\n",
 			part->name);
@@ -466,7 +466,7 @@ static struct mtd_part *add_one_partition(struct mtd_info *master,
 
 	slave->mtd.ecclayout = master->ecclayout;
 	if (master->block_isbad) {
-		uint32_t offs = 0;
+		uint64_t offs = 0;
 
 		while (offs < slave->mtd.size) {
 			if (master->block_isbad(master,
@@ -501,7 +501,7 @@ int add_mtd_partitions(struct mtd_info *master,
 		       int nbparts)
 {
 	struct mtd_part *slave;
-	u_int32_t cur_offset = 0;
+	u_int64_t cur_offset = 0;
 	int i;
 
 	printk(KERN_NOTICE "Creating %d MTD partitions on \"%s\":\n", nbparts, master->name);
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 0a9c9cd..ff2d33e 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2014,13 +2014,14 @@ static int nand_erase(struct mtd_info *mtd, struct erase_info *instr)
 int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 		    int allowbbt)
 {
-	int page, len, status, pages_per_block, ret, chipnr;
+	int page, status, pages_per_block, ret, chipnr;
 	struct nand_chip *chip = mtd->priv;
-	int rewrite_bbt[NAND_MAX_CHIPS]={0};
+	loff_t rewrite_bbt[NAND_MAX_CHIPS]={0};
 	unsigned int bbt_masked_page = 0xffffffff;
+	loff_t len;
 
-	DEBUG(MTD_DEBUG_LEVEL3, "nand_erase: start = 0x%08x, len = %i\n",
-	      (unsigned int)instr->addr, (unsigned int)instr->len);
+	DEBUG(MTD_DEBUG_LEVEL3, "nand_erase: start = 0x%012llx, len = %llu\n",
+	      (unsigned long long)instr->addr, (unsigned long long)instr->len);
 
 	/* Start address must align on block boundary */
 	if (instr->addr & ((1 << chip->phys_erase_shift) - 1)) {
@@ -2116,7 +2117,8 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 			DEBUG(MTD_DEBUG_LEVEL0, "nand_erase: "
 			      "Failed erase, page 0x%08x\n", page);
 			instr->state = MTD_ERASE_FAILED;
-			instr->fail_addr = (page << chip->page_shift);
+			instr->fail_addr =
+				((loff_t)page << chip->page_shift);
 			goto erase_exit;
 		}
 
@@ -2126,7 +2128,8 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 		 */
 		if (bbt_masked_page != 0xffffffff &&
 		    (page & BBT_PAGE_MASK) == bbt_masked_page)
-			    rewrite_bbt[chipnr] = (page << chip->page_shift);
+			    rewrite_bbt[chipnr] =
+					((loff_t)page << chip->page_shift);
 
 		/* Increment page address and decrement length */
 		len -= (1 << chip->phys_erase_shift);
@@ -2173,7 +2176,7 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 			continue;
 		/* update the BBT for chip */
 		DEBUG(MTD_DEBUG_LEVEL0, "nand_erase_nand: nand_update_bbt "
-		      "(%d:0x%0x 0x%0x)\n", chipnr, rewrite_bbt[chipnr],
+		      "(%d:0x%0llx 0x%0x)\n", chipnr, rewrite_bbt[chipnr],
 		      chip->bbt_td->pages[chipnr]);
 		nand_update_bbt(mtd, rewrite_bbt[chipnr]);
 	}
@@ -2365,7 +2368,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 	if (!mtd->name)
 		mtd->name = type->name;
 
-	chip->chipsize = type->chipsize << 20;
+	chip->chipsize = (uint64_t)type->chipsize << 20;
 
 	/* Newer devices have all the information in additional id bytes */
 	if (!type->pagesize) {
@@ -2423,7 +2426,10 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 
 	chip->bbt_erase_shift = chip->phys_erase_shift =
 		ffs(mtd->erasesize) - 1;
-	chip->chip_shift = ffs(chip->chipsize) - 1;
+	if (chip->chipsize & 0xffffffff)
+		chip->chip_shift = ffs((unsigned)chip->chipsize) - 1;
+	else
+		chip->chip_shift = ffs((unsigned)(chip->chipsize >> 32)) + 32 - 1;
 
 	/* Set the bad block position */
 	chip->badblockpos = mtd->writesize > 512 ?
diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 0b1c485..55c23e5 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -171,16 +171,16 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
 				if (tmp == msk)
 					continue;
 				if (reserved_block_code && (tmp == reserved_block_code)) {
-					printk(KERN_DEBUG "nand_read_bbt: Reserved block at 0x%08x\n",
-					       ((offs << 2) + (act >> 1)) << this->bbt_erase_shift);
+					printk(KERN_DEBUG "nand_read_bbt: Reserved block at 0x%012llx\n",
+					       (loff_t)((offs << 2) + (act >> 1)) << this->bbt_erase_shift);
 					this->bbt[offs + (act >> 3)] |= 0x2 << (act & 0x06);
 					mtd->ecc_stats.bbtblocks++;
 					continue;
 				}
 				/* Leave it for now, if its matured we can move this
 				 * message to MTD_DEBUG_LEVEL0 */
-				printk(KERN_DEBUG "nand_read_bbt: Bad block at 0x%08x\n",
-				       ((offs << 2) + (act >> 1)) << this->bbt_erase_shift);
+				printk(KERN_DEBUG "nand_read_bbt: Bad block at 0x%012llx\n",
+				       (loff_t)((offs << 2) + (act >> 1)) << this->bbt_erase_shift);
 				/* Factory marked bad or worn out ? */
 				if (tmp == 0)
 					this->bbt[offs + (act >> 3)] |= 0x3 << (act & 0x06);
@@ -284,7 +284,7 @@ static int read_abs_bbts(struct mtd_info *mtd, uint8_t *buf,
 
 	/* Read the primary version, if available */
 	if (td->options & NAND_BBT_VERSION) {
-		scan_read_raw(mtd, buf, td->pages[0] << this->page_shift,
+		scan_read_raw(mtd, buf, (loff_t)td->pages[0] << this->page_shift,
 			      mtd->writesize);
 		td->version[0] = buf[mtd->writesize + td->veroffs];
 		printk(KERN_DEBUG "Bad block table at page %d, version 0x%02X\n",
@@ -293,7 +293,7 @@ static int read_abs_bbts(struct mtd_info *mtd, uint8_t *buf,
 
 	/* Read the mirror version, if available */
 	if (md && (md->options & NAND_BBT_VERSION)) {
-		scan_read_raw(mtd, buf, md->pages[0] << this->page_shift,
+		scan_read_raw(mtd, buf, (loff_t)md->pages[0] << this->page_shift,
 			      mtd->writesize);
 		md->version[0] = buf[mtd->writesize + md->veroffs];
 		printk(KERN_DEBUG "Bad block table at page %d, version 0x%02X\n",
@@ -411,7 +411,7 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
 		numblocks = this->chipsize >> (this->bbt_erase_shift - 1);
 		startblock = chip * numblocks;
 		numblocks += startblock;
-		from = startblock << (this->bbt_erase_shift - 1);
+		from = (loff_t)startblock << (this->bbt_erase_shift - 1);
 	}
 
 	for (i = startblock; i < numblocks;) {
@@ -428,8 +428,8 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
 
 		if (ret) {
 			this->bbt[i >> 3] |= 0x03 << (i & 0x6);
-			printk(KERN_WARNING "Bad eraseblock %d at 0x%08x\n",
-			       i >> 1, (unsigned int)from);
+			printk(KERN_WARNING "Bad eraseblock %d at 0x%012llx\n",
+			       i >> 1, (unsigned long long)from);
 			mtd->ecc_stats.badblocks++;
 		}
 
@@ -495,7 +495,7 @@ static int search_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr
 		for (block = 0; block < td->maxblocks; block++) {
 
 			int actblock = startblock + dir * block;
-			loff_t offs = actblock << this->bbt_erase_shift;
+			loff_t offs = (loff_t)actblock << this->bbt_erase_shift;
 
 			/* Read first page */
 			scan_read_raw(mtd, buf, offs, mtd->writesize);
@@ -719,7 +719,7 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 
 		memset(&einfo, 0, sizeof(einfo));
 		einfo.mtd = mtd;
-		einfo.addr = (unsigned long)to;
+		einfo.addr = to;
 		einfo.len = 1 << this->bbt_erase_shift;
 		res = nand_erase_nand(mtd, &einfo, 1);
 		if (res < 0)
@@ -729,8 +729,8 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 		if (res < 0)
 			goto outerr;
 
-		printk(KERN_DEBUG "Bad block table written to 0x%08x, version "
-		       "0x%02X\n", (unsigned int)to, td->version[chip]);
+		printk(KERN_DEBUG "Bad block table written to 0x%012llx, version "
+		       "0x%02X\n", (unsigned long long)to, td->version[chip]);
 
 		/* Mark it as used */
 		td->pages[chip] = page;
@@ -910,7 +910,7 @@ static void mark_bbt_region(struct mtd_info *mtd, struct nand_bbt_descr *td)
 			newval = oldval | (0x2 << (block & 0x06));
 			this->bbt[(block >> 3)] = newval;
 			if ((oldval != newval) && td->reserved_block_code)
-				nand_update_bbt(mtd, block << (this->bbt_erase_shift - 1));
+				nand_update_bbt(mtd, (loff_t)block << (this->bbt_erase_shift - 1));
 			continue;
 		}
 		update = 0;
@@ -931,7 +931,7 @@ static void mark_bbt_region(struct mtd_info *mtd, struct nand_bbt_descr *td)
 		   new ones have been marked, then we need to update the stored
 		   bbts.  This should only happen once. */
 		if (update && td->reserved_block_code)
-			nand_update_bbt(mtd, (block - 2) << (this->bbt_erase_shift - 1));
+			nand_update_bbt(mtd, (loff_t)(block - 2) << (this->bbt_erase_shift - 1));
 	}
 }
 
@@ -1027,7 +1027,6 @@ int nand_update_bbt(struct mtd_info *mtd, loff_t offs)
 	if (!this->bbt || !td)
 		return -EINVAL;
 
-	len = mtd->size >> (this->bbt_erase_shift + 2);
 	/* Allocate a temporary buffer for one eraseblock incl. oob */
 	len = (1 << this->bbt_erase_shift);
 	len += (len >> this->page_shift) * mtd->oobsize;
diff --git a/drivers/mtd/nftlcore.c b/drivers/mtd/nftlcore.c
index 320b929..d1c4546 100644
--- a/drivers/mtd/nftlcore.c
+++ b/drivers/mtd/nftlcore.c
@@ -39,7 +39,7 @@ static void nftl_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 	struct NFTLrecord *nftl;
 	unsigned long temp;
 
-	if (mtd->type != MTD_NANDFLASH)
+	if (mtd->type != MTD_NANDFLASH || mtd->size > UINT_MAX)
 		return;
 	/* OK, this is moderately ugly.  But probably safe.  Alternatives? */
 	if (memcmp(mtd->name, "DiskOnChip", 10))
diff --git a/drivers/mtd/nftlmount.c b/drivers/mtd/nftlmount.c
index ccc4f20..8b22b18 100644
--- a/drivers/mtd/nftlmount.c
+++ b/drivers/mtd/nftlmount.c
@@ -51,7 +51,7 @@ static int find_boot_record(struct NFTLrecord *nftl)
 	   the mtd device accordingly.  We could even get rid of
 	   nftl->EraseSize if there were any point in doing so. */
 	nftl->EraseSize = nftl->mbd.mtd->erasesize;
-        nftl->nb_blocks = nftl->mbd.mtd->size / nftl->EraseSize;
+        nftl->nb_blocks = (u32)nftl->mbd.mtd->size / nftl->EraseSize;
 
 	nftl->MediaUnit = BLOCK_NIL;
 	nftl->SpareMediaUnit = BLOCK_NIL;
@@ -168,7 +168,7 @@ device is already correct.
 			printk(KERN_NOTICE "WARNING: Support for NFTL with UnitSizeFactor 0x%02x is experimental\n",
 			       mh->UnitSizeFactor);
 			nftl->EraseSize = nftl->mbd.mtd->erasesize << (0xff - mh->UnitSizeFactor);
-			nftl->nb_blocks = nftl->mbd.mtd->size / nftl->EraseSize;
+			nftl->nb_blocks = (u32)nftl->mbd.mtd->size / nftl->EraseSize;
 		}
 #endif
 		nftl->nb_boot_blocks = le16_to_cpu(mh->FirstPhysicalEUN);
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 90ed319..b011239 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -1772,7 +1772,7 @@ static int onenand_erase(struct mtd_info *mtd, struct erase_info *instr)
 	int len;
 	int ret = 0;
 
-	DEBUG(MTD_DEBUG_LEVEL3, "onenand_erase: start = 0x%08x, len = %i\n", (unsigned int) instr->addr, (unsigned int) instr->len);
+	DEBUG(MTD_DEBUG_LEVEL3, "onenand_erase: start = 0x%012llx, len = %llu\n", (unsigned long long) instr->addr, (unsigned long long) instr->len);
 
 	block_size = (1 << this->erase_shift);
 
@@ -1810,7 +1810,7 @@ static int onenand_erase(struct mtd_info *mtd, struct erase_info *instr)
 
 		/* Check if we have a bad block, we do not erase bad blocks */
 		if (onenand_block_isbad_nolock(mtd, addr, 0)) {
-			printk (KERN_WARNING "onenand_erase: attempt to erase a bad block at addr 0x%08x\n", (unsigned int) addr);
+			printk (KERN_WARNING "onenand_erase: attempt to erase a bad block at addr 0x%012llx\n", (unsigned long long) addr);
 			instr->state = MTD_ERASE_FAILED;
 			goto erase_exit;
 		}
@@ -2029,7 +2029,7 @@ static int onenand_do_lock_cmd(struct mtd_info *mtd, loff_t ofs, size_t len, int
  *
  * Lock one or more blocks
  */
-static int onenand_lock(struct mtd_info *mtd, loff_t ofs, size_t len)
+static int onenand_lock(struct mtd_info *mtd, loff_t ofs, u_int64_t len)
 {
 	int ret;
 
@@ -2047,7 +2047,7 @@ static int onenand_lock(struct mtd_info *mtd, loff_t ofs, size_t len)
  *
  * Unlock one or more blocks
  */
-static int onenand_unlock(struct mtd_info *mtd, loff_t ofs, size_t len)
+static int onenand_unlock(struct mtd_info *mtd, loff_t ofs, u_int64_t len)
 {
 	int ret;
 
diff --git a/drivers/mtd/rfd_ftl.c b/drivers/mtd/rfd_ftl.c
index e538c0a..490b474 100644
--- a/drivers/mtd/rfd_ftl.c
+++ b/drivers/mtd/rfd_ftl.c
@@ -156,7 +156,7 @@ static int scan_header(struct partition *part)
 	size_t retlen;
 
 	sectors_per_block = part->block_size / SECTOR_SIZE;
-	part->total_blocks = part->mbd.mtd->size / part->block_size;
+	part->total_blocks = (u32)part->mbd.mtd->size / part->block_size;
 
 	if (part->total_blocks < 2)
 		return -ENOENT;
@@ -276,16 +276,17 @@ static void erase_callback(struct erase_info *erase)
 
 	part = (struct partition*)erase->priv;
 
-	i = erase->addr / part->block_size;
-	if (i >= part->total_blocks || part->blocks[i].offset != erase->addr) {
-		printk(KERN_ERR PREFIX "erase callback for unknown offset %x "
-				"on '%s'\n", erase->addr, part->mbd.mtd->name);
+	i = (u32)erase->addr / part->block_size;
+	if (i >= part->total_blocks || part->blocks[i].offset != erase->addr ||
+	    erase->addr > UINT_MAX) {
+		printk(KERN_ERR PREFIX "erase callback for unknown offset %llx "
+				"on '%s'\n", (unsigned long long)erase->addr, part->mbd.mtd->name);
 		return;
 	}
 
 	if (erase->state != MTD_ERASE_DONE) {
-		printk(KERN_WARNING PREFIX "erase failed at 0x%x on '%s', "
-				"state %d\n", erase->addr,
+		printk(KERN_WARNING PREFIX "erase failed at 0x%llx on '%s', "
+				"state %d\n", (unsigned long long)erase->addr,
 				part->mbd.mtd->name, erase->state);
 
 		part->blocks[i].state = BLOCK_FAILED;
@@ -345,9 +346,9 @@ static int erase_block(struct partition *part, int block)
 	rc = part->mbd.mtd->erase(part->mbd.mtd, erase);
 
 	if (rc) {
-		printk(KERN_ERR PREFIX "erase of region %x,%x on '%s' "
-				"failed\n", erase->addr, erase->len,
-				part->mbd.mtd->name);
+		printk(KERN_ERR PREFIX "erase of region %llx,%llx on '%s' "
+				"failed\n", (unsigned long long)erase->addr,
+				(unsigned long long)erase->len, part->mbd.mtd->name);
 		kfree(erase);
 	}
 
@@ -763,7 +764,7 @@ static void rfd_ftl_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 {
 	struct partition *part;
 
-	if (mtd->type != MTD_NORFLASH)
+	if (mtd->type != MTD_NORFLASH || mtd->size > UINT_MAX)
 		return;
 
 	part = kzalloc(sizeof(struct partition), GFP_KERNEL);
diff --git a/drivers/mtd/ssfdc.c b/drivers/mtd/ssfdc.c
index 33a5d6e..3f67e00 100644
--- a/drivers/mtd/ssfdc.c
+++ b/drivers/mtd/ssfdc.c
@@ -294,7 +294,8 @@ static void ssfdcr_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 	int cis_sector;
 
 	/* Check for small page NAND flash */
-	if (mtd->type != MTD_NANDFLASH || mtd->oobsize != OOB_SIZE)
+	if (mtd->type != MTD_NANDFLASH || mtd->oobsize != OOB_SIZE ||
+	    mtd->size > UINT_MAX)
 		return;
 
 	/* Check for SSDFC format by reading CIS/IDI sector */
@@ -316,7 +317,7 @@ static void ssfdcr_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 
 	ssfdc->cis_block = cis_sector / (mtd->erasesize >> SECTOR_SHIFT);
 	ssfdc->erase_size = mtd->erasesize;
-	ssfdc->map_len = mtd->size / mtd->erasesize;
+	ssfdc->map_len = (u32)mtd->size / mtd->erasesize;
 
 	DEBUG(MTD_DEBUG_LEVEL1,
 		"SSFDC_RO: cis_block=%d,erase_size=%d,map_len=%d,n_zones=%d\n",
@@ -327,7 +328,7 @@ static void ssfdcr_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 	ssfdc->heads = 16;
 	ssfdc->sectors = 32;
 	get_chs(mtd->size, NULL, &ssfdc->heads, &ssfdc->sectors);
-	ssfdc->cylinders = (unsigned short)((mtd->size >> SECTOR_SHIFT) /
+	ssfdc->cylinders = (unsigned short)(((u32)mtd->size >> SECTOR_SHIFT) /
 			((long)ssfdc->sectors * (long)ssfdc->heads));
 
 	DEBUG(MTD_DEBUG_LEVEL1, "SSFDC_RO: using C:%d H:%d S:%d == %ld sects\n",
diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index c7630a2..634e2e8 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -561,7 +561,7 @@ static int io_init(struct ubi_device *ubi)
 	 */
 
 	ubi->peb_size   = ubi->mtd->erasesize;
-	ubi->peb_count  = ubi->mtd->size / ubi->mtd->erasesize;
+	ubi->peb_count  = mtd_div_by_eb(ubi->mtd->size, ubi->mtd);
 	ubi->flash_size = ubi->mtd->size;
 
 	if (ubi->mtd->block_isbad && ubi->mtd->block_markbad)
diff --git a/drivers/mtd/ubi/gluebi.c b/drivers/mtd/ubi/gluebi.c
index 605812b..6dd4f5e 100644
--- a/drivers/mtd/ubi/gluebi.c
+++ b/drivers/mtd/ubi/gluebi.c
@@ -215,7 +215,8 @@ static int gluebi_erase(struct mtd_info *mtd, struct erase_info *instr)
 	struct ubi_volume *vol;
 	struct ubi_device *ubi;
 
-	dbg_gen("erase %u bytes at offset %u", instr->len, instr->addr);
+	dbg_gen("erase %llu bytes at offset %llu", (unsigned long long)instr->len,
+		 (unsigned long long)instr->addr);
 
 	if (instr->addr < 0 || instr->addr > mtd->size - mtd->erasesize)
 		return -EINVAL;
@@ -223,11 +224,11 @@ static int gluebi_erase(struct mtd_info *mtd, struct erase_info *instr)
 	if (instr->len < 0 || instr->addr + instr->len > mtd->size)
 		return -EINVAL;
 
-	if (instr->addr % mtd->writesize || instr->len % mtd->writesize)
+	if (mtd_mod_by_ws(instr->addr, mtd) || mtd_mod_by_ws(instr->len, mtd))
 		return -EINVAL;
 
-	lnum = instr->addr / mtd->erasesize;
-	count = instr->len / mtd->erasesize;
+	lnum = mtd_div_by_eb(instr->addr, mtd);
+	count = mtd_div_by_eb(instr->len, mtd);
 
 	vol = container_of(mtd, struct ubi_volume, gluebi_mtd);
 	ubi = vol->ubi;
@@ -255,7 +256,7 @@ static int gluebi_erase(struct mtd_info *mtd, struct erase_info *instr)
 
 out_err:
 	instr->state = MTD_ERASE_FAILED;
-	instr->fail_addr = lnum * mtd->erasesize;
+	instr->fail_addr = (long long)lnum * mtd->erasesize;
 	return err;
 }
 
@@ -294,7 +295,7 @@ int ubi_create_gluebi(struct ubi_device *ubi, struct ubi_volume *vol)
 	 * bytes.
 	 */
 	if (vol->vol_type == UBI_DYNAMIC_VOLUME)
-		mtd->size = vol->usable_leb_size * vol->reserved_pebs;
+		mtd->size = (long long)vol->usable_leb_size * vol->reserved_pebs;
 	else
 		mtd->size = vol->used_bytes;
 
@@ -304,8 +305,8 @@ int ubi_create_gluebi(struct ubi_device *ubi, struct ubi_volume *vol)
 		return -ENFILE;
 	}
 
-	dbg_gen("added mtd%d (\"%s\"), size %u, EB size %u",
-		mtd->index, mtd->name, mtd->size, mtd->erasesize);
+	dbg_gen("added mtd%d (\"%s\"), size %llu, EB size %u",
+		mtd->index, mtd->name, (unsigned long long)mtd->size, mtd->erasesize);
 	return 0;
 }
 
diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
index 259461b..c32b4a1 100644
--- a/fs/jffs2/erase.c
+++ b/fs/jffs2/erase.c
@@ -175,7 +175,7 @@ static void jffs2_erase_failed(struct jffs2_sb_info *c, struct jffs2_eraseblock
 {
 	/* For NAND, if the failure did not occur at the device level for a
 	   specific physical page, don't bother updating the bad block table. */
-	if (jffs2_cleanmarker_oob(c) && (bad_offset != MTD_FAIL_ADDR_UNKNOWN)) {
+	if (jffs2_cleanmarker_oob(c) && (bad_offset != (uint32_t)MTD_FAIL_ADDR_UNKNOWN)) {
 		/* We had a device-level failure to erase.  Let's see if we've
 		   failed too many times. */
 		if (!jffs2_write_nand_badblock(c, jeb, bad_offset)) {
@@ -209,7 +209,8 @@ static void jffs2_erase_callback(struct erase_info *instr)
 	struct erase_priv_struct *priv = (void *)instr->priv;
 
 	if(instr->state != MTD_ERASE_DONE) {
-		printk(KERN_WARNING "Erase at 0x%08x finished, but state != MTD_ERASE_DONE. State is 0x%x instead.\n", instr->addr, instr->state);
+		printk(KERN_WARNING "Erase at 0x%08llx finished, but state != MTD_ERASE_DONE. State is 0x%x instead.\n",
+			(unsigned long long)instr->addr, instr->state);
 		jffs2_erase_failed(priv->c, priv->jeb, instr->fail_addr);
 	} else {
 		jffs2_erase_succeeded(priv->c, priv->jeb);
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index eae26bb..c720ee6 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -15,6 +15,8 @@
 #include <linux/mtd/compatmac.h>
 #include <mtd/mtd-abi.h>
 
+#include <asm/div64.h>
+
 #define MTD_CHAR_MAJOR 90
 #define MTD_BLOCK_MAJOR 31
 #define MAX_MTD_DEVICES 32
@@ -25,16 +27,16 @@
 #define MTD_ERASE_DONE          0x08
 #define MTD_ERASE_FAILED        0x10
 
-#define MTD_FAIL_ADDR_UNKNOWN 0xffffffff
+#define MTD_FAIL_ADDR_UNKNOWN -1LL
 
 /* If the erase fails, fail_addr might indicate exactly which block failed.  If
    fail_addr = MTD_FAIL_ADDR_UNKNOWN, the failure was not at the device level or was not
    specific to any particular block. */
 struct erase_info {
 	struct mtd_info *mtd;
-	u_int32_t addr;
-	u_int32_t len;
-	u_int32_t fail_addr;
+	u_int64_t addr;
+	u_int64_t len;
+	u_int64_t fail_addr;
 	u_long time;
 	u_long retries;
 	u_int dev;
@@ -46,7 +48,7 @@ struct erase_info {
 };
 
 struct mtd_erase_region_info {
-	u_int32_t offset;			/* At which this region starts, from the beginning of the MTD */
+	u_int64_t offset;			/* At which this region starts, from the beginning of the MTD */
 	u_int32_t erasesize;		/* For this region */
 	u_int32_t numblocks;		/* Number of blocks of erasesize in this region */
 	unsigned long *lockmap;		/* If keeping bitmap of locks */
@@ -101,7 +103,7 @@ struct mtd_oob_ops {
 struct mtd_info {
 	u_char type;
 	u_int32_t flags;
-	u_int32_t size;	 // Total size of the MTD
+	u_int64_t size;	 // Total size of the MTD
 
 	/* "Major" erase size for the device. Naïve users may take this
 	 * to be the only erase size available, or may use the more detailed
@@ -120,6 +122,16 @@ struct mtd_info {
 	u_int32_t oobsize;   // Amount of OOB data per block (e.g. 16)
 	u_int32_t oobavail;  // Available OOB bytes per block
 
+	/*
+	 * If erasesize is a power of 2 then the shift is stored in
+	 * erasesize_shift otherwise erasesize_shift is zero. Ditto writesize.
+	 */
+	unsigned int erasesize_shift;
+	unsigned int writesize_shift;
+	/* Masks based on erasesize_shift and writesize_shift */
+	unsigned int erasesize_mask;
+	unsigned int writesize_mask;
+
 	// Kernel-only stuff starts here.
 	const char *name;
 	int index;
@@ -190,8 +202,8 @@ struct mtd_info {
 	void (*sync) (struct mtd_info *mtd);
 
 	/* Chip-supported device locking */
-	int (*lock) (struct mtd_info *mtd, loff_t ofs, size_t len);
-	int (*unlock) (struct mtd_info *mtd, loff_t ofs, size_t len);
+	int (*lock) (struct mtd_info *mtd, loff_t ofs, u_int64_t len);
+	int (*unlock) (struct mtd_info *mtd, loff_t ofs, u_int64_t len);
 
 	/* Power Management functions */
 	int (*suspend) (struct mtd_info *mtd);
@@ -221,6 +233,35 @@ struct mtd_info {
 	void (*put_device) (struct mtd_info *mtd);
 };
 
+static inline u_int32_t mtd_div_by_eb(u_int64_t sz, struct mtd_info *mtd)
+{
+	if (mtd->erasesize_shift)
+		return sz >> mtd->erasesize_shift;
+	do_div(sz, mtd->erasesize);
+	return sz;
+}
+
+static inline u_int32_t mtd_mod_by_eb(u_int64_t sz, struct mtd_info *mtd)
+{
+	if (mtd->erasesize_shift)
+		return sz & mtd->erasesize_mask;
+	return do_div(sz, mtd->erasesize);
+}
+
+static inline u_int32_t mtd_div_by_ws(u_int64_t sz, struct mtd_info *mtd)
+{
+	if (mtd->writesize_shift)
+		return sz >> mtd->writesize_shift;
+	do_div(sz, mtd->writesize);
+	return sz;
+}
+
+static inline u_int32_t mtd_mod_by_ws(u_int64_t sz, struct mtd_info *mtd)
+{
+	if (mtd->writesize_shift)
+		return sz & mtd->writesize_mask;
+	return do_div(sz, mtd->writesize);
+}
 
 	/* Kernel-side ioctl definitions */
 
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 733d3f3..c0677b8 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -399,7 +399,7 @@ struct nand_chip {
 	int		bbt_erase_shift;
 	int		chip_shift;
 	int		numchips;
-	unsigned long	chipsize;
+	uint64_t	chipsize;
 	int		pagemask;
 	int		pagebuf;
 	int		subpagesize;
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index c92b4d4..65fba79 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -36,8 +36,8 @@
 
 struct mtd_partition {
 	char *name;			/* identifier string */
-	u_int32_t size;			/* partition size */
-	u_int32_t offset;		/* offset within the master MTD space */
+	u_int64_t size;			/* partition size */
+	u_int64_t offset;		/* offset within the master MTD space */
 	u_int32_t mask_flags;		/* master MTD flags to mask out for this partition */
 	struct nand_ecclayout *ecclayout;	/* out of band layout for this partition (NAND only)*/
 	struct mtd_info **mtdp;		/* pointer to store the MTD object */
-- 
1.5.4.3
