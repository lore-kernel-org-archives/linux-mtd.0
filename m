Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2068EC001B0
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Aug 2023 13:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0/OgeqJ95QnsyoJxFWavXJUbbI7d4tMCguVf4z+33fk=; b=rCq8QPEomFTdkh
	sTH9djEpXdmuCAytnqNFoIIqhplQ0kWY75LevFDO8cwZB8YkjVxV9X0b5hPtDXBWybIZjJyvG4nHF
	TOqwqrQtCYmHZug4WQULabEP9BGRgDotZMf0vl6O/Z4mrKRDIgWNeW2qsWtqgPDjyHJ1mw8TzscOl
	ErR88j0Cz/aOUvW8LOzuh/VZXDWoUsG2gC5vD/WcHVzjZK5Rc9v2sdbbQIybctRSsATUopeYSnYfJ
	PnqSu2Z3J91lp2BNI7tN3BYjrKokkJPorDmVVPIjiOz5i2FDg06SjItN+1phH0ThboPyDM59CVcPP
	NOnQQcV2QXq/fKIQxJ9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0DM-00HMeL-02;
	Mon, 07 Aug 2023 13:24:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0Ce-00HLwR-0G
	for linux-mtd@bombadil.infradead.org;
	Mon, 07 Aug 2023 13:23:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=7HH1oF2B266TE1IKqtNDCHDPwa0sS9XmqMxqhmXHV1o=; b=M7wC8LdS/ab+iD5NMaVC3PnxlU
	OwN/UtIoYvZAAndiXbeAcd+jHATzrlo9C8ZWxhC5oD3+8k2rs9LafUZV6kWkh0seo4g65Fy9nUIBV
	ZAa/TpD2FB2/qcKytYBgiEFBVCOSiHrpDqFNLZIjDZ2ifJDtAPem9GtIiiqVt3y5jaaMeA+3h96H5
	VuVnEsex0OiZU1VcERyN2mCXdgJAweaPYZE2iYrLHMz/gI4HTLG3uWXF7Mvg066D8YzNmZPFx5LoT
	TCAiYTzhk+ur7dpLN4GI4ChwR+IPpMx38MVcKRw8UX9xdYLn1FJtvtypXEpiwwHAG0HetadiCkNeS
	fkdxIb1Q==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0CU-003qjB-2s
	for linux-mtd@lists.infradead.org;
	Mon, 07 Aug 2023 13:23:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5FE8561AF8;
	Mon,  7 Aug 2023 13:23:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C2FFC433CC;
	Mon,  7 Aug 2023 13:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691414588;
	bh=uBLUgzG+Qr84SJ0zH/c3GfOsYhPI41nZW9Idjp3TdLA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dFTwwY66zNWui2sj1Bg2eQWzNrp4yc+E6DgKCTaX1dRm6NHQCRj/Z4h3wdJ1HpqbH
	 ziLQummgaAsXWg99rIOvdjpnlhMA08msQMAo+dCKPKnuAwoX/7KusVcnnD3bg/Gmo0
	 bUGCMxL1/tn/hwndDV9LMFc1Tl2iV4SRExVjUfqGsL453pb3K9YZ9LPcHWzlcPpUGb
	 YudjLV0xaJINizJ74U6eB7hZWmzGwKN6B5W7M92zuUVjUEz3JI8CmsAz+MkeSzPT6b
	 MDO1LzS8RTb64n4NxTP2byGB/wqhUE/M5YcPjm0Meh1aBlNr/xzXokHKBmB6TPUDf2
	 oSoXBQmaLEscw==
From: Michael Walle <mwalle@kernel.org>
Date: Mon, 07 Aug 2023 15:21:30 +0200
Subject: [PATCH 36/41] mtd: spi-nor: micron-st: sort flash_info database
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v1-36-3d3d5bef4ba4@kernel.org>
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
X-CRM114-CacheID: sfid-20230807_142316_466126_46DDD15E 
X-CRM114-Status: GOOD (  11.77  )
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

