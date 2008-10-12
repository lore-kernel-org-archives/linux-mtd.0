Received: from fg-out-1718.google.com ([72.14.220.153])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Koueu-00019n-T9
	for linux-mtd@lists.infradead.org; Sun, 12 Oct 2008 06:42:33 +0000
Received: by fg-out-1718.google.com with SMTP id l26so829230fgb.26
	for <linux-mtd@lists.infradead.org>;
	Sat, 11 Oct 2008 23:42:31 -0700 (PDT)
Subject: [PATCH] Bug on atmel_nand HW ECC : OOB info not correctly written
From: Richard Genoud <richard.genoud@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain
Date: Sun, 12 Oct 2008 08:42:28 +0200
Message-Id: <1223793748.7110.13.camel@ubuntu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	Haavard Skinnemoen <hskinnemoen@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The functions that write the OOB info (on hardware ECC only) use the HW_SYNDROME method.
This is not correct : the start position is "pos = eccsize + chunk" and should be eccsize.
So, the standard (nand_write_oob_std) function should be used.
This patch corrects this by using NAND_ECC_HW instead of NAND_ECC_HW_SYNDROME.

This has only been tested on small pages nand flash.
(if anyone can test it on large pages that would be great).

kernel version : 2.6.27-rc2 (current git mtd-2.6)

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>

---
diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 3387e0d..c98c157 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -174,48 +174,6 @@ static void atmel_write_buf16(struct mtd_info *mtd, const u8 *buf, int len)
 }
 
 /*
- * write oob for small pages
- */
-static int atmel_nand_write_oob_512(struct mtd_info *mtd,
-		struct nand_chip *chip, int page)
-{
-	int chunk = chip->ecc.bytes + chip->ecc.prepad + chip->ecc.postpad;
-	int eccsize = chip->ecc.size, length = mtd->oobsize;
-	int len, pos, status = 0;
-	const uint8_t *bufpoi = chip->oob_poi;
-
-	pos = eccsize + chunk;
-
-	chip->cmdfunc(mtd, NAND_CMD_SEQIN, pos, page);
-	len = min_t(int, length, chunk);
-	chip->write_buf(mtd, bufpoi, len);
-	bufpoi += len;
-	length -= len;
-	if (length > 0)
-		chip->write_buf(mtd, bufpoi, length);
-
-	chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
-	status = chip->waitfunc(mtd, chip);
-
-	return status & NAND_STATUS_FAIL ? -EIO : 0;
-
-}
-
-/*
- * read oob for small pages
- */
-static int atmel_nand_read_oob_512(struct mtd_info *mtd,
-		struct nand_chip *chip,	int page, int sndcmd)
-{
-	if (sndcmd) {
-		chip->cmdfunc(mtd, NAND_CMD_READOOB, 0, page);
-		sndcmd = 0;
-	}
-	chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
-	return sndcmd;
-}
-
-/*
  * Calculate HW ECC
  *
  * function called after a write
@@ -235,14 +193,14 @@ static int atmel_nand_calculate(struct mtd_info *mtd,
 	/* get the first 2 ECC bytes */
 	ecc_value = ecc_readl(host->ecc, PR);
 
-	ecc_code[eccpos[0]] = ecc_value & 0xFF;
-	ecc_code[eccpos[1]] = (ecc_value >> 8) & 0xFF;
+	ecc_code[0] = ecc_value & 0xFF;
+	ecc_code[1] = (ecc_value >> 8) & 0xFF;
 
 	/* get the last 2 ECC bytes */
 	ecc_value = ecc_readl(host->ecc, NPR) & ATMEL_ECC_NPARITY;
 
-	ecc_code[eccpos[2]] = ecc_value & 0xFF;
-	ecc_code[eccpos[3]] = (ecc_value >> 8) & 0xFF;
+	ecc_code[2] = ecc_value & 0xFF;
+	ecc_code[3] = (ecc_value >> 8) & 0xFF;
 
 	return 0;
 }
@@ -476,14 +434,12 @@ static int __init atmel_nand_probe(struct platform_device *pdev)
 			res = -EIO;
 			goto err_ecc_ioremap;
 		}
-		nand_chip->ecc.mode = NAND_ECC_HW_SYNDROME;
+		nand_chip->ecc.mode = NAND_ECC_HW;
 		nand_chip->ecc.calculate = atmel_nand_calculate;
 		nand_chip->ecc.correct = atmel_nand_correct;
 		nand_chip->ecc.hwctl = atmel_nand_hwctl;
 		nand_chip->ecc.read_page = atmel_nand_read_page;
 		nand_chip->ecc.bytes = 4;
-		nand_chip->ecc.prepad = 0;
-		nand_chip->ecc.postpad = 0;
 	}
 
 	nand_chip->chip_delay = 20;		/* 20us command delay time */
@@ -514,7 +470,7 @@ static int __init atmel_nand_probe(struct platform_device *pdev)
 		goto err_scan_ident;
 	}
 
-	if (nand_chip->ecc.mode == NAND_ECC_HW_SYNDROME) {
+	if (nand_chip->ecc.mode == NAND_ECC_HW) {
 		/* ECC is calculated for the whole page (1 step) */
 		nand_chip->ecc.size = mtd->writesize;
 
@@ -522,8 +478,6 @@ static int __init atmel_nand_probe(struct platform_device *pdev)
 		switch (mtd->writesize) {
 		case 512:
 			nand_chip->ecc.layout = &atmel_oobinfo_small;
-			nand_chip->ecc.read_oob = atmel_nand_read_oob_512;
-			nand_chip->ecc.write_oob = atmel_nand_write_oob_512;
 			ecc_writel(host->ecc, MR, ATMEL_ECC_PAGESIZE_528);
 			break;
 		case 1024:
