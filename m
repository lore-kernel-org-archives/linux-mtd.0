Return-Path: <SRS0=+O2D=RP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5BC1C43381
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Mar 2019 08:45:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B063B214AE
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Mar 2019 08:45:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GcAbJQxd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="FMybTB7o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B063B214AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=HKFbS+WwpLKi43EPGoBMDbXS4P5175CsANNlyjE6Z04=; b=GcAbJQxddlPBNUPRwTW0WHGcLn
	jJZ59HsXjbmvdZih3aj0PXS6VzQ8l4c3nYvd911fEE2ri5cE7KeUVBj2IZ82YacT1iNV4I3HGDW3i
	l0l4nJ+6YdYjGx89txMbHJ02HI4AfHwoJR2bM3zfjtlw3yyv/CA7allNzQeB47O5FF4mGBqvom/uF
	CnQM87tZGv3nBJqe/WY6cyjq11u4zDJjUGo5i41oD/l00S1PFEbY87TVRKa5qwPwEBKN7TwFdAE6z
	Hsoz4dw1hmLghS+dx9yKNY9wGLowtOP4NVIazAI/pIA1VyjPN3FDoLkT+SFj9R710soxDbYhlfuPN
	cwcEA/VA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3d2p-0000J1-OC; Tue, 12 Mar 2019 08:45:55 +0000
Received: from conuserg-09.nifty.com ([210.131.2.76])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3d2e-000077-Ic
 for linux-mtd@lists.infradead.org; Tue, 12 Mar 2019 08:45:47 +0000
Received: from pug.e01.socionext.com (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-09.nifty.com with ESMTP id x2C8j6Zj004092;
 Tue, 12 Mar 2019 17:45:23 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com x2C8j6Zj004092
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1552380323;
 bh=ShHSByMNYa082jMRN+t65B3dsZw6dbeo+qSq8gXccxA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FMybTB7oL9KUvb7i8asFa39iJrF3MtdsxA2lvIaBic9bxfm/uf6CN7EDG92N2aOei
 y3GP5XeGQnRIA6Beloa9TOBq2V6mzIqsSvC9xJIwdDCewxuEstfQkQ9N7VLrEqshRK
 4XQupwVl9N2wb2P351ugQUQsB8xt1iwGHyldYEebDyEfh6Zf/AN1LpEKXdV3SFAv6w
 /gb2BC3aq6TR5miadPLfaIlNEgZ+8Lpehp0hD8enMETKyGSdQnlROe9JyxMbrpdaRb
 pkz7ECWF8SEd39gwQ9DrA37MMilYPWxWC1DUJL0UzJ3+rRxJXOs1UAQ8tFiuapbqCQ
 +ZrH2qmXNpcpw==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 9/9] mtd: rawnand: denali: clean up coding style
