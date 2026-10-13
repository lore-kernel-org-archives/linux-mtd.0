Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA608CC6B03
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 09:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KCE80GvCjQclN7U1lVJAv8xsXKBiXIj+syUGDxZ4/ew=; b=zR2rklXXyoagkC
	U+xPRJKUZXUTOksSfn7wo35Hp8rOr8rj0mJHhaLEB7TeTRra1GwZRONi6Iy29tFNCRauxbTySe/cH
	y69T07IQPhu5vjDbpejQeBWQ6MVCCuKtAOJK7IZaRkNUOD9KuPnjHYESA8xqsEKLottWp5beJlEqp
	5LQp/JYy/wpzJfwlmopQrlxCcBWjjU+RwoU6R62adBlYYrloOZe/+fb7ZDFnSQmfaw5MxUngRVS9X
	3iq96661NKOCzr3dfgwvMMEnERnrP8zGpSyv1pL3nsfhGUElGSZ3/GLMtLizo7UkZFfY+W7wBuKMC
	JCM4Pt26hWxdSTUfshXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZ36-0000000CSBQ-1qb5;
	Tue, 13 Oct 2026 09:43:56 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZ32-0000000CSAk-0V3i
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 09:43:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1791884632; x=1823420632;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aeBt89eyCnZiDw01mhYSfPD5Jm1xqwUzTa20QYRZwz8=;
  b=DHMkxHmRBbXvvb8Tb4eK7GcYOyi6BhHPBDUN/mT3Y3U9OjynW/Mmtbfm
   UlC6sCVc3YI2BQup+tvUfh+RcIcgA2IW1fIWMRAD3DOfGtWRriXrtnFrZ
   Vj4iDiDrybntGq4aKaem83NB27gA4fzSVMiytZs3b4P8srzgR97BMkhxY
   NdsmnWmB/lPlvkY0Kp49RKxqHproL7HyLxy6WHxzkikN9H1FQOEvUySWX
   T6Dy01QYTVbdBV8DVepkgkhTqwnav10AzI8edsVZvchUo4n8dhbWRNXN5
   w7hHSoT0zWcF38LXTGeBrxCDTcsFXCCuoCzSRpN8lYYR/0JxH08bbYkwS
   w==;
X-CSE-ConnectionGUID: /SwY72YgQ9iSb42s3ajJtg==
X-CSE-MsgGUID: k72G8NVCREe0f1gvGgWCgw==
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="65227556"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Oct 2026 02:43:50 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 13 Oct 2026 02:43:49 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 13 Oct 2026 02:43:47 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<tglx@kernel.org>, <kees@kernel.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Mihai
 Sain" <mihai.sain@microchip.com>
