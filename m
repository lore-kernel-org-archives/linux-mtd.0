Return-Path: <SRS0=BWs3=QP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 772B9C282CB
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 08:10:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 346E421920
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 08:10:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AcEEKRfk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="rxsLx+JI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 346E421920
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=YZKcEYw5RGosJOHnb+wpYnozeVflKDck3xGc7s7bDlU=; b=AcEEKRfkAlSWKowOW+ko9RXcBT
	/Q6Sgu5QyeCijoiHoULnkhCqOslxea6p5zUcEszcTLtIpSkLF7RnCkb9mQt4FxFrEJQ2I3OJiYEoY
	dBP6DZAXmLI5P7rOai2xgHD7c56vOkhm8RtQwzzlauv4I5QI0/0IuwHkLrUkhqe50CUVnR/W3xcUW
	w/N0h3mtRBDTibP4xg16G9crnWsUB26GM2DpGlPtZ7vH6huCh3yVMjC/eMe0fwlzLOScbumyd04WU
	ORUz9Dl9rLMMN+EDRc8iOtcri64sUf1dR+yyKRizzcYxDUGOu8Lf8PYw9inMgsRoNvnIGCbExGrSK
	F/ypgg+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gs1F9-0000R6-FI; Fri, 08 Feb 2019 08:10:39 +0000
Received: from conuserg-07.nifty.com ([210.131.2.74])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gs1Dt-0006P2-Tv
 for linux-mtd@lists.infradead.org; Fri, 08 Feb 2019 08:09:26 +0000
Received: from pug.e01.socionext.com (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-07.nifty.com with ESMTP id x188902G007241;
 Fri, 8 Feb 2019 17:09:07 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x188902G007241
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1549613348;
 bh=ws0rfNY0AqZ3Gauy1XWKRiE8n2TnorcpmKdkHThTkHk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rxsLx+JIjfJicShCqTX0Jz73s0MTfV43OGVjEN4xxS3ctswj6f/NpiPw3bhGSGNsw
 OChqCR/uuJlonTMWoFBMoAKk9uFI9VKLvpVBry9k/jGBUyW3ToogsnoaTsG+8rgCEk
 YsOaI6P6t5QuceXjJc+2Dyl+QBTEy/nVbVDkQO3VSC26/X77KZD3TwwcBULD2u6vhd
 RbPQOX69zuiDbQqVM/I+I2/lo+Qmhpev/9XVCIruTOrbumYeKIqIk244Uv73NbIrsp
 FW3V6kb+Xn19LYaCbFj6jZkNYDnc6cKmiPhjDwnwcP4CF2CMQupAxo7efjRZsU8ywI
 nBp5rN7aGhYkA==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 07/11] mtd: rawnand: denali: use bool type instead of int
 where appropriate
Date: Fri,  8 Feb 2019 17:08:51 +0900
Message-Id: <1549613335-30319-8-git-send-email-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1549613335-30319-1-git-send-email-yamada.masahiro@socionext.com>
References: <1549613335-30319-1-git-send-email-yamada.masahiro@socionext.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190208_000922_428873_FF0FAFE2 
X-CRM114-Status: GOOD (  14.28  )
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

Use 'bool' type for some function arguments.

 - write (write or read?)
 - raw (the raw access mode or not?)

It is true that denali_nand_info::dma_avail is also boolean, but
I am keeping it as 'int' because 'scripts/checkpatch --strict' would
report the following:

CHECK: Avoid using bool structure members because of possible alignment issues
  - see: https://lkml.org/lkml/2017/11/21/384

