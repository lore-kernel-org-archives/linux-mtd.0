Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E96FEE49A8
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Aug 2023 07:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0J/odc3JzWp5j8sfE48MrCCuMJY4URfIK9yX4doyZb0=; b=Xkcs7azWjWcldF
	YoDysA/0GdCUGkSitNyAbVy6ssiCsT0HlM1vLzh6uKUMoA905Ay2tl+pMXJ0KSHGLspUx0bYCc0mi
	uWKxNoDOSwcLHHQMCZOhEh4VIEmKPs4bI4Q8wAkiqjmm15keAvvmIHfAucwmXLD/1idiGuKFUqZmS
	VO3R4tFV9SUMwzJGlw4EzUVIKR91G1G1xnv9+3iCZzdOZXbwuYfT8uERzMcWmiMyqcw7vERLbcP+N
	lVr+U7BkgoSRCVPeEfJKpYMwG2GsNN23Cp702NTYKBu+KFNMAbxcIrxAJHVDOxTxYl2lHw90sp0MG
	Hv0DN4uP6eaSGnv0BfUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYLWl-00FI6O-0C;
	Tue, 22 Aug 2023 07:10:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYLWf-00FI1T-25
	for linux-mtd@lists.infradead.org;
	Tue, 22 Aug 2023 07:10:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 27BD764D70;
	Tue, 22 Aug 2023 07:10:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62AACC433CC;
	Tue, 22 Aug 2023 07:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692688204;
	bh=ZU2Q5S8n0WBM33+d5apjMFKUzdUvVi8jQVBjbDv54Zo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CLpFl8rdoJ0R6kk2mTdBt/4eZwu6kCVd5JURG9mxSKaP3NPXSf/YHb2WLGLXKZkcv
	 tbS2Me1I+qtzw5Q2e/cykCBwrkObgHz0PtWBzhj1ZHDXAgMorXbVRQbtEQkQEP75JT
	 guEyQt7rb97+xz56hKkm9/6XDTnu0iVOj/5tfqfTzneJyPM6mr13KlzSqsboVltws/
	 6RIbRfnNncd1oE6jeCTHFkJbgTc+L5TozmwXP4g3k7xq/q8w6wxiue+uKdmr/cgJbL
	 SVxgjmS+jbmnv70KrVWBMOgYGenjFmK1+8S9tyapLBQB3Tg2pDDELpM6MrWW5wHiYC
	 FSvgnt1lgxitg==
From: Michael Walle <mwalle@kernel.org>
Date: Tue, 22 Aug 2023 09:09:30 +0200
Subject: [PATCH v2 14/41] mtd: spi-nor: rename .otp_org to .otp and make it
 a pointer
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v2-14-291a0f39f8d8@kernel.org>
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
X-CRM114-CacheID: sfid-20230822_001005_777767_90F6821F 
X-CRM114-Status: GOOD (  14.02  )
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
index 80c340c7863a..1c443fe568cf 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2978,7 +2978,7 @@ static void spi_nor_init_default_params(struct spi_nor *nor)
 	struct device_node *np = spi_nor_get_flash_node(nor);
 
 	params->quad_enable = spi_nor_sr2_bit1_quad_enable;
-	params->otp.org = &info->otp_org;
+	params->otp.org = info->otp;
 
 	/* Default to 16-bit Write Status (01h) Command */
 	nor->flags |= SNOR_F_HAS_16BIT_SR;
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 81535f31907f..c22f5cf65a58 100644
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
