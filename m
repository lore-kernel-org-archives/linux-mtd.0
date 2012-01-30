Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rrs7Y-0005zi-Qs
 for linux-mtd@lists.infradead.org; Mon, 30 Jan 2012 14:22:19 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 3/3] mtd: add leading underscore to all mtd functions
Date: Mon, 30 Jan 2012 16:24:07 +0200
Message-Id: <1327933447-17356-3-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1327933447-17356-1-git-send-email-dedekind1@gmail.com>
References: <1327933447-17356-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

This patch renames all MTD functions by adding a "_" prefix:

mtd->erase -> mtd->_erase
mtd->read_oob -> mtd->_read_oob
...

The reason is that we are re-working the MTD API and from now on it is
an error to use MTD function pointers directly - we have a corresponding
API call for every pointer. By adding a leading "_" we achieve the following:

1. Make sure we convert every direct pointer users
2. A leading "_" suggests that this interface is internal and it becomes
   less likely that people will use them directly
3. Make sure all the out-of-tree modules stop compiling and the owners
   spot the big API change and amend them.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/chips/cfi_cmdset_0001.c |   40 ++++----
 drivers/mtd/chips/cfi_cmdset_0002.c |   26 +++---
 drivers/mtd/chips/cfi_cmdset_0020.c |   18 ++--
 drivers/mtd/chips/fwh_lock.h        |    4 +-
 drivers/mtd/chips/map_absent.c      |    8 +-
 drivers/mtd/chips/map_ram.c         |   10 +-
 drivers/mtd/chips/map_rom.c         |   10 +-
 drivers/mtd/devices/block2mtd.c     |   10 +-
 drivers/mtd/devices/doc2000.c       |   10 +-
 drivers/mtd/devices/doc2001.c       |   10 +-
 drivers/mtd/devices/doc2001plus.c   |   10 +-
 drivers/mtd/devices/docg3.c         |   12 ++--
 drivers/mtd/devices/lart.c          |    6 +-
 drivers/mtd/devices/m25p80.c        |    8 +-
 drivers/mtd/devices/ms02-nv.c       |    4 +-
 drivers/mtd/devices/mtd_dataflash.c |   16 ++--
 drivers/mtd/devices/mtdram.c        |   12 ++--
 drivers/mtd/devices/phram.c         |   10 +-
 drivers/mtd/devices/pmc551.c        |   10 +-
 drivers/mtd/devices/slram.c         |   10 +-
 drivers/mtd/devices/spear_smi.c     |    6 +-
 drivers/mtd/devices/sst25l.c        |    6 +-
 drivers/mtd/inftlcore.c             |    2 +-
 drivers/mtd/lpddr/lpddr_cmds.c      |   16 ++--
 drivers/mtd/maps/uclinux.c          |    2 +-
 drivers/mtd/maps/vmu-flash.c        |    6 +-
 drivers/mtd/mtdchar.c               |    4 +-
 drivers/mtd/mtdconcat.c             |   42 +++++-----
 drivers/mtd/mtdcore.c               |   14 ++--
 drivers/mtd/mtdpart.c               |   91 ++++++++++---------
 drivers/mtd/nand/alauda.c           |    8 +-
 drivers/mtd/nand/nand_base.c        |   30 +++---
 drivers/mtd/onenand/onenand_base.c  |   42 +++++-----
 drivers/mtd/ubi/gluebi.c            |   10 +-
 drivers/net/ethernet/sfc/mtd.c      |    8 +-
 include/linux/mtd/mtd.h             |  168 +++++++++++++++++-----------------
 36 files changed, 350 insertions(+), 349 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index e1e122f..152accf 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -262,9 +262,9 @@ static void fixup_st_m28w320cb(struct mtd_info *mtd)
 static void fixup_use_point(struct mtd_info *mtd)
 {
 	struct map_info *map = mtd->priv;
-	if (!mtd->point && map_is_linear(map)) {
-		mtd->point   = cfi_intelext_point;
-		mtd->unpoint = cfi_intelext_unpoint;
+	if (!mtd->_point && map_is_linear(map)) {
+		mtd->_point   = cfi_intelext_point;
+		mtd->_unpoint = cfi_intelext_unpoint;
 	}
 }
 
@@ -274,8 +274,8 @@ static void fixup_use_write_buffers(struct mtd_info *mtd)
 	struct cfi_private *cfi = map->fldrv_priv;
 	if (cfi->cfiq->BufWriteTimeoutTyp) {
 		printk(KERN_INFO "Using buffer write method\n" );
-		mtd->write = cfi_intelext_write_buffers;
-		mtd->writev = cfi_intelext_writev;
+		mtd->_write = cfi_intelext_write_buffers;
+		mtd->_writev = cfi_intelext_writev;
 	}
 }
 
@@ -443,15 +443,15 @@ struct mtd_info *cfi_cmdset_0001(struct map_info *map, int primary)
 	mtd->type = MTD_NORFLASH;
 
 	/* Fill in the default mtd operations */
-	mtd->erase   = cfi_intelext_erase_varsize;
-	mtd->read    = cfi_intelext_read;
-	mtd->write   = cfi_intelext_write_words;
-	mtd->sync    = cfi_intelext_sync;
-	mtd->lock    = cfi_intelext_lock;
-	mtd->unlock  = cfi_intelext_unlock;
-	mtd->is_locked = cfi_intelext_is_locked;
-	mtd->suspend = cfi_intelext_suspend;
-	mtd->resume  = cfi_intelext_resume;
+	mtd->_erase   = cfi_intelext_erase_varsize;
+	mtd->_read    = cfi_intelext_read;
+	mtd->_write   = cfi_intelext_write_words;
+	mtd->_sync    = cfi_intelext_sync;
+	mtd->_lock    = cfi_intelext_lock;
+	mtd->_unlock  = cfi_intelext_unlock;
+	mtd->_is_locked = cfi_intelext_is_locked;
+	mtd->_suspend = cfi_intelext_suspend;
+	mtd->_resume  = cfi_intelext_resume;
 	mtd->flags   = MTD_CAP_NORFLASH;
 	mtd->name    = map->name;
 	mtd->writesize = 1;
@@ -600,12 +600,12 @@ static struct mtd_info *cfi_intelext_setup(struct mtd_info *mtd)
 	}
 
 #ifdef CONFIG_MTD_OTP
-	mtd->read_fact_prot_reg = cfi_intelext_read_fact_prot_reg;
-	mtd->read_user_prot_reg = cfi_intelext_read_user_prot_reg;
-	mtd->write_user_prot_reg = cfi_intelext_write_user_prot_reg;
-	mtd->lock_user_prot_reg = cfi_intelext_lock_user_prot_reg;
-	mtd->get_fact_prot_info = cfi_intelext_get_fact_prot_info;
-	mtd->get_user_prot_info = cfi_intelext_get_user_prot_info;
+	mtd->_read_fact_prot_reg = cfi_intelext_read_fact_prot_reg;
+	mtd->_read_user_prot_reg = cfi_intelext_read_user_prot_reg;
+	mtd->_write_user_prot_reg = cfi_intelext_write_user_prot_reg;
+	mtd->_lock_user_prot_reg = cfi_intelext_lock_user_prot_reg;
+	mtd->_get_fact_prot_info = cfi_intelext_get_fact_prot_info;
+	mtd->_get_user_prot_info = cfi_intelext_get_user_prot_info;
 #endif
 
 	/* This function has the potential to distort the reality
diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index e2d94bb..27ac062 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -192,7 +192,7 @@ static void fixup_use_write_buffers(struct mtd_info *mtd)
 	struct cfi_private *cfi = map->fldrv_priv;
 	if (cfi->cfiq->BufWriteTimeoutTyp) {
 		pr_debug("Using buffer write method\n" );
-		mtd->write = cfi_amdstd_write_buffers;
+		mtd->_write = cfi_amdstd_write_buffers;
 	}
 }
 
@@ -231,8 +231,8 @@ static void fixup_convert_atmel_pri(struct mtd_info *mtd)
 static void fixup_use_secsi(struct mtd_info *mtd)
 {
 	/* Setup for chips with a secsi area */
-	mtd->read_user_prot_reg = cfi_amdstd_secsi_read;
-	mtd->read_fact_prot_reg = cfi_amdstd_secsi_read;
+	mtd->_read_user_prot_reg = cfi_amdstd_secsi_read;
+	mtd->_read_fact_prot_reg = cfi_amdstd_secsi_read;
 }
 
 static void fixup_use_erase_chip(struct mtd_info *mtd)
@@ -241,7 +241,7 @@ static void fixup_use_erase_chip(struct mtd_info *mtd)
 	struct cfi_private *cfi = map->fldrv_priv;
 	if ((cfi->cfiq->NumEraseRegions == 1) &&
 		((cfi->cfiq->EraseRegionInfo[0] & 0xffff) == 0)) {
-		mtd->erase = cfi_amdstd_erase_chip;
+		mtd->_erase = cfi_amdstd_erase_chip;
 	}
 
 }
