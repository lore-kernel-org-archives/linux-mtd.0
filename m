Return-Path: <SRS0=Jpfl=PR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CCC1C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 17:29:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 243DF60FF2
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 17:29:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 243DF60FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fDDwCMkoaYsfJ/KFtrhimoCam+Z9+MEcg6R1vscCCSU=; b=o7Yfgxvhv+7oZa
	ZPzC9hJI+E2TIoDQj4Vj2Hy2WuKttsgwedKj+i8yHVpPeEbnM4WYJFPMCawNlxQByj9U8caIES+Ot
	+t/oWskqNVpbUZZDAYz5PHZyrRv6OcPUB+jSw2h+SSfmBdYc4MGazLpEyCuTLMpwiCXxPWglc+aIJ
	yipwW9UvsQQzZ0ZnUb51LVKvDDb53l0vRm9VO+WeBvDmijUtAstV7VHE56D5P/F/vvA+Wu8L5zS9Z
	UihRqKaGVJtRt/eAWm4NcZ93Fs0yQONOMHwJ5onRJ2wf78ccYhQl+v5CnnAPP8EL6kKtxhr7KNSo+
	Nyd/qze/FmVlOWXkaTQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgVgj-00BZoc-WE; Fri, 29 Oct 2021 17:29:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgVef-00BZ8D-4T; Fri, 29 Oct 2021 17:27:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1635528421; x=1667064421;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x/REjWCNhLcPf/7ewL5c2XVcu3BBz82ATCZeER86MVc=;
 b=XuNP3x+2ZmJ7/J/Z0lkdzS3R3OPT2JgtFU0v6K3vpR75ATh/d4rRqNrs
 3canCKZUFvIw0eA4Q5Y2wCLCgPlUOgkaIr5SWqOpMI4XI/pQjwM8LqUB7
 mH9/WNMes1rcq9xWY2lCBLC6QTc2x3ZTqt/uE0+aC/oGHRo+PhhjPxCdZ
 DxySzEWkjxYZA7SWOGwXYhJs703csFjV3FZXZ0jbEVkCQQr/Mh/sh2aKV
 L3HHKeEFO4DOjfrEj5CamOb70271SQTDjBkpd5ZNfnArwTHXgOqPQYmaU
 BIq8QbYAIqcpsXXX8ckLHQDSvqFtA6ENOMKXeh1ekq3o/oncX8QBvwcvy A==;
IronPort-SDR: 7aR5wGgDPG1z75MpUQRXlvvEAGbfovxps8ui0AkLo+xzN8V05iq8hSK2hBg3IJPoln+KjRyhN1
 icfnMSzh/WLBqf7gmjiQ093nqr6cY/vsYC1UzgskV3y8X/K55cmJSsHZTZuoPZGYPhpz8HGhd+
 l3plNN2GPEADOpR9MV61dlHqmKW3u21A5LBTNHXtIVY3hVNE+/+7I2ZjflApkWYefkyCdm3lcW
 B5itk0R43zaQMGO0GLTkgE2pMq/lRgzobzUXy0YZZPxH38YSdTTL5GF6+DGt9uDZNQmlLHw4DI
 2C+F+TtTlJDEPaw92KKPIkOd
X-IronPort-AV: E=Sophos;i="5.87,193,1631602800"; d="scan'208";a="137361303"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Oct 2021 10:27:00 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 29 Oct 2021 10:26:59 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 29 Oct 2021 10:26:55 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: [PATCH v3 04/25] mtd: spi-nor: Get rid of nor->page_size
Date: Fri, 29 Oct 2021 20:26:12 +0300
Message-ID: <20211029172633.886453-5-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029172633.886453-1-tudor.ambarus@microchip.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_102701_274746_C68E0A12 
X-CRM114-Status: GOOD (  18.48  )
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
Cc: macromorgan@hotmail.com, jaimeliao@mxic.com.tw, Tudor
 Ambarus <tudor.ambarus@microchip.com>, richard@nod.at, esben@geanix.com,
 linux@rasmusvillemoes.dk, knaerzche@gmail.com, nicolas.ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

nor->page_size duplicated what nor->params->page_size indicates
for no good reason. page_size is a flash parameter of fixed value
and it is better suited to be found in nor->params->page_size.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
---
 drivers/mtd/spi-nor/core.c   | 20 +++++++++-----------
 drivers/mtd/spi-nor/xilinx.c | 17 ++++++++++-------
 include/linux/mtd/spi-nor.h  |  2 --
 3 files changed, 19 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index ae971c773334..13515ad12bf1 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1952,6 +1952,7 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
 	size_t page_offset, page_remain, i;
 	ssize_t ret;
+	u32 page_size = nor->params->page_size;
 
 	dev_dbg(nor->dev, "to 0x%08x, len %zd\n", (u32)to, len);
 
@@ -1968,16 +1969,15 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 		 * calculated with an AND operation. On the other cases we
 		 * need to do a modulus operation (more expensive).
 		 */
