Received: from nat-132.atmel.no ([80.232.32.132] helo=relay.atmel.no)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JCBh4-0003NW-IM
	for linux-mtd@lists.infradead.org; Tue, 08 Jan 2008 10:28:32 +0000
From: Hans-Christian Egtvedt <hcegtvedt@atmel.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/1] Add fixup for AT49BV6416 devices which needs to swap the
	region info
Date: Tue,  8 Jan 2008 11:27:24 +0100
Message-Id: <11997880443971-git-send-email-hcegtvedt@atmel.com>
Cc: kernel@avr32linux.org, Hans-Christian Egtvedt <hcegtvedt@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds a fixup for Atmel AT49BV6416 devices which has the erase region
information swapped. The fixup swaps them correct.

Signed-off-by: Hans-Christian Egtvedt <hcegtvedt@atmel.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 205977b..0b8ad64 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -167,6 +167,18 @@ static void fixup_use_write_buffers(struct mtd_info *mtd, void *param)
 	}
 }
 
+/* Atmel AT49BV6416 chips have swapped the boot sectors and normal sectors */
+static void fixup_swap_atmel_sector_info(struct mtd_info *mtd, void *param)
+{
+	struct map_info *map = mtd->priv;
+	struct cfi_private *cfi = map->fldrv_priv;
+	uint32_t erase_region_info_tmp;
+
+	erase_region_info_tmp = cfi->cfiq->EraseRegionInfo[0];
+	cfi->cfiq->EraseRegionInfo[0] = cfi->cfiq->EraseRegionInfo[1];
+	cfi->cfiq->EraseRegionInfo[1] = erase_region_info_tmp;
+}
+
 /* Atmel chips don't use the same PRI format as AMD chips */
 static void fixup_convert_atmel_pri(struct mtd_info *mtd, void *param)
 {
@@ -221,6 +233,7 @@ static void fixup_use_atmel_lock(struct mtd_info *mtd, void *param)
 }
 
 static struct cfi_fixup cfi_fixup_table[] = {
+	{ CFI_MFR_ATMEL, AT49BV6416, fixup_swap_atmel_sector_info, NULL },
 	{ CFI_MFR_ATMEL, CFI_ID_ANY, fixup_convert_atmel_pri, NULL },
 #ifdef AMD_BOOTLOC_BUG
 	{ CFI_MFR_AMD, CFI_ID_ANY, fixup_amd_bootblock, NULL },
-- 
1.5.2.5