@@ -252,8 +252,8 @@ static void fixup_use_erase_chip(struct mtd_info *mtd)
  */
 static void fixup_use_atmel_lock(struct mtd_info *mtd)
 {
-	mtd->lock = cfi_atmel_lock;
-	mtd->unlock = cfi_atmel_unlock;
+	mtd->_lock = cfi_atmel_lock;
+	mtd->_unlock = cfi_atmel_unlock;
 	mtd->flags |= MTD_POWERUP_LOCK;
 }
 
@@ -432,12 +432,12 @@ struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)
 	mtd->type = MTD_NORFLASH;
 
 	/* Fill in the default mtd operations */
-	mtd->erase   = cfi_amdstd_erase_varsize;
-	mtd->write   = cfi_amdstd_write_words;
-	mtd->read    = cfi_amdstd_read;
-	mtd->sync    = cfi_amdstd_sync;
-	mtd->suspend = cfi_amdstd_suspend;
-	mtd->resume  = cfi_amdstd_resume;
+	mtd->_erase   = cfi_amdstd_erase_varsize;
+	mtd->_write   = cfi_amdstd_write_words;
+	mtd->_read    = cfi_amdstd_read;
+	mtd->_sync    = cfi_amdstd_sync;
+	mtd->_suspend = cfi_amdstd_suspend;
+	mtd->_resume  = cfi_amdstd_resume;
 	mtd->flags   = MTD_CAP_NORFLASH;
 	mtd->name    = map->name;
 	mtd->writesize = 1;
@@ -446,7 +446,7 @@ struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)
 	pr_debug("MTD %s(): write buffer size %d\n", __func__,
 			mtd->writebufsize);
 
-	mtd->panic_write = cfi_amdstd_panic_write;
+	mtd->_panic_write = cfi_amdstd_panic_write;
 	mtd->reboot_notifier.notifier_call = cfi_amdstd_reboot;
 
 	if (cfi->cfi_mode==CFI_MODE_CFI){
diff --git a/drivers/mtd/chips/cfi_cmdset_0020.c b/drivers/mtd/chips/cfi_cmdset_0020.c
index 85e8018..3861cca 100644
--- a/drivers/mtd/chips/cfi_cmdset_0020.c
+++ b/drivers/mtd/chips/cfi_cmdset_0020.c
@@ -228,15 +228,15 @@ static struct mtd_info *cfi_staa_setup(struct map_info *map)
 		}
 
 	/* Also select the correct geometry setup too */
-	mtd->erase = cfi_staa_erase_varsize;
-	mtd->read = cfi_staa_read;
-        mtd->write = cfi_staa_write_buffers;
-	mtd->writev = cfi_staa_writev;
-	mtd->sync = cfi_staa_sync;
-	mtd->lock = cfi_staa_lock;
-	mtd->unlock = cfi_staa_unlock;
-	mtd->suspend = cfi_staa_suspend;
-	mtd->resume = cfi_staa_resume;
+	mtd->_erase = cfi_staa_erase_varsize;
+	mtd->_read = cfi_staa_read;
+	mtd->_write = cfi_staa_write_buffers;
+	mtd->_writev = cfi_staa_writev;
+	mtd->_sync = cfi_staa_sync;
+	mtd->_lock = cfi_staa_lock;
+	mtd->_unlock = cfi_staa_unlock;
+	mtd->_suspend = cfi_staa_suspend;
+	mtd->_resume = cfi_staa_resume;
 	mtd->flags = MTD_CAP_NORFLASH & ~MTD_BIT_WRITEABLE;
 	mtd->writesize = 8; /* FIXME: Should be 0 for STMicro flashes w/out ECC */
 	mtd->writebufsize = cfi_interleave(cfi) << cfi->cfiq->MaxBufWriteSize;
diff --git a/drivers/mtd/chips/fwh_lock.h b/drivers/mtd/chips/fwh_lock.h
index 89c6595..800b0e8 100644
--- a/drivers/mtd/chips/fwh_lock.h
+++ b/drivers/mtd/chips/fwh_lock.h
@@ -101,7 +101,7 @@ static void fixup_use_fwh_lock(struct mtd_info *mtd)
 {
 	printk(KERN_NOTICE "using fwh lock/unlock method\n");
 	/* Setup for the chips with the fwh lock method */
-	mtd->lock   = fwh_lock_varsize;
-	mtd->unlock = fwh_unlock_varsize;
+	mtd->_lock   = fwh_lock_varsize;
+	mtd->_unlock = fwh_unlock_varsize;
 }
 #endif /* FWH_LOCK_H */
diff --git a/drivers/mtd/chips/map_absent.c b/drivers/mtd/chips/map_absent.c
index f2b8729..6be2edd 100644
--- a/drivers/mtd/chips/map_absent.c
+++ b/drivers/mtd/chips/map_absent.c
@@ -55,10 +55,10 @@ static struct mtd_info *map_absent_probe(struct map_info *map)
 	mtd->name 	= map->name;
 	mtd->type 	= MTD_ABSENT;
 	mtd->size 	= map->size;
-	mtd->erase 	= map_absent_erase;
-	mtd->read 	= map_absent_read;
-	mtd->write 	= map_absent_write;
-	mtd->sync 	= map_absent_sync;
+	mtd->_erase 	= map_absent_erase;
+	mtd->_read 	= map_absent_read;
+	mtd->_write 	= map_absent_write;
+	mtd->_sync 	= map_absent_sync;
 	mtd->flags 	= 0;
 	mtd->erasesize  = PAGE_SIZE;
 	mtd->writesize  = 1;
diff --git a/drivers/mtd/chips/map_ram.c b/drivers/mtd/chips/map_ram.c
index 67640cc..2253070 100644
--- a/drivers/mtd/chips/map_ram.c
+++ b/drivers/mtd/chips/map_ram.c
@@ -64,11 +64,11 @@ static struct mtd_info *map_ram_probe(struct map_info *map)
 	mtd->name = map->name;
 	mtd->type = MTD_RAM;
 	mtd->size = map->size;
-	mtd->erase = mapram_erase;
-	mtd->get_unmapped_area = mapram_unmapped_area;
-	mtd->read = mapram_read;
-	mtd->write = mapram_write;
-	mtd->sync = mapram_nop;
+	mtd->_erase = mapram_erase;
+	mtd->_get_unmapped_area = mapram_unmapped_area;
+	mtd->_read = mapram_read;
+	mtd->_write = mapram_write;
+	mtd->_sync = mapram_nop;
 	mtd->flags = MTD_CAP_RAM;
 	mtd->writesize = 1;
 
diff --git a/drivers/mtd/chips/map_rom.c b/drivers/mtd/chips/map_rom.c
index 593f73d..facb560 100644
--- a/drivers/mtd/chips/map_rom.c
+++ b/drivers/mtd/chips/map_rom.c
@@ -41,11 +41,11 @@ static struct mtd_info *map_rom_probe(struct map_info *map)
 	mtd->name = map->name;
 	mtd->type = MTD_ROM;
 	mtd->size = map->size;
-	mtd->get_unmapped_area = maprom_unmapped_area;
-	mtd->read = maprom_read;
-	mtd->write = maprom_write;
-	mtd->sync = maprom_nop;
-	mtd->erase = maprom_erase;
+	mtd->_get_unmapped_area = maprom_unmapped_area;
+	mtd->_read = maprom_read;
+	mtd->_write = maprom_write;
+	mtd->_sync = maprom_nop;
+	mtd->_erase = maprom_erase;
 	mtd->flags = MTD_CAP_ROM;
 	mtd->erasesize = map->size;
 	mtd->writesize = 1;
diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index e7e46d1..d9e75da 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -285,11 +285,11 @@ static struct block2mtd_dev *add_device(char *devname, int erase_size)
 	dev->mtd.writesize = 1;
 	dev->mtd.type = MTD_RAM;
 	dev->mtd.flags = MTD_CAP_RAM;
-	dev->mtd.erase = block2mtd_erase;
-	dev->mtd.write = block2mtd_write;
-	dev->mtd.writev = mtd_writev;
-	dev->mtd.sync = block2mtd_sync;
-	dev->mtd.read = block2mtd_read;
+	dev->mtd._erase = block2mtd_erase;
+	dev->mtd._write = block2mtd_write;
+	dev->mtd._writev = mtd_writev;
+	dev->mtd._sync = block2mtd_sync;
+	dev->mtd._read = block2mtd_read;
 	dev->mtd.priv = dev;
 	dev->mtd.owner = THIS_MODULE;
 
