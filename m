Return-Path: <SRS0=5ASP=MT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 520DCC4320E
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 06:14:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21F4A60551
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 06:14:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 21F4A60551
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nvXDmPamNERyZwlBLy1miyuOpP/o5dQ2bz8GXGgB2Rg=; b=zL6m2n+smW9qBU
	mnwrPeczgvkt6puB/H7TlULXd4zPzmrdhWHXxpVbLGzBMuyXOdBUFcnj0sKscvBrpoL53FEyFmxjo
	hYo/Sk7qGh2878atAKLcyQx+vJ2JkrT5oyIRJQacu/51and0O9QabW3ESi8UIzhziHLiW2kpLa13b
	jT9mjTAsm3IahzyyhbWx1BkIRulO+OQBkUzjsG/wg5MT/o3AKceQGjM2Dy93qMQKu6xBpOVmRUUKC
	blojFoTHKGMwWwPtkCN7mlat/Ha0wg5x+r+JBBaKy4Tqs489GKs58kKKXht+JehXB1ULp5GjlpzFB
	emUJP+8nT7GE6m30UoJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8GLF-00DZNM-JQ; Tue, 27 Jul 2021 06:13:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8F6q-00DHsJ-Ov; Tue, 27 Jul 2021 04:54:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1627361668; x=1658897668;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=quEXac8Me5KRinPjcg+W1EvjGTJmVyCb4e5T50NVy70=;
 b=EBkgR2oYJDeDyHPwzV74gkzk1cjkdN1wUEdMhaRn3pDkOxXVauuq+bFA
 MadO9fui8pJzlTR7rKQeacp6vdMgsOCgLdVH937c730NSbKDb9mwJT7Oc
 aoyDkCyGtQ0Bs9SMdss5LtmGyBMZBSoSt3AC0vjTXSaXVEsXuImF9MrLW
 zXETSDa9fG1QPGfVKoQL2fpOOS2gYd7LjCYoNTg6eKA5TPofAfI3TZFtQ
 RrT5pta97WpWeI2jwAtfR6YamPVGDJeytWE1guS0kR/C0vuGyNcqgFErc
 PRSAu5lZBWKppVq/6wpGBQ0SEKGfbWSupEEEQzI3FZuHOkUFjj3UMdRfg g==;
IronPort-SDR: Wezu3nB2+f1EC/1QJvJ7heDEb/c5WndzjUoPoEnvGobbJwiyEGrm5QipYPWcDkXmF5QcEeCTft
 tZPGKsWtm5Adys0SFFlsV5qtD1Y84c7lMEfGzF8sQKe9rYwQ8iZ8oiamo2po2obrZLB4MEmHlP
 WoWCgZXLqyjhF5ab0z7lpIsu0IQPlbu6J/hqZl1mrwJnMVbFV+9/aPMcjS5Cv29eFzkqry7pfM
 ao/UoobQmHKMUV/8I/n231Zve4moELhSptiHJqr62cxu4M8iZYlbv5C/XVLgv8FySjVmnVvvmF
 sSssLQveoFBCiogou9gEf5ks
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="126055079"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Jul 2021 21:54:27 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 26 Jul 2021 21:54:26 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 26 Jul 2021 21:54:21 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
CC: <figgyc@figgyc.uk>, <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>,
 <esben@geanix.com>, <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>, <heiko.thiery@gmail.com>,
 <macromorgan@hotmail.com>, <sr@denx.de>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <nicolas.ferre@microchip.com>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>
Subject: [PATCH v2 23/35] mtd: spi-nor: Get rid of nor->page_size
Date: Tue, 27 Jul 2021 07:52:10 +0300
Message-ID: <20210727045222.905056-24-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210727045222.905056-1-tudor.ambarus@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_215428_912365_D94DF945 
X-CRM114-Status: GOOD (  19.78  )
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

nor->page_size duplicated what nor->params->page_size indicates
for no good reason. page_size is a flash parameter of fixed value
and it is better suited to be found in nor->params->page_size.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c   | 20 +++++++++-----------
 drivers/mtd/spi-nor/xilinx.c | 17 ++++++++++-------
 include/linux/mtd/spi-nor.h  |  2 --
 3 files changed, 19 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 72dfe6274041..83f27405a000 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1953,6 +1953,7 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
 	size_t page_offset, page_remain, i;
 	ssize_t ret;
+	u32 page_size = nor->params->page_size;
 
 	dev_dbg(nor->dev, "to 0x%08x, len %zd\n", (u32)to, len);
 
@@ -1969,16 +1970,15 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
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
 
@@ -3141,7 +3141,7 @@ static void spi_nor_set_mtd_info(struct spi_nor *nor)
 	if (nor->info->flags & SPI_NOR_NO_ERASE)
 		mtd->flags |= MTD_NO_ERASE;
 	mtd->writesize = nor->params->writesize;
-	mtd->writebufsize = nor->page_size;
+	mtd->writebufsize = nor->params->page_size;
 	mtd->size = nor->params->size;
 	mtd->_erase = spi_nor_erase;
 	mtd->_read = spi_nor_read;
@@ -3174,7 +3174,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	 * We need the bounce buffer early to read/write registers when going
 	 * through the spi-mem layer (buffers have to be DMA-able).
 	 * For spi-mem drivers, we'll reallocate a new buffer if
-	 * nor->page_size turns out to be greater than PAGE_SIZE (which
+	 * nor->params->page_size turns out to be greater than PAGE_SIZE (which
 	 * shouldn't happen before long since NOR pages are usually less
 	 * than 1KB) after spi_nor_scan() returns.
 	 */
@@ -3199,8 +3199,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	if (ret)
 		return ret;
 
-	nor->page_size = nor->params->page_size;
-
 	/*
 	 * Configure the SPI memory:
 	 * - select op codes for (Fast) Read, Page Program and Sector Erase.
@@ -3359,8 +3357,8 @@ static int spi_nor_probe(struct spi_mem *spimem)
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
index a573c3cde414..a5feb86b0a7e 100644
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
index bd92acdd1899..be7ebaf092fe 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -372,7 +372,6 @@ struct spi_nor_flash_parameter;
  * @name:		used to point to correct name in case of ID collisions.
  * @info:		SPI NOR part JEDEC MFR ID and other info
  * @manufacturer:	SPI NOR manufacturer
- * @page_size:		the page size of the SPI NOR
  * @addr_width:		number of address bytes
  * @erase_opcode:	the opcode for erasing a sector
  * @read_opcode:	the read opcode
@@ -403,7 +402,6 @@ struct spi_nor {
 	const char *name;
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
