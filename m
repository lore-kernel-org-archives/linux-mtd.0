Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18241C001B0
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Aug 2023 13:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=feRqy0DCLZYt9TnvPhNpHOd2/gFCRf+9Kq/2LitCAMg=; b=jvrXVdeGHqhz6t
	hJ3DADrqrDFx2TXwusXorhmQ9xGhFbN5QkJSkh7VETNLM9qh/CD5annUMxqvd8tzXZx/7jHLa484F
	Lmw1OBlATDHnxeD6EY0V/oJKHdKnTxafKeDi8Eyk4MJiF9nMYq97cGS+Cba2MbDUmm8rlbeNbVayT
	F9EXoBzgnoHWkOFHylQDpwm0szBYFICfMqarF/V4U9N8OWFmfEyYTcXQwq+ytKocLaJRoh25VbxG2
	hqGmMDNVwOiVxEu8iazJTZk5z9+bmsovASU9FexV9mzYSl65iaIXteXHYw+s3rr6bmHLpbsj/zlhH
	CeADJ2tVEojS/kZuRgDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0Cl-00HM4R-2A;
	Mon, 07 Aug 2023 13:23:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0CI-00HLaR-0J
	for linux-mtd@bombadil.infradead.org;
	Mon, 07 Aug 2023 13:22:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=uHpyw6jj9H6kKnWpKa0ymOcbdKCDrPGPVbUw6obkAYE=; b=B8sHaNM3QLxgjqggHs//xPmK+1
	8F/YoUOKJbEM0CputUKJK2fAD6e+Pm3Uz9fz6PMCNPOKBHBiaZ/bWIoU/WiRK50dfGscsPhqWfoX3
	GCUnWX/Mx4IDs4Ir4sQLcehIBeAk+/5WTWnEjXBM1vTqxV1GYIbXj8JuDuUeb3DUi+JP8D/3lRPnX
	6Fu/Z9BDwGerHI7hbF+y2ZZid8ZOLTXKD7gbLRKcLfaautx7tQyQfk3bbjPCuXeshT9Fc3TKs2nyS
	Dc9ZbcsS7tpEOkNa7UUW0oK4H5h1H+r4OR1A1tjGNY1aQW7XYfeWK39QsNHvLhI7vv45LMcpSUeXR
	8zIRwkCg==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0CB-003qfU-36
	for linux-mtd@lists.infradead.org;
	Mon, 07 Aug 2023 13:22:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9E83861B27;
	Mon,  7 Aug 2023 13:22:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A5A7C433C7;
	Mon,  7 Aug 2023 13:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691414569;
	bh=B6xNNgCdUxYx/FDwlznTmWB5XyM+EBLTTtA64gYkn7k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hFAjENPmsmZB5D0QDQL9CfwYE1FjZ1FAJRPL2Zjl+Kj4tJRSq+GM3segO2Ad1Vcpm
	 xUYsMXoASFgAgQq/rN1cTFmsmCQ/CU61KhZ/VFYrcyvmmC+It/OIpLUWwKJslJlYkg
	 lYj3LEq7a6sUZ4ZvjGmvFk50NWxRunNNQQM0vP3XizEABzE8wr+OVmUgFH3Mp+2C08
	 GdsNGn+tEElcvTWTkGS+nVqWLNeWOG3q+YtnJ5eXl6P3wxGwz9jO/WLF9CrewM4l6f
	 mnjyrcaCDqE+0UOI/3w/HbjVmgJjRYxJcycYEjMDvYiAy/2krA7YN4pHVRMWB0OJmd
	 B9Uw34r4SSbUw==
From: Michael Walle <mwalle@kernel.org>
Date: Mon, 07 Aug 2023 15:21:21 +0200
Subject: [PATCH 27/41] mtd: spi-nor: sst: convert flash_info to new format
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v1-27-3d3d5bef4ba4@kernel.org>
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
X-CRM114-CacheID: sfid-20230807_142253_882155_163A0E8D 
X-CRM114-Status: GOOD (  11.97  )
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
 drivers/mtd/spi-nor/sst.c | 155 ++++++++++++++++++++++++++++++----------------
 1 file changed, 100 insertions(+), 55 deletions(-)

diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
index 42e29441a7f7..8defff00c35f 100644
--- a/drivers/mtd/spi-nor/sst.c
+++ b/drivers/mtd/spi-nor/sst.c
@@ -61,61 +61,106 @@ static const struct spi_nor_fixups sst26vf_nor_fixups = {
 };
 
 static const struct flash_info sst_nor_parts[] = {
-	{ "sst25vf040b", INFO(0xbf258d, 0, 64 * 1024,  8)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-		NO_SFDP_FLAGS(SECT_4K)
-		MFR_FLAGS(SST_WRITE) },
-	{ "sst25vf080b", INFO(0xbf258e, 0, 64 * 1024, 16)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-		NO_SFDP_FLAGS(SECT_4K)
-		MFR_FLAGS(SST_WRITE) },
-	{ "sst25vf016b", INFO(0xbf2541, 0, 64 * 1024, 32)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-		NO_SFDP_FLAGS(SECT_4K)
-		MFR_FLAGS(SST_WRITE) },
-	{ "sst25vf032b", INFO(0xbf254a, 0, 64 * 1024, 64)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-		NO_SFDP_FLAGS(SECT_4K)
-		MFR_FLAGS(SST_WRITE) },
-	{ "sst25vf064c", INFO(0xbf254b, 0, 64 * 1024, 128)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP |
-		      SPI_NOR_SWP_IS_VOLATILE)
-		NO_SFDP_FLAGS(SECT_4K) },
-	{ "sst25wf512",  INFO(0xbf2501, 0, 64 * 1024,  1)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-		NO_SFDP_FLAGS(SECT_4K)
-		MFR_FLAGS(SST_WRITE) },
-	{ "sst25wf010",  INFO(0xbf2502, 0, 64 * 1024,  2)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-		NO_SFDP_FLAGS(SECT_4K)
-		MFR_FLAGS(SST_WRITE) },
-	{ "sst25wf020",  INFO(0xbf2503, 0, 64 * 1024,  4)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-		NO_SFDP_FLAGS(SECT_4K)
-		MFR_FLAGS(SST_WRITE) },
-	{ "sst25wf020a", INFO(0x621612, 0, 64 * 1024,  4)
-		FLAGS(SPI_NOR_HAS_LOCK)
-		NO_SFDP_FLAGS(SECT_4K) },
-	{ "sst25wf040b", INFO(0x621613, 0, 64 * 1024,  8)
-		FLAGS(SPI_NOR_HAS_LOCK)
-		NO_SFDP_FLAGS(SECT_4K) },
-	{ "sst25wf040",  INFO(0xbf2504, 0, 64 * 1024,  8)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-		NO_SFDP_FLAGS(SECT_4K)
-		MFR_FLAGS(SST_WRITE) },
-	{ "sst25wf080",  INFO(0xbf2505, 0, 64 * 1024, 16)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-		NO_SFDP_FLAGS(SECT_4K)
-		MFR_FLAGS(SST_WRITE) },
-	{ "sst26wf016b", INFO(0xbf2651, 0, 64 * 1024, 32)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
-	{ "sst26vf016b", INFO(0xbf2641, 0, 64 * 1024, 32)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
-	{ "sst26vf064b", INFO(0xbf2643, 0, 64 * 1024, 128)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
-		.fixups = &sst26vf_nor_fixups },
+	{
+		.id = SNOR_ID(0xbf, 0x25, 0x8d),
+		.name = "sst25vf040b",
+		.size = SZ_512K,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
+		.no_sfdp_flags = SECT_4K,
+		.mfr_flags = SST_WRITE,
+	}, {
+		.id = SNOR_ID(0xbf, 0x25, 0x8e),
+		.name = "sst25vf080b",
+		.size = SZ_1M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
+		.no_sfdp_flags = SECT_4K,
+		.mfr_flags = SST_WRITE,
+	}, {
+		.id = SNOR_ID(0xbf, 0x25, 0x41),
+		.name = "sst25vf016b",
+		.size = SZ_2M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
+		.no_sfdp_flags = SECT_4K,
+		.mfr_flags = SST_WRITE,
+	}, {
+		.id = SNOR_ID(0xbf, 0x25, 0x4a),
+		.name = "sst25vf032b",
+		.size = SZ_4M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
+		.no_sfdp_flags = SECT_4K,
+		.mfr_flags = SST_WRITE,
+	}, {
+		.id = SNOR_ID(0xbf, 0x25, 0x4b),
+		.name = "sst25vf064c",
+		.size = SZ_8M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP | SPI_NOR_SWP_IS_VOLATILE,
+		.no_sfdp_flags = SECT_4K,
+	}, {
+		.id = SNOR_ID(0xbf, 0x25, 0x01),
+		.name = "sst25wf512",
+		.size = SZ_64K,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
+		.no_sfdp_flags = SECT_4K,
+		.mfr_flags = SST_WRITE,
+	}, {
+		.id = SNOR_ID(0xbf, 0x25, 0x02),
+		.name = "sst25wf010",
+		.size = SZ_128K,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
+		.no_sfdp_flags = SECT_4K,
+		.mfr_flags = SST_WRITE,
+	}, {
+		.id = SNOR_ID(0xbf, 0x25, 0x03),
+		.name = "sst25wf020",
+		.size = SZ_256K,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
+		.no_sfdp_flags = SECT_4K,
+		.mfr_flags = SST_WRITE,
+	}, {
+		.id = SNOR_ID(0x62, 0x16, 0x12),
+		.name = "sst25wf020a",
+		.size = SZ_256K,
+		.flags = SPI_NOR_HAS_LOCK,
+		.no_sfdp_flags = SECT_4K,
+	}, {
+		.id = SNOR_ID(0x62, 0x16, 0x13),
+		.name = "sst25wf040b",
+		.size = SZ_512K,
+		.flags = SPI_NOR_HAS_LOCK,
+		.no_sfdp_flags = SECT_4K,
+	}, {
+		.id = SNOR_ID(0xbf, 0x25, 0x04),
+		.name = "sst25wf040",
+		.size = SZ_512K,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
+		.no_sfdp_flags = SECT_4K,
+		.mfr_flags = SST_WRITE,
+	}, {
+		.id = SNOR_ID(0xbf, 0x25, 0x05),
+		.name = "sst25wf080",
+		.size = SZ_1M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
+		.no_sfdp_flags = SECT_4K,
+		.mfr_flags = SST_WRITE,
+	}, {
+		.id = SNOR_ID(0xbf, 0x26, 0x51),
+		.name = "sst26wf016b",
+		.size = SZ_2M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xbf, 0x26, 0x41),
+		.name = "sst26vf016b",
+		.size = SZ_2M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ,
+	}, {
+		.id = SNOR_ID(0xbf, 0x26, 0x43),
+		.name = "sst26vf064b",
+		.size = SZ_8M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixups = &sst26vf_nor_fixups,
+	}
 };
 
 static int sst_nor_write(struct mtd_info *mtd, loff_t to, size_t len,

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
