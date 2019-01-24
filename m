Return-Path: <SRS0=xpfJ=QA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26976C282C3
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 04:20:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E574B21872
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 04:20:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XSgNFaAJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="FWNq4zxH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E574B21872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=5/Z/n/7qsYdIQXnH63DTXXOWciLEn39fZg1bz3QFtJA=; b=XSgNFaAJ5DYFG6CZXUCJTbKHZv
	uaDkcXCWL90062nag4NkL1s4MeYp1mTgKVki7YeDm2w9BH7c6ZdFygeLPuxATwlpG4/4RnoOoOTwQ
	NFy9H7mNtYrKMwkk/g4yhT3q6V9HKbESs1jDOLUiPaack30ES34PycXJaF6J+lK69LiiSpOV7ORMD
	5LvENJkH1X+VUrnrQ13Ox5ejvS5rv8MokJReAi5Q0PJUiNF+sOkHpWONY15Y9y1mD+UmreXOp7x/a
	cy66/e8epBZpNvJ/6TSztWzkcemR4GFYgnCAjTNE18vuqChR45Sd9JsGrr4uecXnP1Ej1I4ClCzQv
	6O7PcpJA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmWUs-00015x-QP; Thu, 24 Jan 2019 04:20:10 +0000
Received: from conuserg-12.nifty.com ([210.131.2.79])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmWUj-0000Jk-8k
 for linux-mtd@lists.infradead.org; Thu, 24 Jan 2019 04:20:03 +0000
Received: from pug.e01.socionext.com (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-12.nifty.com with ESMTP id x0O4JI06030691;
 Thu, 24 Jan 2019 13:19:20 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com x0O4JI06030691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1548303561;
 bh=VHFb44+xsO5NAj11hpjxC6a3TDCSsDpuFIplJ8wqUP8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FWNq4zxHgQ6ZiYuqwmOzc7dKYJWcNBwBgcI3bABzN7iD+b+0WK6ru/YjOgw31kMDM
 LWlZoL5D/CDctAQEYPgCNZLxpWDK3yE3dM+vaes2iQABu2+TCT6ryrD56gWymertGz
 YOWnOALTBzuRDwzSTGTbzSJMHlRHRXzmiB5LmGTxmJcfWuq5S4+Afh+wEPkDWaZiF5
 w70yrNP8vfbmMWzvI52O+9FaUG7yPbbcuwSP6kdYseV4Uo0G+6Yf5UbObJbfD+1q+9
 XipsTAwiXtlXa3TryEMzIGd5tL5y7OL2DNhYsO7JuyWZDmPFnNJcNZ5+BOGNZU1hXE
 wtgEcMS/LV/Vw==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 2/2] mtd: rawnand: denali: remove unused function argument
 'raw'
Date: Thu, 24 Jan 2019 13:19:07 +0900
Message-Id: <1548303547-21156-3-git-send-email-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1548303547-21156-1-git-send-email-yamada.masahiro@socionext.com>
References: <1548303547-21156-1-git-send-email-yamada.masahiro@socionext.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190123_202001_702503_0A978E34 
X-CRM114-Status: GOOD (  10.37  )
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

This argument is not used at all.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/raw/denali.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
index 6775644..24aeafc 100644
--- a/drivers/mtd/nand/raw/denali.c
+++ b/drivers/mtd/nand/raw/denali.c
@@ -473,7 +473,7 @@ static void denali_setup_dma32(struct denali_nand_info *denali,
 }
 
 static int denali_pio_read(struct denali_nand_info *denali, void *buf,
-			   size_t size, int page, int raw)
+			   size_t size, int page)
 {
 	u32 addr = DENALI_MAP01 | DENALI_BANK(denali) | page;
 	uint32_t *buf32 = (uint32_t *)buf;
@@ -501,7 +501,7 @@ static int denali_pio_read(struct denali_nand_info *denali, void *buf,
 }
 
 static int denali_pio_write(struct denali_nand_info *denali,
-			    const void *buf, size_t size, int page, int raw)
+			    const void *buf, size_t size, int page)
 {
 	u32 addr = DENALI_MAP01 | DENALI_BANK(denali) | page;
 	const uint32_t *buf32 = (uint32_t *)buf;
@@ -522,16 +522,16 @@ static int denali_pio_write(struct denali_nand_info *denali,
 }
 
 static int denali_pio_xfer(struct denali_nand_info *denali, void *buf,
-			   size_t size, int page, int raw, int write)
+			   size_t size, int page, int write)
 {
 	if (write)
-		return denali_pio_write(denali, buf, size, page, raw);
+		return denali_pio_write(denali, buf, size, page);
 	else
-		return denali_pio_read(denali, buf, size, page, raw);
+		return denali_pio_read(denali, buf, size, page);
 }
 
 static int denali_dma_xfer(struct denali_nand_info *denali, void *buf,
-			   size_t size, int page, int raw, int write)
+			   size_t size, int page, int write)
 {
 	dma_addr_t dma_addr;
 	uint32_t irq_mask, irq_status, ecc_err_mask;
@@ -541,7 +541,7 @@ static int denali_dma_xfer(struct denali_nand_info *denali, void *buf,
 	dma_addr = dma_map_single(denali->dev, buf, size, dir);
 	if (dma_mapping_error(denali->dev, dma_addr)) {
 		dev_dbg(denali->dev, "Failed to DMA-map buffer. Trying PIO.\n");
-		return denali_pio_xfer(denali, buf, size, page, raw, write);
+		return denali_pio_xfer(denali, buf, size, page, write);
 	}
 
 	if (write) {
@@ -595,9 +595,9 @@ static int denali_data_xfer(struct denali_nand_info *denali, void *buf,
 		  denali->reg + TRANSFER_SPARE_REG);
 
 	if (denali->dma_avail)
-		return denali_dma_xfer(denali, buf, size, page, raw, write);
+		return denali_dma_xfer(denali, buf, size, page, write);
 	else
-		return denali_pio_xfer(denali, buf, size, page, raw, write);
+		return denali_pio_xfer(denali, buf, size, page, write);
 }
 
 static void denali_oob_xfer(struct mtd_info *mtd, struct nand_chip *chip,
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
