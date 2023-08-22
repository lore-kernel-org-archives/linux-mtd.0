Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2BCAEE49AF
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Aug 2023 07:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uMogUfuONZ1xZvYfTBHM9y9PHxUcsCXfatRo3EKLPds=; b=HRi7oaj06Q0khg
	eDHsfDY+3k4kiO74OBH6s88ZnM0AAOVKkjC5M8dGyqnkd+fn8satD1EZ5bWTUE5IKsgAzaHYXk070
	qdG/YJ4oOk7NymQHHSNdhQiTF68zj0QnkcytW/NF7Kc+NOLjtc6H243n3QEw5YBxRh3SsBcghFyb7
	aRLYIeSJc0HHXXyItXwSyMS9QnJ2KaEQrvkUV6gb4w0WorvRmRIuurTOI7AkbpsBcQ7XSx4Bmls5B
	XD8JB8UiL4wQ4+qmqZlCfXqykdqNBTCqghr4gnVJDS63prZmQvnK3Pje5D7w7JZ72g/VtwY9GJe3x
	D0gGrWKDPbjmRFAZIJfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYLWU-00FHsW-1M;
	Tue, 22 Aug 2023 07:09:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYLWR-00FHr1-2I
	for linux-mtd@lists.infradead.org;
	Tue, 22 Aug 2023 07:09:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 378B364D18;
	Tue, 22 Aug 2023 07:09:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5360C433CB;
	Tue, 22 Aug 2023 07:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692688190;
	bh=2ZHDvbq3+3zLWqFwJBCT9nsnQo0T+nMGUO9QmyxfUBo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SAmXAVz6nj0bs8b2qLxVSXEdd2MX/4RP2Ymem5Sq9Lp9T6soqnOby52kDxVxiqy7R
	 mt50w4imKBuCYRrMRYwD5F+zVH4q34tYlrPolxb7mV5Fq2sMY5s5P2pqS/aA5ybpXk
	 wM3PVFIRX3DVfK3bgjvtvelxRUeKy/kG4uNqY8p7EU0s7jDNpEWsRm8azeBfzI8iHq
	 YZ+ToT3ng98XIjC+9rm7J14qKZS3uxQJkIk2o0J8OiyIhV9biakXsIWBFDNr3vhMkg
	 4RaFjulGPKrTEtp2kkcQ/YTsDCONzVyoGv+YJjLoY1PFLzzUZWvY+uD7cjA0AUIXvK
	 HjV7qp1Dpx1uw==
From: Michael Walle <mwalle@kernel.org>
Date: Tue, 22 Aug 2023 09:09:23 +0200
Subject: [PATCH v2 07/41] mtd: spi-nor: store .n_banks in struct
 spi_nor_flash_parameter
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v2-7-291a0f39f8d8@kernel.org>
References: <20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Michael Walle <mwalle@kernel.org>
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_000951_835411_E10D0ABA 
X-CRM114-Status: GOOD (  15.38  )
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
