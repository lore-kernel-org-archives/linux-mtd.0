Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A052AC001B0
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Aug 2023 13:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LDtPcNmpSxhR9dzW6I/sCWDUY6I1YqCrtZ5F3PsakjQ=; b=47mxFjfXWk/+DO
	80N936R/uvVQixEekIZJ7rg4cJDDVSu62QtDHUo/OE4AJuEOmXtHu+STsLP+vSbqAOPPo5Aiq11wW
	PIhqgp8VulbY+rKCO4/MDHAtg8Hsw9yeJ5AnknrqoWSSPBbry4DpWMa8pAB638ySeuAuaFCdqf/h5
	mryGjaMD2+hB8w/+m+BxMjatnCiSCz79JwhWagwEvFUAnGFbdJ5zeG328hgQDkeVt1y9XO2AJ9V8h
	8eamUByAIbY4XemnBgkUpngme8leC5iUxpSxxydDJ0bTUntHOTYayQjwt9V6k06RA2313WrNiYbv7
	InSmv2A20YAggomsewXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0DY-00HMrD-0N;
	Mon, 07 Aug 2023 13:24:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0CQ-00HLij-1D
	for linux-mtd@lists.infradead.org;
	Mon, 07 Aug 2023 13:23:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4043961A91;
	Mon,  7 Aug 2023 13:23:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAD69C433CD;
	Mon,  7 Aug 2023 13:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691414584;
	bh=v3ofMUp8UBxPgYd5XD7XRHJNeXUWfMpXY/dIXqoAhK8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=es5CoEJce0v1chJ3Ry11vQ0GhdRj6X8gklJ28pDG1Ic/YfKoDOMqil6qcGTgXZiV3
	 GFYqkdTW2DCOXPH7Lsi+5JvaNt0dqzufqW5lV+SP0m/lRzAOo8Xuo924dqT6Zyi0Ju
	 0EH6f6kPSYIaSNA+Wnn1bD7WgDWTMpvdu8bpL3wFBBT78sITFDDl1XC/HnvqMvpmaj
	 U2cxKagIH4b0EZJvcxpZ7Lpt1l5euCTRJ4ddJ50Fzu2lXCrAcww+UI65Ede5KTCqVJ
	 JSgEMENfWfaA6/1R8CKdcQkLBGPjaULvftRvZE0cdeq2/1o2Vvt/oU5s7XYetUrBtk
	 Idc5jlGyvcb0A==
From: Michael Walle <mwalle@kernel.org>
Date: Mon, 07 Aug 2023 15:21:28 +0200
Subject: [PATCH 34/41] mtd: spi-nor: issi: sort flash_info database
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v1-34-3d3d5bef4ba4@kernel.org>
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
X-CRM114-CacheID: sfid-20230807_062306_530791_B5B47B1E 
X-CRM114-Status: GOOD (  11.00  )
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
 drivers/mtd/spi-nor/issi.c | 44 ++++++++++++++++++++++----------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index 9478f1e61626..18d9a00aa22e 100644
--- a/drivers/mtd/spi-nor/issi.c
+++ b/drivers/mtd/spi-nor/issi.c
@@ -48,26 +48,43 @@ static const struct spi_nor_fixups pm25lv_nor_fixups = {
 
 static const struct flash_info issi_nor_parts[] = {
 	{
+		.name = "pm25lv512",
+		.sector_size = SZ_32K,
+		.size = SZ_64K,
+		.no_sfdp_flags = SECT_4K,
+		.fixups = &pm25lv_nor_fixups
+	}, {
+		.name = "pm25lv010",
+		.sector_size = SZ_32K,
+		.size = SZ_128K,
+		.no_sfdp_flags = SECT_4K,
+		.fixups = &pm25lv_nor_fixups
+	}, {
 		.id = SNOR_ID(0x7f, 0x9d, 0x20),
 		.name = "is25cd512",
 		.sector_size = SZ_32K,
 		.size = SZ_64K,
 		.no_sfdp_flags = SECT_4K,
+	}, {
+		.id = SNOR_ID(0x7f, 0x9d, 0x46),
+		.name = "pm25lq032",
+		.size = SZ_4M,
+		.no_sfdp_flags = SECT_4K,
 	}, {
 		.id = SNOR_ID(0x9d, 0x40, 0x13),
 		.name = "is25lq040b",
 		.size = SZ_512K,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-	}, {
-		.id = SNOR_ID(0x9d, 0x60, 0x15),
-		.name = "is25lp016d",
-		.size = SZ_2M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
 		.id = SNOR_ID(0x9d, 0x60, 0x14),
 		.name = "is25lp080d",
 		.size = SZ_1M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0x9d, 0x60, 0x15),
+		.name = "is25lp016d",
+		.size = SZ_2M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
 		.id = SNOR_ID(0x9d, 0x60, 0x16),
 		.name = "is25lp032",
@@ -109,23 +126,6 @@ static const struct flash_info issi_nor_parts[] = {
 		.flags = SPI_NOR_QUAD_PP,
 		.fixups = &is25lp256_fixups,
 		.fixup_flags = SPI_NOR_4B_OPCODES,
-	}, {
-		.name = "pm25lv512",
-		.sector_size = SZ_32K,
-		.size = SZ_64K,
-		.no_sfdp_flags = SECT_4K,
-		.fixups = &pm25lv_nor_fixups
-	}, {
-		.name = "pm25lv010",
-		.sector_size = SZ_32K,
-		.size = SZ_128K,
-		.no_sfdp_flags = SECT_4K,
-		.fixups = &pm25lv_nor_fixups
-	}, {
-		.id = SNOR_ID(0x7f, 0x9d, 0x46),
-		.name = "pm25lq032",
-		.size = SZ_4M,
-		.no_sfdp_flags = SECT_4K,
 	}
 };
 

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
