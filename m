Return-Path: <SRS0=zMDb=SA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4996C4360F
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Mar 2019 07:29:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F18B2082F
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Mar 2019 07:29:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e4V436U/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="wj4c4C9J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F18B2082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=uxNU+bq9Lr4A5D3I15u3aGEKaoi26JN4a64KxDW/uQc=; b=e4V436U/c9gVVcUSxC3gOHIr6i
	TEISB07WUOpXjZCL0275ykW4bEcT2QeVeGepElWXUGjgfH2qz7eL0x10Qlqz55iv5slukizvjhjiJ
	FXbt4IQJNGBQYseBTGqLvK/GBvrS67OyekfUkYT+ikRkwZ7Epo9fZohiPo7aEn6j2WCpCSsbUzjAK
	V1DbcmMpBVf5WR0k+dpG3K+3XIdzmzg7fLjRKN5YyWQyqF6kC5TljnIztQw8H9aCp09tVFz0M04Lq
	umTEp8PcoeArRmSdSKeCotteNhJi7ejshS5gHIjPt7wLJNbgP0cZjFhaoco1IQQ6a3WGhGjUYA5HF
	BakNwX8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9lxa-0005or-OV; Fri, 29 Mar 2019 07:29:54 +0000
Received: from conuserg-10.nifty.com ([210.131.2.77])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9lwY-0004Pz-3U
 for linux-mtd@lists.infradead.org; Fri, 29 Mar 2019 07:28:54 +0000
Received: from grover.tkatk1.zaq.ne.jp (zaqdadce369.zaq.ne.jp
 [218.220.227.105]) (authenticated)
 by conuserg-10.nifty.com with ESMTP id x2T7SQaG002537;
 Fri, 29 Mar 2019 16:28:36 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com x2T7SQaG002537
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1553844517;
 bh=LxmFXmOZ+IYS1jfeDT1SQreLqh9TurbdVbRxs0TdcuM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=wj4c4C9JloAn44CeX9SClupIP/aIkcQW8vk9GZDv0H3kaS4onR0VvFDAKHZu9Sk+N
 xkap+TZr0n8CLR80zNJiAq3R4uSJAnPPiH090ozN8GxgOoIUHXH2JfMSGXWtvX+q6P
 DqGWngsn8/T82svufPel2G11nJKkw/RegTa9fkH+9SbMbLmzqD1SjX8DrN4ebf6RF9
 XYVJHuY5OcXMgz0hDh2XaG87VSuzuqtisP5+YfQBASmFn8GXplkWQIbnuYh28H8E/B
 W3O69xvhLBuf+V27FMY6WzTXHbF4tr0z/2bnaiFpGz6AWDhl+ZpjbnzS3WEgbsHQNN
 i2b0NnbrN21Lg==
X-Nifty-SrcIP: [218.220.227.105]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v4 9/9] mtd: rawnand: denali: clean up coding style
Date: Fri, 29 Mar 2019 16:28:21 +0900
Message-Id: <1553844501-7119-10-git-send-email-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1553844501-7119-1-git-send-email-yamada.masahiro@socionext.com>
References: <1553844501-7119-1-git-send-email-yamada.masahiro@socionext.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_002850_460934_B547CDD8 
X-CRM114-Status: GOOD (  13.31  )
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
Cc: Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
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

I slightly changed denali_check_erased_page() to shorten it.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v4: None
Changes in v3: None
Changes in v2: None

 drivers/mtd/nand/raw/denali.c | 54 +++++++++++++++++++++----------------------
 1 file changed, 26 insertions(+), 28 deletions(-)

diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
index 6d0ee5e..9abc0ea 100644
--- a/drivers/mtd/nand/raw/denali.c
+++ b/drivers/mtd/nand/raw/denali.c
@@ -106,7 +106,7 @@ static void denali_disable_irq(struct denali_controller *denali)
 }
 
 static void denali_clear_irq(struct denali_controller *denali,
-			     int bank, uint32_t irq_status)
+			     int bank, u32 irq_status)
 {
 	/* write one to clear bits */
 	iowrite32(irq_status, denali->reg + INTR_STATUS(bank));
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
 
@@ -411,20 +411,17 @@ static int denali_check_erased_page(struct nand_chip *chip,
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
@@ -432,8 +429,8 @@ static int denali_check_erased_page(struct nand_chip *chip,
 			max_bitflips = max_t(unsigned int, max_bitflips, stat);
 		}
 
-		buf += ecc_size;
-		ecc_code += ecc_bytes;
+		buf += ecc->size;
+		ecc_code += ecc->bytes;
 	}
 
 	return max_bitflips;
@@ -445,7 +442,7 @@ static int denali_hw_ecc_fixup(struct nand_chip *chip,
 {
 	struct mtd_ecc_stats *ecc_stats = &nand_to_mtd(chip)->ecc_stats;
 	int bank = denali->active_bank;
-	uint32_t ecc_cor;
+	u32 ecc_cor;
 	unsigned int max_bitflips;
 
 	ecc_cor = ioread32(denali->reg + ECC_COR_INFO(bank));
@@ -476,17 +473,17 @@ static int denali_hw_ecc_fixup(struct nand_chip *chip,
 
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
 
@@ -551,7 +548,7 @@ static int denali_sw_ecc_fixup(struct nand_chip *chip,
 static void denali_setup_dma64(struct denali_controller *denali,
 			       dma_addr_t dma_addr, int page, bool write)
 {
-	uint32_t mode;
+	u32 mode;
 	const int page_count = 1;
 
 	mode = DENALI_MAP10 | DENALI_BANK(denali) | page;
@@ -576,7 +573,7 @@ static void denali_setup_dma64(struct denali_controller *denali,
 static void denali_setup_dma32(struct denali_controller *denali,
 			       dma_addr_t dma_addr, int page, bool write)
 {
-	uint32_t mode;
+	u32 mode;
 	const int page_count = 1;
 
 	mode = DENALI_MAP10 | DENALI_BANK(denali);
@@ -601,7 +598,7 @@ static int denali_pio_read(struct denali_controller *denali, u32 *buf,
 			   size_t size, int page)
 {
 	u32 addr = DENALI_MAP01 | DENALI_BANK(denali) | page;
-	uint32_t irq_status, ecc_err_mask;
+	u32 irq_status, ecc_err_mask;
 	int i;
 
 	if (denali->caps & DENALI_CAP_HW_ECC_FIXUP)
@@ -628,7 +625,7 @@ static int denali_pio_write(struct denali_controller *denali, const u32 *buf,
 			    size_t size, int page)
 {
 	u32 addr = DENALI_MAP01 | DENALI_BANK(denali) | page;
-	uint32_t irq_status;
+	u32 irq_status;
 	int i;
 
 	denali_reset_irq(denali);
@@ -637,7 +634,8 @@ static int denali_pio_write(struct denali_controller *denali, const u32 *buf,
 		denali->host_write(denali, addr, buf[i]);
 
 	irq_status = denali_wait_for_irq(denali,
-				INTR__PROGRAM_COMP | INTR__PROGRAM_FAIL);
+					 INTR__PROGRAM_COMP |
+					 INTR__PROGRAM_FAIL);
 	if (!(irq_status & INTR__PROGRAM_COMP))
 		return -EIO;
 
@@ -657,7 +655,7 @@ static int denali_dma_xfer(struct denali_controller *denali, void *buf,
 			   size_t size, int page, bool write)
 {
 	dma_addr_t dma_addr;
-	uint32_t irq_mask, irq_status, ecc_err_mask;
+	u32 irq_mask, irq_status, ecc_err_mask;
 	enum dma_data_direction dir = write ? DMA_TO_DEVICE : DMA_FROM_DEVICE;
 	int ret = 0;
 
@@ -723,7 +721,7 @@ static int denali_page_xfer(struct nand_chip *chip, void *buf, size_t size,
 		return denali_pio_xfer(denali, buf, size, page, write);
 }
 
-static int denali_read_page(struct nand_chip *chip, uint8_t *buf,
+static int denali_read_page(struct nand_chip *chip, u8 *buf,
 			    int oob_required, int page)
 {
 	struct denali_controller *denali = to_denali_controller(chip);
@@ -756,7 +754,7 @@ static int denali_read_page(struct nand_chip *chip, uint8_t *buf,
 	return stat;
 }
 
-static int denali_write_page(struct nand_chip *chip, const uint8_t *buf,
+static int denali_write_page(struct nand_chip *chip, const u8 *buf,
 			     int oob_required, int page)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
@@ -774,7 +772,7 @@ static int denali_setup_data_interface(struct nand_chip *chip, int chipnr,
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
