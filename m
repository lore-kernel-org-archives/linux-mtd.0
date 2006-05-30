Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fl64q-0007AA-CS
	for linux-mtd@lists.infradead.org; Tue, 30 May 2006 11:24:20 -0400
Date: Tue, 30 May 2006 17:24:06 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Message-ID: <20060530152406.GA15284@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Cc: 
Subject: [PATCH,RFC] [MTD] replace MTD_NORFLASH with MTD_GENERIC_TYPE
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch is 90% uncontroversial.  The remaining 10% introduce a new
field to struct mtd_info.  Looks like we need something similar to
this patch, but probably not identical to it.

Comments?

Jörn

-- 
Audacity augments courage; hesitation, fear.
-- Publilius Syrus 

[MTD] replace MTD_NORFLASH with MTD_GENERIC_TYPE

Apart from the text substitution, the STMicro ECC-NOR and Intel Sibley
flashes need special treatment.  This patch introduces a special
kernel-only flag for them that jffs2 uses to call special code.  It
should be noted that special code for these devices should not be
used.  But until jffs2 is clean in that respect, the flag serves as a
reminder that a cleanup is still required at some point.

This also changes the safety guard in rfd_ftl.c.  We can use the ftl
on all devices that can behave like NOR flash now.  This adds RAM and
disk devices, but removes the mentionend ECC-NOR and Sibley flashes.

Signed-off-by: Jörn Engel <joern@wohnheim.fh-wedel.de>
---

 drivers/mtd/chips/amd_flash.c       |    2 +-
 drivers/mtd/chips/cfi_cmdset_0001.c |    3 ++-
 drivers/mtd/chips/cfi_cmdset_0002.c |    2 +-
 drivers/mtd/chips/cfi_cmdset_0020.c |    3 ++-
 drivers/mtd/chips/jedec.c           |    2 +-
 drivers/mtd/chips/sharp.c           |    2 +-
 drivers/mtd/devices/lart.c          |    2 +-
 drivers/mtd/devices/m25p80.c        |    2 +-
 drivers/mtd/rfd_ftl.c               |    2 +-
 fs/jffs2/os-linux.h                 |    2 +-
 include/linux/mtd/mtd.h             |    9 +++++++++
 include/mtd/mtd-abi.h               |    1 -
 12 files changed, 21 insertions(+), 11 deletions(-)

--- mtd_type/include/linux/mtd/mtd.h~type_nor	2006-04-23 14:04:41.000000000 +0200
+++ mtd_type/include/linux/mtd/mtd.h	2006-04-23 14:04:49.000000000 +0200
@@ -56,9 +56,18 @@ struct mtd_erase_region_info {
 	u_int32_t numblocks;		/* Number of blocks of erasesize in this region */
 };
 
