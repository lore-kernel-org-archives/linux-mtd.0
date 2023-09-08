Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE11BEE57F0
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Sep 2023 10:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q3o8pJ8fthIzpxwwTBu8PRtNZjF4sXxJke+inleCgMM=; b=QcNbA/R5Qnz/Dn
	xBb8Ws0UmKnqRHE59+oHbrCGkpvMttXQzdIMZAVrNmTGZQlgj44GAm8lui52JoaeHq6+C/giJ8c9X
	IsSOk/XR2tvtkrPJBVus2BeVOsY5wEZa+Jo8ytrNRwhC8QMPqiB4fiJs034ES/rIMFLA+lwO7mDEW
	q3uSXfCRQdGvuy6fj8kGmSJUBA2dC97KBobYWuxBdY2cWkf3ZNgygbNt0HuOGm2wXaJbp/LLAcKVs
	xOzgExOBqJoABKn/ilbRr5sNgYpiTW0yg9V7K71OK+qr6v7neOKamaNdhCV4Jy6+GxbxeBikeuiDc
	HPvRe0gwH8wiYWOahiqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYYd-00DTpd-1P;
	Fri, 08 Sep 2023 10:17:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYYQ-00DTdh-3D
	for linux-mtd@bombadil.infradead.org;
	Fri, 08 Sep 2023 10:17:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Hd9ZXu1ms8L+1PnQEpSruTOjEzoJjMZRue4helCgH8g=; b=O9U8BM8C7Hk9/elolIODRvwxZN
	ex/Xv7vwzO+cc6klbotWV5SGaYdUCY4x8tPIF5JammrJIsq6Q1MmA0W5zsTMsAgH5iulapzIIjNVH
	WIxDHllCSIlszXEVVjtpD4Chqmun66F7h3B762PVQ7MBYUBZFXreCb4dVO1N7lYOKHsQ7wSVUr+6L
	mVOd1YxmyRkSG/whYrIAX4ygtOkeOFHHHcE3m3F/keylrv0yF0RIka006yDSErw8uzfWa9FhyXQcc
	4P3C55ahpgwB4yj0jyQYfOWCEUz/V/mzkOKBkr28uWWOC0llyQAxyKn9+fDBfRp2lz1NwzyXtAy7Z
	uV03+3hA==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYYJ-002R09-38
	for linux-mtd@lists.infradead.org;
	Fri, 08 Sep 2023 10:17:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 91941614AC;
	Fri,  8 Sep 2023 10:17:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A927CC433AB;
	Fri,  8 Sep 2023 10:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694168246;
	bh=FnqvsVEt1dn/8eNY7lxm1PrsElAnzNiLYIyWKyfbLlM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PfOHdxLRuyqF4IMhUuLmd2Fm1iCkHei5B6lUDIoc0QQu7BmrP8jmoRxL1PdDFk7Bx
	 889oYgru8+d90rDg7QFLMjskP6xtFeMOiIizFT0N8nM4zCtbWRRuAkHxadcX92acea
	 inqqeVPeZV1zIRAeBlZ75tAP7Cnfh77oxIxdE1OGPYKQ/okbsTRUMj+q7n0zGHyy5Z
	 dxqwboxmRSLIszCjKqC1hxFhm0GI+AW2sVu9mLtn4VIkm/eObMo+aRhJLVafO86mPF
	 e3CBciuqwbtULwEtVeNEHazTYGpIQBLeMfaWTQD3QKlq6xjzL5jYsjMHEYERedmZf9
	 jOJ2UXLaelsNQ==
From: Michael Walle <mwalle@kernel.org>
Date: Fri, 08 Sep 2023 12:16:45 +0200
Subject: [PATCH v3 27/41] mtd: spi-nor: sst: convert flash_info to new
 format
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v3-27-e60548861b10@kernel.org>
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
X-CRM114-CacheID: sfid-20230908_111730_345534_1BD8A6E6 
X-CRM114-Status: GOOD (  12.45  )
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
 drivers/mtd/spi-nor/sst.c | 162 +++++++++++++++++++++++++++++-----------------
 1 file changed, 104 insertions(+), 58 deletions(-)

diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
index 1e06c6841a18..77b271abd342 100644
--- a/drivers/mtd/spi-nor/sst.c
+++ b/drivers/mtd/spi-nor/sst.c
@@ -61,64 +61,110 @@ static const struct spi_nor_fixups sst26vf_nor_fixups = {
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
-	{ "sst26vf032b", INFO(0xbf2642, 0, 0, 0)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-		.fixups = &sst26vf_nor_fixups },
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
+		.id = SNOR_ID(0xbf, 0x26, 0x42),
+		.name = "sst26vf032b",
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
+		.fixups = &sst26vf_nor_fixups,
+	}, {
+		.id = SNOR_ID(0xbf, 0x26, 0x43),
+		.name = "sst26vf064b",
+		.size = SZ_8M,
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
