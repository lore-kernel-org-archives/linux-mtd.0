Received: from mail-out.m-online.net ([212.18.0.9])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PPheI-0002WR-Bh
	for linux-mtd@lists.infradead.org; Mon, 06 Dec 2010 20:27:04 +0000
From: Anatolij Gustschin <agust@denx.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: add NOR flash write buffer size reporting for UBI/UBIFS
Date: Mon,  6 Dec 2010 21:26:57 +0100
Message-Id: <1291667217-13097-1-git-send-email-agust@denx.de>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add "write_buffer_size" field to struct mtd_info. This field
will be used to set minimal I/O unit size (min_io_size) for UBI
on NOR flash. In case of NOR flash minimal I/O size must be equal
to the maximal size of the write buffer used by embedded flash
programming algorithm.

Flash programming from prepared write buffer performed in one
programming operation could be interrupted by a power cut or
a system reset causing corrupted (partially written) areas in
a flash sector. Knowing the size of potentially corrupted areas
UBIFS scanning and recovery algorithms are able to perform
successful recovery.

Signed-off-by: Anatolij Gustschin <agust@denx.de>
---
 drivers/mtd/chips/cfi_cmdset_0001.c |    1 +
 drivers/mtd/chips/cfi_cmdset_0002.c |    4 ++++
 drivers/mtd/chips/cfi_cmdset_0020.c |    1 +
 drivers/mtd/mtdconcat.c             |    1 +
 drivers/mtd/mtdpart.c               |    1 +
 drivers/mtd/ubi/build.c             |    5 ++++-
 include/linux/mtd/mtd.h             |   12 ++++++++++++
 7 files changed, 24 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 44cbfc0..3705da5 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -455,6 +455,7 @@ struct mtd_info *cfi_cmdset_0001(struct map_info *map, int primary)
 	mtd->flags   = MTD_CAP_NORFLASH;
 	mtd->name    = map->name;
 	mtd->writesize = 1;
+	mtd->write_buffer_size = 1 << cfi->cfiq->MaxBufWriteSize;
 
 	mtd->reboot_notifier.notifier_call = cfi_intelext_reboot;
 
diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 9d68ab9..33989ce 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -428,6 +428,10 @@ struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)
 	mtd->flags   = MTD_CAP_NORFLASH;
 	mtd->name    = map->name;
 	mtd->writesize = 1;
+	mtd->write_buffer_size = 1 << cfi->cfiq->MaxBufWriteSize;
+
+	DEBUG(MTD_DEBUG_LEVEL3, "MTD %s(): write buffer size %d\n",
+		__func__, mtd->write_buffer_size);
 
 	mtd->reboot_notifier.notifier_call = cfi_amdstd_reboot;
 
diff --git a/drivers/mtd/chips/cfi_cmdset_0020.c b/drivers/mtd/chips/cfi_cmdset_0020.c
index 314af1f..54ad184 100644
--- a/drivers/mtd/chips/cfi_cmdset_0020.c
+++ b/drivers/mtd/chips/cfi_cmdset_0020.c
@@ -238,6 +238,7 @@ static struct mtd_info *cfi_staa_setup(struct map_info *map)
 	mtd->resume = cfi_staa_resume;
 	mtd->flags = MTD_CAP_NORFLASH & ~MTD_BIT_WRITEABLE;
 	mtd->writesize = 8; /* FIXME: Should be 0 for STMicro flashes w/out ECC */
+	mtd->write_buffer_size = 1 << cfi->cfiq->MaxBufWriteSize;
 	map->fldrv = &cfi_staa_chipdrv;
 	__module_get(THIS_MODULE);
 	mtd->name = map->name;
diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index bf8de09..53a5e94 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -776,6 +776,7 @@ struct mtd_info *mtd_concat_create(struct mtd_info *subdev[],	/* subdevices to c
 	concat->mtd.size = subdev[0]->size;
 	concat->mtd.erasesize = subdev[0]->erasesize;
 	concat->mtd.writesize = subdev[0]->writesize;
+	concat->mtd.write_buffer_size = subdev[0]->write_buffer_size;
 	concat->mtd.subpage_sft = subdev[0]->subpage_sft;
 	concat->mtd.oobsize = subdev[0]->oobsize;
 	concat->mtd.oobavail = subdev[0]->oobavail;
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 1047ff0..ef37476 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -384,6 +384,7 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
 	slave->mtd.flags = master->flags & ~part->mask_flags;
 	slave->mtd.size = part->size;
 	slave->mtd.writesize = master->writesize;
+	slave->mtd.write_buffer_size = master->write_buffer_size;
 	slave->mtd.oobsize = master->oobsize;
 	slave->mtd.oobavail = master->oobavail;
 	slave->mtd.subpage_sft = master->subpage_sft;
diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 5ebe280..9db6fff 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -670,9 +670,12 @@ static int io_init(struct ubi_device *ubi)
 	if (ubi->mtd->type == MTD_NORFLASH) {
 		ubi_assert(ubi->mtd->writesize == 1);
 		ubi->nor_flash = 1;
+		ubi_assert(ubi->mtd->write_buffer_size > 0);
+		ubi->min_io_size = ubi->mtd->write_buffer_size;
+	} else {
+		ubi->min_io_size = ubi->mtd->writesize;
 	}
 
-	ubi->min_io_size = ubi->mtd->writesize;
 	ubi->hdrs_min_io_size = ubi->mtd->writesize >> ubi->mtd->subpage_sft;
 
 	/*
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index fe8d77e..cb902d1 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -144,6 +144,18 @@ struct mtd_info {
 	 */
 	uint32_t writesize;
 
+	/*
+	 * Sets minimal I/O unit size (min_io_size) for UBI on NOR flash.
+	 * In case of NOR flash minimal I/O size must be equal to the size
+	 * of the write buffer used by internal flash programming algorithm.
+	 * This requirement results from the fact that the flash programming
+	 * operation could be interrupted by a power cut or a system reset
+	 * causing corrupted (partially written) areas in a flash sector.
+	 * Knowing the size of potentially corrupted areas UBIFS scanning
+	 * and recovery algorithms are able to perform successful recovery.
+	 */
+	uint32_t write_buffer_size;
+
 	uint32_t oobsize;   // Amount of OOB data per block (e.g. 16)
 	uint32_t oobavail;  // Available OOB bytes per block
 
-- 
1.7.1