+/**
+ * Kernel flags.  Each of the flags below is necessary for one in-kernel
+ * user to special-case some flash type.  It is obvious that those
+ * special cases need to go, along with the associated flags.
+ */
+/* special case for nor_wbuf flashes, used by fs/jffs2/ */
+#define MTD_KF_NOR_WBUF_FLASH	0x8000000
+
 struct mtd_info {
 	u_char type;
 	u_int32_t flags;
+	u_int32_t kernel_flags; /* TODO: every one of these needs to go */
 	u_int32_t size;	 // Total size of the MTD
 
 	/* "Major" erase size for the device. NaÃ¯ve users may take this
--- mtd_type/include/mtd/mtd-abi.h~type_nor	2006-04-23 14:04:41.000000000 +0200
+++ mtd_type/include/mtd/mtd-abi.h	2006-04-23 14:04:49.000000000 +0200
@@ -24,7 +24,6 @@ struct mtd_oob_buf {
 };
 
 #define MTD_ABSENT		0
-#define MTD_NORFLASH		3
 #define MTD_NANDFLASH		4
 #define MTD_DATAFLASH		6
 #define MTD_GENERIC_TYPE	7
--- mtd_type/drivers/mtd/chips/amd_flash.c~type_nor	2006-04-23 14:04:41.000000000 +0200
+++ mtd_type/drivers/mtd/chips/amd_flash.c	2006-04-23 14:04:49.000000000 +0200
@@ -736,7 +736,7 @@ static struct mtd_info *amd_flash_probe(
 		}
 		offset += dev_size;
 	}
-	mtd->type = MTD_NORFLASH;
+	mtd->type = MTD_GENERIC_TYPE;
 	mtd->flags = MTD_CAP_NORFLASH;
 	mtd->name = map->name;
 	mtd->erase = amd_flash_erase;
--- mtd_type/drivers/mtd/chips/cfi_cmdset_0001.c~type_nor	2006-04-23 14:04:41.000000000 +0200
+++ mtd_type/drivers/mtd/chips/cfi_cmdset_0001.c	2006-04-23 14:04:49.000000000 +0200
@@ -351,7 +351,7 @@ struct mtd_info *cfi_cmdset_0001(struct 
 	}
 	memset(mtd, 0, sizeof(*mtd));
 	mtd->priv = map;
-	mtd->type = MTD_NORFLASH;
+	mtd->type = MTD_GENERIC_TYPE;
 
 	/* Fill in the default mtd operations */
 	mtd->erase   = cfi_intelext_erase_varsize;
@@ -551,6 +551,7 @@ static int cfi_intelext_partition_fixup(
 			MTD_PROGREGION_CTRLMODE_VALID(mtd) = cfi->interleave * prinfo->ControlValid;
 			MTD_PROGREGION_CTRLMODE_INVALID(mtd) = cfi->interleave * prinfo->ControlInvalid;
 			mtd->flags &= ~MTD_BIT_WRITEABLE;
+			mtd->kernel_flags |= MTD_KF_NOR_WBUF_FLASH;
 			printk(KERN_DEBUG "%s: program region size/ctrl_valid/ctrl_inval = %d/%d/%d\n",
 			       map->name, mtd->writesize,
 			       MTD_PROGREGION_CTRLMODE_VALID(mtd),
--- mtd_type/drivers/mtd/chips/cfi_cmdset_0002.c~type_nor	2006-04-23 14:04:41.000000000 +0200
+++ mtd_type/drivers/mtd/chips/cfi_cmdset_0002.c	2006-04-23 14:04:49.000000000 +0200
@@ -225,7 +225,7 @@ struct mtd_info *cfi_cmdset_0002(struct 
 	}
 	memset(mtd, 0, sizeof(*mtd));
 	mtd->priv = map;
-	mtd->type = MTD_NORFLASH;
+	mtd->type = MTD_GENERIC_TYPE;
 
 	/* Fill in the default mtd operations */
 	mtd->erase   = cfi_amdstd_erase_varsize;
--- mtd_type/drivers/mtd/chips/cfi_cmdset_0020.c~type_nor	2006-04-23 14:04:41.000000000 +0200
+++ mtd_type/drivers/mtd/chips/cfi_cmdset_0020.c	2006-04-23 14:04:49.000000000 +0200
@@ -182,7 +182,7 @@ static struct mtd_info *cfi_staa_setup(s
 
 	memset(mtd, 0, sizeof(*mtd));
 	mtd->priv = map;
-	mtd->type = MTD_NORFLASH;
+	mtd->type = MTD_GENERIC_TYPE;
 	mtd->size = devsize * cfi->numchips;
 
 	mtd->numeraseregions = cfi->cfiq->NumEraseRegions * cfi->numchips;
@@ -238,6 +238,7 @@ static struct mtd_info *cfi_staa_setup(s
 	mtd->suspend = cfi_staa_suspend;
 	mtd->resume = cfi_staa_resume;
 	mtd->flags = MTD_CAP_NORFLASH & ~MTD_BIT_WRITEABLE;
+	mtd->kernel_flags |= MTD_KF_NOR_WBUF_FLASH;
 	mtd->writesize = 8; /* FIXME: Should be 0 for STMicro flashes w/out ECC */
 	map->fldrv = &cfi_staa_chipdrv;
 	__module_get(THIS_MODULE);
--- mtd_type/drivers/mtd/chips/jedec.c~type_nor	2006-04-23 14:04:41.000000000 +0200
+++ mtd_type/drivers/mtd/chips/jedec.c	2006-04-23 14:04:49.000000000 +0200
@@ -254,7 +254,7 @@ static struct mtd_info *jedec_probe(stru
    memset(MTD,0,sizeof(*MTD));
   // strlcpy(MTD->name,Part,sizeof(MTD->name));
    MTD->name = map->name;
-   MTD->type = MTD_NORFLASH;
+   MTD->type = MTD_GENERIC_TYPE;
    MTD->flags = MTD_CAP_NORFLASH;
    MTD->erasesize = SectorSize*(map->buswidth);
    //   printk("MTD->erasesize is %x\n",(unsigned int)MTD->erasesize);
--- mtd_type/drivers/mtd/chips/sharp.c~type_nor	2006-04-23 14:04:41.000000000 +0200
+++ mtd_type/drivers/mtd/chips/sharp.c	2006-04-23 14:04:49.000000000 +0200
@@ -131,7 +131,7 @@ static struct mtd_info *sharp_probe(stru
 	}
 
 	mtd->priv = map;
-	mtd->type = MTD_NORFLASH;
+	mtd->type = MTD_GENERIC_TYPE;
 	mtd->erase = sharp_erase;
 	mtd->read = sharp_read;
 	mtd->write = sharp_write;
--- mtd_type/drivers/mtd/devices/lart.c~type_nor	2006-04-23 14:04:41.000000000 +0200
+++ mtd_type/drivers/mtd/devices/lart.c	2006-04-23 14:04:49.000000000 +0200
@@ -634,7 +634,7 @@ int __init lart_flash_init (void)
 	 }
    printk ("%s: This looks like a LART board to me.\n",module_name);
    mtd.name = module_name;
-   mtd.type = MTD_NORFLASH;
+   mtd.type = MTD_GENERIC_TYPE;
    mtd.flags = MTD_CAP_NORFLASH;
    mtd.size = FLASH_BLOCKSIZE_PARAM * FLASH_NUMBLOCKS_16m_PARAM + FLASH_BLOCKSIZE_MAIN * FLASH_NUMBLOCKS_16m_MAIN;
    mtd.erasesize = FLASH_BLOCKSIZE_MAIN;
--- mtd_type/drivers/mtd/devices/m25p80.c~type_nor	2006-04-23 14:04:41.000000000 +0200
+++ mtd_type/drivers/mtd/devices/m25p80.c	2006-04-23 14:04:49.000000000 +0200
@@ -464,7 +464,7 @@ static int __devinit m25p_probe(struct s
 	else
 		flash->mtd.name = spi->dev.bus_id;
 
-	flash->mtd.type = MTD_NORFLASH;
+	flash->mtd.type = MTD_GENERIC_TYPE;
 	flash->mtd.flags = MTD_CAP_NORFLASH;
 	flash->mtd.size = info->sector_size * info->n_sectors;
 	flash->mtd.erasesize = info->sector_size;
--- mtd_type/drivers/mtd/rfd_ftl.c~type_nor	2006-04-23 14:04:41.000000000 +0200
+++ mtd_type/drivers/mtd/rfd_ftl.c	2006-04-23 14:04:49.000000000 +0200
@@ -761,7 +761,7 @@ static void rfd_ftl_add_mtd(struct mtd_b
 {
 	struct partition *part;
 
-	if (mtd->type != MTD_NORFLASH)
+	if ( !(mtd->flags & MTD_WRITEABLE) || !(mtd->flags & MTD_BIT_WRITEABLE))
 		return;
 
 	part = kcalloc(1, sizeof(struct partition), GFP_KERNEL);
--- mtd_type/fs/jffs2/os-linux.h~type_nor	2006-04-23 14:04:41.000000000 +0200
+++ mtd_type/fs/jffs2/os-linux.h	2006-04-23 14:04:49.000000000 +0200
@@ -131,7 +131,7 @@ void jffs2_nand_flash_cleanup(struct jff
 int jffs2_dataflash_setup(struct jffs2_sb_info *c);
 void jffs2_dataflash_cleanup(struct jffs2_sb_info *c);
 
-#define jffs2_nor_wbuf_flash(c) (c->mtd->type == MTD_NORFLASH && ! (c->mtd->flags & MTD_BIT_WRITEABLE))
+#define jffs2_nor_wbuf_flash(c) (c->mtd->flags & MTD_KF_NOR_WBUF_FLASH)
 int jffs2_nor_wbuf_flash_setup(struct jffs2_sb_info *c);
 void jffs2_nor_wbuf_flash_cleanup(struct jffs2_sb_info *c);
 
