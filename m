Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SSmtB-0004Rz-9w
 for linux-mtd@lists.infradead.org; Fri, 11 May 2012 10:16:19 +0000
Received: by werc12 with SMTP id c12so32295wer.36
 for <linux-mtd@lists.infradead.org>; Fri, 11 May 2012 03:15:52 -0700 (PDT)
From: Javier Martin <javier.martin@vista-silicon.com>
To: linux-mtd@lists.infradead.org
Subject: MTD: Add fixup for S29NS512P NOR flash.
Date: Fri, 11 May 2012 12:15:41 +0200
Message-Id: <1336731341-615-1-git-send-email-javier.martin@vista-silicon.com>
Cc: Gernot.Hoyler@spansion.com, Artem.Bityutskiy@nokia.com,
 joakim.tjernlund@transmode.se, tabe@mvista.com,
 Javier Martin <javier.martin@vista-silicon.com>, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Spansion S29NS512P flash uses a 16bit transfer to report number
of sectors instead of two 8bit accesses as CFI specifies.

Signed-off-by: Javier Martin <javier.martin@vista-silicon.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 23175ed..5873b1f 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -332,6 +332,19 @@ static void fixup_s29gl032n_sectors(struct mtd_info *mtd)
 	}
 }
 
+static void fixup_s29ns512p_sectors(struct mtd_info *mtd)
+{
+	struct map_info *map = mtd->priv;
+	struct cfi_private *cfi = map->fldrv_priv;
+
+	/*
+	 *  S29NS512P flash uses more than 8bits to report number of sectors,
+	 * which is not permitted by CFI.
+	 */
+	cfi->cfiq->EraseRegionInfo[0] = 0x020001ff;
+	pr_warning("%s: Bad S29NS512P CFI data, adjust to 512 sectors\n", mtd->name);
+}
+
 /* Used to fix CFI-Tables of chips without Extended Query Tables */
 static struct cfi_fixup cfi_nopri_fixup_table[] = {
 	{ CFI_MFR_SST, 0x234a, fixup_sst39vf }, /* SST39VF1602 */
@@ -362,6 +375,7 @@ static struct cfi_fixup cfi_fixup_table[] = {
 	{ CFI_MFR_AMD, 0x1301, fixup_s29gl064n_sectors },
 	{ CFI_MFR_AMD, 0x1a00, fixup_s29gl032n_sectors },
 	{ CFI_MFR_AMD, 0x1a01, fixup_s29gl032n_sectors },
+	{ CFI_MFR_AMD, 0x3f00, fixup_s29ns512p_sectors },
 	{ CFI_MFR_SST, 0x536a, fixup_sst38vf640x_sectorsize }, /* SST38VF6402 */
 	{ CFI_MFR_SST, 0x536b, fixup_sst38vf640x_sectorsize }, /* SST38VF6401 */
 	{ CFI_MFR_SST, 0x536c, fixup_sst38vf640x_sectorsize }, /* SST38VF6404 */
-- 
1.7.0.4
