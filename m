Received: from mail-ey0-f177.google.com ([209.85.215.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S32da-0003Uj-2r
 for linux-mtd@lists.infradead.org; Thu, 01 Mar 2012 09:49:26 +0000
Received: by mail-ey0-f177.google.com with SMTP id k13so143864eaa.36
 for <linux-mtd@lists.infradead.org>; Thu, 01 Mar 2012 01:49:25 -0800 (PST)
From: Bastian Hecht <hechtb@googlemail.com>
To: linux-sh@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH v3 5/7] mtd: sh_flctl: Use cached register value for FLCMNCR
Date: Thu,  1 Mar 2012 10:48:39 +0100
Message-Id: <1330595321-2728-5-git-send-email-hechtb@gmail.com>
In-Reply-To: <1330595321-2728-1-git-send-email-hechtb@gmail.com>
References: <1330595321-2728-1-git-send-email-hechtb@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>,
 Laurent Pichart <laurent.pinchart@ideasonboard.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Instead of reading out the register, use a cached value. This will
make way for a proper runtime power management implementation.

Signed-off-by: Bastian Hecht <hechtb@gmail.com>
---
changelog: 
 renamed flcmncr_val to flcmncr_base
 hwecc code needs to alter flcmncr_base too
 use cached value in set_cmd_regs too
 pull in the chip enable flag into the flcmncr_base value. I think it's easier to just modify flcmncr_base in flctl_select_chip() rather than adding another cached value for the enable flag.

 drivers/mtd/nand/sh_flctl.c  |   22 +++++++---------------
 include/linux/mtd/sh_flctl.h |    1 +
 2 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
index 5c3e71f..73398f7 100644
--- a/drivers/mtd/nand/sh_flctl.c
+++ b/drivers/mtd/nand/sh_flctl.c
@@ -283,7 +283,7 @@ static void write_fiforeg(struct sh_flctl *flctl, int rlen, int offset)
 static void set_cmd_regs(struct mtd_info *mtd, uint32_t cmd, uint32_t flcmcdr_val)
 {
 	struct sh_flctl *flctl = mtd_to_flctl(mtd);
-	uint32_t flcmncr_val = readl(FLCMNCR(flctl)) & ~SEL_16BIT;
+	uint32_t flcmncr_val = flctl->flcmncr_base & ~SEL_16BIT;
 	uint32_t flcmdcr_val, addr_len_bytes = 0;
 
 	/* Set SNAND bit if page size is 2048byte */
@@ -681,16 +681,15 @@ read_normal_exit:
 static void flctl_select_chip(struct mtd_info *mtd, int chipnr)
 {
 	struct sh_flctl *flctl = mtd_to_flctl(mtd);
-	uint32_t flcmncr_val = readl(FLCMNCR(flctl));
 
 	switch (chipnr) {
 	case -1:
-		flcmncr_val &= ~CE0_ENABLE;
-		writel(flcmncr_val, FLCMNCR(flctl));
+		flctl->flcmncr_base &= ~CE0_ENABLE;
+		writel(flctl->flcmncr_base, FLCMNCR(flctl));
 		break;
 	case 0:
-		flcmncr_val |= CE0_ENABLE;
-		writel(flcmncr_val, FLCMNCR(flctl));
+		flctl->flcmncr_base |= CE0_ENABLE;
+		writel(flctl->flcmncr_base, FLCMNCR(flctl));
 		break;
 	default:
 		BUG();
@@ -748,11 +747,6 @@ static int flctl_verify_buf(struct mtd_info *mtd, const u_char *buf, int len)
 	return 0;
 }
 
-static void flctl_register_init(struct sh_flctl *flctl, unsigned long val)
-{
-	writel(val, FLCMNCR(flctl));
-}
-
 static int flctl_chip_init_tail(struct mtd_info *mtd)
 {
 	struct sh_flctl *flctl = mtd_to_flctl(mtd);
@@ -804,8 +798,7 @@ static int flctl_chip_init_tail(struct mtd_info *mtd)
 		chip->ecc.mode = NAND_ECC_HW;
 
 		/* 4 symbols ECC enabled */
-		writel(readl(FLCMNCR(flctl)) | _4ECCEN | ECCPOS2 | ECCPOS_02,
-				FLCMNCR(flctl));
+		flctl->flcmncr_base |= _4ECCEN | ECCPOS2 | ECCPOS_02;
 	} else {
 		chip->ecc.mode = NAND_ECC_SOFT;
 	}
@@ -851,10 +844,9 @@ static int __devinit flctl_probe(struct platform_device *pdev)
 	nand = &flctl->chip;
 	flctl_mtd->priv = nand;
 	flctl->pdev = pdev;
+	flctl->flcmncr_base = pdata->flcmncr_val;
 	flctl->hwecc = pdata->has_hwecc;
 
-	flctl_register_init(flctl, pdata->flcmncr_val);
-
 	nand->options = NAND_NO_AUTOINCR;
 
 	/* Set address of hardware control function */
diff --git a/include/linux/mtd/sh_flctl.h b/include/linux/mtd/sh_flctl.h
index b669405..c708282 100644
--- a/include/linux/mtd/sh_flctl.h
+++ b/include/linux/mtd/sh_flctl.h
@@ -132,6 +132,7 @@ struct sh_flctl {
 	int	erase1_page_addr;	/* page_addr in ERASE1 cmd */
 	uint32_t erase_ADRCNT;		/* bits of FLCMDCR in ERASE1 cmd */
 	uint32_t rw_ADRCNT;	/* bits of FLCMDCR in READ WRITE cmd */
+	uint32_t flcmncr_base;	/* base value of FLCMNCR */
 
 	int	hwecc_cant_correct[4];
 
-- 
1.7.5.4
