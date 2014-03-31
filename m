Received: from mail-lb0-x235.google.com ([2a00:1450:4010:c04::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUgBn-0001mj-1O
 for linux-mtd@lists.infradead.org; Mon, 31 Mar 2014 17:40:03 +0000
Received: by mail-lb0-f181.google.com with SMTP id c11so6138329lbj.12
 for <linux-mtd@lists.infradead.org>; Mon, 31 Mar 2014 10:39:40 -0700 (PDT)
Subject: [PATCH] mtd: cfi_cmdset_0001 - fixup for PC28F512P33TFA
From: Christoph Fritz <chf.fritz@googlemail.com>
To: Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 31 Mar 2014 19:32:31 +0200
Message-ID: <1396287151.4857.50.camel@mars>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Marius Achilles <M.Achilles@phytec.de>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add a fixup (quirk) for Micron NOR flash PC28F512P33TFA: This patch
disables option 'suspend erase' due to "internal timing issues on
some revisions of the P3x" which is pointed out by Micron TechNote-PDF
"Adapting the Linux Kernel for Micron P30, P33, and J3 Flash Memory" [1].

Without this patch, errors occur during heavy flash usage mostly in minus
degree temperature environments.

It's very likely that other P3x chips suffer from the same issue.

[1]: https://www.micron.com/~/media/Documents/Products/Technical%20Note/NOR%20Flash/tn1206_p30_p33_j3_linux.pdf

Signed-off-by: Christoph Fritz <chf.fritz@googlemail.com>
Tested-by: Marius Achilles <M.Achilles@phytec.de>
---
 drivers/mtd/chips/cfi_cmdset_0001.c |   13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 7751443..eb951b1 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -279,6 +279,18 @@ static void fixup_use_write_buffers(struct mtd_info *mtd)
 	}
 }
 
+static void fixup_micron_pc28f512p33(struct mtd_info *mtd)
+{
+	struct map_info *map = mtd->priv;
+	struct cfi_private *cfi = map->fldrv_priv;
+	struct cfi_pri_intelext *cfip = cfi->cmdset_priv;
+
+	if (cfip->FeatureSupport & 2) {
+		printk(KERN_INFO "Disable Suspend Erase\n");
+		cfip->FeatureSupport &= ~2;
+	}
+}
+
 /*
  * Some chips power-up with all sectors locked by default.
  */
@@ -309,6 +321,7 @@ static struct cfi_fixup cfi_fixup_table[] = {
 #endif
 	{ CFI_MFR_ST, 0x00ba, /* M28W320CT */ fixup_st_m28w320ct },
 	{ CFI_MFR_ST, 0x00bb, /* M28W320CB */ fixup_st_m28w320cb },
+	{ CFI_MFR_INTEL, 0x8964, /* PC28F512P33 */ fixup_micron_pc28f512p33 },
 	{ CFI_MFR_INTEL, CFI_ID_ANY, fixup_unlock_powerup_lock },
 	{ 0, 0, NULL }
 };
-- 
1.7.10.4
