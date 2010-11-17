Received: from smtp1-g21.free.fr ([212.27.42.1])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PIgKM-0004d0-Me
	for linux-mtd@lists.infradead.org; Wed, 17 Nov 2010 11:37:29 +0000
Subject: [PATCH] mtd: cfi_fixup: remove unused 'param' parameter
To: linux-mtd@lists.infradead.org
From: Guillaume LECERF <glecerf@gmail.com>
Date: Wed, 17 Nov 2010 12:35:50 +0100
Message-ID: <20101117113550.15860.31152.stgit@dev.siriade.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Wolfram Sang <w.sang@pengutronix.de>, Nicolas Pitre <nico@fluxnic.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The 'param' parameter has never been used since its introduction, so
simply remove it.

Signed-off-by: Guillaume LECERF <glecerf@gmail.com>
---
 drivers/mtd/chips/cfi_cmdset_0001.c |   54 ++++++++++----------
 drivers/mtd/chips/cfi_cmdset_0002.c |   94 ++++++++++++++++++-----------------
 drivers/mtd/chips/cfi_util.c        |    2 -
 drivers/mtd/chips/fwh_lock.h        |    2 -
 include/linux/mtd/cfi.h             |    3 -
 5 files changed, 77 insertions(+), 78 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index ad9268b..44cbfc0 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -162,7 +162,7 @@ static void cfi_tell_features(struct cfi_pri_intelext *extp)
 #endif
 
 /* Atmel chips don't use the same PRI format as Intel chips */
-static void fixup_convert_atmel_pri(struct mtd_info *mtd, void *param)
+static void fixup_convert_atmel_pri(struct mtd_info *mtd)
 {
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
@@ -202,7 +202,7 @@ static void fixup_convert_atmel_pri(struct mtd_info *mtd, void *param)
 	cfi->cfiq->BufWriteTimeoutMax = 0;
 }
 