diff --git a/drivers/mtd/devices/doc2000.c b/drivers/mtd/devices/doc2000.c
index b1cdf64..ffd01a6 100644
--- a/drivers/mtd/devices/doc2000.c
+++ b/drivers/mtd/devices/doc2000.c
@@ -565,11 +565,11 @@ void DoC2k_init(struct mtd_info *mtd)
 	mtd->writesize = 512;
 	mtd->oobsize = 16;
 	mtd->owner = THIS_MODULE;
-	mtd->erase = doc_erase;
-	mtd->read = doc_read;
-	mtd->write = doc_write;
-	mtd->read_oob = doc_read_oob;
-	mtd->write_oob = doc_write_oob;
+	mtd->_erase = doc_erase;
+	mtd->_read = doc_read;
+	mtd->_write = doc_write;
+	mtd->_read_oob = doc_read_oob;
+	mtd->_write_oob = doc_write_oob;
 	this->curfloor = -1;
 	this->curchip = -1;
 	mutex_init(&this->lock);
diff --git a/drivers/mtd/devices/doc2001.c b/drivers/mtd/devices/doc2001.c
index 7543b98..3785733 100644
--- a/drivers/mtd/devices/doc2001.c
+++ b/drivers/mtd/devices/doc2001.c
@@ -349,11 +349,11 @@ void DoCMil_init(struct mtd_info *mtd)
 	mtd->writesize = 512;
 	mtd->oobsize = 16;
 	mtd->owner = THIS_MODULE;
-	mtd->erase = doc_erase;
-	mtd->read = doc_read;
-	mtd->write = doc_write;
-	mtd->read_oob = doc_read_oob;
-	mtd->write_oob = doc_write_oob;
+	mtd->_erase = doc_erase;
+	mtd->_read = doc_read;
+	mtd->_write = doc_write;
+	mtd->_read_oob = doc_read_oob;
+	mtd->_write_oob = doc_write_oob;
 	this->curfloor = -1;
 	this->curchip = -1;
 
diff --git a/drivers/mtd/devices/doc2001plus.c b/drivers/mtd/devices/doc2001plus.c
index 177510d..409fa31 100644
--- a/drivers/mtd/devices/doc2001plus.c
+++ b/drivers/mtd/devices/doc2001plus.c
@@ -470,11 +470,11 @@ void DoCMilPlus_init(struct mtd_info *mtd)
 	mtd->writesize = 512;
 	mtd->oobsize = 16;
 	mtd->owner = THIS_MODULE;
-	mtd->erase = doc_erase;
-	mtd->read = doc_read;
-	mtd->write = doc_write;
-	mtd->read_oob = doc_read_oob;
-	mtd->write_oob = doc_write_oob;
+	mtd->_erase = doc_erase;
+	mtd->_read = doc_read;
+	mtd->_write = doc_write;
+	mtd->_read_oob = doc_read_oob;
+	mtd->_write_oob = doc_write_oob;
 	this->curfloor = -1;
 	this->curchip = -1;
 
diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index ad11ef0a..3746ae8 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -1820,12 +1820,12 @@ static void __init doc_set_driver_info(int chip_id, struct mtd_info *mtd)
 	mtd->writesize = DOC_LAYOUT_PAGE_SIZE;
 	mtd->oobsize = DOC_LAYOUT_OOB_SIZE;
 	mtd->owner = THIS_MODULE;
-	mtd->erase = doc_erase;
-	mtd->read = doc_read;
-	mtd->write = doc_write;
-	mtd->read_oob = doc_read_oob;
-	mtd->write_oob = doc_write_oob;
-	mtd->block_isbad = doc_block_isbad;
+	mtd->_erase = doc_erase;
+	mtd->_read = doc_read;
+	mtd->_write = doc_write;
+	mtd->_read_oob = doc_read_oob;
+	mtd->_write_oob = doc_write_oob;
+	mtd->_block_isbad = doc_block_isbad;
 	mtd->ecclayout = &docg3_oobinfo;
 }
 
diff --git a/drivers/mtd/devices/lart.c b/drivers/mtd/devices/lart.c
index 3a11ea6..a595848 100644
--- a/drivers/mtd/devices/lart.c
+++ b/drivers/mtd/devices/lart.c
@@ -635,9 +635,9 @@ static int __init lart_flash_init (void)
    mtd.erasesize = FLASH_BLOCKSIZE_MAIN;
    mtd.numeraseregions = ARRAY_SIZE(erase_regions);
    mtd.eraseregions = erase_regions;
-   mtd.erase = flash_erase;
-   mtd.read = flash_read;
-   mtd.write = flash_write;
+   mtd._erase = flash_erase;
+   mtd._read = flash_read;
+   mtd._write = flash_write;
    mtd.owner = THIS_MODULE;
 
 #ifdef LART_DEBUG
diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 230b02e..f83e4d0 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -908,14 +908,14 @@ static int __devinit m25p_probe(struct spi_device *spi)
 	flash->mtd.writesize = 1;
 	flash->mtd.flags = MTD_CAP_NORFLASH;
 	flash->mtd.size = info->sector_size * info->n_sectors;
-	flash->mtd.erase = m25p80_erase;
-	flash->mtd.read = m25p80_read;
+	flash->mtd._erase = m25p80_erase;
+	flash->mtd._read = m25p80_read;
 
 	/* sst flash chips use AAI word program */
 	if (JEDEC_MFR(info->jedec_id) == CFI_MFR_SST)
-		flash->mtd.write = sst_write;
+		flash->mtd._write = sst_write;
 	else
