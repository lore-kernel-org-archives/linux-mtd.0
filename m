Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6B8C001B0
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Aug 2023 13:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=otmoIA586fGJCgc1tO3ilQytAXsdUyHNVfSWTveSXaE=; b=MzLXBiFD+VLZ38
	+wbNqMlfK3QKOdZtypuDBxD+8kBIPWrmQr+wElzd9CqOJQY3HD2J79/kQ4RRVlqRSgV3tpEc78bbq
	Dt/2Xj9ngATklm3jCaREh7xuHXL3IH36xGj9r9YJF0Od+m22qAXqb4TOdvKIyP88iDQaKV2UBwk5B
	FoKm44s4/JryTFIG+SOOmy5MoyGieRDgd7JZO0tzrfzR/bD4GDV8clVAjkgW7AmBKAdY4mc+uJ8GB
	t3zuVAfVsoovjEkVBJqkOwpI2Pv1aSv2lCeIQj5bRmr45OHpZ9yHghiLM5tHAsKl0p98duXegGd43
	a3Od9fmtY82DQr2/pGlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0CI-00HLbC-0q;
	Mon, 07 Aug 2023 13:22:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0CB-00HLUZ-2R
	for linux-mtd@bombadil.infradead.org;
	Mon, 07 Aug 2023 13:22:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=W4xlGXKvKRcX6t7g9LaAzb+Dxo7rnSxpiVxsDhVC7Sc=; b=dGmdCCcg0M9nUUF2MenMy92Vhf
	MYH1B6uO4IMKQjfVox8SZVKXEQ0Rq2kcSVZ+K1EHMA1LsHMkK8j8ECAAvEhg2SqfpKN/0fv2Wwrhx
	iuVxqwXWNe2aCkEigxdFBnzuGLlDhyATnb+Xp/wvxTZ2YJ+6qLjb76oDlyVX326NujgzyzB1qVrfP
	03bzTvRbSBoZFI0FyIDvYU9WNzCr0MxYUyWmdZdSzJ0zmHe65FD39HeRqUVAhBtf7mm9tyVTbjvj1
	P91830pkX80Mz7H4xDHYl63E2IHMduh1yZUHWIC99hXeIwEiRh0bkl95nVmfB3dM1as3zhrbe2R2k
	Z0APGlnA==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0C2-003qci-1h
	for linux-mtd@lists.infradead.org;
	Mon, 07 Aug 2023 13:22:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AE9CE61AFB;
	Mon,  7 Aug 2023 13:22:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A575C433CA;
	Mon,  7 Aug 2023 13:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691414557;
	bh=Wbw26ozDm2yZuCOCpEEf+tY0cT7CvfziJiMaObcpSys=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Uxt7i/1b2MRPDpAzZVAbWPJtkHxShma6vIczBTkDyNaey89RYzqWvONkTOwOzkay5
	 ZNCa5Fl7pU8gKYN+GWXY5BgLe1Fl8yb6LWLJiRrp6f7tY6qlVQBTJUXzSg0QowNf0C
	 AC+eS+Uk7RiDBu1wth8VD8iesliZPyhL0TmXFzYhEXFZ/lCcK8CN3K2zJCGPFuCXqG
	 PWYJs4nT4RthbGHBMrsNXJ5nsaJN/nBYVhlyoUwYbWr7s+qmXIE+HXQ/JcwEhnHn1G
	 O302Jeo8Km3ZgQTTb/zwjIWrd3GTj+uDfkH/rB/vEuUC+FLikCLVuakwvBemAZ8MYb
	 fcvxJdmiCleQw==
From: Michael Walle <mwalle@kernel.org>
Date: Mon, 07 Aug 2023 15:21:15 +0200
Subject: [PATCH 21/41] mtd: spi-nor: gigadevice: convert flash_info to new
 format
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v1-21-3d3d5bef4ba4@kernel.org>
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
X-CRM114-CacheID: sfid-20230807_142242_949222_125B228A 
X-CRM114-Status: GOOD (  11.25  )
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

The INFOx() macros are going away. Convert the flash_info database to
the new format.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/gigadevice.c | 81 ++++++++++++++++++++++++----------------
 1 file changed, 49 insertions(+), 32 deletions(-)

diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
index 7cf142c75529..0d22cd99715b 100644
--- a/drivers/mtd/spi-nor/gigadevice.c
+++ b/drivers/mtd/spi-nor/gigadevice.c
@@ -34,38 +34,55 @@ static const struct spi_nor_fixups gd25q256_fixups = {
 };
 
 static const struct flash_info gigadevice_nor_parts[] = {
-	{ "gd25q16", INFO(0xc84015, 0, 64 * 1024,  32)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
-	{ "gd25q32", INFO(0xc84016, 0, 64 * 1024,  64)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
-	{ "gd25lq32", INFO(0xc86016, 0, 64 * 1024, 64)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
-	{ "gd25q64", INFO(0xc84017, 0, 64 * 1024, 128)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
-	{ "gd25lq64c", INFO(0xc86017, 0, 64 * 1024, 128)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
-	{ "gd25lq128d", INFO(0xc86018, 0, 64 * 1024, 256)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
-	{ "gd25q128", INFO(0xc84018, 0, 64 * 1024, 256)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
-	{ "gd25q256", INFO(0xc84019, 0, 64 * 1024, 0)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6)
-		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
-		.fixups = &gd25q256_fixups },
+	{
+		.id = SNOR_ID(0xc8, 0x40, 0x15),
+		.name = "gd25q16",
+		.size = SZ_2M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xc8, 0x40, 0x16),
+		.name = "gd25q32",
+		.size = SZ_4M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xc8, 0x60, 0x16),
+		.name = "gd25lq32",
+		.size = SZ_4M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xc8, 0x40, 0x17),
+		.name = "gd25q64",
+		.size = SZ_8M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xc8, 0x60, 0x17),
+		.name = "gd25lq64c",
+		.size = SZ_8M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xc8, 0x60, 0x18),
+		.name = "gd25lq128d",
+		.size = SZ_16M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xc8, 0x40, 0x18),
+		.name = "gd25q128",
+		.size = SZ_16M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xc8, 0x40, 0x19),
+		.name = "gd25q256",
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6,
+		.fixups = &gd25q256_fixups,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+	},
 };
 
 const struct spi_nor_manufacturer spi_nor_gigadevice = {

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
