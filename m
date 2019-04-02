Return-Path: <SRS0=uocl=SE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22377C43381
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2019 04:04:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5ABE20883
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2019 04:04:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jEgw0RDj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="OmuXsdrW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5ABE20883
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yb4O8sNMD66M19PYUyOeT1WZIPDpedVl8pnM5UOKsLs=; b=jEgw0RDj7eG39Mn/iyY9Uujsno
	CCoXG6KWBUwvqeoSFRrdaoR1u6gWRqhgBr04jISURI8gslZBZH9zprs5Wk+QKecnK7CYJYVcdpNuk
	cnHcaJNresF72ez4uWj3tzzsLXS8aq8vE0PnAbSia4ssPrH1gF3LCSmGHxyS38nAEE+oJDlgeghc4
	xN1r6+G0CiA+W6rX3u91oTXKynES8UVqC5FsO27OGi7Op7wZYuNEXmrRqpPrb5M4PNC2swwDshmVA
	oSpYn+nuTXYyTgDFt3syKXnVIIDFIx9Ey5FgtiB+zibQH5kqQb76iOf3KD8jPQ9t+ZoyBHhGfDcXD
	urB4Nfjw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBAet-0000dC-TA; Tue, 02 Apr 2019 04:04:23 +0000
Received: from conuserg-07.nifty.com ([210.131.2.74])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBAeG-0008Cy-1B
 for linux-mtd@lists.infradead.org; Tue, 02 Apr 2019 04:03:47 +0000
Received: from pug.e01.socionext.com (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-07.nifty.com with ESMTP id x3243HaY021871;
 Tue, 2 Apr 2019 13:03:22 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x3243HaY021871
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1554177803;
 bh=JeFdw5YW0UFiB2TB3IT3/BSl8E6CKnBlNnD2IQK+xDQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OmuXsdrWul42DG6KNvCBfHN7L+IlKfX989XeWtenKpU3kFhCGmLsrf4oU0a7HweOS
 Jdc7QWrToqYFCGOu0O2fuZ9oe881KAqc1FAr1Sr2REaEeQ9GI1mdGyuIaojKXgkfWO
 sxsv7z/utg2la99lZNVei1NwNWQDkZHbWN8Tr+iR8K0AwNWSosDxsAEjhAm+/ugZ1d
 HYxRrQzWD1b0UUShIcR8qUW0G0uCuTM8os+RxSG1sj5BeDnVy8NMj/fbMeb82hDlLx
 fEBL2uaWjm6Syd4E8X14TnPmgjPCssQIV+qEeGXMQbw8tTKZveTt1a5ZHMPiT3vR9q
 pV08hkZsHPagw==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v5 5/9] mtd: rawnand: denali: use bool type instead of int
 where appropriate
Date: Tue,  2 Apr 2019 13:03:05 +0900
Message-Id: <1554177789-15414-6-git-send-email-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554177789-15414-1-git-send-email-yamada.masahiro@socionext.com>
References: <1554177789-15414-1-git-send-email-yamada.masahiro@socionext.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_210344_367056_850BD9D5 
X-CRM114-Status: GOOD (  14.79  )
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

Use 'bool' type for the following boolean parameters.

 - write (write or read?)
 - dma_avail (DMA engine available or not?)

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2:
  - Use bool for dma_avail as well

 drivers/mtd/nand/raw/denali.c | 23 ++++++++++++-----------
 drivers/mtd/nand/raw/denali.h |  4 ++--
 2 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
