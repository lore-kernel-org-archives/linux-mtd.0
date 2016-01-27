Received: from mail-lf0-x22f.google.com ([2a00:1450:4010:c07::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aOL0F-00083m-Rz
 for linux-mtd@lists.infradead.org; Wed, 27 Jan 2016 07:59:01 +0000
Received: by mail-lf0-x22f.google.com with SMTP id 17so651026lfz.1
 for <linux-mtd@lists.infradead.org>; Tue, 26 Jan 2016 23:58:39 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, linux-mtd@lists.infradead.org
Cc: bcm-kernel-feedback-list@broadcom.com, Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH] mtd: brcmnand: set initial ECC params based on info from HW
Date: Wed, 27 Jan 2016 08:58:20 +0100
Message-Id: <1453881500-11736-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

So far we were depending on nand_dt_init getting ECC info from DT and
setting it in ECC struct. It is possible to simply read this info from
hardware registers which makes adding support for new hardware way
easier (no more guessing & trying all combinations).
Please note it still gives a precedence to DT which was overwrite
whatever was initially set by the driver.

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
It took me hours to figure out how to setup NAND on my D-Link DIR-885L.
This should be very helpful for ppl adding new devices support.
---
 drivers/mtd/nand/brcmnand/brcmnand.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
index 844fc07..f358cda 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/brcmnand/brcmnand.c
@@ -615,6 +615,17 @@ static inline u32 brcmnand_ecc_level_mask(struct brcmnand_controller *ctrl)
 	return mask << NAND_ACC_CONTROL_ECC_SHIFT;
 }
 
+static int brcmnand_get_ecc_strength(struct brcmnand_host *host)
+{
+	struct brcmnand_controller *ctrl = host->ctrl;
+	u32 mask = brcmnand_ecc_level_mask(ctrl);
+	u16 acc_control_offs = brcmnand_cs_offset(ctrl, host->cs,
+						  BRCMNAND_CS_ACC_CONTROL);
+
+	return (nand_readreg(ctrl, acc_control_offs) & mask) >>
+		NAND_ACC_CONTROL_ECC_SHIFT;
+}
+
 static void brcmnand_set_ecc_enabled(struct brcmnand_host *host, int en)
 {
 	struct brcmnand_controller *ctrl = host->ctrl;
@@ -1960,6 +1971,9 @@ static int brcmnand_init_cs(struct brcmnand_host *host, struct device_node *dn)
 	nand_writereg(ctrl, cfg_offs,
 		      nand_readreg(ctrl, cfg_offs) & ~CFG_BUS_WIDTH);
 
+	chip->ecc.strength = brcmnand_get_ecc_strength(host);
+	chip->ecc.size = brcmnand_get_sector_size_1k(host) ? 1024 : 512;
+
 	if (nand_scan_ident(mtd, 1, NULL))
 		return -ENXIO;
 
-- 
1.8.4.5
