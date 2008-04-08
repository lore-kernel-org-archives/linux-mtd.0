Received: from az33egw02.freescale.net ([192.88.158.103])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jj2Qd-0001Qu-JU
	for linux-mtd@lists.infradead.org; Tue, 08 Apr 2008 01:15:16 +0000
Received: from az33smr01.freescale.net (az33smr01.freescale.net [10.64.34.199])
	by az33egw02.freescale.net (8.12.11/az33egw02) with ESMTP id
	m381FC9l006952 for <linux-mtd@lists.infradead.org>;
	Mon, 7 Apr 2008 18:15:12 -0700 (MST)
From: Trent Piepho <tpiepho@freescale.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] MTD: Fixup for incorrect CFI data in Spansion
	S29GL064/32N flash chips
Date: Mon,  7 Apr 2008 18:12:29 -0700
Message-Id: <1207617149-1582-2-git-send-email-tpiepho@freescale.com>
In-Reply-To: <Pine.LNX.4.64.0804071759410.15143@t2.domain.actdsltmp>
References: <Pine.LNX.4.64.0804071759410.15143@t2.domain.actdsltmp>
Cc: Trent Piepho <tpiepho@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a known erratum confirmed by Spansion.  I have an errata document,
but I can't find a link to it anywhere on their site to include here.

Some of the S29GL064N chips report 64 sectors when they should report 128,
and some of S29GL032N chips report 127 sectors when they should report 63.

Note that when the chip dies are fixed by Spansion, they will still have
the same id.  The fix is done in such a way that it won't affect corrected
chips.

The fixups use the extended id made available by a previous patch.  Without
that, virtually all newer AMD/Spansion chips will have the same ID (0x227e)
and it's not possible to apply the fixup to the correct chips.

Signed-off-by: Trent Piepho <tpiepho@freescale.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c |   26 ++++++++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index d072e87..abdff72 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -220,6 +220,28 @@ static void fixup_use_atmel_lock(struct mtd_info *mtd, void *param)
 	mtd->flags |= MTD_POWERUP_LOCK;
 }
 
+static void fixup_s29gl064n_sectors(struct mtd_info *mtd, void *param)
+{
+	struct map_info *map = mtd->priv;
+	struct cfi_private *cfi = map->fldrv_priv;
+
+	if ((cfi->cfiq->EraseRegionInfo[0] & 0xffff) == 0x003f) {
+		cfi->cfiq->EraseRegionInfo[0] |= 0x0040;
+		pr_warning("%s: Bad S29GL064N CFI data, adjust from 64 to 128 sectors\n", mtd->name);
+	}
+}
+
+static void fixup_s29gl032n_sectors(struct mtd_info *mtd, void *param)
+{
+	struct map_info *map = mtd->priv;
+	struct cfi_private *cfi = map->fldrv_priv;
+
+	if ((cfi->cfiq->EraseRegionInfo[1] & 0xffff) == 0x007e) {
+		cfi->cfiq->EraseRegionInfo[1] &= ~0x0040;
+		pr_warning("%s: Bad S29GL032N CFI data, adjust from 127 to 63 sectors\n", mtd->name);
+	}
+}
+
 static struct cfi_fixup cfi_fixup_table[] = {
 	{ CFI_MFR_ATMEL, CFI_ID_ANY, fixup_convert_atmel_pri, NULL },
 #ifdef AMD_BOOTLOC_BUG
@@ -231,6 +253,10 @@ static struct cfi_fixup cfi_fixup_table[] = {
 	{ CFI_MFR_AMD, 0x0056, fixup_use_secsi, NULL, },
 	{ CFI_MFR_AMD, 0x005C, fixup_use_secsi, NULL, },
 	{ CFI_MFR_AMD, 0x005F, fixup_use_secsi, NULL, },
+	{ CFI_MFR_AMD, 0x0c01, fixup_s29gl064n_sectors, NULL, },
+	{ CFI_MFR_AMD, 0x1301, fixup_s29gl064n_sectors, NULL, },
+	{ CFI_MFR_AMD, 0x1a00, fixup_s29gl032n_sectors, NULL, },
+	{ CFI_MFR_AMD, 0x1a01, fixup_s29gl032n_sectors, NULL, },
 #if !FORCE_WORD_WRITE
 	{ CFI_MFR_ANY, CFI_ID_ANY, fixup_use_write_buffers, NULL, },
 #endif
-- 
1.5.4.1