The flash ID is the new primary key into our database. Sort the entry by
it. Keep the most specific ones first, because there might be ID
collisions between shorter and longer ones.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/micron-st.c | 336 ++++++++++++++++++++--------------------
 1 file changed, 168 insertions(+), 168 deletions(-)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 720fd2fbd0ad..4afcfc57c896 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -182,133 +182,35 @@ static const struct flash_info micron_nor_parts[] = {
 
 static const struct flash_info st_nor_parts[] = {
 	{
-		.id = SNOR_ID(0x20, 0xbb, 0x15),
-		.name = "n25q016a",
-		.size = SZ_2M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
-	}, {
-		.id = SNOR_ID(0x20, 0xba, 0x16),
-		.name = "n25q032",
-		.size = SZ_4M,
-		.no_sfdp_flags = SPI_NOR_QUAD_READ,
-	}, {
-		.id = SNOR_ID(0x20, 0xbb, 0x16),
-		.name = "n25q032a",
-		.size = SZ_4M,
-		.no_sfdp_flags = SPI_NOR_QUAD_READ,
-	}, {
-		.id = SNOR_ID(0x20, 0xba, 0x17),
-		.name = "n25q064",
-		.size = SZ_8M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
-	}, {
-		.id = SNOR_ID(0x20, 0xbb, 0x17),
-		.name = "n25q064a",
-		.size = SZ_8M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
-	}, {
-		.id = SNOR_ID(0x20, 0xbb, 0x18),
-		.name = "n25q128a11",
-		.size = SZ_16M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
-			 SPI_NOR_BP3_SR_BIT6,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
-		.mfr_flags = USE_FSR,
-	}, {
-		.id = SNOR_ID(0x20, 0xba, 0x18),
-		.name = "n25q128a13",
-		.size = SZ_16M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
-			 SPI_NOR_BP3_SR_BIT6,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
-		.mfr_flags = USE_FSR,
-	}, {
-		.id = SNOR_ID(0x20, 0xba, 0x19, 0x10, 0x44, 0x00),
-		.name = "mt25ql256a",
-		.size = SZ_32M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-		.fixup_flags = SPI_NOR_4B_OPCODES,
-		.mfr_flags = USE_FSR,
-	}, {
-		.id = SNOR_ID(0x20, 0xba, 0x19),
-		.name = "n25q256a",
-		.size = SZ_32M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-		.mfr_flags = USE_FSR,
-	}, {
-		.id = SNOR_ID(0x20, 0xbb, 0x19, 0x10, 0x44, 0x00),
-		.name = "mt25qu256a",
-		.size = SZ_32M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
-			 SPI_NOR_BP3_SR_BIT6,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-		.fixup_flags = SPI_NOR_4B_OPCODES,
-		.mfr_flags = USE_FSR,
-	}, {
-		.id = SNOR_ID(0x20, 0xbb, 0x19),
-		.name = "n25q256ax1",
-		.size = SZ_32M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
-		.mfr_flags = USE_FSR,
+		.name = "m25p05-nonjedec",
+		.sector_size = SZ_32K,
+		.size = SZ_64K,
 	}, {
-		.id = SNOR_ID(0x20, 0xba, 0x20, 0x10, 0x44, 0x00),
-		.name = "mt25ql512a",
-		.size = SZ_64M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-		.fixup_flags = SPI_NOR_4B_OPCODES,
-		.mfr_flags = USE_FSR,
+		.name = "m25p10-nonjedec",
+		.sector_size = SZ_32K,
+		.size = SZ_128K,
 	}, {
-		.id = SNOR_ID(0x20, 0xba, 0x20),
-		.name = "n25q512ax3",
-		.size = SZ_64M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
-			 SPI_NOR_BP3_SR_BIT6,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
-		.mfr_flags = USE_FSR,
+		.name = "m25p20-nonjedec",
+		.size = SZ_256K,
 	}, {
-		.id = SNOR_ID(0x20, 0xbb, 0x20, 0x10, 0x44, 0x00),
-		.name = "mt25qu512a",
-		.size = SZ_64M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-		.fixup_flags = SPI_NOR_4B_OPCODES,
-		.mfr_flags = USE_FSR,
+		.name = "m25p40-nonjedec",
+		.size = SZ_512K,
 	}, {
-		.id = SNOR_ID(0x20, 0xbb, 0x20),
-		.name = "n25q512a",
-		.size = SZ_64M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
-			 SPI_NOR_BP3_SR_BIT6,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
-		.mfr_flags = USE_FSR,
+		.name = "m25p80-nonjedec",
+		.size = SZ_1M,
 	}, {
-		.id = SNOR_ID(0x20, 0xba, 0x21),
-		.name = "n25q00",
-		.size = SZ_128M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
-			 SPI_NOR_BP3_SR_BIT6 | NO_CHIP_ERASE,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
-		.mfr_flags = USE_FSR,
+		.name = "m25p16-nonjedec",
+		.size = SZ_2M,
 	}, {
-		.id = SNOR_ID(0x20, 0xbb, 0x21),
-		.name = "n25q00a",
-		.size = SZ_128M,
-		.flags = NO_CHIP_ERASE,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
-		.mfr_flags = USE_FSR,
+		.name = "m25p32-nonjedec",
+		.size = SZ_4M,
 	}, {
-		.id = SNOR_ID(0x20, 0xba, 0x22),
-		.name = "mt25ql02g",
-		.size = SZ_256M,
-		.flags = NO_CHIP_ERASE,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
-		.mfr_flags = USE_FSR,
+		.name = "m25p64-nonjedec",
+		.size = SZ_8M,
 	}, {
-		.id = SNOR_ID(0x20, 0xbb, 0x22),
-		.name = "mt25qu02g",
-		.size = SZ_256M,
-		.flags = NO_CHIP_ERASE,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-		.mfr_flags = USE_FSR,
+		.name = "m25p128-nonjedec",
+		.sector_size = SZ_256K,
+		.size = SZ_16M,
 	}, {
 		.id = SNOR_ID(0x20, 0x20, 0x10),
 		.name = "m25p05",
@@ -348,36 +250,6 @@ static const struct flash_info st_nor_parts[] = {
 		.name = "m25p128",
 		.sector_size = SZ_256K,
 		.size = SZ_16M,
-	}, {
-		.name = "m25p05-nonjedec",
-		.sector_size = SZ_32K,
-		.size = SZ_64K,
-	}, {
-		.name = "m25p10-nonjedec",
-		.sector_size = SZ_32K,
-		.size = SZ_128K,
-	}, {
-		.name = "m25p20-nonjedec",
-		.size = SZ_256K,
-	}, {
-		.name = "m25p40-nonjedec",
-		.size = SZ_512K,
-	}, {
-		.name = "m25p80-nonjedec",
-		.size = SZ_1M,
-	}, {
-		.name = "m25p16-nonjedec",
-		.size = SZ_2M,
-	}, {
-		.name = "m25p32-nonjedec",
-		.size = SZ_4M,
-	}, {
-		.name = "m25p64-nonjedec",
-		.size = SZ_8M,
-	}, {
-		.name = "m25p128-nonjedec",
-		.sector_size = SZ_256K,
-		.size = SZ_16M,
 	}, {
 		.id = SNOR_ID(0x20, 0x40, 0x11),
 		.name = "m45pe10",
@@ -391,18 +263,14 @@ static const struct flash_info st_nor_parts[] = {
 		.name = "m45pe16",
 		.size = SZ_2M,
 	}, {
-		.id = SNOR_ID(0x20, 0x80, 0x12),
-		.name = "m25pe20",
-		.size = SZ_256K,
+		.id = SNOR_ID(0x20, 0x63, 0x16),
+		.name = "m25px32-s1",
+		.size = SZ_4M,
+		.no_sfdp_flags = SECT_4K,
 	}, {
-		.id = SNOR_ID(0x20, 0x80, 0x14),
-		.name = "m25pe80",
+		.id = SNOR_ID(0x20, 0x71, 0x14),
+		.name = "m25px80",
 		.size = SZ_1M,
-	}, {
-		.id = SNOR_ID(0x20, 0x80, 0x15),
-		.name = "m25pe16",
-		.size = SZ_2M,
-		.no_sfdp_flags = SECT_4K,
 	}, {
 		.id = SNOR_ID(0x20, 0x71, 0x15),
 		.name = "m25px16",
@@ -413,25 +281,157 @@ static const struct flash_info st_nor_parts[] = {
 		.name = "m25px32",
 		.size = SZ_4M,
 		.no_sfdp_flags = SECT_4K,
+	}, {
+		.id = SNOR_ID(0x20, 0x71, 0x17),
+		.name = "m25px64",
+		.size = SZ_8M,
 	}, {
 		.id = SNOR_ID(0x20, 0x73, 0x16),
 		.name = "m25px32-s0",
 		.size = SZ_4M,
 		.no_sfdp_flags = SECT_4K,
 	}, {
-		.id = SNOR_ID(0x20, 0x63, 0x16),
-		.name = "m25px32-s1",
-		.size = SZ_4M,
+		.id = SNOR_ID(0x20, 0x80, 0x12),
+		.name = "m25pe20",
+		.size = SZ_256K,
+	}, {
+		.id = SNOR_ID(0x20, 0x80, 0x14),
+		.name = "m25pe80",
+		.size = SZ_1M,
+	}, {
+		.id = SNOR_ID(0x20, 0x80, 0x15),
+		.name = "m25pe16",
+		.size = SZ_2M,
 		.no_sfdp_flags = SECT_4K,
 	}, {
-		.id = SNOR_ID(0x20, 0x71, 0x17),
-		.name = "m25px64",
+		.id = SNOR_ID(0x20, 0xba, 0x16),
+		.name = "n25q032",
+		.size = SZ_4M,
+		.no_sfdp_flags = SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0x20, 0xba, 0x17),
+		.name = "n25q064",
 		.size = SZ_8M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
 	}, {
-		.id = SNOR_ID(0x20, 0x71, 0x14),
-		.name = "m25px80",
-		.size = SZ_1M,
-	},
+		.id = SNOR_ID(0x20, 0xba, 0x18),
+		.name = "n25q128a13",
+		.size = SZ_16M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+			 SPI_NOR_BP3_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
+		.mfr_flags = USE_FSR,
+	}, {
+		.id = SNOR_ID(0x20, 0xba, 0x19, 0x10, 0x44, 0x00),
+		.name = "mt25ql256a",
+		.size = SZ_32M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+		.mfr_flags = USE_FSR,
+	}, {
+		.id = SNOR_ID(0x20, 0xba, 0x19),
+		.name = "n25q256a",
+		.size = SZ_32M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.mfr_flags = USE_FSR,
+	}, {
+		.id = SNOR_ID(0x20, 0xba, 0x20, 0x10, 0x44, 0x00),
+		.name = "mt25ql512a",
+		.size = SZ_64M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+		.mfr_flags = USE_FSR,
+	}, {
+		.id = SNOR_ID(0x20, 0xba, 0x20),
+		.name = "n25q512ax3",
+		.size = SZ_64M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+			 SPI_NOR_BP3_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
+		.mfr_flags = USE_FSR,
+	}, {
+		.id = SNOR_ID(0x20, 0xba, 0x21),
+		.name = "n25q00",
+		.size = SZ_128M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+			 SPI_NOR_BP3_SR_BIT6 | NO_CHIP_ERASE,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
+		.mfr_flags = USE_FSR,
+	}, {
+		.id = SNOR_ID(0x20, 0xba, 0x22),
+		.name = "mt25ql02g",
+		.size = SZ_256M,
+		.flags = NO_CHIP_ERASE,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
+		.mfr_flags = USE_FSR,
+	}, {
+		.id = SNOR_ID(0x20, 0xbb, 0x15),
+		.name = "n25q016a",
+		.size = SZ_2M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0x20, 0xbb, 0x16),
+		.name = "n25q032a",
+		.size = SZ_4M,
+		.no_sfdp_flags = SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0x20, 0xbb, 0x17),
+		.name = "n25q064a",
+		.size = SZ_8M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0x20, 0xbb, 0x18),
+		.name = "n25q128a11",
+		.size = SZ_16M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+			 SPI_NOR_BP3_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
+		.mfr_flags = USE_FSR,
+	}, {
+		.id = SNOR_ID(0x20, 0xbb, 0x19, 0x10, 0x44, 0x00),
+		.name = "mt25qu256a",
+		.size = SZ_32M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+			 SPI_NOR_BP3_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+		.mfr_flags = USE_FSR,
+	}, {
+		.id = SNOR_ID(0x20, 0xbb, 0x19),
+		.name = "n25q256ax1",
+		.size = SZ_32M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
+		.mfr_flags = USE_FSR,
+	}, {
+		.id = SNOR_ID(0x20, 0xbb, 0x20, 0x10, 0x44, 0x00),
+		.name = "mt25qu512a",
+		.size = SZ_64M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+		.mfr_flags = USE_FSR,
+	}, {
+		.id = SNOR_ID(0x20, 0xbb, 0x20),
+		.name = "n25q512a",
+		.size = SZ_64M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+			 SPI_NOR_BP3_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
+		.mfr_flags = USE_FSR,
+	}, {
+		.id = SNOR_ID(0x20, 0xbb, 0x21),
+		.name = "n25q00a",
+		.size = SZ_128M,
+		.flags = NO_CHIP_ERASE,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
+		.mfr_flags = USE_FSR,
+	}, {
+		.id = SNOR_ID(0x20, 0xbb, 0x22),
+		.name = "mt25qu02g",
+		.size = SZ_256M,
+		.flags = NO_CHIP_ERASE,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.mfr_flags = USE_FSR,
+	}
 };
 
 /**

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
