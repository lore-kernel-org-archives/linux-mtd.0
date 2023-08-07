Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 144CBC001DB
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Aug 2023 13:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V7V3MS2hqHnt0jyIWej/IzbviWGE3Zeo2Ig5oRLTCoY=; b=AjAl4N3iGuDOZc
	q9waV/e4M8/bUOA5Pi62jvMZ9VdE5gEO8svVzhS9c4FaQorllla2uUC0AajSY+xm7h5FNLGNFIBEb
	CzqV2l0fzsBuXZNcGLiuaS2r721c4RiPb1tlfpKhtczWNKV0+y7rFJT4fiATpjD7EBIHXnPUPXcVJ
	aO0WIiNNKgp95oJR5XfCfINBsQvcM58zvf0YyYGkiHU318ALyCaBzoiWSpINjiY7/Ute1RcTJERv/
	s5Y9t66S3vcitWtm02CnL0xVL1QyYPQSlGu9us4dfg9nPfjmaz/dfq66TzSNtQhlYLSe8hmp/VZsu
	nCQAovu7g/d1sJCDQO1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0Bo-00HL8o-2L;
	Mon, 07 Aug 2023 13:22:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0Bj-00HL34-1M
	for linux-mtd@lists.infradead.org;
	Mon, 07 Aug 2023 13:22:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DEABC61ADA;
	Mon,  7 Aug 2023 13:22:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E754C433CB;
	Mon,  7 Aug 2023 13:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691414542;
	bh=lVNHe40ZD+qOohBgV1PoniWN1QEJCYIZ2y5SGmIv6ik=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BLzgVoV9Kw93tRTL4v19Z6zKs5jepRwI5NdutVFedJCOcVomkJkGqQcv5ZZuEGcpq
	 tAZA5Hsj7rOvIs05mA6Mc8aJXbXQbcQn4iqen6YWw+0QHPj/MZ4Q7RC94kYfLmDjvr
	 iuuHmh+nYiv+fjWriB+GBrumYyjczTn1tkXsWzleUHc9w4Gus0dloarTebDAQRkrwm
	 iarBY1+C3moLn/4kKvx2ZenQdWAN3INCRmy3vzqo3hR8FGWyGv2/gqBt9hMgjjU4ds
	 IqDMppSeQ2Pq9qrx1IiMg0M4LuhuvqdYkGtJJswCjcKnINEeThYCGbJc0lLuDaGx23
	 PfhPscFx9RMJA==
From: Michael Walle <mwalle@kernel.org>
Date: Mon, 07 Aug 2023 15:21:08 +0200
Subject: [PATCH 14/41] mtd: spi-nor: rename .otp_org to .otp and make it a
 pointer
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v1-14-3d3d5bef4ba4@kernel.org>
References: <20230807-mtd-flash-info-db-rework-v1-0-3d3d5bef4ba4@kernel.org>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v1-0-3d3d5bef4ba4@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Michael Walle <mwalle@kernel.org>
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_062223_530791_2F9A2E6C 
X-CRM114-Status: GOOD (  13.40  )
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

Move the OTP ops out of the flash_info structure. Besides of saving some
space, there will be a new macro SNOR_OTP() which can be used to set the
ops:
  .otp = SNOR_OTP(...),

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/core.c | 2 +-
 drivers/mtd/spi-nor/core.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 1319fcb97e16..06b34d9ad8a1 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2977,7 +2977,7 @@ static void spi_nor_init_default_params(struct spi_nor *nor)
 	struct device_node *np = spi_nor_get_flash_node(nor);
 
 	params->quad_enable = spi_nor_sr2_bit1_quad_enable;
-	params->otp.org = &info->otp_org;
+	params->otp.org = info->otp;
 
 	/* Default to 16-bit Write Status (01h) Command */
 	nor->flags |= SNOR_F_HAS_16BIT_SR;
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 57272bb51eff..e26a17d11c14 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -555,7 +555,7 @@ struct flash_info {
 
 	u8 mfr_flags;
 
-	const struct spi_nor_otp_organization otp_org;
+	const struct spi_nor_otp_organization *otp;
 	const struct spi_nor_fixups *fixups;
 };
 
@@ -605,7 +605,7 @@ struct flash_info {
 		.flags = SPI_NOR_NO_ERASE | SPI_NOR_NO_FR,		\
 
 #define OTP_INFO(_len, _n_regions, _base, _offset)			\
-		.otp_org = {						\
+		.otp = &(const struct spi_nor_otp_organization){	\
 			.len = (_len),					\
 			.base = (_base),				\
 			.offset = (_offset),				\

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
