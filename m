Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B300EE57F0
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Sep 2023 10:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4kh+VJq6rrYMN6/+BkQaZTmwebSEHfvunXBKhiD4B70=; b=jWhephooL011oX
	ioANZoEEsIszBFVb1J6aZAqAHD9FDZRbRqpuYlFhEsLeA6dcRW4OWnPWapx9T3X4FM0xHPTYaMqOZ
	FPPuCtu7WyIQNlY2zER99YlQm+/sWfS6W7KnhtS8dqGgAR7sgOZ95VWrjVx/KTRYc2xAd5cQ+T0VP
	NfaX9wrPO1tCjMcF1jIyBir9CZHg4IT+T+CfoiruM7F3dGjroHv1q8I4Uwl82UAFDzGc06MCsotBy
	5POYuYcs8uUCir4m+UJGFPiaaiq2CbuuEY0WtXtvN3+DZbzH7xkR+tzxB7Of5CLSbN3K0Q7Fa7tM9
	2HWpVbdH2EGr6bC6yLpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYXh-00DSuc-1Y;
	Fri, 08 Sep 2023 10:16:49 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYXe-00DSsI-24
	for linux-mtd@lists.infradead.org;
	Fri, 08 Sep 2023 10:16:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E2255B81DCA;
	Fri,  8 Sep 2023 10:16:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB298C433C7;
	Fri,  8 Sep 2023 10:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694168201;
	bh=LgVMUtw1CM1hDbEFLUFoQErg4cNgw+t9IA0MTKH/DNQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PYCzJ9UBTRuQektnzaNNIGv8cya9PWZvapxMt4B9NJNRZn1kjAXFSa20wEINvgmaK
	 1n6e+IiAwBrpzl+WxJRwTmMzH9+cD+7ZzGC67luieXryCAArW2YC+LVsu0ZUoe5Enl
	 two1IFgfgPQ/14pd1sOw+Tj/sIiFslUm0YLTYd8Cw02jhdmBB4TzeaaiJOZu38MvUs
	 o5Rg98U9IdmwdrZqnggXp2U1MyEkY//ka9yiQK+INy6n8h1LfPoD0pbM0xZf3RSBqD
	 TTTxXMQfYhC7BRL5GOjbh3RAFb4YLMtOZvREUhuPlhgKKzn5XjTgkQWN2HydrFA5ua
	 KcBL6kJ0/QjYw==
From: Michael Walle <mwalle@kernel.org>
Date: Fri, 08 Sep 2023 12:16:24 +0200
Subject: [PATCH v3 06/41] mtd: spi-nor: default page_size to 256 bytes
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v3-6-e60548861b10@kernel.org>
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
X-CRM114-CacheID: sfid-20230908_031646_955382_26AC9963 
X-CRM114-Status: GOOD (  16.05  )
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

The INFO() macro always set the page_size to 256 bytes. Make that an
optional parameter. This default is a sane one for all older flashes,
newer ones will set the page size by its SFDP tables anyway.

Signed-off-by: Michael Walle <mwalle@kernel.org>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c | 7 +------
 drivers/mtd/spi-nor/core.h | 8 ++++++--
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index f4cc2eafcc5e..d27ad1295ee0 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2018,11 +2018,6 @@ static const struct spi_nor_manufacturer *manufacturers[] = {
 static const struct flash_info spi_nor_generic_flash = {
 	.name = "spi-nor-generic",
 	.n_banks = 1,
-	/*
-	 * JESD216 rev A doesn't specify the page size, therefore we need a
-	 * sane default.
-	 */
-	.page_size = 256,
 	.parse_sfdp = true,
 };
 
@@ -3001,7 +2996,7 @@ static void spi_nor_init_default_params(struct spi_nor *nor)
 	params->writesize = 1;
 	params->size = info->size;
 	params->bank_size = params->size;
-	params->page_size = info->page_size;
+	params->page_size = info->page_size ?: SPI_NOR_DEFAULT_PAGE_SIZE;
 
 	if (!(info->flags & SPI_NOR_NO_FR)) {
 		/* Default to Fast Read for DT and non-DT platform devices. */
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 12c35409493b..25bc18197614 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -10,6 +10,11 @@
 #include "sfdp.h"
 
 #define SPI_NOR_MAX_ID_LEN	6
+/*
+ * 256 bytes is a sane default for most older flashes. Newer flashes will
+ * have the page size defined within their SFDP tables.
+ */
+#define SPI_NOR_DEFAULT_PAGE_SIZE 256
 
 /* Standard SPI NOR flash operations. */
 #define SPI_NOR_READID_OP(naddr, ndummy, buf, len)			\
@@ -447,7 +452,7 @@ struct spi_nor_fixups {
  * @sector_size:    the size listed here is what works with SPINOR_OP_SE, which
  *                  isn't necessarily called a "sector" by the vendor.
  * @n_banks:        the number of banks.
- * @page_size:      the flash's page size.
+ * @page_size:      (optional) the flash's page size. Defaults to 256.
  * @addr_nbytes:    number of address bytes to send.
  *
  * @parse_sfdp:     true when flash supports SFDP tables. The false value has no
@@ -558,7 +563,6 @@ struct flash_info {
 #define SPI_NOR_GEOMETRY(_sector_size, _n_sectors, _n_banks)		\
 	.size = (_sector_size) * (_n_sectors),				\
 	.sector_size = (_sector_size),					\
-	.page_size = 256,						\
 	.n_banks = (_n_banks)
 
 /* Used when the "_ext_id" is two bytes at most */

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