-		if (is_power_of_2(nor->page_size)) {
-			page_offset = addr & (nor->page_size - 1);
+		if (is_power_of_2(page_size)) {
+			page_offset = addr & (page_size - 1);
 		} else {
 			uint64_t aux = addr;
 
-			page_offset = do_div(aux, nor->page_size);
+			page_offset = do_div(aux, page_size);
 		}
 		/* the size of data remaining on the first page */
-		page_remain = min_t(size_t,
-				    nor->page_size - page_offset, len - i);
+		page_remain = min_t(size_t, page_size - page_offset, len - i);
 
 		addr = spi_nor_convert_addr(nor, addr);
 
@@ -3087,7 +3087,7 @@ static void spi_nor_set_mtd_info(struct spi_nor *nor)
 	if (nor->info->flags & SPI_NOR_NO_ERASE)
 		mtd->flags |= MTD_NO_ERASE;
 	mtd->writesize = nor->params->writesize;
-	mtd->writebufsize = nor->page_size;
+	mtd->writebufsize = nor->params->page_size;
 	mtd->size = nor->params->size;
 	mtd->_erase = spi_nor_erase;
 	mtd->_read = spi_nor_read;
@@ -3123,7 +3123,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	 * We need the bounce buffer early to read/write registers when going
 	 * through the spi-mem layer (buffers have to be DMA-able).
 	 * For spi-mem drivers, we'll reallocate a new buffer if
-	 * nor->page_size turns out to be greater than PAGE_SIZE (which
+	 * nor->params->page_size turns out to be greater than PAGE_SIZE (which
 	 * shouldn't happen before long since NOR pages are usually less
 	 * than 1KB) after spi_nor_scan() returns.
 	 */
@@ -3180,8 +3180,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 			nor->flags |= SNOR_F_HAS_SR_BP3_BIT6;
 	}
 
-	nor->page_size = nor->params->page_size;
-
 	if (of_property_read_bool(np, "broken-flash-reset"))
 		nor->flags |= SNOR_F_BROKEN_RESET;
 
@@ -3346,8 +3344,8 @@ static int spi_nor_probe(struct spi_mem *spimem)
 	 * and add this logic so that if anyone ever adds support for such
 	 * a NOR we don't end up with buffer overflows.
 	 */
-	if (nor->page_size > PAGE_SIZE) {
-		nor->bouncebuf_size = nor->page_size;
+	if (nor->params->page_size > PAGE_SIZE) {
+		nor->bouncebuf_size = nor->params->page_size;
 		devm_kfree(nor->dev, nor->bouncebuf);
 		nor->bouncebuf = devm_kmalloc(nor->dev,
 					      nor->bouncebuf_size,
diff --git a/drivers/mtd/spi-nor/xilinx.c b/drivers/mtd/spi-nor/xilinx.c
index 1138bdbf4199..0658e47564ba 100644
--- a/drivers/mtd/spi-nor/xilinx.c
+++ b/drivers/mtd/spi-nor/xilinx.c
@@ -28,11 +28,12 @@ static const struct flash_info xilinx_parts[] = {
  */
 static u32 s3an_convert_addr(struct spi_nor *nor, u32 addr)
 {
+	u32 page_size = nor->params->page_size;
 	u32 offset, page;
 
-	offset = addr % nor->page_size;
-	page = addr / nor->page_size;
-	page <<= (nor->page_size > 512) ? 10 : 9;
+	offset = addr % page_size;
+	page = addr / page_size;
+	page <<= (page_size > 512) ? 10 : 9;
 
 	return page | offset;
 }
@@ -40,6 +41,7 @@ static u32 s3an_convert_addr(struct spi_nor *nor, u32 addr)
 static int xilinx_nor_setup(struct spi_nor *nor,
 			    const struct spi_nor_hwcaps *hwcaps)
 {
+	u32 page_size;
 	int ret;
 
 	ret = spi_nor_xread_sr(nor, nor->bouncebuf);
@@ -64,10 +66,11 @@ static int xilinx_nor_setup(struct spi_nor *nor,
 	 */
 	if (nor->bouncebuf[0] & XSR_PAGESIZE) {
 		/* Flash in Power of 2 mode */
-		nor->page_size = (nor->page_size == 264) ? 256 : 512;
-		nor->mtd.writebufsize = nor->page_size;
-		nor->mtd.size = 8 * nor->page_size * nor->info->n_sectors;
-		nor->mtd.erasesize = 8 * nor->page_size;
+		page_size = (nor->params->page_size == 264) ? 256 : 512;
+		nor->params->page_size = page_size;
+		nor->mtd.writebufsize = page_size;
+		nor->mtd.size = 8 * page_size * nor->info->n_sectors;
+		nor->mtd.erasesize = 8 * page_size;
 	} else {
 		/* Flash in Default addressing mode */
 		nor->params->convert_addr = s3an_convert_addr;
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index f67457748ed8..fc90fce26e33 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -371,7 +371,6 @@ struct spi_nor_flash_parameter;
  * @bouncebuf_size:	size of the bounce buffer
  * @info:		SPI NOR part JEDEC MFR ID and other info
  * @manufacturer:	SPI NOR manufacturer
- * @page_size:		the page size of the SPI NOR
  * @addr_width:		number of address bytes
  * @erase_opcode:	the opcode for erasing a sector
  * @read_opcode:	the read opcode
@@ -401,7 +400,6 @@ struct spi_nor {
 	size_t			bouncebuf_size;
 	const struct flash_info	*info;
 	const struct spi_nor_manufacturer *manufacturer;
-	u32			page_size;
 	u8			addr_width;
 	u8			erase_opcode;
 	u8			read_opcode;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