index b9bc406..a501d9e 100644
--- a/drivers/mtd/nand/raw/denali.c
+++ b/drivers/mtd/nand/raw/denali.c
@@ -533,7 +533,7 @@ static int denali_sw_ecc_fixup(struct nand_chip *chip,
 }
 
 static void denali_setup_dma64(struct denali_nand_info *denali,
-			       dma_addr_t dma_addr, int page, int write)
+			       dma_addr_t dma_addr, int page, bool write)
 {
 	uint32_t mode;
 	const int page_count = 1;
@@ -547,7 +547,8 @@ static void denali_setup_dma64(struct denali_nand_info *denali,
 	 *    burst len = 64 bytes, the number of pages
 	 */
 	denali->host_write(denali, mode,
-			   0x01002000 | (64 << 16) | (write << 8) | page_count);
+			   0x01002000 | (64 << 16) |
+			   (write ? BIT(8) : 0) | page_count);
 
 	/* 2. set memory low address */
 	denali->host_write(denali, mode, lower_32_bits(dma_addr));
@@ -557,7 +558,7 @@ static void denali_setup_dma64(struct denali_nand_info *denali,
 }
 
 static void denali_setup_dma32(struct denali_nand_info *denali,
-			       dma_addr_t dma_addr, int page, int write)
+			       dma_addr_t dma_addr, int page, bool write)
 {
 	uint32_t mode;
 	const int page_count = 1;
@@ -568,7 +569,7 @@ static void denali_setup_dma32(struct denali_nand_info *denali,
 
 	/* 1. setup transfer type and # of pages */
 	denali->host_write(denali, mode | page,
-			   0x2000 | (write << 8) | page_count);
+			   0x2000 | (write ? BIT(8) : 0) | page_count);
 
 	/* 2. set memory high address bits 23:8 */
 	denali->host_write(denali, mode | ((dma_addr >> 16) << 8), 0x2200);
@@ -628,7 +629,7 @@ static int denali_pio_write(struct denali_nand_info *denali, const u32 *buf,
 }
 
 static int denali_pio_xfer(struct denali_nand_info *denali, void *buf,
-			   size_t size, int page, int write)
+			   size_t size, int page, bool write)
 {
 	if (write)
 		return denali_pio_write(denali, buf, size, page);
@@ -637,7 +638,7 @@ static int denali_pio_xfer(struct denali_nand_info *denali, void *buf,
 }
 
 static int denali_dma_xfer(struct denali_nand_info *denali, void *buf,
-			   size_t size, int page, int write)
+			   size_t size, int page, bool write)
 {
 	dma_addr_t dma_addr;
 	uint32_t irq_mask, irq_status, ecc_err_mask;
@@ -694,7 +695,7 @@ static int denali_dma_xfer(struct denali_nand_info *denali, void *buf,
 }
 
 static int denali_page_xfer(struct nand_chip *chip, void *buf, size_t size,
-			    int page, int write)
+			    int page, bool write)
 {
 	struct denali_nand_info *denali = to_denali(chip);
 
@@ -715,7 +716,7 @@ static int denali_read_page(struct nand_chip *chip, uint8_t *buf,
 	int stat = 0;
 	int ret;
 
-	ret = denali_page_xfer(chip, buf, mtd->writesize, page, 0);
+	ret = denali_page_xfer(chip, buf, mtd->writesize, page, false);
 	if (ret && ret != -EBADMSG)
 		return ret;
 
@@ -744,7 +745,7 @@ static int denali_write_page(struct nand_chip *chip, const uint8_t *buf,
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
 
-	return denali_page_xfer(chip, (void *)buf, mtd->writesize, page, 1);
+	return denali_page_xfer(chip, (void *)buf, mtd->writesize, page, true);
 }
 
 static int denali_setup_data_interface(struct nand_chip *chip, int chipnr,
@@ -1001,7 +1002,7 @@ static int denali_attach_chip(struct nand_chip *chip)
 	int ret;
 
 	if (ioread32(denali->reg + FEATURES) & FEATURES__DMA)
-		denali->dma_avail = 1;
+		denali->dma_avail = true;
 
 	if (denali->dma_avail) {
 		int dma_bit = denali->caps & DENALI_CAP_DMA_64BIT ? 64 : 32;
@@ -1010,7 +1011,7 @@ static int denali_attach_chip(struct nand_chip *chip)
 		if (ret) {
 			dev_info(denali->dev,
 				 "Failed to set DMA mask. Disabling DMA.\n");
-			denali->dma_avail = 0;
+			denali->dma_avail = false;
 		}
 	}
 
diff --git a/drivers/mtd/nand/raw/denali.h b/drivers/mtd/nand/raw/denali.h
index 4447184..d2603c6 100644
--- a/drivers/mtd/nand/raw/denali.h
+++ b/drivers/mtd/nand/raw/denali.h
@@ -303,7 +303,7 @@ struct denali_nand_info {
 	u32 irq_mask;			/* interrupts we are waiting for */
 	u32 irq_status;			/* interrupts that have happened */
 	int irq;
-	int dma_avail;			/* can support DMA? */
+	bool dma_avail;			/* can support DMA? */
 	int devs_per_cs;		/* devices connected in parallel */
 	int oob_skip_bytes;		/* number of bytes reserved for BBM */
 	int max_banks;
@@ -313,7 +313,7 @@ struct denali_nand_info {
 	u32 (*host_read)(struct denali_nand_info *denali, u32 addr);
 	void (*host_write)(struct denali_nand_info *denali, u32 addr, u32 data);
 	void (*setup_dma)(struct denali_nand_info *denali, dma_addr_t dma_addr,
-			  int page, int write);
+			  int page, bool write);
 };
 
 #define DENALI_CAP_HW_ECC_FIXUP			BIT(0)
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