-		flash->mtd.write = m25p80_write;
+		flash->mtd._write = m25p80_write;
 
 	/* prefer "small sector" erase if possible */
 	if (info->flags & SECT_4K) {
diff --git a/drivers/mtd/devices/ms02-nv.c b/drivers/mtd/devices/ms02-nv.c
index 8423fb6..3a05af5 100644
--- a/drivers/mtd/devices/ms02-nv.c
+++ b/drivers/mtd/devices/ms02-nv.c
@@ -215,8 +215,8 @@ static int __init ms02nv_init_one(ulong addr)
 	mtd->size = fixsize;
 	mtd->name = (char *)ms02nv_name;
 	mtd->owner = THIS_MODULE;
-	mtd->read = ms02nv_read;
-	mtd->write = ms02nv_write;
+	mtd->_read = ms02nv_read;
+	mtd->_write = ms02nv_write;
 	mtd->writesize = 1;
 
 	ret = -EIO;
diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index 5ec5fc9..fd4a9fc 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -611,16 +611,16 @@ static int dataflash_write_user_otp(struct mtd_info *mtd,
 
 static char *otp_setup(struct mtd_info *device, char revision)
 {
-	device->get_fact_prot_info = dataflash_get_otp_info;
-	device->read_fact_prot_reg = dataflash_read_fact_otp;
-	device->get_user_prot_info = dataflash_get_otp_info;
-	device->read_user_prot_reg = dataflash_read_user_otp;
+	device->_get_fact_prot_info = dataflash_get_otp_info;
+	device->_read_fact_prot_reg = dataflash_read_fact_otp;
+	device->_get_user_prot_info = dataflash_get_otp_info;
+	device->_read_user_prot_reg = dataflash_read_user_otp;
 
 	/* rev c parts (at45db321c and at45db1281 only!) use a
 	 * different write procedure; not (yet?) implemented.
 	 */
 	if (revision > 'c')
-		device->write_user_prot_reg = dataflash_write_user_otp;
+		device->_write_user_prot_reg = dataflash_write_user_otp;
 
 	return ", OTP";
 }
@@ -672,9 +672,9 @@ add_dataflash_otp(struct spi_device *spi, char *name,
 	device->owner = THIS_MODULE;
 	device->type = MTD_DATAFLASH;
 	device->flags = MTD_WRITEABLE;
-	device->erase = dataflash_erase;
-	device->read = dataflash_read;
-	device->write = dataflash_write;
+	device->_erase = dataflash_erase;
+	device->_read = dataflash_read;
+	device->_write = dataflash_write;
 	device->priv = priv;
 
 	device->dev.parent = &spi->dev;
diff --git a/drivers/mtd/devices/mtdram.c b/drivers/mtd/devices/mtdram.c
index 2562689..91030cf 100644
--- a/drivers/mtd/devices/mtdram.c
+++ b/drivers/mtd/devices/mtdram.c
@@ -126,12 +126,12 @@ int mtdram_init_device(struct mtd_info *mtd, void *mapped_address,
 	mtd->priv = mapped_address;
 
 	mtd->owner = THIS_MODULE;
-	mtd->erase = ram_erase;
-	mtd->point = ram_point;
-	mtd->unpoint = ram_unpoint;
-	mtd->get_unmapped_area = ram_get_unmapped_area;
-	mtd->read = ram_read;
-	mtd->write = ram_write;
+	mtd->_erase = ram_erase;
+	mtd->_point = ram_point;
+	mtd->_unpoint = ram_unpoint;
+	mtd->_get_unmapped_area = ram_get_unmapped_area;
+	mtd->_read = ram_read;
+	mtd->_write = ram_write;
 
 	if (mtd_device_register(mtd, NULL, 0))
 		return -EIO;
diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index 23423bd..eff2b69 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -142,11 +142,11 @@ static int register_device(char *name, unsigned long start, unsigned long len)
 	new->mtd.name = name;
 	new->mtd.size = len;
 	new->mtd.flags = MTD_CAP_RAM;
-        new->mtd.erase = phram_erase;
-	new->mtd.point = phram_point;
-	new->mtd.unpoint = phram_unpoint;
-	new->mtd.read = phram_read;
-	new->mtd.write = phram_write;
+	new->mtd._erase = phram_erase;
+	new->mtd._point = phram_point;
+	new->mtd._unpoint = phram_unpoint;
+	new->mtd._read = phram_read;
+	new->mtd._write = phram_write;
 	new->mtd.owner = THIS_MODULE;
 	new->mtd.type = MTD_RAM;
 	new->mtd.erasesize = PAGE_SIZE;
diff --git a/drivers/mtd/devices/pmc551.c b/drivers/mtd/devices/pmc551.c
index cfccf65..67d22e1 100644
--- a/drivers/mtd/devices/pmc551.c
+++ b/drivers/mtd/devices/pmc551.c
@@ -787,11 +787,11 @@ static int __init init_pmc551(void)
 
 		mtd->size = msize;
 		mtd->flags = MTD_CAP_RAM;
-		mtd->erase = pmc551_erase;
-		mtd->read = pmc551_read;
-		mtd->write = pmc551_write;
-		mtd->point = pmc551_point;
-		mtd->unpoint = pmc551_unpoint;
+		mtd->_erase = pmc551_erase;
+		mtd->_read = pmc551_read;
+		mtd->_write = pmc551_write;
+		mtd->_point = pmc551_point;
+		mtd->_unpoint = pmc551_unpoint;
 		mtd->type = MTD_RAM;
 		mtd->name = "PMC551 RAM board";
 		mtd->erasesize = 0x10000;
diff --git a/drivers/mtd/devices/slram.c b/drivers/mtd/devices/slram.c
index e585263..cbeb195 100644
--- a/drivers/mtd/devices/slram.c
+++ b/drivers/mtd/devices/slram.c
@@ -200,11 +200,11 @@ static int register_device(char *name, unsigned long start, unsigned long length
 	(*curmtd)->mtdinfo->name = name;
 	(*curmtd)->mtdinfo->size = length;
 	(*curmtd)->mtdinfo->flags = MTD_CAP_RAM;
-        (*curmtd)->mtdinfo->erase = slram_erase;
-	(*curmtd)->mtdinfo->point = slram_point;
-	(*curmtd)->mtdinfo->unpoint = slram_unpoint;
-	(*curmtd)->mtdinfo->read = slram_read;
-	(*curmtd)->mtdinfo->write = slram_write;
+	(*curmtd)->mtdinfo->_erase = slram_erase;
+	(*curmtd)->mtdinfo->_point = slram_point;
+	(*curmtd)->mtdinfo->_unpoint = slram_unpoint;
+	(*curmtd)->mtdinfo->_read = slram_read;
+	(*curmtd)->mtdinfo->_write = slram_write;
 	(*curmtd)->mtdinfo->owner = THIS_MODULE;
 	(*curmtd)->mtdinfo->type = MTD_RAM;
 	(*curmtd)->mtdinfo->erasesize = SLRAM_BLK_SZ;
diff --git a/drivers/mtd/devices/spear_smi.c b/drivers/mtd/devices/spear_smi.c
index d86757b..77bcb0b 100644
--- a/drivers/mtd/devices/spear_smi.c
+++ b/drivers/mtd/devices/spear_smi.c
@@ -848,9 +848,9 @@ static int spear_smi_setup_banks(struct platform_device *pdev, u32 bank)
 	flash->mtd.erasesize = flash_devices[flash_index].sectorsize;
 	flash->page_size = flash_devices[flash_index].pagesize;
 	flash->erase_cmd = flash_devices[flash_index].erase_cmd;
-	flash->mtd.erase = spear_mtd_erase;
-	flash->mtd.read = spear_mtd_read;
-	flash->mtd.write = spear_mtd_write;
+	flash->mtd._erase = spear_mtd_erase;
+	flash->mtd._read = spear_mtd_read;
+	flash->mtd._write = spear_mtd_write;
 	flash->dev_id = flash_devices[flash_index].device_id;
 
 	dev_info(&dev->pdev->dev, "mtd .name=%s .size=%llx(%lluM)\n",
diff --git a/drivers/mtd/devices/sst25l.c b/drivers/mtd/devices/sst25l.c
index 196fd95..a665eba 100644
--- a/drivers/mtd/devices/sst25l.c
+++ b/drivers/mtd/devices/sst25l.c
@@ -403,9 +403,9 @@ static int __devinit sst25l_probe(struct spi_device *spi)
 	flash->mtd.erasesize	= flash_info->erase_size;
 	flash->mtd.writesize	= flash_info->page_size;
 	flash->mtd.size		= flash_info->page_size * flash_info->nr_pages;
-	flash->mtd.erase	= sst25l_erase;
-	flash->mtd.read		= sst25l_read;
-	flash->mtd.write 	= sst25l_write;
+	flash->mtd._erase	= sst25l_erase;
+	flash->mtd._read		= sst25l_read;
+	flash->mtd._write 	= sst25l_write;
 
 	dev_info(&spi->dev, "%s (%lld KiB)\n", flash_info->name,
 		 (long long)flash->mtd.size >> 10);
diff --git a/drivers/mtd/inftlcore.c b/drivers/mtd/inftlcore.c
index 28646c9..3af3514 100644
--- a/drivers/mtd/inftlcore.c
+++ b/drivers/mtd/inftlcore.c
@@ -56,7 +56,7 @@ static void inftl_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 	if (memcmp(mtd->name, "DiskOnChip", 10))
 		return;
 
-	if (!mtd->block_isbad) {
+	if (!mtd->_block_isbad) {
 		printk(KERN_ERR
 "INFTL no longer supports the old DiskOnChip drivers loaded via docprobe.\n"
 "Please use the new diskonchip driver under the NAND subsystem.\n");
diff --git a/drivers/mtd/lpddr/lpddr_cmds.c b/drivers/mtd/lpddr/lpddr_cmds.c
index 536bbce..fd19d3b 100644
--- a/drivers/mtd/lpddr/lpddr_cmds.c
+++ b/drivers/mtd/lpddr/lpddr_cmds.c
@@ -63,18 +63,18 @@ struct mtd_info *lpddr_cmdset(struct map_info *map)
 	mtd->type = MTD_NORFLASH;
 
 	/* Fill in the default mtd operations */
-	mtd->read = lpddr_read;
+	mtd->_read = lpddr_read;
 	mtd->type = MTD_NORFLASH;
 	mtd->flags = MTD_CAP_NORFLASH;
 	mtd->flags &= ~MTD_BIT_WRITEABLE;
-	mtd->erase = lpddr_erase;
-	mtd->write = lpddr_write_buffers;
-	mtd->writev = lpddr_writev;
-	mtd->lock = lpddr_lock;
-	mtd->unlock = lpddr_unlock;
+	mtd->_erase = lpddr_erase;
+	mtd->_write = lpddr_write_buffers;
+	mtd->_writev = lpddr_writev;
+	mtd->_lock = lpddr_lock;
+	mtd->_unlock = lpddr_unlock;
 	if (map_is_linear(map)) {
-		mtd->point = lpddr_point;
-		mtd->unpoint = lpddr_unpoint;
+		mtd->_point = lpddr_point;
+		mtd->_unpoint = lpddr_unpoint;
 	}
 	mtd->size = 1 << lpddr->qinfo->DevSizeShift;
 	mtd->erasesize = 1 << lpddr->qinfo->UniformBlockSizeShift;
diff --git a/drivers/mtd/maps/uclinux.c b/drivers/mtd/maps/uclinux.c
index 6793074..cfff454 100644
--- a/drivers/mtd/maps/uclinux.c
+++ b/drivers/mtd/maps/uclinux.c
@@ -85,7 +85,7 @@ static int __init uclinux_mtd_init(void)
 	}
 
 	mtd->owner = THIS_MODULE;
-	mtd->point = uclinux_point;
+	mtd->_point = uclinux_point;
 	mtd->priv = mapp;
 
 	uclinux_ram_mtdinfo = mtd;
diff --git a/drivers/mtd/maps/vmu-flash.c b/drivers/mtd/maps/vmu-flash.c
index 3a04b07..48a803e 100644
--- a/drivers/mtd/maps/vmu-flash.c
+++ b/drivers/mtd/maps/vmu-flash.c
@@ -544,9 +544,9 @@ static void vmu_queryblocks(struct mapleq *mq)
 	mtd_cur->flags = MTD_WRITEABLE|MTD_NO_ERASE;
 	mtd_cur->size = part_cur->numblocks * card->blocklen;
 	mtd_cur->erasesize = card->blocklen;
-	mtd_cur->write = vmu_flash_write;
-	mtd_cur->read = vmu_flash_read;
-	mtd_cur->sync = vmu_flash_sync;
+	mtd_cur->_write = vmu_flash_write;
+	mtd_cur->_read = vmu_flash_read;
+	mtd_cur->_sync = vmu_flash_sync;
 	mtd_cur->writesize = card->blocklen;
 
 	mpart = kmalloc(sizeof(struct mdev_part), GFP_KERNEL);
diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 50c6a1e..426640e 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -405,7 +405,7 @@ static int mtdchar_writeoob(struct file *file, struct mtd_info *mtd,
 	if (length > 4096)
 		return -EINVAL;
 
-	if (!mtd->write_oob)
+	if (!mtd->_write_oob)
 		ret = -EOPNOTSUPP;
 	else
 		ret = access_ok(VERIFY_READ, ptr, length) ? 0 : -EFAULT;
@@ -576,7 +576,7 @@ static int mtdchar_write_ioctl(struct mtd_info *mtd,
 			!access_ok(VERIFY_READ, req.usr_data, req.len) ||
 			!access_ok(VERIFY_READ, req.usr_oob, req.ooblen))
 		return -EFAULT;
-	if (!mtd->write_oob)
+	if (!mtd->_write_oob)
 		return -EOPNOTSUPP;
 
 	ops.mode = req.mode;
diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index 1ed5103..5c7eb69 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -777,16 +777,16 @@ struct mtd_info *mtd_concat_create(struct mtd_info *subdev[],	/* subdevices to c
 	concat->mtd.subpage_sft = subdev[0]->subpage_sft;
 	concat->mtd.oobsize = subdev[0]->oobsize;
 	concat->mtd.oobavail = subdev[0]->oobavail;
-	if (subdev[0]->writev)
-		concat->mtd.writev = concat_writev;
-	if (subdev[0]->read_oob)
-		concat->mtd.read_oob = concat_read_oob;
-	if (subdev[0]->write_oob)
-		concat->mtd.write_oob = concat_write_oob;
-	if (subdev[0]->block_isbad)
-		concat->mtd.block_isbad = concat_block_isbad;
-	if (subdev[0]->block_markbad)
-		concat->mtd.block_markbad = concat_block_markbad;
+	if (subdev[0]->_writev)
+		concat->mtd._writev = concat_writev;
+	if (subdev[0]->_read_oob)
+		concat->mtd._read_oob = concat_read_oob;
+	if (subdev[0]->_write_oob)
+		concat->mtd._write_oob = concat_write_oob;
+	if (subdev[0]->_block_isbad)
+		concat->mtd._block_isbad = concat_block_isbad;
+	if (subdev[0]->_block_markbad)
+		concat->mtd._block_markbad = concat_block_markbad;
 
 	concat->mtd.ecc_stats.badblocks = subdev[0]->ecc_stats.badblocks;
 
@@ -833,8 +833,8 @@ struct mtd_info *mtd_concat_create(struct mtd_info *subdev[],	/* subdevices to c
 		if (concat->mtd.writesize   !=  subdev[i]->writesize ||
 		    concat->mtd.subpage_sft != subdev[i]->subpage_sft ||
 		    concat->mtd.oobsize    !=  subdev[i]->oobsize ||
-		    !concat->mtd.read_oob  != !subdev[i]->read_oob ||
-		    !concat->mtd.write_oob != !subdev[i]->write_oob) {
+		    !concat->mtd._read_oob  != !subdev[i]->_read_oob ||
+		    !concat->mtd._write_oob != !subdev[i]->_write_oob) {
 			kfree(concat);
 			printk("Incompatible OOB or ECC data on \"%s\"\n",
 			       subdev[i]->name);
@@ -849,15 +849,15 @@ struct mtd_info *mtd_concat_create(struct mtd_info *subdev[],	/* subdevices to c
 	concat->num_subdev = num_devs;
 	concat->mtd.name = name;
 
-	concat->mtd.erase = concat_erase;
-	concat->mtd.read = concat_read;
-	concat->mtd.write = concat_write;
-	concat->mtd.sync = concat_sync;
-	concat->mtd.lock = concat_lock;
-	concat->mtd.unlock = concat_unlock;
-	concat->mtd.suspend = concat_suspend;
-	concat->mtd.resume = concat_resume;
-	concat->mtd.get_unmapped_area = concat_get_unmapped_area;
+	concat->mtd._erase = concat_erase;
+	concat->mtd._read = concat_read;
+	concat->mtd._write = concat_write;
+	concat->mtd._sync = concat_sync;
+	concat->mtd._lock = concat_lock;
+	concat->mtd._unlock = concat_unlock;
+	concat->mtd._suspend = concat_suspend;
+	concat->mtd._resume = concat_resume;
+	concat->mtd._get_unmapped_area = concat_get_unmapped_area;
 
 	/*
 	 * Combine the erase block size info of the subdevices:
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index de96865..aafe0ee 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -126,7 +126,7 @@ static int mtd_cls_resume(struct device *dev)
 {
 	struct mtd_info *mtd = dev_get_drvdata(dev);
 
-	if (mtd && mtd->resume)
+	if (mtd && mtd->_resume)
 		mtd_resume(mtd);
 	return 0;
 }
@@ -610,8 +610,8 @@ int __get_mtd_device(struct mtd_info *mtd)
 	if (!try_module_get(mtd->owner))
 		return -ENODEV;
 
-	if (mtd->get_device) {
-		err = mtd->get_device(mtd);
+	if (mtd->_get_device) {
+		err = mtd->_get_device(mtd);
 
 		if (err) {
 			module_put(mtd->owner);
@@ -675,8 +675,8 @@ void __put_mtd_device(struct mtd_info *mtd)
 	--mtd->usecount;
 	BUG_ON(mtd->usecount < 0);
 
-	if (mtd->put_device)
-		mtd->put_device(mtd);
+	if (mtd->_put_device)
+		mtd->_put_device(mtd);
 
 	module_put(mtd->owner);
 }
@@ -729,9 +729,9 @@ int mtd_writev(struct mtd_info *mtd, const struct kvec *vecs,
 	       unsigned long count, loff_t to, size_t *retlen)
 {
 	*retlen = 0;
-	if (!mtd->writev)
+	if (!mtd->_writev)
 		return default_mtd_writev(mtd, vecs, count, to, retlen);
-	return mtd->writev(mtd, vecs, count, to, retlen);
+	return mtd->_writev(mtd, vecs, count, to, retlen);
 }
 EXPORT_SYMBOL_GPL(mtd_writev);
 
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 47d00f0..4f01079 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -262,7 +262,7 @@ static int part_erase(struct mtd_info *mtd, struct erase_info *instr)
 
 void mtd_erase_callback(struct erase_info *instr)
 {
-	if (instr->mtd->erase == part_erase) {
+	if (instr->mtd->_erase == part_erase) {
 		struct mtd_part *part = PART(instr->mtd);
 
 		if (instr->fail_addr != MTD_FAIL_ADDR_UNKNOWN)
@@ -410,54 +410,55 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
 	 */
 	slave->mtd.dev.parent = master->dev.parent;
 
-	slave->mtd.read = part_read;
-	slave->mtd.write = part_write;
+	slave->mtd._read = part_read;
+	slave->mtd._write = part_write;
 
-	if (master->panic_write)
-		slave->mtd.panic_write = part_panic_write;
+	if (master->_panic_write)
+		slave->mtd._panic_write = part_panic_write;
 
-	if (master->point && master->unpoint) {
-		slave->mtd.point = part_point;
-		slave->mtd.unpoint = part_unpoint;
+	if (master->_point && master->_unpoint) {
+		slave->mtd._point = part_point;
+		slave->mtd._unpoint = part_unpoint;
 	}
 
-	if (master->get_unmapped_area)
-		slave->mtd.get_unmapped_area = part_get_unmapped_area;
-	if (master->read_oob)
-		slave->mtd.read_oob = part_read_oob;
-	if (master->write_oob)
-		slave->mtd.write_oob = part_write_oob;
-	if (master->read_user_prot_reg)
-		slave->mtd.read_user_prot_reg = part_read_user_prot_reg;
-	if (master->read_fact_prot_reg)
-		slave->mtd.read_fact_prot_reg = part_read_fact_prot_reg;
-	if (master->write_user_prot_reg)
-		slave->mtd.write_user_prot_reg = part_write_user_prot_reg;
-	if (master->lock_user_prot_reg)
-		slave->mtd.lock_user_prot_reg = part_lock_user_prot_reg;
-	if (master->get_user_prot_info)
-		slave->mtd.get_user_prot_info = part_get_user_prot_info;
-	if (master->get_fact_prot_info)
-		slave->mtd.get_fact_prot_info = part_get_fact_prot_info;
-	if (master->sync)
-		slave->mtd.sync = part_sync;
-	if (!partno && !master->dev.class && master->suspend && master->resume) {
-			slave->mtd.suspend = part_suspend;
-			slave->mtd.resume = part_resume;
+	if (master->_get_unmapped_area)
+		slave->mtd._get_unmapped_area = part_get_unmapped_area;
+	if (master->_read_oob)
+		slave->mtd._read_oob = part_read_oob;
+	if (master->_write_oob)
+		slave->mtd._write_oob = part_write_oob;
+	if (master->_read_user_prot_reg)
+		slave->mtd._read_user_prot_reg = part_read_user_prot_reg;
+	if (master->_read_fact_prot_reg)
+		slave->mtd._read_fact_prot_reg = part_read_fact_prot_reg;
+	if (master->_write_user_prot_reg)
+		slave->mtd._write_user_prot_reg = part_write_user_prot_reg;
+	if (master->_lock_user_prot_reg)
+		slave->mtd._lock_user_prot_reg = part_lock_user_prot_reg;
+	if (master->_get_user_prot_info)
+		slave->mtd._get_user_prot_info = part_get_user_prot_info;
+	if (master->_get_fact_prot_info)
+		slave->mtd._get_fact_prot_info = part_get_fact_prot_info;
+	if (master->_sync)
+		slave->mtd._sync = part_sync;
+	if (!partno && !master->dev.class && master->_suspend &&
+	    master->_resume) {
+			slave->mtd._suspend = part_suspend;
+			slave->mtd._resume = part_resume;
 	}
-	if (master->writev)
-		slave->mtd.writev = part_writev;
-	if (master->lock)
-		slave->mtd.lock = part_lock;
-	if (master->unlock)
-		slave->mtd.unlock = part_unlock;
-	if (master->is_locked)
-		slave->mtd.is_locked = part_is_locked;
-	if (master->block_isbad)
-		slave->mtd.block_isbad = part_block_isbad;
-	if (master->block_markbad)
-		slave->mtd.block_markbad = part_block_markbad;
-	slave->mtd.erase = part_erase;
+	if (master->_writev)
+		slave->mtd._writev = part_writev;
+	if (master->_lock)
+		slave->mtd._lock = part_lock;
+	if (master->_unlock)
+		slave->mtd._unlock = part_unlock;
+	if (master->_is_locked)
+		slave->mtd._is_locked = part_is_locked;
+	if (master->_block_isbad)
+		slave->mtd._block_isbad = part_block_isbad;
+	if (master->_block_markbad)
+		slave->mtd._block_markbad = part_block_markbad;
+	slave->mtd._erase = part_erase;
 	slave->master = master;
 	slave->offset = part->offset;
 
@@ -549,7 +550,7 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
 	}
 
 	slave->mtd.ecclayout = master->ecclayout;
-	if (master->block_isbad) {
+	if (master->_block_isbad) {
 		uint64_t offs = 0;
 
 		while (offs < slave->mtd.size) {
diff --git a/drivers/mtd/nand/alauda.c b/drivers/mtd/nand/alauda.c
index 6a5ff64..ac38f73 100644
--- a/drivers/mtd/nand/alauda.c
+++ b/drivers/mtd/nand/alauda.c
@@ -585,10 +585,10 @@ static int alauda_init_media(struct alauda *al)
 	mtd->writesize = 1<<card->pageshift;
 	mtd->type = MTD_NANDFLASH;
 	mtd->flags = MTD_CAP_NANDFLASH;
-	mtd->read = alauda_read;
-	mtd->write = alauda_write;
-	mtd->erase = alauda_erase;
-	mtd->block_isbad = alauda_isbad;
+	mtd->_read = alauda_read;
+	mtd->_write = alauda_write;
+	mtd->_erase = alauda_erase;
+	mtd->_block_isbad = alauda_isbad;
 	mtd->priv = al;
 	mtd->owner = THIS_MODULE;
 
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index b902066..05f8243 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3483,21 +3483,21 @@ int nand_scan_tail(struct mtd_info *mtd)
 	mtd->type = MTD_NANDFLASH;
 	mtd->flags = (chip->options & NAND_ROM) ? MTD_CAP_ROM :
 						MTD_CAP_NANDFLASH;
-	mtd->erase = nand_erase;
-	mtd->point = NULL;
-	mtd->unpoint = NULL;
-	mtd->read = nand_read;
-	mtd->write = nand_write;
-	mtd->panic_write = panic_nand_write;
-	mtd->read_oob = nand_read_oob;
-	mtd->write_oob = nand_write_oob;
-	mtd->sync = nand_sync;
-	mtd->lock = NULL;
-	mtd->unlock = NULL;
-	mtd->suspend = nand_suspend;
-	mtd->resume = nand_resume;
-	mtd->block_isbad = nand_block_isbad;
-	mtd->block_markbad = nand_block_markbad;
+	mtd->_erase = nand_erase;
+	mtd->_point = NULL;
+	mtd->_unpoint = NULL;
+	mtd->_read = nand_read;
+	mtd->_write = nand_write;
+	mtd->_panic_write = panic_nand_write;
+	mtd->_read_oob = nand_read_oob;
+	mtd->_write_oob = nand_write_oob;
+	mtd->_sync = nand_sync;
+	mtd->_lock = NULL;
+	mtd->_unlock = NULL;
+	mtd->_suspend = nand_suspend;
+	mtd->_resume = nand_resume;
+	mtd->_block_isbad = nand_block_isbad;
+	mtd->_block_markbad = nand_block_markbad;
 	mtd->writebufsize = mtd->writesize;
 
 	/* propagate ecc.layout to mtd_info */
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index a061bc1..914c49b 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -4107,29 +4107,29 @@ int onenand_scan(struct mtd_info *mtd, int maxchips)
 	/* Fill in remaining MTD driver data */
 	mtd->type = ONENAND_IS_MLC(this) ? MTD_MLCNANDFLASH : MTD_NANDFLASH;
 	mtd->flags = MTD_CAP_NANDFLASH;
-	mtd->erase = onenand_erase;
-	mtd->point = NULL;
-	mtd->unpoint = NULL;
-	mtd->read = onenand_read;
-	mtd->write = onenand_write;
-	mtd->read_oob = onenand_read_oob;
-	mtd->write_oob = onenand_write_oob;
-	mtd->panic_write = onenand_panic_write;
+	mtd->_erase = onenand_erase;
+	mtd->_point = NULL;
+	mtd->_unpoint = NULL;
+	mtd->_read = onenand_read;
+	mtd->_write = onenand_write;
+	mtd->_read_oob = onenand_read_oob;
+	mtd->_write_oob = onenand_write_oob;
+	mtd->_panic_write = onenand_panic_write;
 #ifdef CONFIG_MTD_ONENAND_OTP
-	mtd->get_fact_prot_info = onenand_get_fact_prot_info;
-	mtd->read_fact_prot_reg = onenand_read_fact_prot_reg;
-	mtd->get_user_prot_info = onenand_get_user_prot_info;
-	mtd->read_user_prot_reg = onenand_read_user_prot_reg;
-	mtd->write_user_prot_reg = onenand_write_user_prot_reg;
-	mtd->lock_user_prot_reg = onenand_lock_user_prot_reg;
+	mtd->_get_fact_prot_info = onenand_get_fact_prot_info;
+	mtd->_read_fact_prot_reg = onenand_read_fact_prot_reg;
+	mtd->_get_user_prot_info = onenand_get_user_prot_info;
+	mtd->_read_user_prot_reg = onenand_read_user_prot_reg;
+	mtd->_write_user_prot_reg = onenand_write_user_prot_reg;
+	mtd->_lock_user_prot_reg = onenand_lock_user_prot_reg;
 #endif
-	mtd->sync = onenand_sync;
-	mtd->lock = onenand_lock;
-	mtd->unlock = onenand_unlock;
-	mtd->suspend = onenand_suspend;
-	mtd->resume = onenand_resume;
-	mtd->block_isbad = onenand_block_isbad;
-	mtd->block_markbad = onenand_block_markbad;
+	mtd->_sync = onenand_sync;
+	mtd->_lock = onenand_lock;
+	mtd->_unlock = onenand_unlock;
+	mtd->_suspend = onenand_suspend;
+	mtd->_resume = onenand_resume;
+	mtd->_block_isbad = onenand_block_isbad;
+	mtd->_block_markbad = onenand_block_markbad;
 	mtd->owner = THIS_MODULE;
 	mtd->writebufsize = mtd->writesize;
 
diff --git a/drivers/mtd/ubi/gluebi.c b/drivers/mtd/ubi/gluebi.c
index 941bc3c..0101dce 100644
--- a/drivers/mtd/ubi/gluebi.c
+++ b/drivers/mtd/ubi/gluebi.c
@@ -340,11 +340,11 @@ static int gluebi_create(struct ubi_device_info *di,
 	mtd->owner      = THIS_MODULE;
 	mtd->writesize  = di->min_io_size;
 	mtd->erasesize  = vi->usable_leb_size;
-	mtd->read       = gluebi_read;
-	mtd->write      = gluebi_write;
-	mtd->erase      = gluebi_erase;
-	mtd->get_device = gluebi_get_device;
-	mtd->put_device = gluebi_put_device;
+	mtd->_read       = gluebi_read;
+	mtd->_write      = gluebi_write;
+	mtd->_erase      = gluebi_erase;
+	mtd->_get_device = gluebi_get_device;
+	mtd->_put_device = gluebi_put_device;
 
 	/*
 	 * In case of dynamic a volume, MTD device size is just volume size. In
diff --git a/drivers/net/ethernet/sfc/mtd.c b/drivers/net/ethernet/sfc/mtd.c
index bc9dcd6..6622eca 100644
--- a/drivers/net/ethernet/sfc/mtd.c
+++ b/drivers/net/ethernet/sfc/mtd.c
@@ -263,10 +263,10 @@ static int efx_mtd_probe_device(struct efx_nic *efx, struct efx_mtd *efx_mtd)
 		part->mtd.owner = THIS_MODULE;
 		part->mtd.priv = efx_mtd;
 		part->mtd.name = part->name;
-		part->mtd.erase = efx_mtd_erase;
-		part->mtd.read = efx_mtd->ops->read;
-		part->mtd.write = efx_mtd->ops->write;
-		part->mtd.sync = efx_mtd_sync;
+		part->mtd._erase = efx_mtd_erase;
+		part->mtd._read = efx_mtd->ops->read;
+		part->mtd._write = efx_mtd->ops->write;
+		part->mtd._sync = efx_mtd_sync;
 
 		if (mtd_device_register(&part->mtd, NULL, 0))
 			goto fail;
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index d8c7aad..d65770c 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -174,52 +174,52 @@ struct mtd_info {
 	 * Do not call via these pointers, use corresponding mtd_*()
 	 * wrappers instead.
 	 */
-	int (*erase) (struct mtd_info *mtd, struct erase_info *instr);
-	int (*point) (struct mtd_info *mtd, loff_t from, size_t len,
-		      size_t *retlen, void **virt, resource_size_t *phys);
-	void (*unpoint) (struct mtd_info *mtd, loff_t from, size_t len);
-	unsigned long (*get_unmapped_area) (struct mtd_info *mtd,
-					    unsigned long len,
-					    unsigned long offset,
-					    unsigned long flags);
-	int (*read) (struct mtd_info *mtd, loff_t from, size_t len,
-		     size_t *retlen, u_char *buf);
-	int (*write) (struct mtd_info *mtd, loff_t to, size_t len,
-		      size_t *retlen, const u_char *buf);
-	int (*panic_write) (struct mtd_info *mtd, loff_t to, size_t len,
-			    size_t *retlen, const u_char *buf);
-	int (*read_oob) (struct mtd_info *mtd, loff_t from,
-			 struct mtd_oob_ops *ops);
-	int (*write_oob) (struct mtd_info *mtd, loff_t to,
+	int (*_erase) (struct mtd_info *mtd, struct erase_info *instr);
+	int (*_point) (struct mtd_info *mtd, loff_t from, size_t len,
+		       size_t *retlen, void **virt, resource_size_t *phys);
+	void (*_unpoint) (struct mtd_info *mtd, loff_t from, size_t len);
+	unsigned long (*_get_unmapped_area) (struct mtd_info *mtd,
+					     unsigned long len,
+					     unsigned long offset,
+					     unsigned long flags);
+	int (*_read) (struct mtd_info *mtd, loff_t from, size_t len,
+		      size_t *retlen, u_char *buf);
+	int (*_write) (struct mtd_info *mtd, loff_t to, size_t len,
+		       size_t *retlen, const u_char *buf);
+	int (*_panic_write) (struct mtd_info *mtd, loff_t to, size_t len,
+			     size_t *retlen, const u_char *buf);
+	int (*_read_oob) (struct mtd_info *mtd, loff_t from,
 			  struct mtd_oob_ops *ops);
-	int (*get_fact_prot_info) (struct mtd_info *mtd, struct otp_info *buf,
-				   size_t len);
-	int (*read_fact_prot_reg) (struct mtd_info *mtd, loff_t from,
-				   size_t len, size_t *retlen, u_char *buf);
-	int (*get_user_prot_info) (struct mtd_info *mtd, struct otp_info *buf,
-				   size_t len);
-	int (*read_user_prot_reg) (struct mtd_info *mtd, loff_t from,
-				   size_t len, size_t *retlen, u_char *buf);
-	int (*write_user_prot_reg) (struct mtd_info *mtd, loff_t to, size_t len,
-				    size_t *retlen, u_char *buf);
-	int (*lock_user_prot_reg) (struct mtd_info *mtd, loff_t from,
-				   size_t len);
-	int (*writev) (struct mtd_info *mtd, const struct kvec *vecs,
+	int (*_write_oob) (struct mtd_info *mtd, loff_t to,
+			   struct mtd_oob_ops *ops);
+	int (*_get_fact_prot_info) (struct mtd_info *mtd, struct otp_info *buf,
+				    size_t len);
+	int (*_read_fact_prot_reg) (struct mtd_info *mtd, loff_t from,
+				    size_t len, size_t *retlen, u_char *buf);
+	int (*_get_user_prot_info) (struct mtd_info *mtd, struct otp_info *buf,
+				    size_t len);
+	int (*_read_user_prot_reg) (struct mtd_info *mtd, loff_t from,
+				    size_t len, size_t *retlen, u_char *buf);
+	int (*_write_user_prot_reg) (struct mtd_info *mtd, loff_t to,
+				     size_t len, size_t *retlen, u_char *buf);
+	int (*_lock_user_prot_reg) (struct mtd_info *mtd, loff_t from,
+				    size_t len);
+	int (*_writev) (struct mtd_info *mtd, const struct kvec *vecs,
 			unsigned long count, loff_t to, size_t *retlen);
-	void (*sync) (struct mtd_info *mtd);
-	int (*lock) (struct mtd_info *mtd, loff_t ofs, uint64_t len);
-	int (*unlock) (struct mtd_info *mtd, loff_t ofs, uint64_t len);
-	int (*is_locked) (struct mtd_info *mtd, loff_t ofs, uint64_t len);
-	int (*block_isbad) (struct mtd_info *mtd, loff_t ofs);
-	int (*block_markbad) (struct mtd_info *mtd, loff_t ofs);
-	int (*suspend) (struct mtd_info *mtd);
-	void (*resume) (struct mtd_info *mtd);
+	void (*_sync) (struct mtd_info *mtd);
+	int (*_lock) (struct mtd_info *mtd, loff_t ofs, uint64_t len);
+	int (*_unlock) (struct mtd_info *mtd, loff_t ofs, uint64_t len);
+	int (*_is_locked) (struct mtd_info *mtd, loff_t ofs, uint64_t len);
+	int (*_block_isbad) (struct mtd_info *mtd, loff_t ofs);
+	int (*_block_markbad) (struct mtd_info *mtd, loff_t ofs);
+	int (*_suspend) (struct mtd_info *mtd);
+	void (*_resume) (struct mtd_info *mtd);
 	/*
 	 * If the driver is something smart, like UBI, it may need to maintain
 	 * its own reference counting. The below functions are only for driver.
 	 */
-	int (*get_device) (struct mtd_info *mtd);
-	void (*put_device) (struct mtd_info *mtd);
+	int (*_get_device) (struct mtd_info *mtd);
+	void (*_put_device) (struct mtd_info *mtd);
 
 	/* Backing device capabilities for this device
 	 * - provides mmap capabilities
@@ -249,7 +249,7 @@ struct mtd_info {
  */
 static inline int mtd_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
-	return mtd->erase(mtd, instr);
+	return mtd->_erase(mtd, instr);
 }
 
 /*
@@ -259,15 +259,15 @@ static inline int mtd_point(struct mtd_info *mtd, loff_t from, size_t len,
 			    size_t *retlen, void **virt, resource_size_t *phys)
 {
 	*retlen = 0;
-	if (!mtd->point)
+	if (!mtd->_point)
 		return -EOPNOTSUPP;
-	return mtd->point(mtd, from, len, retlen, virt, phys);
+	return mtd->_point(mtd, from, len, retlen, virt, phys);
 }
 
 /* We probably shouldn't allow XIP if the unpoint isn't a NULL */
 static inline void mtd_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
 {
-	return mtd->unpoint(mtd, from, len);
+	return mtd->_unpoint(mtd, from, len);
 }
 
 /*
@@ -280,24 +280,24 @@ static inline unsigned long mtd_get_unmapped_area(struct mtd_info *mtd,
 						  unsigned long offset,
 						  unsigned long flags)
 {
-	if (!mtd->get_unmapped_area)
+	if (!mtd->_get_unmapped_area)
 		return -EOPNOTSUPP;
-	return mtd->get_unmapped_area(mtd, len, offset, flags);
+	return mtd->_get_unmapped_area(mtd, len, offset, flags);
 }
 
 static inline int mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
 			   size_t *retlen, u_char *buf)
 {
-	return mtd->read(mtd, from, len, retlen, buf);
+	return mtd->_read(mtd, from, len, retlen, buf);
 }
 
 static inline int mtd_write(struct mtd_info *mtd, loff_t to, size_t len,
 			    size_t *retlen, const u_char *buf)
 {
 	*retlen = 0;
-	if (!mtd->write)
+	if (!mtd->_write)
 		return -EROFS;
-	return mtd->write(mtd, to, len, retlen, buf);
+	return mtd->_write(mtd, to, len, retlen, buf);
 }
 
 /*
@@ -311,27 +311,27 @@ static inline int mtd_panic_write(struct mtd_info *mtd, loff_t to, size_t len,
 				  size_t *retlen, const u_char *buf)
 {
 	*retlen = 0;
-	if (!mtd->panic_write)
+	if (!mtd->_panic_write)
 		return -EOPNOTSUPP;
-	return mtd->panic_write(mtd, to, len, retlen, buf);
+	return mtd->_panic_write(mtd, to, len, retlen, buf);
 }
 
 static inline int mtd_read_oob(struct mtd_info *mtd, loff_t from,
 			       struct mtd_oob_ops *ops)
 {
 	ops->retlen = ops->oobretlen = 0;
-	if (!mtd->read_oob)
+	if (!mtd->_read_oob)
 		return -EOPNOTSUPP;
-	return mtd->read_oob(mtd, from, ops);
+	return mtd->_read_oob(mtd, from, ops);
 }
 
 static inline int mtd_write_oob(struct mtd_info *mtd, loff_t to,
 				struct mtd_oob_ops *ops)
 {
 	ops->retlen = ops->oobretlen = 0;
-	if (!mtd->write_oob)
+	if (!mtd->_write_oob)
 		return -EOPNOTSUPP;
-	return mtd->write_oob(mtd, to, ops);
+	return mtd->_write_oob(mtd, to, ops);
 }
 
 /*
@@ -342,9 +342,9 @@ static inline int mtd_write_oob(struct mtd_info *mtd, loff_t to,
 static inline int mtd_get_fact_prot_info(struct mtd_info *mtd,
 					 struct otp_info *buf, size_t len)
 {
-	if (!mtd->get_fact_prot_info)
+	if (!mtd->_get_fact_prot_info)
 		return -EOPNOTSUPP;
-	return mtd->get_fact_prot_info(mtd, buf, len);
+	return mtd->_get_fact_prot_info(mtd, buf, len);
 }
 
 static inline int mtd_read_fact_prot_reg(struct mtd_info *mtd, loff_t from,
@@ -352,18 +352,18 @@ static inline int mtd_read_fact_prot_reg(struct mtd_info *mtd, loff_t from,
 					 u_char *buf)
 {
 	*retlen = 0;
-	if (!mtd->read_fact_prot_reg)
+	if (!mtd->_read_fact_prot_reg)
 		return -EOPNOTSUPP;
-	return mtd->read_fact_prot_reg(mtd, from, len, retlen, buf);
+	return mtd->_read_fact_prot_reg(mtd, from, len, retlen, buf);
 }
 
 static inline int mtd_get_user_prot_info(struct mtd_info *mtd,
 					 struct otp_info *buf,
 					 size_t len)
 {
-	if (!mtd->get_user_prot_info)
+	if (!mtd->_get_user_prot_info)
 		return -EOPNOTSUPP;
-	return mtd->get_user_prot_info(mtd, buf, len);
+	return mtd->_get_user_prot_info(mtd, buf, len);
 }
 
 static inline int mtd_read_user_prot_reg(struct mtd_info *mtd, loff_t from,
@@ -371,9 +371,9 @@ static inline int mtd_read_user_prot_reg(struct mtd_info *mtd, loff_t from,
 					 u_char *buf)
 {
 	*retlen = 0;
-	if (!mtd->read_user_prot_reg)
+	if (!mtd->_read_user_prot_reg)
 		return -EOPNOTSUPP;
-	return mtd->read_user_prot_reg(mtd, from, len, retlen, buf);
+	return mtd->_read_user_prot_reg(mtd, from, len, retlen, buf);
 }
 
 static inline int mtd_write_user_prot_reg(struct mtd_info *mtd, loff_t to,
@@ -381,17 +381,17 @@ static inline int mtd_write_user_prot_reg(struct mtd_info *mtd, loff_t to,
 					  u_char *buf)
 {
 	*retlen = 0;
-	if (!mtd->write_user_prot_reg)
+	if (!mtd->_write_user_prot_reg)
 		return -EOPNOTSUPP;
-	return mtd->write_user_prot_reg(mtd, to, len, retlen, buf);
+	return mtd->_write_user_prot_reg(mtd, to, len, retlen, buf);
 }
 
 static inline int mtd_lock_user_prot_reg(struct mtd_info *mtd, loff_t from,
 					 size_t len)
 {
-	if (!mtd->lock_user_prot_reg)
+	if (!mtd->_lock_user_prot_reg)
 		return -EOPNOTSUPP;
-	return mtd->lock_user_prot_reg(mtd, from, len);
+	return mtd->_lock_user_prot_reg(mtd, from, len);
 }
 
 int mtd_writev(struct mtd_info *mtd, const struct kvec *vecs,
@@ -399,55 +399,55 @@ int mtd_writev(struct mtd_info *mtd, const struct kvec *vecs,
 
 static inline void mtd_sync(struct mtd_info *mtd)
 {
-	if (mtd->sync)
-		mtd->sync(mtd);
+	if (mtd->_sync)
+		mtd->_sync(mtd);
 }
 
 /* Chip-supported device locking */
 static inline int mtd_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 {
-	if (!mtd->lock)
+	if (!mtd->_lock)
 		return -EOPNOTSUPP;
-	return mtd->lock(mtd, ofs, len);
+	return mtd->_lock(mtd, ofs, len);
 }
 
 static inline int mtd_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 {
-	if (!mtd->unlock)
+	if (!mtd->_unlock)
 		return -EOPNOTSUPP;
-	return mtd->unlock(mtd, ofs, len);
+	return mtd->_unlock(mtd, ofs, len);
 }
 
 static inline int mtd_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 {
-	if (!mtd->is_locked)
+	if (!mtd->_is_locked)
 		return -EOPNOTSUPP;
-	return mtd->is_locked(mtd, ofs, len);
+	return mtd->_is_locked(mtd, ofs, len);
 }
 
 static inline int mtd_suspend(struct mtd_info *mtd)
 {
-	return mtd->suspend ? mtd->suspend(mtd) : 0;
+	return mtd->_suspend ? mtd->_suspend(mtd) : 0;
 }
 
 static inline void mtd_resume(struct mtd_info *mtd)
 {
-	if (mtd->resume)
-		mtd->resume(mtd);
+	if (mtd->_resume)
+		mtd->_resume(mtd);
 }
 
 static inline int mtd_block_isbad(struct mtd_info *mtd, loff_t ofs)
 {
-	if (!mtd->block_isbad)
+	if (!mtd->_block_isbad)
 		return -EOPNOTSUPP;
-	return mtd->block_isbad(mtd, ofs);
+	return mtd->_block_isbad(mtd, ofs);
 }
 
 static inline int mtd_block_markbad(struct mtd_info *mtd, loff_t ofs)
 {
-	if (!mtd->block_markbad)
+	if (!mtd->_block_markbad)
 		return -EOPNOTSUPP;
-	return mtd->block_markbad(mtd, ofs);
+	return mtd->_block_markbad(mtd, ofs);
 }
 
 static inline uint32_t mtd_div_by_eb(uint64_t sz, struct mtd_info *mtd)
@@ -482,12 +482,12 @@ static inline uint32_t mtd_mod_by_ws(uint64_t sz, struct mtd_info *mtd)
 
 static inline int mtd_has_oob(const struct mtd_info *mtd)
 {
-	return mtd->read_oob && mtd->write_oob;
+	return mtd->_read_oob && mtd->_write_oob;
 }
 
 static inline int mtd_can_have_bb(const struct mtd_info *mtd)
 {
-	return !!mtd->block_isbad;
+	return !!mtd->_block_isbad;
 }
 
 	/* Kernel-side ioctl definitions */
-- 
1.7.7.6