Date: Tue, 12 Mar 2019 17:44:50 +0900
Message-Id: <1552380290-19951-10-git-send-email-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1552380290-19951-1-git-send-email-yamada.masahiro@socionext.com>
References: <1552380290-19951-1-git-send-email-yamada.masahiro@socionext.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190312_014544_932187_B2625440 
X-CRM114-Status: GOOD (  12.81  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Eliminate the following reports from 'scripts/checkpatch.pl --strict'.

  CHECK: Prefer kernel type 'u8' over 'uint8_t'
  CHECK: Prefer kernel type 'u32' over 'uint32_t'
  CHECK: Alignment should match open parenthesis

I slightly changed denali_check_erased_page() to make it shorter.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v3: None
Changes in v2: None

 drivers/mtd/nand/raw/denali.c | 53 ++++++++++++++++++++-----------------------
 1 file changed, 25 insertions(+), 28 deletions(-)

diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
index b1a4d9c..9c30e744 100644
--- a/drivers/mtd/nand/raw/denali.c
+++ b/drivers/mtd/nand/raw/denali.c
@@ -124,7 +124,7 @@ static irqreturn_t denali_isr(int irq, void *dev_id)
 {
 	struct denali_controller *denali = dev_id;
 	irqreturn_t ret = IRQ_NONE;
-	uint32_t irq_status;
+	u32 irq_status;
 	int i;
 
 	spin_lock(&denali->irq_lock);
@@ -163,7 +163,7 @@ static void denali_reset_irq(struct denali_controller *denali)
 static u32 denali_wait_for_irq(struct denali_controller *denali, u32 irq_mask)
 {
 	unsigned long time_left, flags;
-	uint32_t irq_status;
+	u32 irq_status;
 
 	spin_lock_irqsave(&denali->irq_lock, flags);
 
@@ -235,20 +235,17 @@ static int denali_check_erased_page(struct nand_chip *chip,
 				    unsigned int max_bitflips)
 {
 	struct mtd_ecc_stats *ecc_stats = &nand_to_mtd(chip)->ecc_stats;
-	uint8_t *ecc_code = chip->oob_poi + denali->oob_skip_bytes;
-	int ecc_steps = chip->ecc.steps;
-	int ecc_size = chip->ecc.size;
-	int ecc_bytes = chip->ecc.bytes;
+	struct nand_ecc_ctrl *ecc = &chip->ecc;
+	u8 *ecc_code = chip->oob_poi + denali->oob_skip_bytes;
 	int i, stat;
 
-	for (i = 0; i < ecc_steps; i++) {
+	for (i = 0; i < ecc->steps; i++) {
 		if (!(uncor_ecc_flags & BIT(i)))
 			continue;
 
-		stat = nand_check_erased_ecc_chunk(buf, ecc_size,
-						  ecc_code, ecc_bytes,
-						  NULL, 0,
-						  chip->ecc.strength);
+		stat = nand_check_erased_ecc_chunk(buf, ecc->size, ecc_code,
+						   ecc->bytes, NULL, 0,
+						   ecc->strength);
 		if (stat < 0) {
 			ecc_stats->failed++;
 		} else {
@@ -256,8 +253,8 @@ static int denali_check_erased_page(struct nand_chip *chip,
 			max_bitflips = max_t(unsigned int, max_bitflips, stat);
 		}
 
-		buf += ecc_size;
-		ecc_code += ecc_bytes;
+		buf += ecc->size;
+		ecc_code += ecc->bytes;
 	}
 
 	return max_bitflips;
@@ -269,7 +266,7 @@ static int denali_hw_ecc_fixup(struct nand_chip *chip,
 {
 	struct mtd_ecc_stats *ecc_stats = &nand_to_mtd(chip)->ecc_stats;
 	int bank = denali->active_bank;
-	uint32_t ecc_cor;
+	u32 ecc_cor;
 	unsigned int max_bitflips;
 
 	ecc_cor = ioread32(denali->reg + ECC_COR_INFO(bank));
@@ -300,17 +297,17 @@ static int denali_hw_ecc_fixup(struct nand_chip *chip,
 
 static int denali_sw_ecc_fixup(struct nand_chip *chip,
 			       struct denali_controller *denali,
-			       unsigned long *uncor_ecc_flags, uint8_t *buf)
+			       unsigned long *uncor_ecc_flags, u8 *buf)
 {
 	struct mtd_ecc_stats *ecc_stats = &nand_to_mtd(chip)->ecc_stats;
 	unsigned int ecc_size = chip->ecc.size;
 	unsigned int bitflips = 0;
 	unsigned int max_bitflips = 0;
-	uint32_t err_addr, err_cor_info;
+	u32 err_addr, err_cor_info;
 	unsigned int err_byte, err_sector, err_device;
-	uint8_t err_cor_value;
+	u8 err_cor_value;
 	unsigned int prev_sector = 0;
-	uint32_t irq_status;
+	u32 irq_status;
 
 	denali_reset_irq(denali);
 
@@ -375,7 +372,7 @@ static int denali_sw_ecc_fixup(struct nand_chip *chip,
 static void denali_setup_dma64(struct denali_controller *denali,
 			       dma_addr_t dma_addr, int page, bool write)
 {
-	uint32_t mode;
+	u32 mode;
 	const int page_count = 1;
 
 	mode = DENALI_MAP10 | DENALI_BANK(denali) | page;
@@ -400,7 +397,7 @@ static void denali_setup_dma64(struct denali_controller *denali,
 static void denali_setup_dma32(struct denali_controller *denali,
 			       dma_addr_t dma_addr, int page, bool write)
 {
-	uint32_t mode;
+	u32 mode;
 	const int page_count = 1;
 
 	mode = DENALI_MAP10 | DENALI_BANK(denali);
@@ -425,7 +422,7 @@ static int denali_pio_read(struct denali_controller *denali, u32 *buf,
 			   size_t size, int page)
 {
 	u32 addr = DENALI_MAP01 | DENALI_BANK(denali) | page;
-	uint32_t irq_status, ecc_err_mask;
+	u32 irq_status, ecc_err_mask;
 	int i;
 
 	if (denali->caps & DENALI_CAP_HW_ECC_FIXUP)
@@ -452,7 +449,7 @@ static int denali_pio_write(struct denali_controller *denali, const u32 *buf,
 			    size_t size, int page)
 {
 	u32 addr = DENALI_MAP01 | DENALI_BANK(denali) | page;
-	uint32_t irq_status;
+	u32 irq_status;
 	int i;
 
 	denali_reset_irq(denali);
@@ -481,7 +478,7 @@ static int denali_dma_xfer(struct denali_controller *denali, void *buf,
 			   size_t size, int page, bool write)
 {
 	dma_addr_t dma_addr;
-	uint32_t irq_mask, irq_status, ecc_err_mask;
+	u32 irq_mask, irq_status, ecc_err_mask;
 	enum dma_data_direction dir = write ? DMA_TO_DEVICE : DMA_FROM_DEVICE;
 	int ret = 0;
 
@@ -674,7 +671,7 @@ static int denali_memcpy_in(void *buf, unsigned int offset, unsigned int len,
 	return 0;
 }
 
-static int denali_read_page_raw(struct nand_chip *chip, uint8_t *buf,
+static int denali_read_page_raw(struct nand_chip *chip, u8 *buf,
 				int oob_required, int page)
 {
 	struct denali_chip *dchip = to_denali_chip(chip);
@@ -711,7 +708,7 @@ static int denali_memcpy_out(void *buf, unsigned int offset, unsigned int len,
 	return 0;
 }
 
-static int denali_write_page_raw(struct nand_chip *chip, const uint8_t *buf,
+static int denali_write_page_raw(struct nand_chip *chip, const u8 *buf,
 				 int oob_required, int page)
 {
 	struct denali_chip *dchip = to_denali_chip(chip);
@@ -785,7 +782,7 @@ static int denali_write_oob(struct nand_chip *chip, int page)
 	return nand_prog_page_end_op(chip);
 }
 
-static int denali_read_page(struct nand_chip *chip, uint8_t *buf,
+static int denali_read_page(struct nand_chip *chip, u8 *buf,
 			    int oob_required, int page)
 {
 	struct denali_controller *denali = to_denali_controller(chip);
@@ -818,7 +815,7 @@ static int denali_read_page(struct nand_chip *chip, uint8_t *buf,
 	return stat;
 }
 
-static int denali_write_page(struct nand_chip *chip, const uint8_t *buf,
+static int denali_write_page(struct nand_chip *chip, const u8 *buf,
 			     int oob_required, int page)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
@@ -837,7 +834,7 @@ static int denali_setup_data_interface(struct nand_chip *chip, int chipnr,
 	int acc_clks, re_2_we, re_2_re, we_2_re, addr_2_data;
 	int rdwr_en_lo, rdwr_en_hi, rdwr_en_lo_hi, cs_setup;
 	int addr_2_data_mask;
-	uint32_t tmp;
+	u32 tmp;
 
 	timings = nand_get_sdr_timings(conf);
 	if (IS_ERR(timings))
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