-static void fixup_at49bv640dx_lock(struct mtd_info *mtd, void *param)
+static void fixup_at49bv640dx_lock(struct mtd_info *mtd)
 {
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
@@ -214,7 +214,7 @@ static void fixup_at49bv640dx_lock(struct mtd_info *mtd, void *param)
 
 #ifdef CMDSET0001_DISABLE_ERASE_SUSPEND_ON_WRITE
 /* Some Intel Strata Flash prior to FPO revision C has bugs in this area */
-static void fixup_intel_strataflash(struct mtd_info *mtd, void* param)
+static void fixup_intel_strataflash(struct mtd_info *mtd)
 {
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
@@ -227,7 +227,7 @@ static void fixup_intel_strataflash(struct mtd_info *mtd, void* param)
 #endif
 
 #ifdef CMDSET0001_DISABLE_WRITE_SUSPEND
-static void fixup_no_write_suspend(struct mtd_info *mtd, void* param)
+static void fixup_no_write_suspend(struct mtd_info *mtd)
 {
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
@@ -240,7 +240,7 @@ static void fixup_no_write_suspend(struct mtd_info *mtd, void* param)
 }
 #endif
 
-static void fixup_st_m28w320ct(struct mtd_info *mtd, void* param)
+static void fixup_st_m28w320ct(struct mtd_info *mtd)
 {
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
@@ -249,7 +249,7 @@ static void fixup_st_m28w320ct(struct mtd_info *mtd, void* param)
 	cfi->cfiq->BufWriteTimeoutMax = 0;	/* Not supported */
 }
 
-static void fixup_st_m28w320cb(struct mtd_info *mtd, void* param)
+static void fixup_st_m28w320cb(struct mtd_info *mtd)
 {
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
@@ -259,7 +259,7 @@ static void fixup_st_m28w320cb(struct mtd_info *mtd, void* param)
 		(cfi->cfiq->EraseRegionInfo[1] & 0xffff0000) | 0x3e;
 };
 
-static void fixup_use_point(struct mtd_info *mtd, void *param)
+static void fixup_use_point(struct mtd_info *mtd)
 {
 	struct map_info *map = mtd->priv;
 	if (!mtd->point && map_is_linear(map)) {
@@ -268,7 +268,7 @@ static void fixup_use_point(struct mtd_info *mtd, void *param)
 	}
 }
 
-static void fixup_use_write_buffers(struct mtd_info *mtd, void *param)
+static void fixup_use_write_buffers(struct mtd_info *mtd)
 {
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
@@ -282,7 +282,7 @@ static void fixup_use_write_buffers(struct mtd_info *mtd, void *param)
 /*
  * Some chips power-up with all sectors locked by default.
  */
-static void fixup_unlock_powerup_lock(struct mtd_info *mtd, void *param)
+static void fixup_unlock_powerup_lock(struct mtd_info *mtd)
 {
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
@@ -295,31 +295,31 @@ static void fixup_unlock_powerup_lock(struct mtd_info *mtd, void *param)
 }
 
 static struct cfi_fixup cfi_fixup_table[] = {
-	{ CFI_MFR_ATMEL, CFI_ID_ANY, fixup_convert_atmel_pri, NULL },
-	{ CFI_MFR_ATMEL, AT49BV640D, fixup_at49bv640dx_lock, NULL },
-	{ CFI_MFR_ATMEL, AT49BV640DT, fixup_at49bv640dx_lock, NULL },
+	{ CFI_MFR_ATMEL, CFI_ID_ANY, fixup_convert_atmel_pri },
+	{ CFI_MFR_ATMEL, AT49BV640D, fixup_at49bv640dx_lock },
+	{ CFI_MFR_ATMEL, AT49BV640DT, fixup_at49bv640dx_lock },
 #ifdef CMDSET0001_DISABLE_ERASE_SUSPEND_ON_WRITE
-	{ CFI_MFR_ANY, CFI_ID_ANY, fixup_intel_strataflash, NULL },
+	{ CFI_MFR_ANY, CFI_ID_ANY, fixup_intel_strataflash },
 #endif
 #ifdef CMDSET0001_DISABLE_WRITE_SUSPEND
-	{ CFI_MFR_ANY, CFI_ID_ANY, fixup_no_write_suspend, NULL },
+	{ CFI_MFR_ANY, CFI_ID_ANY, fixup_no_write_suspend },
 #endif
 #if !FORCE_WORD_WRITE
-	{ CFI_MFR_ANY, CFI_ID_ANY, fixup_use_write_buffers, NULL },
+	{ CFI_MFR_ANY, CFI_ID_ANY, fixup_use_write_buffers },
 #endif
-	{ CFI_MFR_ST, 0x00ba, /* M28W320CT */ fixup_st_m28w320ct, NULL },
-	{ CFI_MFR_ST, 0x00bb, /* M28W320CB */ fixup_st_m28w320cb, NULL },
-	{ CFI_MFR_INTEL, CFI_ID_ANY, fixup_unlock_powerup_lock, NULL, },
-	{ 0, 0, NULL, NULL }
+	{ CFI_MFR_ST, 0x00ba, /* M28W320CT */ fixup_st_m28w320ct },
+	{ CFI_MFR_ST, 0x00bb, /* M28W320CB */ fixup_st_m28w320cb },
+	{ CFI_MFR_INTEL, CFI_ID_ANY, fixup_unlock_powerup_lock },
+	{ 0, 0, NULL }
 };
 
 static struct cfi_fixup jedec_fixup_table[] = {
-	{ CFI_MFR_INTEL, I82802AB,   fixup_use_fwh_lock, NULL, },
-	{ CFI_MFR_INTEL, I82802AC,   fixup_use_fwh_lock, NULL, },
-	{ CFI_MFR_ST,    M50LPW080,  fixup_use_fwh_lock, NULL, },
-	{ CFI_MFR_ST,    M50FLW080A, fixup_use_fwh_lock, NULL, },
-	{ CFI_MFR_ST,    M50FLW080B, fixup_use_fwh_lock, NULL, },
-	{ 0, 0, NULL, NULL }
+	{ CFI_MFR_INTEL, I82802AB,   fixup_use_fwh_lock },
+	{ CFI_MFR_INTEL, I82802AC,   fixup_use_fwh_lock },
+	{ CFI_MFR_ST,    M50LPW080,  fixup_use_fwh_lock },
+	{ CFI_MFR_ST,    M50FLW080A, fixup_use_fwh_lock },
+	{ CFI_MFR_ST,    M50FLW080B, fixup_use_fwh_lock },
+	{ 0, 0, NULL }
 };
 static struct cfi_fixup fixup_table[] = {
 	/* The CFI vendor ids and the JEDEC vendor IDs appear
@@ -327,8 +327,8 @@ static struct cfi_fixup fixup_table[] = {
 	 * well.  This table is to pick all cases where
 	 * we know that is the case.
 	 */
-	{ CFI_MFR_ANY, CFI_ID_ANY, fixup_use_point, NULL },
-	{ 0, 0, NULL, NULL }
+	{ CFI_MFR_ANY, CFI_ID_ANY, fixup_use_point },
+	{ 0, 0, NULL }
 };
 
 static void cfi_fixup_major_minor(struct cfi_private *cfi,
diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 3b8e32d..9d68ab9 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -134,7 +134,7 @@ static void cfi_tell_features(struct cfi_pri_amdstd *extp)
 
 #ifdef AMD_BOOTLOC_BUG
 /* Wheee. Bring me the head of someone at AMD. */
-static void fixup_amd_bootblock(struct mtd_info *mtd, void* param)
+static void fixup_amd_bootblock(struct mtd_info *mtd)
 {
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
@@ -186,7 +186,7 @@ static void fixup_amd_bootblock(struct mtd_info *mtd, void* param)
 }
 #endif
 
-static void fixup_use_write_buffers(struct mtd_info *mtd, void *param)
+static void fixup_use_write_buffers(struct mtd_info *mtd)
 {
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
@@ -197,7 +197,7 @@ static void fixup_use_write_buffers(struct mtd_info *mtd, void *param)
 }
 
 /* Atmel chips don't use the same PRI format as AMD chips */
-static void fixup_convert_atmel_pri(struct mtd_info *mtd, void *param)
+static void fixup_convert_atmel_pri(struct mtd_info *mtd)
 {
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
@@ -228,14 +228,14 @@ static void fixup_convert_atmel_pri(struct mtd_info *mtd, void *param)
 	cfi->cfiq->BufWriteTimeoutMax = 0;
 }
 
-static void fixup_use_secsi(struct mtd_info *mtd, void *param)
+static void fixup_use_secsi(struct mtd_info *mtd)
 {
 	/* Setup for chips with a secsi area */
 	mtd->read_user_prot_reg = cfi_amdstd_secsi_read;
 	mtd->read_fact_prot_reg = cfi_amdstd_secsi_read;
 }
 
-static void fixup_use_erase_chip(struct mtd_info *mtd, void *param)
+static void fixup_use_erase_chip(struct mtd_info *mtd)
 {
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
@@ -250,7 +250,7 @@ static void fixup_use_erase_chip(struct mtd_info *mtd, void *param)
  * Some Atmel chips (e.g. the AT49BV6416) power-up with all sectors
  * locked by default.
  */
-static void fixup_use_atmel_lock(struct mtd_info *mtd, void *param)
+static void fixup_use_atmel_lock(struct mtd_info *mtd)
 {
 	mtd->lock = cfi_atmel_lock;
 	mtd->unlock = cfi_atmel_unlock;
@@ -271,7 +271,7 @@ static void fixup_old_sst_eraseregion(struct mtd_info *mtd)
 	cfi->cfiq->NumEraseRegions = 1;
 }
 
-static void fixup_sst39vf(struct mtd_info *mtd, void *param)
+static void fixup_sst39vf(struct mtd_info *mtd)
 {
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
@@ -282,7 +282,7 @@ static void fixup_sst39vf(struct mtd_info *mtd, void *param)
 	cfi->addr_unlock2 = 0x2AAA;
 }
 
-static void fixup_sst39vf_rev_b(struct mtd_info *mtd, void *param)
+static void fixup_sst39vf_rev_b(struct mtd_info *mtd)
 {
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
@@ -295,12 +295,12 @@ static void fixup_sst39vf_rev_b(struct mtd_info *mtd, void *param)
 	cfi->sector_erase_cmd = CMD(0x50);
 }
 
-static void fixup_sst38vf640x_sectorsize(struct mtd_info *mtd, void *param)
+static void fixup_sst38vf640x_sectorsize(struct mtd_info *mtd)
 {
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
 
-	fixup_sst39vf_rev_b(mtd, param);
+	fixup_sst39vf_rev_b(mtd);
 
 	/*
 	 * CFI reports 1024 sectors (0x03ff+1) of 64KBytes (0x0100*256) where
@@ -310,7 +310,7 @@ static void fixup_sst38vf640x_sectorsize(struct mtd_info *mtd, void *param)
 	pr_warning("%s: Bad 38VF640x CFI data; adjusting sector size from 64 to 8KiB\n", mtd->name);
 }
 
-static void fixup_s29gl064n_sectors(struct mtd_info *mtd, void *param)
+static void fixup_s29gl064n_sectors(struct mtd_info *mtd)
 {
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
@@ -321,7 +321,7 @@ static void fixup_s29gl064n_sectors(struct mtd_info *mtd, void *param)
 	}
 }
 
-static void fixup_s29gl032n_sectors(struct mtd_info *mtd, void *param)
+static void fixup_s29gl032n_sectors(struct mtd_info *mtd)
 {
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
@@ -334,47 +334,47 @@ static void fixup_s29gl032n_sectors(struct mtd_info *mtd, void *param)
 
 /* Used to fix CFI-Tables of chips without Extended Query Tables */
 static struct cfi_fixup cfi_nopri_fixup_table[] = {
-	{ CFI_MFR_SST, 0x234A, fixup_sst39vf, NULL, }, /* SST39VF1602 */
-	{ CFI_MFR_SST, 0x234B, fixup_sst39vf, NULL, }, /* SST39VF1601 */
-	{ CFI_MFR_SST, 0x235A, fixup_sst39vf, NULL, }, /* SST39VF3202 */
-	{ CFI_MFR_SST, 0x235B, fixup_sst39vf, NULL, }, /* SST39VF3201 */
-	{ CFI_MFR_SST, 0x235C, fixup_sst39vf_rev_b, NULL, }, /* SST39VF3202B */
-	{ CFI_MFR_SST, 0x235D, fixup_sst39vf_rev_b, NULL, }, /* SST39VF3201B */
-	{ CFI_MFR_SST, 0x236C, fixup_sst39vf_rev_b, NULL, }, /* SST39VF6402B */
-	{ CFI_MFR_SST, 0x236D, fixup_sst39vf_rev_b, NULL, }, /* SST39VF6401B */
-	{ 0, 0, NULL, NULL }
+	{ CFI_MFR_SST, 0x234a, fixup_sst39vf }, /* SST39VF1602 */
+	{ CFI_MFR_SST, 0x234b, fixup_sst39vf }, /* SST39VF1601 */
+	{ CFI_MFR_SST, 0x235a, fixup_sst39vf }, /* SST39VF3202 */
+	{ CFI_MFR_SST, 0x235b, fixup_sst39vf }, /* SST39VF3201 */
+	{ CFI_MFR_SST, 0x235c, fixup_sst39vf_rev_b }, /* SST39VF3202B */
+	{ CFI_MFR_SST, 0x235d, fixup_sst39vf_rev_b }, /* SST39VF3201B */
+	{ CFI_MFR_SST, 0x236c, fixup_sst39vf_rev_b }, /* SST39VF6402B */
+	{ CFI_MFR_SST, 0x236d, fixup_sst39vf_rev_b }, /* SST39VF6401B */
+	{ 0, 0, NULL }
 };
 
 static struct cfi_fixup cfi_fixup_table[] = {
-	{ CFI_MFR_ATMEL, CFI_ID_ANY, fixup_convert_atmel_pri, NULL },
+	{ CFI_MFR_ATMEL, CFI_ID_ANY, fixup_convert_atmel_pri },
 #ifdef AMD_BOOTLOC_BUG
-	{ CFI_MFR_AMD, CFI_ID_ANY, fixup_amd_bootblock, NULL },
-	{ CFI_MFR_MACRONIX, CFI_ID_ANY, fixup_amd_bootblock, NULL },
+	{ CFI_MFR_AMD, CFI_ID_ANY, fixup_amd_bootblock },
+	{ CFI_MFR_MACRONIX, CFI_ID_ANY, fixup_amd_bootblock },
 #endif
-	{ CFI_MFR_AMD, 0x0050, fixup_use_secsi, NULL, },
-	{ CFI_MFR_AMD, 0x0053, fixup_use_secsi, NULL, },
-	{ CFI_MFR_AMD, 0x0055, fixup_use_secsi, NULL, },
-	{ CFI_MFR_AMD, 0x0056, fixup_use_secsi, NULL, },
-	{ CFI_MFR_AMD, 0x005C, fixup_use_secsi, NULL, },
-	{ CFI_MFR_AMD, 0x005F, fixup_use_secsi, NULL, },
-	{ CFI_MFR_AMD, 0x0c01, fixup_s29gl064n_sectors, NULL, },
-	{ CFI_MFR_AMD, 0x1301, fixup_s29gl064n_sectors, NULL, },
-	{ CFI_MFR_AMD, 0x1a00, fixup_s29gl032n_sectors, NULL, },
-	{ CFI_MFR_AMD, 0x1a01, fixup_s29gl032n_sectors, NULL, },
-	{ CFI_MFR_SST, 0x536A, fixup_sst38vf640x_sectorsize, NULL, }, /* SST38VF6402 */
-	{ CFI_MFR_SST, 0x536B, fixup_sst38vf640x_sectorsize, NULL, }, /* SST38VF6401 */
-	{ CFI_MFR_SST, 0x536C, fixup_sst38vf640x_sectorsize, NULL, }, /* SST38VF6404 */
-	{ CFI_MFR_SST, 0x536D, fixup_sst38vf640x_sectorsize, NULL, }, /* SST38VF6403 */
+	{ CFI_MFR_AMD, 0x0050, fixup_use_secsi },
+	{ CFI_MFR_AMD, 0x0053, fixup_use_secsi },
+	{ CFI_MFR_AMD, 0x0055, fixup_use_secsi },
+	{ CFI_MFR_AMD, 0x0056, fixup_use_secsi },
+	{ CFI_MFR_AMD, 0x005C, fixup_use_secsi },
+	{ CFI_MFR_AMD, 0x005F, fixup_use_secsi },
+	{ CFI_MFR_AMD, 0x0c01, fixup_s29gl064n_sectors },
+	{ CFI_MFR_AMD, 0x1301, fixup_s29gl064n_sectors },
+	{ CFI_MFR_AMD, 0x1a00, fixup_s29gl032n_sectors },
+	{ CFI_MFR_AMD, 0x1a01, fixup_s29gl032n_sectors },
+	{ CFI_MFR_SST, 0x536a, fixup_sst38vf640x_sectorsize }, /* SST38VF6402 */
+	{ CFI_MFR_SST, 0x536b, fixup_sst38vf640x_sectorsize }, /* SST38VF6401 */
+	{ CFI_MFR_SST, 0x536c, fixup_sst38vf640x_sectorsize }, /* SST38VF6404 */
+	{ CFI_MFR_SST, 0x536d, fixup_sst38vf640x_sectorsize }, /* SST38VF6403 */
 #if !FORCE_WORD_WRITE
-	{ CFI_MFR_ANY, CFI_ID_ANY, fixup_use_write_buffers, NULL, },
+	{ CFI_MFR_ANY, CFI_ID_ANY, fixup_use_write_buffers },
 #endif
-	{ 0, 0, NULL, NULL }
+	{ 0, 0, NULL }
 };
 static struct cfi_fixup jedec_fixup_table[] = {
-	{ CFI_MFR_SST, SST49LF004B, fixup_use_fwh_lock, NULL, },
-	{ CFI_MFR_SST, SST49LF040B, fixup_use_fwh_lock, NULL, },
-	{ CFI_MFR_SST, SST49LF008A, fixup_use_fwh_lock, NULL, },
-	{ 0, 0, NULL, NULL }
+	{ CFI_MFR_SST, SST49LF004B, fixup_use_fwh_lock },
+	{ CFI_MFR_SST, SST49LF040B, fixup_use_fwh_lock },
+	{ CFI_MFR_SST, SST49LF008A, fixup_use_fwh_lock },
+	{ 0, 0, NULL }
 };
 
 static struct cfi_fixup fixup_table[] = {
@@ -383,9 +383,9 @@ static struct cfi_fixup fixup_table[] = {
 	 * well.  This table is to pick all cases where
 	 * we know that is the case.
 	 */
-	{ CFI_MFR_ANY, CFI_ID_ANY, fixup_use_erase_chip, NULL },
-	{ CFI_MFR_ATMEL, AT49BV6416, fixup_use_atmel_lock, NULL },
-	{ 0, 0, NULL, NULL }
+	{ CFI_MFR_ANY, CFI_ID_ANY, fixup_use_erase_chip },
+	{ CFI_MFR_ATMEL, AT49BV6416, fixup_use_atmel_lock },
+	{ 0, 0, NULL }
 };
 
 
diff --git a/drivers/mtd/chips/cfi_util.c b/drivers/mtd/chips/cfi_util.c
index 360525c..6ae3d11 100644
--- a/drivers/mtd/chips/cfi_util.c
+++ b/drivers/mtd/chips/cfi_util.c
@@ -156,7 +156,7 @@ void cfi_fixup(struct mtd_info *mtd, struct cfi_fixup *fixups)
 	for (f=fixups; f->fixup; f++) {
 		if (((f->mfr == CFI_MFR_ANY) || (f->mfr == cfi->mfr)) &&
 		    ((f->id  == CFI_ID_ANY)  || (f->id  == cfi->id))) {
-			f->fixup(mtd, f->param);
+			f->fixup(mtd);
 		}
 	}
 }
diff --git a/drivers/mtd/chips/fwh_lock.h b/drivers/mtd/chips/fwh_lock.h
index d180649..5e3cc80 100644
--- a/drivers/mtd/chips/fwh_lock.h
+++ b/drivers/mtd/chips/fwh_lock.h
@@ -98,7 +98,7 @@ static int fwh_unlock_varsize(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	return ret;
 }
 
-static void fixup_use_fwh_lock(struct mtd_info *mtd, void *param)
+static void fixup_use_fwh_lock(struct mtd_info *mtd)
 {
 	printk(KERN_NOTICE "using fwh lock/unlock method\n");
 	/* Setup for the chips with the fwh lock method */
diff --git a/include/linux/mtd/cfi.h b/include/linux/mtd/cfi.h
index 4dd0c2c..a9baee6 100644
--- a/include/linux/mtd/cfi.h
+++ b/include/linux/mtd/cfi.h
@@ -527,8 +527,7 @@ struct cfi_extquery *cfi_read_pri(struct map_info *map, uint16_t adr, uint16_t s
 struct cfi_fixup {
 	uint16_t mfr;
 	uint16_t id;
-	void (*fixup)(struct mtd_info *mtd, void* param);
-	void* param;
+	void (*fixup)(struct mtd_info *mtd);
 };
 
 #define CFI_MFR_ANY		0xFFFF
