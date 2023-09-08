Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F73EEE57F2
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Sep 2023 10:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MfKYd3hC3xOEqSZCUvlIa4AWOe37r+rLBrBEH+TQ2fw=; b=VkIGyhcQFcWGn7
	geMsRUMeSMppPipPVOqFk1CHTvY8cbluNszJy3qHOrX11mEUCXZQnx662Mo6mw243lO54zktdbdEI
	ST5Db6RLyxVauDCJ3glU7YDCAM50ZTJIveVTKEV0gBVQEy0W82SsJmsQKygZrUhDOWT+1RQ/ucn7z
	NziZhKgWrrrVzcjc2iKyXLrZGJAx3ykfN1QgxRnq6HtCaPzP+3/cxk9ikgj1b5C09WMcsbdgrLhun
	rP/KxtJFWcxF2zSRnmMlnlYyj71M7rF6EbooXbLq2FDVmq0csGarCq+UOa43awi/6/+i3fm7Fece+
	F1wQbhToejjkC2pcyz3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYXi-00DSvH-0l;
	Fri, 08 Sep 2023 10:16:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYXf-00DSrp-0g
	for linux-mtd@lists.infradead.org;
	Fri, 08 Sep 2023 10:16:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CFF26614AC;
	Fri,  8 Sep 2023 10:16:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAD80C433BF;
	Fri,  8 Sep 2023 10:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694168203;
	bh=T89/S72zev0zM3PT2bX1H7LCoqUelnfRBWMuWQbSpiM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YKajqh5qmxfm8nRsoN1FgIipGx2iCrFppuPf/DxZbAcBhVeGaRwjzX3AEBBYenNkK
	 aZDaYugUFP92MQHjOgRzov2uSRTEtW/pZwydnMsgLPXR199a5Yyq1p1+5PlAB8g73E
	 gcYvVwud1LI1T0ShgGsKVXFnsJBdO5Owzg36ThikTtsBY9zPsjeQ/qPLEPB2LA4kfa
	 5k0eJTORSdtQuKKj6wK9H4RIhp4N1fIqHlfbPnP4CPOYR/dLwH9DHwQSURQfM7ijrx
	 zPlpThaNzWV6JF2/gigpA/zvk3NaepHd63gDIW2aQwYmf9gCC8SevQSSuE1wAnYTtD
	 66COMI8oRimUg==
From: Michael Walle <mwalle@kernel.org>
Date: Fri, 08 Sep 2023 12:16:25 +0200
Subject: [PATCH v3 07/41] mtd: spi-nor: store .n_banks in struct
 spi_nor_flash_parameter
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v3-7-e60548861b10@kernel.org>
References: <20230807-mtd-flash-info-db-rework-v3-0-e60548861b10@kernel.org>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v3-0-e60548861b10@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Michael Walle <mwalle@kernel.org>
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_031647_349858_665BAD32 
X-CRM114-Status: GOOD (  15.33  )
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

First, fixups might want to replace the n_banks parameter, thus we need
it in the (writable) parameter struct. Secondly, this way we can have a
default in the core and just skip setting the n_banks in the flash_info
database. Most of the flashes doesn't have more than one bank.

Signed-off-by: Michael Walle <mwalle@kernel.org>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/core.c | 7 ++++---
 drivers/mtd/spi-nor/core.h | 2 ++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index d27ad1295ee0..e27f1323fa0b 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2862,7 +2862,7 @@ static void spi_nor_init_flags(struct spi_nor *nor)
 	if (flags & NO_CHIP_ERASE)
 		nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
 
-	if (flags & SPI_NOR_RWW && nor->info->n_banks > 1 &&
+	if (flags & SPI_NOR_RWW && nor->params->n_banks > 1 &&
 	    !nor->controller_ops)
 		nor->flags |= SNOR_F_RWW;
 }
@@ -2926,8 +2926,8 @@ static int spi_nor_late_init_params(struct spi_nor *nor)
 	if (nor->flags & SNOR_F_HAS_LOCK && !nor->params->locking_ops)
 		spi_nor_init_default_locking_ops(nor);
 
-	if (nor->info->n_banks > 1)
-		params->bank_size = div64_u64(params->size, nor->info->n_banks);
+	if (params->n_banks > 1)
+		params->bank_size = div64_u64(params->size, params->n_banks);
 
 	return 0;
 }
@@ -2997,6 +2997,7 @@ static void spi_nor_init_default_params(struct spi_nor *nor)
 	params->size = info->size;
 	params->bank_size = params->size;
 	params->page_size = info->page_size ?: SPI_NOR_DEFAULT_PAGE_SIZE;
+	params->n_banks = info->n_banks;
 
 	if (!(info->flags & SPI_NOR_NO_FR)) {
 		/* Default to Fast Read for DT and non-DT platform devices. */
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 25bc18197614..2fc999f2787c 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -358,6 +358,7 @@ struct spi_nor_otp {
  *			in octal DTR mode.
  * @rdsr_addr_nbytes:	dummy address bytes needed for Read Status Register
  *			command in octal DTR mode.
+ * @n_banks:		number of banks.
  * @n_dice:		number of dice in the flash memory.
  * @vreg_offset:	volatile register offset for each die.
  * @hwcaps:		describes the read and page program hardware
@@ -394,6 +395,7 @@ struct spi_nor_flash_parameter {
 	u8				addr_mode_nbytes;
 	u8				rdsr_dummy;
 	u8				rdsr_addr_nbytes;
+	u8				n_banks;
 	u8				n_dice;
 	u32				*vreg_offset;
 

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
