Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N0c3a-0005QO-RH
	for linux-mtd@lists.infradead.org; Wed, 21 Oct 2009 14:20:57 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 17/19] mxc_nand: Allow flash based bbt
Date: Wed, 21 Oct 2009 16:13:24 +0200
Message-Id: <1256134406-25251-18-git-send-email-s.hauer@pengutronix.de>
In-Reply-To: <1256134406-25251-17-git-send-email-s.hauer@pengutronix.de>
References: <1256134406-25251-1-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-2-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-3-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-4-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-5-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-6-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-7-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-8-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-9-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-10-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-11-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-12-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-13-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-14-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-15-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-16-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-17-git-send-email-s.hauer@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Eric Benard <ebenard@eukrea.com>,
	Vladimir Barinov <vova.barinov@gmail.com>,
	mathieu.berland@eads.com, jbe@pengutronix.de, sha@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 arch/arm/plat-mxc/include/mach/mxc_nand.h |    3 +-
 drivers/mtd/nand/mxc_nand.c               |   34 +++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+), 1 deletions(-)

diff --git a/arch/arm/plat-mxc/include/mach/mxc_nand.h b/arch/arm/plat-mxc/include/mach/mxc_nand.h
index 2b972df..5d2d21d 100644
--- a/arch/arm/plat-mxc/include/mach/mxc_nand.h
+++ b/arch/arm/plat-mxc/include/mach/mxc_nand.h
@@ -22,6 +22,7 @@
 
 struct mxc_nand_platform_data {
 	int width;	/* data bus width in bytes */
-	int hw_ecc;	/* 0 if supress hardware ECC */
+	int hw_ecc:1;	/* 0 if supress hardware ECC */
+	int flash_bbt:1; /* set to 1 to use a flash based bbt */
 };
 #endif /* __ASM_ARCH_NAND_H */
diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 199a5f2..3fdc172 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -648,6 +648,33 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
 	}
 }
 
+/*
+ * The generic flash bbt decriptors overlap with our ecc
+ * hardware, so define some i.MX specific ones.
+ */
+static uint8_t bbt_pattern[] = { 'B', 'b', 't', '0' };
+static uint8_t mirror_pattern[] = { '1', 't', 'b', 'B' };
+
+static struct nand_bbt_descr bbt_main_descr = {
+	.options = NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE
+	    | NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP,
+	.offs = 0,
+	.len = 4,
+	.veroffs = 4,
+	.maxblocks = 4,
+	.pattern = bbt_pattern,
+};
+
+static struct nand_bbt_descr bbt_mirror_descr = {
+	.options = NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE
+	    | NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP,
+	.offs = 0,
+	.len = 4,
+	.veroffs = 4,
+	.maxblocks = 4,
+	.pattern = mirror_pattern,
+};
+
 static int __init mxcnd_probe(struct platform_device *pdev)
 {
 	struct nand_chip *this;
@@ -786,6 +813,13 @@ static int __init mxcnd_probe(struct platform_device *pdev)
 	if (pdata->width == 2)
 		this->options |= NAND_BUSWIDTH_16;
 
+	if (pdata->flash_bbt) {
+		this->bbt_td = &bbt_main_descr;
+		this->bbt_md = &bbt_mirror_descr;
+		/* update flash based bbt */
+		this->options |= NAND_USE_FLASH_BBT;
+	}
+
 	/* first scan to find the device and get the page size */
 	if (nand_scan_ident(mtd, 1)) {
 		err = -ENXIO;
-- 
1.6.5
