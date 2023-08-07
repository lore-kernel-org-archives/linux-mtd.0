Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8647C001B0
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Aug 2023 13:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=49TPmRaT9CclbfPQMOnzL2IK6r6F3XtfL2MJUcDs8q8=; b=LVVSARIc8xxRJ0
	NFicj7ALvze+57PB+2oOKEjKlvO2bbh4ZhPkX+yg5Zk4mSj6pCqI8pU73SR7MRz6qR5k52+vWPhTy
	Zg1nry1Pvmgdcfkm+18txikblKITfMwLZl5h8n8CISJEMx0wKS3dP+g8EuOYJTVb4/9+OXT4ZaZ2H
	jMp1fab39nNlXJxUh1C5QHumq2Tdi7Bpk5TCFfG7BoCOyXq2ZhzfxB4aOH5BVmrDrkJ99vayA8gqn
	2ndgBK1eSwG1vOzUwrPC2FViElhpIJ0A9cej/tdWA/YN5AIeKmfjwbWkBqIIwwx5n5CSKxS82spMA
	x9KWFKWdom2s4+yOLegQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0C8-00HLRH-0F;
	Mon, 07 Aug 2023 13:22:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0Br-00HL1M-2p
	for linux-mtd@lists.infradead.org;
	Mon, 07 Aug 2023 13:22:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id ACDAF61B18;
	Mon,  7 Aug 2023 13:22:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18225C433CB;
	Mon,  7 Aug 2023 13:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691414550;
	bh=FMrL+V9+pSz441pre2fqIuiBhaXySkpsxmO1V8C9qk8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=R+WwD1y2lEmfVbe0XZBGXdq72nqTe5wIV4LYk5gXBqXzPWTxzngn+XVYlKQEXvpzL
	 vjcST3zvz6CHnnzU8mPB3/fPxPVGx3SJrrIHhOd8/uPk/y9bn/+pESxlbeW+5k02K7
	 1LVqHnScimFI2WOMI/VgsDDjg0srPx5/LhAHVMSsAeKFXVIV1DYfKshaXJJqEuy/XF
	 c0mZZk78NqreNIdMTl08Sjey3dOMRvMtBvgIQChP45hFcwZkjRJNPaWUbveTA4MeKv
	 4XEuybJ8r6YdVkwF4hBo4LaHVq1Fv9aaIuEAcMBV9AiCxbsiNpW3pwuQR2t6u+H924
	 SvTg4Y60LQYww==
From: Michael Walle <mwalle@kernel.org>
Date: Mon, 07 Aug 2023 15:21:12 +0200
Subject: [PATCH 18/41] mtd: spi-nor: eon: convert flash_info to new format
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v1-18-3d3d5bef4ba4@kernel.org>
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
X-CRM114-CacheID: sfid-20230807_062232_053568_08D86923 
X-CRM114-Status: GOOD (  11.07  )
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
 drivers/mtd/spi-nor/eon.c | 72 +++++++++++++++++++++++++++++++++++------------
 1 file changed, 54 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/spi-nor/eon.c b/drivers/mtd/spi-nor/eon.c
index 4848ffe8b38f..ba09cb6c2abd 100644
--- a/drivers/mtd/spi-nor/eon.c
+++ b/drivers/mtd/spi-nor/eon.c
@@ -9,24 +9,60 @@
 #include "core.h"
 
 static const struct flash_info eon_nor_parts[] = {
-	{ "en25f32",    INFO(0x1c3116, 0, 64 * 1024,   64)
-		NO_SFDP_FLAGS(SECT_4K) },
-	{ "en25p32",    INFO(0x1c2016, 0, 64 * 1024,   64) },
-	{ "en25q32b",   INFO(0x1c3016, 0, 64 * 1024,   64) },
-	{ "en25p64",    INFO(0x1c2017, 0, 64 * 1024,  128) },
-	{ "en25q64",    INFO(0x1c3017, 0, 64 * 1024,  128)
-		NO_SFDP_FLAGS(SECT_4K) },
-	{ "en25q80a",   INFO(0x1c3014, 0, 64 * 1024,   16)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
-	{ "en25qh16",   INFO(0x1c7015, 0, 64 * 1024,   32)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
-	{ "en25qh32",   INFO(0x1c7016, 0, 64 * 1024,   64) },
-	{ "en25qh64",   INFO(0x1c7017, 0, 64 * 1024,  128)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
-	{ "en25qh128",  INFO(0x1c7018, 0, 64 * 1024,  256) },
-	{ "en25qh256",  INFO(0x1c7019, 0, 64 * 1024,  0) },
-	{ "en25s64",	INFO(0x1c3817, 0, 64 * 1024,  128)
-		NO_SFDP_FLAGS(SECT_4K) },
+	{
+		.id = SNOR_ID(0x1c, 0x31, 0x16),
+		.name = "en25f32",
+		.size = SZ_4M,
+		.no_sfdp_flags = SECT_4K,
+	}, {
+		.id = SNOR_ID(0x1c, 0x20, 0x16),
+		.name = "en25p32",
+		.size = SZ_4M,
+	}, {
+		.id = SNOR_ID(0x1c, 0x30, 0x16),
+		.name = "en25q32b",
+		.size = SZ_4M,
+	}, {
+		.id = SNOR_ID(0x1c, 0x20, 0x17),
+		.name = "en25p64",
+		.size = SZ_8M,
+	}, {
+		.id = SNOR_ID(0x1c, 0x30, 0x17),
+		.name = "en25q64",
+		.size = SZ_8M,
+		.no_sfdp_flags = SECT_4K,
+	}, {
+		.id = SNOR_ID(0x1c, 0x30, 0x14),
+		.name = "en25q80a",
+		.size = SZ_1M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ,
+	}, {
+		.id = SNOR_ID(0x1c, 0x70, 0x15),
+		.name = "en25qh16",
+		.size = SZ_2M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ,
+	}, {
+		.id = SNOR_ID(0x1c, 0x70, 0x16),
+		.name = "en25qh32",
+		.size = SZ_4M,
+	}, {
+		.id = SNOR_ID(0x1c, 0x70, 0x17),
+		.name = "en25qh64",
+		.size = SZ_8M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ,
+	}, {
+		.id = SNOR_ID(0x1c, 0x70, 0x18),
+		.name = "en25qh128",
+		.size = SZ_16M,
+	}, {
+		.id = SNOR_ID(0x1c, 0x70, 0x19),
+		.name = "en25qh256",
+	}, {
+		.name = "en25s64",
+		.id = SNOR_ID(0x1c, 0x38, 0x17),
+		.size = SZ_8M,
+		.no_sfdp_flags = SECT_4K,
+	},
 };
 
 const struct spi_nor_manufacturer spi_nor_eon = {

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