I do not think it is a matter here, but I am sticking to the suggestion.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/raw/denali.c | 23 ++++++++++++-----------
 drivers/mtd/nand/raw/denali.h |  2 +-
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
index 514d189..748711e 100644
--- a/drivers/mtd/nand/raw/denali.c
+++ b/drivers/mtd/nand/raw/denali.c
@@ -357,7 +357,7 @@ static int denali_sw_ecc_fixup(struct nand_chip *chip,
 }
 
 static void denali_setup_dma64(struct denali_nand_info *denali,
-			       dma_addr_t dma_addr, int page, int write)
+			       dma_addr_t dma_addr, int page, bool write)
 {
 	uint32_t mode;
 	const int page_count = 1;
@@ -371,7 +371,8 @@ static void denali_setup_dma64(struct denali_nand_info *denali,
 	 *    burst len = 64 bytes, the number of pages
 	 */
 	denali->host_write(denali, mode,
-			   0x01002000 | (64 << 16) | (write << 8) | page_count);
+			   0x01002000 | (64 << 16) |
+			   (write ? BIT(8) : 0) | page_count);
 
 	/* 2. set memory low address */
 	denali->host_write(denali, mode, lower_32_bits(dma_addr));
@@ -381,7 +382,7 @@ static void denali_setup_dma64(struct denali_nand_info *denali,
 }
 
 static void denali_setup_dma32(struct denali_nand_info *denali,
-			       dma_addr_t dma_addr, int page, int write)
+			       dma_addr_t dma_addr, int page, bool write)
 {
 	uint32_t mode;
 	const int page_count = 1;
@@ -392,7 +393,7 @@ static void denali_setup_dma32(struct denali_nand_info *denali,
 
 	/* 1. setup transfer type and # of pages */
 	denali->host_write(denali, mode | page,
-			   0x2000 | (write << 8) | page_count);
+			   0x2000 | (write ? BIT(8) : 0) | page_count);
 
 	/* 2. set memory high address bits 23:8 */
 	denali->host_write(denali, mode | ((dma_addr >> 16) << 8), 0x2200);
@@ -453,7 +454,7 @@ static int denali_pio_write(struct denali_nand_info *denali, const u32 *buf,
 }
 
 static int denali_pio_xfer(struct denali_nand_info *denali, void *buf,
-			   size_t size, int page, int write)
+			   size_t size, int page, bool write)
 {
 	if (write)
 		return denali_pio_write(denali, buf, size, page);
@@ -462,7 +463,7 @@ static int denali_pio_xfer(struct denali_nand_info *denali, void *buf,
 }
 
 static int denali_dma_xfer(struct denali_nand_info *denali, void *buf,
-			   size_t size, int page, int write)
+			   size_t size, int page, bool write)
 {
 	dma_addr_t dma_addr;
 	u32 irq_mask, irq_stat, ecc_err_mask;
@@ -519,7 +520,7 @@ static int denali_dma_xfer(struct denali_nand_info *denali, void *buf,
 }
 
 static int denali_data_xfer(struct nand_chip *chip, void *buf, size_t size,
-			    int page, int raw, int write)
+			    int page, bool raw, bool write)
 {
 	struct denali_nand_info *denali = to_denali(chip);
 
@@ -644,7 +645,7 @@ static int denali_read_page_raw(struct nand_chip *chip, uint8_t *buf,
 	if (!buf)
 		return -EINVAL;
 
-	ret = denali_data_xfer(chip, tmp_buf, size, page, 1, 0);
+	ret = denali_data_xfer(chip, tmp_buf, size, page, true, false);
 	if (ret)
 		return ret;
 
@@ -700,7 +701,7 @@ static int denali_write_page_raw(struct nand_chip *chip, const uint8_t *buf,
 			return ret;
 	}
 
-	return denali_data_xfer(chip, tmp_buf, size, page, 1, 1);
+	return denali_data_xfer(chip, tmp_buf, size, page, true, true);
 }
 
 static int denali_change_read_column_op(void *buf, unsigned int offset,
@@ -752,7 +753,7 @@ static int denali_read_page(struct nand_chip *chip, uint8_t *buf,
 	int stat = 0;
 	int ret;
 
-	ret = denali_data_xfer(chip, buf, mtd->writesize, page, 0, 0);
+	ret = denali_data_xfer(chip, buf, mtd->writesize, page, false, false);
 	if (ret && ret != -EBADMSG)
 		return ret;
 
@@ -782,7 +783,7 @@ static int denali_write_page(struct nand_chip *chip, const uint8_t *buf,
 	struct mtd_info *mtd = nand_to_mtd(chip);
 
 	return denali_data_xfer(chip, (void *)buf, mtd->writesize, page,
-				0, 1);
+				false, true);
 }
 
 static int denali_setup_data_interface(struct nand_chip *chip, int chipnr,
diff --git a/drivers/mtd/nand/raw/denali.h b/drivers/mtd/nand/raw/denali.h
index 46296f2..8e91438 100644
--- a/drivers/mtd/nand/raw/denali.h
+++ b/drivers/mtd/nand/raw/denali.h
@@ -314,7 +314,7 @@ struct denali_nand_info {
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
