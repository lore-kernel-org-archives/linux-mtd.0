Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SAQHw-0008HL-DY
 for linux-mtd@lists.infradead.org; Wed, 21 Mar 2012 18:29:37 +0000
From: Wolfram Sang <w.sang@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: nand: gpmi: fix function annotations
Date: Wed, 21 Mar 2012 19:29:17 +0100
Message-Id: <1332354557-22600-1-git-send-email-w.sang@pengutronix.de>
Cc: Huang Shijie <b32955@freescale.com>, Wolfram Sang <w.sang@pengutronix.de>,
 Artem Bityutski <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A lot of functions have been marked __devinit, but they shouldn't, because they
are needed for bbt_scan. While I believe the whole MX23 handling should be done
entirely different, I am missing the resources to fix it. So, let's have at least
the annotations correct.

Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 493ec2f..c1deb58 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -1155,7 +1155,7 @@ static int gpmi_block_markbad(struct mtd_info *mtd, loff_t ofs)
 	return ret;
 }
 
-static int __devinit nand_boot_set_geometry(struct gpmi_nand_data *this)
+static int nand_boot_set_geometry(struct gpmi_nand_data *this)
 {
 	struct boot_rom_geometry *geometry = &this->rom_geometry;
 
@@ -1182,7 +1182,7 @@ static int __devinit nand_boot_set_geometry(struct gpmi_nand_data *this)
 }
 
 static const char  *fingerprint = "STMP";
-static int __devinit mx23_check_transcription_stamp(struct gpmi_nand_data *this)
+static int mx23_check_transcription_stamp(struct gpmi_nand_data *this)
 {
 	struct boot_rom_geometry *rom_geo = &this->rom_geometry;
 	struct device *dev = this->dev;
@@ -1239,7 +1239,7 @@ static int __devinit mx23_check_transcription_stamp(struct gpmi_nand_data *this)
 }
 
 /* Writes a transcription stamp. */
-static int __devinit mx23_write_transcription_stamp(struct gpmi_nand_data *this)
+static int mx23_write_transcription_stamp(struct gpmi_nand_data *this)
 {
 	struct device *dev = this->dev;
 	struct boot_rom_geometry *rom_geo = &this->rom_geometry;
@@ -1322,7 +1322,7 @@ static int __devinit mx23_write_transcription_stamp(struct gpmi_nand_data *this)
 	return 0;
 }
 
-static int __devinit mx23_boot_init(struct gpmi_nand_data  *this)
+static int mx23_boot_init(struct gpmi_nand_data  *this)
 {
 	struct device *dev = this->dev;
 	struct nand_chip *chip = &this->nand;
@@ -1391,7 +1391,7 @@ static int __devinit mx23_boot_init(struct gpmi_nand_data  *this)
 	return 0;
 }
 
-static int __devinit nand_boot_init(struct gpmi_nand_data  *this)
+static int nand_boot_init(struct gpmi_nand_data  *this)
 {
 	nand_boot_set_geometry(this);
 
@@ -1401,7 +1401,7 @@ static int __devinit nand_boot_init(struct gpmi_nand_data  *this)
 	return 0;
 }
 
-static int __devinit gpmi_set_geometry(struct gpmi_nand_data *this)
+static int gpmi_set_geometry(struct gpmi_nand_data *this)
 {
 	int ret;
 
-- 
1.7.9.1