Subject: [PATCH] mtd: nand: bbt: Use pr_fmt() for consistent log prefixes
Date: Tue, 13 Oct 2026 12:43:39 +0300
Message-ID: <20261013094339.7285-1-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_024352_970887_88BDBF2C 
X-CRM114-Status: GOOD (  14.60  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Define pr_fmt() in nand_bbt.c to automatically prepend the nand_bbt:
prefix to log messages. Remove redundant subsystem prefixes from
individual logging statements to avoid duplication and ensure consistent
log formatting across the NAND bad block table implementation.
No functional changes intended.

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 drivers/mtd/nand/raw/nand_bbt.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_bbt.c b/drivers/mtd/nand/raw/nand_bbt.c
index b0e7592a2ab7..93f162805f31 100644
--- a/drivers/mtd/nand/raw/nand_bbt.c
+++ b/drivers/mtd/nand/raw/nand_bbt.c
@@ -52,6 +52,7 @@
  * - bbts start at a page boundary, if autolocated on a block boundary
  * - the space necessary for a bbt in FLASH does not exceed a block boundary
  */
+#define pr_fmt(fmt) "nand_bbt: " fmt
 
 #include <linux/slab.h>
 #include <linux/types.h>
@@ -193,15 +194,15 @@ static int read_bbt(struct nand_chip *this, uint8_t *buf, int page, int num,
 		res = mtd_read(mtd, from, len, &retlen, buf);
 		if (res < 0) {
 			if (mtd_is_eccerr(res)) {
-				pr_info("nand_bbt: ECC error in BBT at 0x%012llx\n",
+				pr_info("ECC error in BBT at 0x%012llx\n",
 					from & ~mtd->writesize);
 				return res;
 			} else if (mtd_is_bitflip(res)) {
-				pr_info("nand_bbt: corrected error in BBT at 0x%012llx\n",
+				pr_info("corrected error in BBT at 0x%012llx\n",
 					from & ~mtd->writesize);
 				ret = res;
 			} else {
-				pr_info("nand_bbt: error reading BBT\n");
+				pr_info("error reading BBT\n");
 				return res;
 			}
 		}
@@ -214,7 +215,7 @@ static int read_bbt(struct nand_chip *this, uint8_t *buf, int page, int num,
 				if (tmp == msk)
 					continue;
 				if (reserved_block_code && (tmp == reserved_block_code)) {
-					pr_info("nand_read_bbt: reserved block at 0x%012llx\n",
+					pr_info("reserved block at 0x%012llx\n",
 						 (loff_t)(offs + act) <<
 						 this->bbt_erase_shift);
 					bbt_mark_entry(this, offs + act,
@@ -226,7 +227,7 @@ static int read_bbt(struct nand_chip *this, uint8_t *buf, int page, int num,
 				 * Leave it for now, if it's matured we can
 				 * move this message to pr_debug.
 				 */
-				pr_info("nand_read_bbt: bad block at 0x%012llx\n",
+				pr_info("bad block at 0x%012llx\n",
 					 (loff_t)(offs + act) <<
 					 this->bbt_erase_shift);
 				/* Factory marked bad or worn out? */
@@ -503,7 +504,7 @@ static int create_bbt(struct nand_chip *this, uint8_t *buf,
 		from = 0;
 	} else {
 		if (chip >= nanddev_ntargets(&this->base)) {
-			pr_warn("create_bbt(): chipnr (%d) > available chips (%d)\n",
+			pr_warn("chipnr (%d) > available chips (%d)\n",
 			        chip + 1, nanddev_ntargets(&this->base));
 			return -EINVAL;
 		}
@@ -725,7 +726,7 @@ static void mark_bbt_block_bad(struct nand_chip *this,
 	to = (loff_t)block << this->bbt_erase_shift;
 	res = nand_markbad_bbm(this, to);
 	if (res)
-		pr_warn("nand_bbt: error %d while marking block %d bad\n",
+		pr_warn("error %d while marking block %d bad\n",
 			res, block);
 
 	td->pages[chip] = -1;
@@ -825,10 +826,10 @@ static int write_bbt(struct nand_chip *this, uint8_t *buf,
 			res = mtd_read(mtd, to, len, &retlen, buf);
 			if (res < 0) {
 				if (retlen != len) {
-					pr_info("nand_bbt: error reading block for writing the bad block table\n");
+					pr_info("error reading block for writing the bad block table\n");
 					return res;
 				}
-				pr_warn("nand_bbt: ECC error while reading block for writing bad block table\n");
+				pr_warn("ECC error while reading block for writing bad block table\n");
 			}
 			/* Read oob data */
 			ops.ooblen = (len >> this->page_shift) * mtd->oobsize;
@@ -890,7 +891,7 @@ static int write_bbt(struct nand_chip *this, uint8_t *buf,
 		einfo.len = 1 << this->bbt_erase_shift;
 		res = nand_erase_nand(this, &einfo, 1);
 		if (res < 0) {
-			pr_warn("nand_bbt: error while erasing BBT block %d\n",
+			pr_warn("error while erasing BBT block %d\n",
 				res);
 			mark_bbt_block_bad(this, td, chip, block);
 			continue;
@@ -900,7 +901,7 @@ static int write_bbt(struct nand_chip *this, uint8_t *buf,
 				     td->options & NAND_BBT_NO_OOB ?
 				     NULL : &buf[len]);
 		if (res < 0) {
-			pr_warn("nand_bbt: error while writing BBT block %d\n",
+			pr_warn("error while writing BBT block %d\n",
 				res);
 			mark_bbt_block_bad(this, td, chip, block);
 			continue;
@@ -915,7 +916,7 @@ static int write_bbt(struct nand_chip *this, uint8_t *buf,
 	return 0;
 
  outerr:
-	pr_warn("nand_bbt: error while writing bad block table %d\n", res);
+	pr_warn("error while writing bad block table %d\n", res);
 	return res;
 }
 
@@ -1263,7 +1264,7 @@ static int nand_scan_bbt(struct nand_chip *this, struct nand_bbt_descr *bd)
 	 */
 	if (!td) {
 		if ((res = nand_memory_bbt(this, bd))) {
-			pr_err("nand_bbt: can't scan flash and build the RAM-based BBT\n");
+			pr_err("can't scan flash and build the RAM-based BBT\n");
 			goto err_free_bbt;
 		}
 		return 0;
@@ -1451,7 +1452,7 @@ int nand_isbad_bbt(struct nand_chip *this, loff_t offs, int allowbbt)
 	block = (int)(offs >> this->bbt_erase_shift);
 	res = bbt_get_entry(this, block);
 
-	pr_debug("nand_isbad_bbt(): bbt info for offs 0x%08x: (block %d) 0x%02x\n",
+	pr_debug("bbt info for offs 0x%08x: (block %d) 0x%02x\n",
 		 (unsigned int)offs, block, res);
 
 	if (mtd_check_expert_analysis_mode())
-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
