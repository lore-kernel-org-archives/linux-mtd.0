Received: from relay.atmel.no ([80.232.32.139])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N63ie-00014K-OH
	for linux-mtd@lists.infradead.org; Thu, 05 Nov 2009 14:53:53 +0000
From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2] mtd: add lock fixup for AT49BV640D and AT49BV640DT chips
Date: Thu,  5 Nov 2009 15:53:37 +0100
Message-Id: <1257432817-20786-1-git-send-email-hans-christian.egtvedt@atmel.com>
Cc: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>, nico@fluxnic.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch sets the MTD_POWERUP_LOCK flag for AT49BV640D and AT49BV640DT
devices, since the devices are locked when powered up and needs to be unlocked
before interfaced.

Quote datasheet; "At power-up and reset, all sectors have their Softlock
protection mode enabled.".

Tested on AVR32 hardware platform with an AT49BV640D flash device.

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
---
Changes in v2:
 moved fixup_at49bv640dx_lock to cfi_fixup_table.
 also set the FeatureSupport bit for protection bits in cfi_pri_intelext

 drivers/mtd/chips/cfi_cmdset_0001.c |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index e7563a9..31e9c43 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -51,7 +51,9 @@
 #define M50LPW080       0x002F
 #define M50FLW080A	0x0080
 #define M50FLW080B	0x0081
+/* Atmel chips */
 #define AT49BV640D	0x02de
+#define AT49BV640DT	0x02db
 
 static int cfi_intelext_read (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
 static int cfi_intelext_write_words(struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
@@ -199,6 +201,16 @@ static void fixup_convert_atmel_pri(struct mtd_info *mtd, void *param)
 	cfi->cfiq->BufWriteTimeoutMax = 0;
 }
 
+static void fixup_at49bv640dx_lock(struct mtd_info *mtd, void *param)
+{
+	struct map_info *map = mtd->priv;
+	struct cfi_private *cfi = map->fldrv_priv;
+	struct cfi_pri_intelext *cfip = cfi->cmdset_priv;
+
+	cfip->FeatureSupport |= (1 << 5);
+	mtd->flags |= MTD_POWERUP_LOCK;
+}
+
 #ifdef CMDSET0001_DISABLE_ERASE_SUSPEND_ON_WRITE
 /* Some Intel Strata Flash prior to FPO revision C has bugs in this area */
 static void fixup_intel_strataflash(struct mtd_info *mtd, void* param)
@@ -283,6 +295,8 @@ static void fixup_unlock_powerup_lock(struct mtd_info *mtd, void *param)
 
 static struct cfi_fixup cfi_fixup_table[] = {
 	{ CFI_MFR_ATMEL, CFI_ID_ANY, fixup_convert_atmel_pri, NULL },
+	{ CFI_MFR_ATMEL, AT49BV640D, fixup_at49bv640dx_lock, NULL },
+	{ CFI_MFR_ATMEL, AT49BV640DT, fixup_at49bv640dx_lock, NULL },
 #ifdef CMDSET0001_DISABLE_ERASE_SUSPEND_ON_WRITE
 	{ CFI_MFR_ANY, CFI_ID_ANY, fixup_intel_strataflash, NULL },
 #endif
-- 
1.6.0.4
