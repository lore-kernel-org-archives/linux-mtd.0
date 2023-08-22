Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE226EE49A8
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Aug 2023 07:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4kh+VJq6rrYMN6/+BkQaZTmwebSEHfvunXBKhiD4B70=; b=4bPtJmjBoUkI/A
	jk28wXOaHuoq4TJPg85Ic8j2DkvSNKvYB7IB+C6f9jNDU+YmuHaNPrahTGiSaC1gEiB7UNf4arTeZ
	5hmPWSOww2j2DSPTQL87cmlotDZAmE01fAdGwfHDw9CX07eyjh8pNbmricnj9bfrwoEBctj5WwuVH
	vJj3bldylIgT+SC/gRQlRbM/DYJzrLUe9OXHj30ydk3Y3YovjD87VbdT2zpmTe+WRRAuo0O979hxP
	GJWHJgXi4m/z5ag2OV18gEl5C1g6boCIWWEPH4MNcopaQirzA682TylPfm+jcHiG7It6FoDcaMq9E
	e9d5u1rs6P1eIrhT4wBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYLWS-00FHre-2U;
	Tue, 22 Aug 2023 07:09:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYLWP-00FHqK-2k
	for linux-mtd@lists.infradead.org;
	Tue, 22 Aug 2023 07:09:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4364964D4A;
	Tue, 22 Aug 2023 07:09:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA44AC433C7;
	Tue, 22 Aug 2023 07:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692688188;
	bh=LgVMUtw1CM1hDbEFLUFoQErg4cNgw+t9IA0MTKH/DNQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jBsWh4AbN5xuoP2VMKu92lKhW32mdi+Sy37q5FxcJXuSONJCFCsZ5jzXbrtcMEXM2
	 ASWrF2AUDhx6mKaT/5f6q0YPGyqFISys9zjBGBwC6kSr3sK0a/fjbxezqpRXBynHco
	 KGdEuxM5OBY5boVl+ad9CrJTwMbgcInZN+GAGACX0xkk766AiJzoynMNSsjAYVCMok
	 Y+RkoVMxHcP0/w7TU2wXBEyBXdpa4lLRjOn/VJdj9m+5S6CvalHZfzJ1Hqb2kD523f
	 7A3oapaq/LjPciswfkjTpKitcIRj2qm8xWIisGuwistihrwVHahmxG+OZ5YPx1GHjB
	 ZWxu8aFo4s3wA==
From: Michael Walle <mwalle@kernel.org>
Date: Tue, 22 Aug 2023 09:09:22 +0200
Subject: [PATCH v2 06/41] mtd: spi-nor: default page_size to 256 bytes
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v2-6-291a0f39f8d8@kernel.org>
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
X-CRM114-CacheID: sfid-20230822_000949_978172_7EF1FB85 
X-CRM114-Status: GOOD (  16.10  )
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
